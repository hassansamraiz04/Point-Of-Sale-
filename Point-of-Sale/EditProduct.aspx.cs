using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Point_Of_Sale
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void editProduct_Click(object sender, EventArgs e)
        {
            // Check if all fields are filled
            if (productID.Text == "" || productName.Text == "" || categoryName.Text == "" || purchasePrice.Text == "" || salePrice.Text == "" || quantity.Text == "" || categoryID.Text == "")
            {
                message.InnerText = "Please fill in all fields.";
                return;
            }

            // Get the values entered by the user
            int PID = Convert.ToInt16(productID.Text);
            string prodName = productName.Text;
            string catName = categoryName.Text;
            int catID = Convert.ToInt32(categoryID.Text);  // Added CategoryID
            decimal purPrice = Convert.ToDecimal(purchasePrice.Text);
            decimal salPrice = Convert.ToDecimal(salePrice.Text);
            int qty = Convert.ToInt32(quantity.Text);

            // Database connection string
            string connectionString = "Data Source=DESKTOP-G133VUQ\\SQLEXPRESS;Initial Catalog=POS;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Check if the ProductID exists in the Products table
                using (SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM Products WHERE ProductID = @ProductID", connection))
                {
                    command.Parameters.AddWithValue("@ProductID", PID);
                    connection.Open();
                    int count = (int)command.ExecuteScalar();

                    // If the product doesn't exist, display an error
                    if (count == 0)
                    {
                        message.InnerText = "Product not found.";
                        return;
                    }
                    connection.Close();
                }

                // Check if the CategoryID exists in the Category table (if CategoryID is being updated)
                using (SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM Category WHERE CategoryID = @CategoryID", connection))
                {
                    command.Parameters.AddWithValue("@CategoryID", catID);
                    connection.Open();
                    int catCount = (int)command.ExecuteScalar();

                    // If the CategoryID doesn't exist, display an error
                    if (catCount == 0)
                    {
                        message.InnerText = "Category ID does not exist in the Category table.";
                        return;
                    }
                    connection.Close();
                }

                // If the CategoryName differs, check if the category needs to be updated
                if (catName != "")
                {
                    using (SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM Category WHERE CategoryName = @CategoryName", connection))
                    {
                        command.Parameters.AddWithValue("@CategoryName", catName);
                        connection.Open();
                        int catNameCount = (int)command.ExecuteScalar();

                        if (catNameCount == 0)
                        {
                            // If CategoryName does not exist in the Category table, update it
                            using (SqlCommand updateCategoryCommand = new SqlCommand("UPDATE Category SET CategoryName = @CategoryName WHERE CategoryID = @CategoryID", connection))
                            {
                                updateCategoryCommand.Parameters.AddWithValue("@CategoryName", catName);
                                updateCategoryCommand.Parameters.AddWithValue("@CategoryID", catID);
                                updateCategoryCommand.ExecuteNonQuery();
                            }
                        }
                        connection.Close();
                    }
                }

                // Now proceed to update the Product information
                using (SqlCommand command = new SqlCommand("update_product", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@ProductID", PID);
                    command.Parameters.AddWithValue("@ProductName", prodName);
                    command.Parameters.AddWithValue("@CategoryID", catID); // Pass CategoryID
                    command.Parameters.AddWithValue("@PurchasePrice", purPrice);
                    command.Parameters.AddWithValue("@SalePrice", salPrice);
                    command.Parameters.AddWithValue("@Quantity", qty);

                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }
            }

            message.InnerText = "Product edited successfully!";

            // Clear fields after successful update
            productID.Text = "";
            productName.Text = "";
            categoryName.Text = "";
            categoryID.Text = "";  // Clear CategoryID field
            purchasePrice.Text = "";
            salePrice.Text = "";
            quantity.Text = "";
        }

    }
}