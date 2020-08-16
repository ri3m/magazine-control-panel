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
    public partial class Pages : System.Web.UI.Page
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

        protected void btn_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MagConPanDBCS"].ConnectionString))
                    {
                        con.Open();
                        SqlCommand command = new SqlCommand("insert into dbo.Pages(PageTitle,PageContent,PageNo) values (N'" + PageTitle.Text + "',N'" + PageContent.Text + "','" + PageNo.Text + "')", con);
                        command.Parameters.AddWithValue("PageTitle", PageTitle.Text);
                        command.Parameters.AddWithValue("PageContent", PageContent.Text);
                        command.Parameters.AddWithValue("PageNo", PageNo.Text);
                        command.ExecuteNonQuery();
                        con.Close();
                        PageTitle.Text = "";
                        PageContent.Text = "";
                        PageNo.Text = "";
                        String success = "alert('تم الحفظ بنجاح');";
                        ClientScript.RegisterStartupScript(typeof(Page), "MassegDiplay", success, true);
                    }
                }
                catch (SqlException ex)
                {
                    HttpContext.Current.Response.Write("<script> alert('لم يتم الحفظ')</script>");
                }
                catch (Exception)
                {
                    HttpContext.Current.Response.Write("<script> alert('invalid')</script>");
                }
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