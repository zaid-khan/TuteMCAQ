using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserIDP"] == null && System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
            {
                Response.Redirect("/TuteMCAQ/Logout.aspx");
            }
        }
    }
}
