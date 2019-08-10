using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Registrationresult : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string status = Session["Status"].ToString();
        Session.Remove("Status");
        if(status.Equals("Success"))
        { 
            MessageReg.CssClass = "largerMsg text-success";
            MessageReg.Text = "Registration Success";
            MessageID.CssClass = "largerMsgID";
            MessageID.Text = "Your USER-ID is " + Session["UserID"].ToString();
        }
        else
        {
            MessageReg.CssClass = "largerMsg text-error";
            MessageReg.Text = "Registration Failure";
        }
    }
}