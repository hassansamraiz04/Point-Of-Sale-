using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using static Point_Of_Sale.WebForm2;



namespace Point_Of_Sale
{
    public partial class WebForm2 : System.Web.UI.Page
    {



        protected void fun_NewSale(object sender, EventArgs e)
        {
            initiate_newSale(sender, e);
        }
        protected void AddProduct(object sender, EventArgs e)
        {
            btnAddProduct_Click(sender, e);
        }
        protected void CompleteBill(object sender, EventArgs e)
        {
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "CompleteBill", "CompleteBill();", true);
            btn_CompleteBill(sender, e);
        }
        protected void PrintBill(object sender, EventArgs e)
        {
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "PrintBill", "printBill();", true);
            ClearProductFields();
        }

        protected void initiate_newSale(object sender, EventArgs e)
        {
            if (Global.saleInitaited == 1)
            {
                message.InnerText = "First Complete this Sale...";
                return;
            }

            ClearProductFields();
            string connectionString = "Data Source=DESKTOP-G133VUQ\\SQLEXPRESS;Initial Catalog=POS;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @"
                SELECT CASE
                           WHEN EXISTS (SELECT 1 FROM Sales) THEN
                               CASE
                                   WHEN (SELECT TotalAmount FROM Sales WHERE SalesID = (SELECT MAX(SalesID) FROM Sales)) = -1 THEN 1
                                   ELSE 0
                               END
                           ELSE 0
                       END AS Result;
                ";

                SqlCommand command1 = new SqlCommand(query, connection);
                connection.Open();
                int result = (int)command1.ExecuteScalar();

                connection.Close();
                if (result != 1)
                {
                    int userId = 1; // Replace with the actual user ID, e.g., from session or logged-in user data
                    using (SqlCommand command = new SqlCommand("Init_sale", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("@UserID", userId); // Pass the UserID

                        connection.Open();
                        command.ExecuteNonQuery();
                        connection.Close();

                        message.InnerText = "Sale initiated";
                        Global.saleInitaited = 1;
                    }

                }
                else
                {
                    Global.productAdded = 1;
                    btn_CompleteBill(sender, e);
                    message.InnerText = "Previous Bill Closed. Now again press NEW SALE to initiate new sale";
                    return;
                }

                int saleID = 0;
                using (SqlCommand command = new SqlCommand("SELECT MAX(SalesID) AS LastSaleID FROM Sales", connection))
                {
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            if (!reader.IsDBNull(reader.GetOrdinal("LastSaleID")))
                            {
                                saleID = reader.GetInt32(reader.GetOrdinal("LastSaleID"));
                            }
                            else
                            {
                                saleID = 0;
                            }
                        }
                    }
                    connection.Close();

                    Saleid.InnerText = "Sale No : " + saleID;
                }
            }


        }


        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            // Get product details from the text boxes
            if (txtProductId.Text == "" || txtPrice.Text == "" || txtPrice.Text == "")
            {
                message.InnerText = "Please fill in all fields first..";
                return;
            }

            if (Global.saleInitaited == 0)
            {
                message.InnerText = "First Initiate a New Sale..";
                return;
            }

            Global.productAdded = 1;
            string productName = txtProductName.Text;
            int productId = Convert.ToInt32(txtProductId.Text);
            int saleID = 0;
            int price = Convert.ToInt32(txtPrice.Text);
            int quantity = Convert.ToInt32(txtQuantity.Text);
            int discount = Convert.ToInt32(txtDiscount.Text);
            int soldPrice = price - discount;
            //Validate input here if needed
            int quantityAvailable;
            // Insert product into the database
            string connectionString = "Data Source=DESKTOP-G133VUQ\\SQLEXPRESS;Initial Catalog=POS;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("CheckQuantityAvailability", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@ProductID", productId);
                    command.Parameters.AddWithValue("@Quantity", quantity);
                    SqlParameter outputParam = new SqlParameter("@QuantityAvailable", SqlDbType.Int)
                    {
                        Direction = ParameterDirection.Output
                    };
                    command.Parameters.Add(outputParam);

                    connection.Open();
                    command.ExecuteNonQuery();

                    // Retrieve the value of the output parameter
                    quantityAvailable = (outputParam.Value != DBNull.Value)
                        ? Convert.ToInt32(outputParam.Value)
                        : 0;

                    connection.Close();

                    if (quantityAvailable == 0)
                    {
                        ClearProductFields();
                        message.InnerText = "Product/Quantity Not Available.";
                        return;
                    }
                }


                using (SqlCommand command = new SqlCommand("SELECT MAX(SalesID) AS LastSaleID FROM Sales", connection))
                {
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            if (!reader.IsDBNull(reader.GetOrdinal("LastSaleID")))
                            {
                                saleID = reader.GetInt32(reader.GetOrdinal("LastSaleID"));
                            }
                            else
                            {
                                message.InnerText = "Error with the new Sale...";
                            }
                        }
                    }
                    connection.Close();

                    Saleid.InnerText = "Sale No : " + saleID;
                }

                using (SqlCommand command = new SqlCommand("Add_saleDetail_Info", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@ProductId", productId);
                    command.Parameters.AddWithValue("@SalesID", saleID);
                    command.Parameters.AddWithValue("@Price", price);
                    command.Parameters.AddWithValue("@Quantity", quantity);
                    command.Parameters.AddWithValue("@Discount", discount);
                    command.Parameters.AddWithValue("@SoldPrice", soldPrice);

                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();

                }

                using (SqlCommand command = new SqlCommand("remove_product_after_sale_inventory", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@ProductId", productId);
                    command.Parameters.AddWithValue("@quantity", quantity);


                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                    message.InnerText = "Item Added to bill";

                }

                string query = "SELECT COUNT(*) FROM SaleDetail WHERE SalesID = @SaleID";
                SqlCommand command1 = new SqlCommand(query, connection);
                command1.Parameters.AddWithValue("@SaleID", saleID);

                connection.Open();

                // Execute the query and get the count
                int count;
                if (command1.Parameters["@SaleID"].Value == DBNull.Value)
                {
                    count = 0;
                }
                else
                    count = Convert.ToInt32(command1.ExecuteScalar());

                connection.Close();
                //Sample data(replace this with your actual data)

                UpdateBillTable(productName, quantity, price, discount);

                Global.TotalAmount = Global.TotalAmount + (price * quantity);
                Global.TotalDiscount = Global.TotalDiscount + discount;
                Global.GrandTotal = Global.GrandTotal + ((price * quantity) - discount);


                totalAmount.InnerText = Global.TotalAmount.ToString() + ".00 /-";
                DiscountAmount.InnerText = Global.TotalDiscount.ToString() + ".00 /-";
                grandTotal.InnerText = Global.GrandTotal.ToString() + ".00 /-";

                AdjustBillContainerHeight();
                ClearProductFields();
            }
        }


        public void ShowTable()
        {



            for (int j = 0; j < Global.i; j++)
            {
                HtmlTableRow row = new HtmlTableRow();
                HtmlTableCell cell1 = new HtmlTableCell();
                HtmlTableCell cell2 = new HtmlTableCell();
                HtmlTableCell cell3 = new HtmlTableCell();
                HtmlTableCell cell4 = new HtmlTableCell();

                cell1.InnerText = Global.products[j].Name;
                cell2.InnerText = Global.products[j].Quantity.ToString();
                cell3.InnerText = Global.products[j].Price.ToString();
                cell4.InnerText = Global.products[j].Discount.ToString();

                row.Cells.Add(cell1);
                row.Cells.Add(cell2);
                row.Cells.Add(cell3);
                row.Cells.Add(cell4);

                myTable.Rows.Add(row);
            }
        }
        public void UpdateBillTable(string productName, int quantity, int price, int discount)
        {

            Global.products[Global.i] = new Product { Name = productName, Quantity = quantity, Price = price, Discount = discount };
            Global.i++;

            for (int j = 0; j < Global.i; j++)
            {
                HtmlTableRow row = new HtmlTableRow();
                HtmlTableCell cell1 = new HtmlTableCell();
                HtmlTableCell cell2 = new HtmlTableCell();
                HtmlTableCell cell3 = new HtmlTableCell();
                HtmlTableCell cell4 = new HtmlTableCell();

                cell1.InnerText = Global.products[j].Name;
                cell2.InnerText = Global.products[j].Quantity.ToString();
                cell3.InnerText = Global.products[j].Price.ToString();
                cell4.InnerText = Global.products[j].Discount.ToString();

                row.Cells.Add(cell1);
                row.Cells.Add(cell2);
                row.Cells.Add(cell3);
                row.Cells.Add(cell4);

                myTable.Rows.Add(row);
            }
        }
        private void AdjustBillContainerHeight()
        {
            // Find the bill div
            HtmlGenericControl bill = (HtmlGenericControl)FindControl("bill");

            if (bill != null)
            {
                // Get the number of rows in the table
                int numRows = myTable.Rows.Count;

                // Calculate the height of each row (assuming each row has a height of 30px)
                int rowHeight = 30;

                // Calculate the total height needed for the rows
                int totalHeight = numRows * rowHeight;

                // Set the height of the bill div
                bill.Style["height"] = totalHeight.ToString() + "px";
            }
        }
        public class Product
        {

            public void addVal(string n, int q, int p, int d)
            {
                Name = n;
                Quantity = q;
                Price = p;
                Discount = d;
            }
            public string Name { get; set; }
            public int Quantity { get; set; }
            public double Price { get; set; }
            public int Discount { get; set; }
        }
        protected void btn_CompleteBill(object sender, EventArgs e)
        {
            if (Global.saleInitaited == 0 && Global.saleClosed == 1)
            {
                message.InnerText = "No Bill to Complete...";
                return;
            }

            if (Global.productAdded == 0)
            {
                message.InnerText = "First add any product. Bill is empty...";
                return;
            }
            btnPrintBill.Attributes["style"] = "display:inline-block;";
            ShowTable();
            double totalPrice = Global.TotalAmount;
            double totalDiscount = Global.TotalDiscount;
            double totalSoldPrice = Global.GrandTotal;

            Global.TotalAmount = 0;
            Global.TotalDiscount = 0;
            Global.GrandTotal = 0;
            Global.saleInitaited = 0;
            Global.saleClosed = 1;
            Global.productAdded = 0;



            int saleID = 0;
            string connectionString = "Data Source=DESKTOP-G133VUQ\\SQLEXPRESS;Initial Catalog=POS;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("SELECT MAX(SalesID) AS LastSaleID FROM Sales", connection))
                {
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            if (!reader.IsDBNull(reader.GetOrdinal("LastSaleID")))
                            {
                                saleID = reader.GetInt32(reader.GetOrdinal("LastSaleID"));
                            }
                        }
                    }

                    connection.Close();
                }



                string customerName = txtCustomerName.Text;
                string customerPhNo = txtCustomerPhNo.Text;

                using (SqlCommand command = new SqlCommand("FinalizeSale", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    // Add required parameters
                    command.Parameters.AddWithValue("@SalesID", saleID);
                    command.Parameters.AddWithValue("@Date", DateTime.Today); // Pass today's date
                    command.Parameters.AddWithValue("@UserID", 1); // Assuming a default user ID
                    command.Parameters.AddWithValue("@TotalAmount", totalPrice); // Assuming a calculated total price
                    command.Parameters.AddWithValue("@TotalDiscount", totalDiscount); // Assuming a calculated total discount
                    command.Parameters.AddWithValue("@GrandTotal", totalSoldPrice); // Assuming a calculated grand total
                    command.Parameters.AddWithValue("@CustomerName", customerName);
                    command.Parameters.AddWithValue("@CustomerPhNo", customerPhNo);

                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();

                    message.InnerText = "Sale Closed.";
                }


            }


        }


        private void ClearProductFields()
        {
            txtProductName.Text = "";
            txtProductId.Text = "";
            txtPrice.Text = "";
            txtQuantity.Text = "1";
            txtDiscount.Text = "0";
        }

    }
}