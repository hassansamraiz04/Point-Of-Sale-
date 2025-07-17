using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Threading.Tasks;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;
using System.Web.Services.Description;

namespace Point_Of_Sale
{
    public partial class low_inventory : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-G133VUQ\\SQLEXPRESS;Initial Catalog=POS;Integrated Security=True");
        protected void button_click_display_low_inventory(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Low_inventory", con);
            cmd.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            GridViewlowinventory.DataSource = dt;
            GridViewlowinventory.DataBind();

            // Set properties for GridView after binding data
            GridViewlowinventory.HorizontalAlign = HorizontalAlign.Center;
            GridViewlowinventory.BorderWidth = 2;
            GridViewlowinventory.BorderStyle = BorderStyle.Double;
            GridViewlowinventory.HeaderStyle.Font.Bold = true;
            GridViewlowinventory.HeaderStyle.ForeColor = System.Drawing.Color.Black; // Optional: Change header text color
            Color customColor = Color.FromArgb(236, 225, 255);
            GridViewlowinventory.BackColor = customColor;
            GridViewlowinventory.HeaderStyle.Font.Bold = true;
            GridViewlowinventory.HeaderStyle.ForeColor = Color.White; // Header text color
            Color customColor1 = Color.FromArgb(69, 15, 96);
            GridViewlowinventory.HeaderStyle.BackColor = customColor1; // Header background color
            GridViewlowinventory.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
            GridViewlowinventory.HeaderStyle.Height = 40;

            // Set width of HeaderRow after the GridView is fully populated
            if (GridViewlowinventory.HeaderRow != null)
            {
                GridViewlowinventory.HeaderRow.Width = 50; // Set width only if HeaderRow exists
            }

            foreach (GridViewRow row in GridViewlowinventory.Rows)
            {
                foreach (TableCell cell in row.Cells)
                {
                    cell.Style["padding"] = "10px"; // Adjust padding as needed
                }
            }

            btnDisplaylowinventory.Visible = false;
            con.Close();
        }

    }
}