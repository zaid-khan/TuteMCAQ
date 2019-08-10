using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class AdminTuteMCAQ_Home : System.Web.UI.Page
{
    protected void Logout_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        Session.Abandon();
        Session.Clear();
        Response.Redirect("/TuteMCAQ/AdminTuteMCAQ/Home.aspx");
    }
}