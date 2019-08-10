using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RegisteredContent_Default2 : System.Web.UI.Page
{
    int count = 0;
    public Dictionary<string, string> Question
    {
        get
        {
            return Session["Result"] != null
                ? ((Dictionary<string, string>)Session["Result"]) : null;

        }
        set
        {
            Session["Result"] = value;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ResID"] == null)
        {

            //your code that depends on aspxerrorpath here
            ResHeader.InnerText = "Invalid Result";
            TopUserName.InnerHtml = "Error";
            DetailsView1.Enabled = false;
            DetailsView1.Visible = false;
        }
        TopUserName.InnerHtml = "Your result <em><strong>" + HttpContext.Current.User.Identity.Name + "</strong></em>!";
        //if(Question != null)
        //{
        //    //foreach(KeyValuePair<string, string> kv in Question)
        //    //{
        //    //    int value = Convert.ToInt32(kv.Value.ToString());
        //    //    if (value >= 1 && value <= 4)
        //    //        count++;
        //    //    //if(kv.Value.ToString())
        //    //    //Response.Write("Count : " + count + "<br/>");
        //    //    Response.Write("Key : " + kv.Key.ToString() + "<br/>");
        //    //    Response.Write("Value : " + kv.Value.ToString() + "<br/>");

        //    //}
        //    Response.Write("Count : " + count + "<br/>");

        //} 

        //Response.Write("The total questions attempted : " + Session["qatt"].ToString() + "<br>");
        //Response.Write("The total S1 questions attempted : " + Session["qs1att"].ToString() + "<br>");
        //Response.Write("The total S2 questions attempted : " + Session["qs2att"].ToString() + "<br>");
        //Response.Write("The total marks in S1 " + Session["s1marks"] + "<br>");
        //Response.Write("The total marks in S2 " + Session["s2marks"] + "<br>");


    }
}