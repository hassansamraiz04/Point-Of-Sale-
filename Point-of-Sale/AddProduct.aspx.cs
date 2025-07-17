using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Point_Of_Sale
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void addProduct_Click(object sender, EventArgs e)
        {
            // Check if any required fields are empty
            if (productName.Text == "" || categoryName.Text == "" || purchasePrice.Text == "" || salePrice.Text == "" || quantity.Text == "" || categoryID.Text == "")
            {
                message.InnerText = "Please fill in all fields first.";
                return;
            }

            // Declare and convert input values
            int productIDValue = Convert.ToInt32(productID.Text);
            string prodName = productName.Text;
            string catName = categoryName.Text;
            int categoryIDValue = Convert.ToInt32(categoryID.Text);  // Added CategoryID
            decimal purPrice = Convert.ToDecimal(purchasePrice.Text);
            decimal salPrice = Convert.ToDecimal(salePrice.Text);
            int qty = Convert.ToInt32(quantity.Text);

            // Connection string (replace with your actual connection string)
            string connectionString = "Data Source=DESKTOP-G133VUQ\\SQLEXPRESS;Initial Catalog=POS;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("AddProduct", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    // Add parameters to the command
                    command.Parameters.AddWithValue("@ProductID", productIDValue);
                    command.Parameters.AddWithValue("@ProductName", prodName);
                    command.Parameters.AddWithValue("@CategoryID", categoryIDValue); // Added CategoryID parameter
                    command.Parameters.AddWithValue("@CategoryName", catName);
                    command.Parameters.AddWithValue("@PurchasePrice", purPrice);
                    command.Parameters.AddWithValue("@SalePrice", salPrice);
                    command.Parameters.AddWithValue("@Quantity", qty);

                    try
                    {
                        // Open the connection and execute the command
                        connection.Open();
                        command.ExecuteNonQuery();

                        // Display success message
                        message.InnerText = "Product added successfully!";
                    }
                    catch (Exception ex)
                    {
                        // Display error message if something goes wrong
                        message.InnerText = "Error: " + ex.Message;
                    }
                }
            }
        }
    }
}
