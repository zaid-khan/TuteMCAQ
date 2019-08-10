using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if(Session["LoggedIn"] != null)
        //    Label1.Text = "Hello Zaid!";
    }

    protected void btncli_Click(object sender, EventArgs e)
    {
        Session["LoggedIn"] = "Hello";
    }
}