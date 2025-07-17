using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Point_Of_Sale
{
    public partial class WebForm1 : Page
    {
        // Connection string
        private string connectionString = "Data Source=DESKTOP-G133VUQ\\SQLEXPRESS;Initial Catalog=POS;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            // Any logic that should execute when the page loads
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // Retrieve the values from the textboxes
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            // Call the stored procedure for authentication
            if (AuthenticateUser(username, password))
            {
                // Redirect to another page if login is successful
                Response.Redirect("~/Home.aspx"); // Change to the appropriate page
            }
            else
            {
                // Show an error message if authentication fails
                message.InnerHtml = "<p style='color:red;'>Invalid username or password.</p>";
            }
        }

        private bool AuthenticateUser(string username, string password)
        {
            bool isAuthenticated = false;

            // Establish a connection to the database
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();

                    // Define the command to call the stored procedure
                    using (SqlCommand cmd = new SqlCommand("User_authentication", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // Add parameters for the stored procedure
                        cmd.Parameters.AddWithValue("@UserName", username);
                        cmd.Parameters.AddWithValue("@Password", password);

                        // Execute the query and get the result
                        SqlDataReader reader = cmd.ExecuteReader();

                        if (reader.HasRows)
                        {
                            // Authentication is successful
                            isAuthenticated = true;
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Log the error (for debugging purposes)
                    message.InnerHtml = "<p style='color:red;'>Error: " + ex.Message + "</p>";
                }
            }

            return isAuthenticated;
        }
    }
}
