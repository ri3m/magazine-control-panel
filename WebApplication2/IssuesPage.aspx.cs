using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;


namespace WebApplication2
{
    public partial class IssuesPage : System.Web.UI.Page
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
       


        protected void Button1_Click1(object sender, EventArgs e)
        {
            

                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MagConPanDBCS"].ConnectionString))
                {
                    con.Open();
                    SqlCommand cmb = new SqlCommand("insert into Issues (Issue,IssueNo,IssueDate,status) values (@Issue,@IssueNo,@IssueDate,@status)", con);
                    cmb.Parameters.AddWithValue("@Issue", TextBox1.Text);
                    cmb.Parameters.AddWithValue("@IssueNo", TextBox2.Text);
                    cmb.Parameters.AddWithValue("@IssueDate", TextBox3.Text);
                    cmb.Parameters.AddWithValue("@status", DropDownList1.SelectedValue);
                    cmb.ExecuteNonQuery();

                    con.Close();
                   TextBox1.Text = "";
                   TextBox2.Text = "";
                   TextBox3.Text = "";
                   DropDownList1.Items.Clear();
                   Page.Response.Redirect(Page.Request.Url.ToString(), true);


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


        
  