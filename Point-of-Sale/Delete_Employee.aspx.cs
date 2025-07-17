using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Point_Of_Sale
{
    public partial class WebForm11 : System.Web.UI.Page
    {
        // Connection string for your database
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-G133VUQ\\SQLEXPRESS;Initial Catalog=POS;Integrated Security=True");

        // Event handler for the button click to delete an employee
        protected void button_click_delete_employee(object sender, EventArgs e)
        {
            try
            {
                // Retrieve the Employee ID from the textbox
                int employeeID = Convert.ToInt32(txtID.Text);

                // Open connection to the database
                con.Open();

                // Create the SqlCommand object and set the stored procedure name
                SqlCommand cmd = new SqlCommand("remove_employ", con);
                cmd.CommandType = CommandType.StoredProcedure;

                // Add the EmployeeID parameter to the stored procedure
                cmd.Parameters.AddWithValue("@employID", employeeID);

                // Execute the stored procedure to delete the employee
                cmd.ExecuteNonQuery();

                // Close the connection
                con.Close();

                // Display success message
                message.InnerText = "Employee deleted successfully.";
                message.Attributes["class"] = "success";  // Apply success style
            }
            catch (Exception ex)
            {
                // Handle any errors that may have occurred
                message.InnerText = "Error: " + ex.Message;
                message.Attributes["class"] = "error";  // Apply error style
            }
        }
    }
}
