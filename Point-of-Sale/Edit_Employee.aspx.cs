using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Point_Of_Sale
{
    public partial class WebForm10 : System.Web.UI.Page
    {
        // Connection string for your database
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-G133VUQ\\SQLEXPRESS;Initial Catalog=POS;Integrated Security=True");

        // Event handler for the button click to update employee details
        protected void button_click_update_employee(object sender, EventArgs e)
        {
            try
            {
                // Open connection to the database
                con.Open();

                // Create the SqlCommand object and set the stored procedure name
                SqlCommand cmd = new SqlCommand("update_employ", con);
                cmd.CommandType = CommandType.StoredProcedure;

                // Add parameters for the stored procedure
                cmd.Parameters.AddWithValue("@employeeid", Convert.ToInt32(txtID.Text)); // Employee ID
                cmd.Parameters.AddWithValue("@designation", txtDesignation.Text); // Designation
                cmd.Parameters.AddWithValue("@phNo", Convert.ToInt32(txtPhone.Text)); // Phone number
                cmd.Parameters.AddWithValue("@address", txtAddress.Text); // Address
                cmd.Parameters.AddWithValue("@salary", Convert.ToInt32(txtSalary.Text)); // Salary
                cmd.Parameters.AddWithValue("@UserName", txtusername.Text); // User Name
                cmd.Parameters.AddWithValue("@Password", txtpassword.Text); // Password
                cmd.Parameters.AddWithValue("@AccessibilityStatus", Convert.ToInt32(txtaccessibility.Text)); // Accessibility Status

                // Execute the stored procedure
                cmd.ExecuteNonQuery();

                // Close the connection
                con.Close();

                // Display a success message
                message.InnerText = "Employee information updated successfully.";
            }
            catch (Exception ex)
            {
                // Handle any errors that may have occurred
                message.InnerText = "Error: " + ex.Message;
            }
        }
    }
}
