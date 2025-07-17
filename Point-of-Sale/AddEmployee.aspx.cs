using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;
using System.Xml.Linq;
using System.Net.Configuration;

namespace Point_Of_Sale
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-G133VUQ\\SQLEXPRESS;Initial Catalog=POS;Integrated Security=True\r\n");
        protected void button_click_add_employee(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-G133VUQ\\SQLEXPRESS;Initial Catalog=POS;Integrated Security=True"))
                {
                    using (SqlCommand cmd = new SqlCommand("add_employ", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // Convert input to required types
                        cmd.Parameters.AddWithValue("@empID", Convert.ToInt32(txtID.Text));
                        cmd.Parameters.AddWithValue("@empName", txtName.Text);
                        cmd.Parameters.AddWithValue("@designation", txtDesignation.Text);
                        cmd.Parameters.AddWithValue("@PhoneNo", Convert.ToInt32(txtPhone.Text));
                        cmd.Parameters.AddWithValue("@address", txtAddress.Text);
                        cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                        cmd.Parameters.AddWithValue("@cnic", Convert.ToInt32(txtCNIC.Text));
                        cmd.Parameters.AddWithValue("@bdate", Convert.ToDateTime(txtDOB.Text));
                        cmd.Parameters.AddWithValue("@salary", Convert.ToInt32(txtSalary.Text));
                        cmd.Parameters.AddWithValue("@joindate", Convert.ToDateTime(txtJoiningDate.Text));
                        cmd.Parameters.AddWithValue("@UserName", txtusername.Text);
                        cmd.Parameters.AddWithValue("@Password", txtpassword.Text);
                        cmd.Parameters.AddWithValue("@AccessibilityStatus", Convert.ToInt32(txtaccessibility.Text));

                        con.Open();
                        cmd.ExecuteNonQuery();
                        msg.InnerText = "Employee Hired Successfully!";
                    }
                }
            }
            catch (FormatException ex)
            {
                msg.InnerText = $"Input Error: {ex.Message}. Please enter valid data.";
            }
            catch (Exception ex)
            {
                msg.InnerText = $"Database Error: {ex.Message}";
            }
        }

    }
}
