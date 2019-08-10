using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;

public partial class Login : System.Web.UI.Page
{
    string name;
    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (Request.IsAuthenticated)
            Response.Redirect("~/Default.aspx");
    }

    protected void LogInbtn_Click(object sender, EventArgs e)
    {

        if (Page.IsValid)
        {

            if (AuthenticateUser())
            {
                /*HttpContext.Current.User.Identity.Name;*/
                if (name != null)
                {
                    FormsAuthentication.SetAuthCookie(name, RememberMe.Checked);
                    
                    //Response.Write("user name : " + HttpContext.Current.User.Identity.Name);
                }
                string urlto = FormsAuthentication.GetRedirectUrl(name, RememberMe.Checked);
                if (urlto.Contains("Login"))
                    Response.Redirect("~/Default.aspx");
                else
                    Response.Redirect(urlto);
                //FormsAuthentication.RedirectFromLoginPage(inputUserID.Text, RememberMe.Checked);
            }
            else
            {
                MessageforLogin.Text = "Invalid UserID or Password";
            }


        }
    }

    private bool AuthenticateUser()
    {
        string CS = ConfigurationManager.ConnectionStrings["TuteDB"].ConnectionString;
        try
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("spAuthenticateUser", con); 
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserID", inputUserID.Text);
                cmd.Parameters.AddWithValue("@Password", inputPassword.Text);
                con.Open();
                int ReturnCode = Convert.ToInt32(cmd.ExecuteScalar());

                if (ReturnCode == 1)
                {
                    //CREATING THE USERIDP SESSION VARIABLE AND SETTING THE TIME OUT TO 20 MINUTES
                
                    Session["UserIDP"] = inputUserID.Text;
                    Session.Timeout = 50;
                    SqlCommand getuser = new SqlCommand("spGetUserName", con);
                    getuser.CommandType = System.Data.CommandType.StoredProcedure;
                    getuser.Parameters.AddWithValue("@UserID", inputUserID.Text);
                    name = getuser.ExecuteScalar().ToString();
                    name = name.Split(' ').First();
                }
                return ReturnCode == 1;
            }
        }
        catch (Exception exc)
        {
            return false;
        }
    }
}