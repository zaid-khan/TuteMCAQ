using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;

public partial class Forgot : System.Web.UI.Page
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (Request.IsAuthenticated)
            Response.Redirect("~/Default.aspx");
    }

    protected void LogInbtn_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string CS = ConfigurationManager.ConnectionStrings["TuteDB"].ConnectionString;
            try
            {
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("spForgotPasswordValid", con);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@UserID", inputUserID.Text);
                    cmd.Parameters.AddWithValue("@EmailID", inputEmailID.Text);
                    cmd.Parameters.AddWithValue("@DOB", inputDOB.Text);
                    con.Open();
                    int ReturnCode = Convert.ToInt32(cmd.ExecuteScalar());
                    if (ReturnCode == 1)
                    {
                        SqlCommand getcmd = new SqlCommand("spGetPassword", con);
                        getcmd.CommandType = System.Data.CommandType.StoredProcedure;
                        getcmd.Parameters.AddWithValue("@UserID", inputUserID.Text);
                        string Password = getcmd.ExecuteScalar().ToString();
                        MessageforSuccess.Text = "Success";
                        MessageforFailure.Text = "";
                        Session["myuserid"] = inputUserID.Text;
                        Response.Redirect("Recovery.aspx");
                        //string Alert = "alert('Your Password is " + Password + "')";
                        //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", Alert, true);
                    }
                    else
                    {
                        MessageforSuccess.Text = "";
                        MessageforFailure.Text = "Invalid User";
                    }
                }
            }
            catch (Exception exc)
            {
                MessageforSuccess.Text = "Failure";
                /*Exception code*/
            }
        }
    }
}