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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Loginbtn_Click(object sender, EventArgs e)
        {

            SqlConnection con;
            SqlCommand cmd;


            if ((txtusername.Text == "") || (txtPw.Text == ""))
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "popup", "alert('الرجاء تعبئة جميع الحقول')", true);
            }
            //connect to db
            using (con = new SqlConnection(ConfigurationManager.ConnectionStrings["MagConPanDBCS"].ConnectionString))
            {


                con.Open();
                cmd = new SqlCommand("select * from users where username='" + txtusername.Text + "' and password='" + txtPw.Text + "' ", con);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows == true)
                {
                    dr.Read();
                    Session["username"] = dr["username"].ToString();
                    Response.Redirect("mainpage.aspx");
                    cmd.Dispose();
                    con.Dispose();
                }


                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "popup", "alert('حدث خطأ اثناء تشغيل الدخول ,الرجاء المحاولة لامجدداً')", true);
                }
            }

        }

        protected void txtPw_TextChanged(object sender, EventArgs e)
        {

        }
    }
}