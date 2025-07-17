using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Point_Of_Sale
{
    public partial class Display_Employees : System.Web.UI.Page
    {
        // Connection string for your database
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-G133VUQ\\SQLEXPRESS;Initial Catalog=POS;Integrated Security=True\r\n");

        // Event handler for the button click to display employees
        protected void button_click_display_employees(object sender, EventArgs e)
        {
            try
            {
                // Open connection to the database
                con.Open();

                // Create the SqlCommand object and set the stored procedure name
                SqlCommand cmd = new SqlCommand("display_employ", con);
                cmd.CommandType = CommandType.StoredProcedure;

                // Create a SqlDataAdapter to retrieve the data
                SqlDataAdapter da = new SqlDataAdapter(cmd);

                // Create a DataTable to store the result set
                DataTable dt = new DataTable();

                // Fill the DataTable with the data from the stored procedure
                da.Fill(dt);

                // Bind the DataTable to the GridView to display employees
                GridViewEmployees.DataSource = dt;
                GridViewEmployees.DataBind();

                // Close the connection
                con.Close();

                // Display success message
                message.InnerText = "Employees loaded successfully.";
            }
            catch (Exception ex)
            {
                // Handle any errors that may have occurred
                message.InnerText = "Error: " + ex.Message;
            }
        }
    }
}
