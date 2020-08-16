using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class Sections : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Session["username"] != null)
                {
                     Response.ClearHeaders();
                    Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
                    Response.AddHeader("Pragma", "no-cache");

                }
                else
                {
                    Response.Redirect("login.aspx");
                }
            }


        }
        protected void Logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string mainconn = ConfigurationManager.ConnectionStrings["MagConPanDBCS"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(mainconn);
            string sqlquery = "insert into [dbo].[Sections](SectionName)values(@SectionName)";
            SqlCommand sqlcomm = new SqlCommand(sqlquery, sqlconn);
            sqlcomm.Parameters.AddWithValue("@SectionName", TextBox1.Text);
            sqlconn.Open();
            sqlcomm.ExecuteNonQuery();
            sqlconn.Close();
            TextBox1.Text = "";
            String success = "alert('تم الحفظ بنجاح');";
            ClientScript.RegisterStartupScript(typeof(Page), "MassegDiplay", success, true);

        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                string success = "alert('Deleted!');";
                ClientScript.RegisterStartupScript(typeof(Page), "MessageDisplay", success, true);
            }
            if (e.CommandName == "Update")
            {
                string success = "alert('Updated!');";
                ClientScript.RegisterStartupScript(typeof(Page), "MessageDisplay", success, true);
            }
        }
    }
}