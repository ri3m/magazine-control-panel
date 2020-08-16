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
    public partial class AssociationsPage : System.Web.UI.Page
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

                    Response.Redirect("Login.aspx");

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

           


                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MagConPanDBCS"].ConnectionString))

                {

                    con.Open();

                    SqlCommand cmd = new SqlCommand("insert into Association(SectionName,Issue,FPageNumNSec,SectionNo) values('" + DropDownList2.SelectedValue + "','" + DropDownList1.SelectedValue + "','" + TextBox1.Text + "','" + TextBox2.Text + "') ", con);

                    cmd.ExecuteNonQuery();

                    con.Close();
                 
                   TextBox1.Text = "";
                   TextBox2.Text = "";
                   DropDownList1.Items.Clear();
                   DropDownList2.Items.Clear();
                   Page.Response.Redirect(Page.Request.Url.ToString(), true);

                  String success = "alert('تم الحفظ بنجاح');";
                  ClientScript.RegisterStartupScript(typeof(Page), "MassegDiplay", success, true);


                 }

            


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
