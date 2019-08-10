using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Recovery : System.Web.UI.Page
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (Request.IsAuthenticated)
            Response.Redirect("~/Default.aspx");
        else if (Session["myuserid"] == null)
            Response.Redirect("Forgot.aspx");
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ChangedPassword_ServerClick(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {

            if (AuthenticateUser())
            {
                /*HttpContext.Current.User.Identity.Name;*/
                lblNot.CssClass = "alert-success text-success";
                lblNot.Text = "Password Changed Successfully!";
                Session.Remove("myuserid");
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                "alert",
                "alert('Password changed sucessfully. Click OK to Login');window.location ='Login.aspx';",
                true);
                //FormsAuthentication.RedirectFromLoginPage(inputUserID.Text, RememberMe.Checked);
            }
            else
            {

                lblNot.CssClass = "alert-danger text-error";
                lblNot.Text = "Password Unchanged!";
            }
        }
    }

    private bool AuthenticateUser()
    {
        string userid = Session["myuserid"].ToString();

        string CS = ConfigurationManager.ConnectionStrings["TuteDB"].ConnectionString;
        try
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand getuser = new SqlCommand("spChangePassword", con);
                getuser.CommandType = System.Data.CommandType.StoredProcedure;

                getuser.Parameters.AddWithValue("@UserID", userid);
                getuser.Parameters.AddWithValue("@Password", inputPassword.Text);
                con.Open();
                getuser.ExecuteScalar();

                return true;
            }

        }
        catch (Exception exc)
        {
            return false;
        }
    }
}