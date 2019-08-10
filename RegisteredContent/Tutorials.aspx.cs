using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Tutorials : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton ib = (ImageButton)sender;
        string filename = ib.ToolTip;

        Response.ContentType = "Application/pdf";
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + filename);
        Response.TransmitFile(Server.MapPath("~/AdminTuteMCAQ/PDFs/" + filename));
        Response.End();
        //PostBackUrl = "~/AdminTuteMCAQ/PDFs/numsys.pdf"
    }
}