using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RegisteredContent_MockExam : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if(!IsPostBack)
        //myModal.Visible = false;
        drpType.Enabled = Option1.Checked;
    }



    protected void Option1_CheckedChanged(object sender, EventArgs e)
    {
        if (Option2.Checked)
        {
            drpType.SelectedIndex = 0;
            drpType.Enabled = false;
        }
    }

    protected void OpenWindow(object sender, EventArgs e)
    {
        //string url = "Default.aspx";
        string s = @"var params = [
                'height='+screen.height,
                'width='+screen.width,
                'fullscreen=yes' // only works in IE, but here for completeness
                    ].join(',');
            var popup = window.open('Default.aspx', 'popup_window', params); 
                popup.moveTo(0,0);
                ";
        ClientScript.RegisterStartupScript(this.GetType(), "script", s, true);
    }
}