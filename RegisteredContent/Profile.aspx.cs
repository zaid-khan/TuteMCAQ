using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;

public partial class RegisteredContent_Profile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = HttpContext.Current.User.Identity.Name + "\'s Profile - TuteMCAQ";
        if (Session["UserIDP"] == null)
            lblError.Text = "Session has expired";
        ViewP.Attributes.Add("class", "btn btn-info");
    }

    protected void ViewP_ServerClick(object sender, EventArgs e)
    {
        //DivProgress.Attributes.Add("style", "width: " + ((double)counter * 14.28) + "%;");
       
        content2.Attributes.Add("hidden", "hidden");
        content3.Attributes.Add("hidden", "hidden");
        content1.Attributes.Remove("hidden");
        ViewP.Attributes.Add("class", "btn btn-info");
        ViewR.Attributes.Add("class", "btn");
        ChnP.Attributes.Add("class", "btn");
        //content1.Attributes.Add("visible", "true");
        //content2.Attributes.Add("visible", "false");
        //content3.Attributes.Add("visible", "false");

    }

    protected void ViewR_ServerClick(object sender, EventArgs e)
    {
        content1.Attributes.Add("hidden", "hidden");
        content3.Attributes.Add("hidden", "hidden");
        content2.Attributes.Remove("hidden");
        ViewP.Attributes.Add("class", "btn");
        ViewR.Attributes.Add("class", "btn btn-info");
        ChnP.Attributes.Add("class", "btn");
        //content1.Attributes.Add("visible", "false");
        //content2.Attributes.Add("visible", "true");
        //content3.Attributes.Add("visible", "false");

    }


    protected void ChnP_ServerClick(object sender, EventArgs e)
    {
        content1.Attributes.Add("hidden", "hidden");
        content2.Attributes.Add("hidden", "hidden");
        content3.Attributes.Remove("hidden");
        ViewP.Attributes.Add("class", "btn");
        ViewR.Attributes.Add("class", "btn");
        ChnP.Attributes.Add("class", "btn btn-info");
        //content1.Attributes.Add("visible", "false");
        //content2.Attributes.Add("visible", "false");
        //content3.Attributes.Add("visible", "true");
    }


    protected void DetailsView1_ItemUpdated(
        object sender, DetailsViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = "A database error has occurred. " +
                "Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
        }
        else if (e.AffectedRows == 0)
            lblError.Text = "Not able to update profile. " +
                "Please try again.";
        else
            lblSuccess.Text = "Profile Successfully updated.";

    }

    protected void ChangedPassword_ServerClick(object sender, EventArgs e)
    {
        content1.Attributes.Add("hidden", "hidden");
        content2.Attributes.Add("hidden", "hidden");
        content3.Attributes.Remove("hidden");
        ViewP.Attributes.Add("class", "btn");
        ViewR.Attributes.Add("class", "btn");
        ChnP.Attributes.Add("class", "btn btn-info");
        if (Page.IsValid)
        {

            if (AuthenticateUser())
            {
                /*HttpContext.Current.User.Identity.Name;*/
                lblNot.CssClass = "alert-success text-success";
                lblNot.Text = "Password Changed Successfully!";

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
        string CS = ConfigurationManager.ConnectionStrings["TuteDB"].ConnectionString;
        try
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("spAuthenticateUser", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserID", Session["UserIDP"].ToString());
                cmd.Parameters.AddWithValue("@Password", inputOld.Value);
                con.Open();
                int ReturnCode = Convert.ToInt32(cmd.ExecuteScalar());

                if (ReturnCode == 1)
                {
                    SqlCommand getuser = new SqlCommand("spChangePassword", con);
                    getuser.CommandType = System.Data.CommandType.StoredProcedure;
                    getuser.Parameters.AddWithValue("@UserID", Session["UserIDP"].ToString());
                    getuser.Parameters.AddWithValue("@Password", inputPassword.Value);
                    getuser.ExecuteScalar();
                    return true;
                }

            }
            return false;
        }
        catch (Exception exc)
        {
            return false;
        }
    }

    protected void EmailCustomValidation_ServerValidate(object source, ServerValidateEventArgs args)
    {
        string CS = ConfigurationManager.ConnectionStrings["TuteDB"].ConnectionString;
        try
        {
            string newemail = ((TextBox)DetailsView1.FindControl("txtEmail")).Text;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("spValidateEmail", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Email", newemail);
                con.Open();
                bool validemail = Convert.ToBoolean(cmd.ExecuteScalar());
                if (!validemail)
                    args.IsValid = false;

                else
                    args.IsValid = true;
            }
        }
        catch (Exception exc)
        {
            lblError.Text = "Email Error " + exc.Message;
        }

    }

    protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        //string newemail = e.NewValues["txtEmail"].ToString();
        //CustomValidator cv = (CustomValidator)DetailsView1.FindControl("CustomValidator1"
        
    }
}