using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;


public partial class RegisteredContent_Default : System.Web.UI.Page
{
    public Dictionary<string, string> Question
    {
        get
        {
            return ViewState["question"] != null
                ? ((Dictionary<string, string>)ViewState["question"]) : null;

        }
        set
        {
            ViewState["question"] = value;
        }
    }
    static int counter;

    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            counter = 90;
            //SETTING THE TIMER INTERVAL
            Timer2.Enabled = true;
            Timer2.Interval = counter * 1000; //COMMENT THE ABOVE LINE IF YOU UNCOMMENT THIS LINE
            target_interval.Value = "90000";
            //Timer1.Interval = 1000;
        }

    }


    protected void Page_Init(object sender, EventArgs e)
    {
        ControlParameter pr = new ControlParameter("QuestionIDD", TypeCode.String, "DropDownList1", "SelectedValue");
        pr.DefaultValue = DropDownList1.SelectedValue;
        SqlDataSource2.SelectParameters.Add(pr);

    }



    protected void Page_Load(object sender, EventArgs e)
    {
        TopUserName.InnerHtml = "Best of Luck <em>" + HttpContext.Current.User.Identity.Name + "</em>!";
        if (!IsPostBack)
        {

            DropDownList1.DataBind();

            if (Question == null)
            {
                Question = new Dictionary<string, string>();
                //Dictionary<string, string> ques =
                //ViewState["ques"] = ques;
            }
            foreach (ListItem myItem in DropDownList1.Items)
            {
                myItem.Attributes.Add("style", "background-color:red;color:white");
                //myItem.Attributes.Add("style", "");
            }

        }
    }

    public void Page_PreRender(object sender, EventArgs e)
    {
        DetailsView1.DataBind();
        //this.DataBind();
        ContainsKey();

        if (IsPostBack)
            ChangeColor();
    }


    //CONTAINS KEY AND CHANGE COLOR METHODS
    public void ContainsKey()
    {
        string value = DropDownList1.SelectedValue;
        if (Question.ContainsKey(value))
        {
            //txtR.Text = "DropDownlist ex contains " + value;

            string key = Question[value];
            switch (key)
            {

                case "1":
                    //txtR.Text = "Selected Value previously of this Option is 1";
                    ((RadioButton)DetailsView1.FindControl("Option1")).Checked = true;
                    break;
                case "2":
                    //txtR.Text = "Selected Value previously of this Option is 2";
                    ((RadioButton)DetailsView1.FindControl("Option2")).Checked = true;
                    break;
                case "3":
                    //txtR.Text = "Selected Value previously of this Option is 3";
                    ((RadioButton)DetailsView1.FindControl("Option3")).Checked = true;
                    break;
                case "4":
                    //txtR.Text = "Selected Value previously of this Option is 4";
                    ((RadioButton)DetailsView1.FindControl("Option4")).Checked = true;
                    break;
            }
        }
    }


    public void ChangeColor()
    {
        foreach (ListItem myItem in DropDownList1.Items)
        {

            if (Question.ContainsKey(myItem.Value))
            {
                string val = Question[myItem.Value];
                if (val.Equals("-1"))
                    myItem.Attributes.Add("style", "background-color:yellow;color:black");
                else
                    myItem.Attributes.Add("style", "background-color:green;color:white");
            }
            else
                myItem.Attributes.Add("style", "background-color:red;color:white");
            //myItem.Attributes.Add("style", "");
        }
    }

    //END OF CHANGE COLOR AND CONTAINS KEY




    //BUTTON CLICKS
    protected void btnNext_Click(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex != (DropDownList1.Items.Count - 1))
            ++DropDownList1.SelectedIndex;
        //ContainsKey();
    }

    protected void btnPrev_Click(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex != 0)
            --DropDownList1.SelectedIndex;
        //ContainsKey();

    }

    protected void btnFlag_Click(object sender, EventArgs e)
    {
        if (Question.ContainsKey(DropDownList1.SelectedValue))
            Question[DropDownList1.SelectedValue] = "-1";
        else
            Question.Add(DropDownList1.SelectedValue, "-1");
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        if (Question.ContainsKey(DropDownList1.SelectedValue))
            Question.Remove(DropDownList1.SelectedValue);

    }

    //END OF BUTTON CLICKS




    //Option Changed Events

    protected void Option1_CheckedChanged(object sender, EventArgs e)
    {
        //ViewState["count"] = Convert.ToInt32(ViewState["count"]) + 1;

        //Dictionary<string, string> ques = (Dictionary<string, string>)ViewState["ques"];
        if (Question.ContainsKey(DropDownList1.SelectedValue))
            Question[DropDownList1.SelectedValue] = "1";
        else
            Question.Add(DropDownList1.SelectedValue, "1");
        //ViewState["ques"] = ques;
        //dropdownlist1.Items[0].Attributes.CssStyle.Add("color", "red");
        //DropDownList1.Items[0].Attributes.CssStyle.Add("color", "red");
        //ChangeColor();
    }

    protected void Option2_CheckedChanged(object sender, EventArgs e)
    {
        //ViewState["count"] = Convert.ToInt32(ViewState["count"]) + 1;
        //Dictionary<string, string> ques = (Dictionary<string, string>)ViewState["ques"];
        if (Question.ContainsKey(DropDownList1.SelectedValue))
            Question[DropDownList1.SelectedValue] = "2";
        else
            Question.Add(DropDownList1.SelectedValue, "2");
        //ViewState["ques"] = ques;

        //ChangeColor();
    }

    protected void Option3_CheckedChanged(object sender, EventArgs e)
    {
        //ViewState["count"] = Convert.ToInt32(ViewState["count"]) + 1;
        //Dictionary<string, string> ques = (Dictionary<string, string>)ViewState["ques"];
        if (Question.ContainsKey(DropDownList1.SelectedValue))
            Question[DropDownList1.SelectedValue] = "3";
        else
            Question.Add(DropDownList1.SelectedValue, "3");
        //ViewState["ques"] = ques;

        //ChangeColor();
    }

    protected void Option4_CheckedChanged(object sender, EventArgs e)
    {
        //ViewState["count"] = Convert.ToInt32(ViewState["count"]) + 1;
        //Dictionary<string, string> ques = (Dictionary<string, string>)ViewState["ques"];
        if (Question.ContainsKey(DropDownList1.SelectedValue))
            Question[DropDownList1.SelectedValue] = "4";
        else
            Question.Add(DropDownList1.SelectedValue, "4");
        //ViewState["ques"] = ques;

        //ChangeColor();
    }

    //End of Option Event Change

    //Timer Tick Event
    protected void Timer2_Tick(object sender, EventArgs e)
    {
        //Timer1.Enabled = false;
        Timer2.Enabled = false;
        int res = saveChanges();
        if (res != 0)
            Response.Redirect("Result.aspx?ResID=" + res);
        else
            Response.Redirect("Result.aspx");
        //Response.Redirect("Result.aspx");
    }

    //End of Timer Tick Event







    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int res = saveChanges();
        //Session["Result"] = ViewState["question"];
        if (res != 0)
            Response.Redirect("Result.aspx?ResID=" + res);
        else
            Response.Redirect("Result.aspx");
    }

    protected void btnQuit_Click(object sender, EventArgs e)
    {
        Response.Redirect("Result.aspx");
    }


    public int saveChanges()
    {
        string CS = ConfigurationManager.ConnectionStrings["TuteDB"].ConnectionString;
        int qatt = 0, totalq = 10, marksoutof = 0, totalm = totalq * 4, s1marks = 0, s1total = totalm / 2,
            s2marks = 0, s2total = totalm / 2, qs1att = 0, rs1 = 0, totals1q = totalq / 2, qs2att = 0, rs2 = 0, totals2q = totalq / 2;

        if (Question != null)
        {
            foreach (KeyValuePair<string, string> kv in Question)
            {
                int key = Convert.ToInt32(kv.Key.ToString());
                int value = Convert.ToInt32(kv.Value.ToString());
                if (value >= 1 && value <= 4)
                {
                    //Increment the qatt column
                    qatt++;



                    try
                    {
                        using (SqlConnection con = new SqlConnection(CS))
                        {
                            SqlCommand cmd = new SqlCommand("spReturnType", con);
                            cmd.CommandType = System.Data.CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@Key", key);
                            con.Open();
                            int returntype = Convert.ToInt32(cmd.ExecuteScalar());
                            con.Close();
                            if (returntype == 1)
                            {
                                qs1att++;
                                using (SqlConnection con2 = new SqlConnection(CS))
                                {
                                    SqlCommand cmd2 = new SqlCommand("spCheckAnswer", con2);
                                    cmd2.CommandType = System.Data.CommandType.StoredProcedure;
                                    cmd2.Parameters.AddWithValue("@Key", key);
                                    cmd2.Parameters.AddWithValue("@Value", value);
                                    con2.Open();
                                    int answervalue = Convert.ToInt32(cmd2.ExecuteScalar());
                                    if (answervalue == 4)
                                        rs1++;
                                    con2.Close();
                                    s1marks += answervalue;
                                }
                            }
                            else
                            {
                                qs2att++;
                                using (SqlConnection con2 = new SqlConnection(CS))
                                {
                                    SqlCommand cmd2 = new SqlCommand("spCheckAnswer", con2);
                                    cmd2.CommandType = System.Data.CommandType.StoredProcedure;
                                    cmd2.Parameters.AddWithValue("@Key", key);
                                    cmd2.Parameters.AddWithValue("@Value", value);
                                    con2.Open();
                                    int answervalue = Convert.ToInt32(cmd2.ExecuteScalar());
                                    if (answervalue == 4)
                                        rs2++;
                                    con2.Close();
                                    s2marks += answervalue;
                                }
                            }
                        }

                    }
                    catch (Exception exc)
                    {
                        Response.Write(exc.Message);
                    }
                }

                //if(kv.Value.ToString())
                //Response.Write("Count : " + count + "<br/>");
                //Response.Write("Key : " + kv.Key.ToString() + "<br/>");
                //Response.Write("Value : " + kv.Value.ToString() + "<br/>");

            }
            marksoutof = s1marks + s2marks;
            int result = 0;
            try
            {
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("spAddNewResult", con);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@UserID", Session["UserIDP"]); //done
                    cmd.Parameters.AddWithValue("@QuesAtt", qatt); //done
                    cmd.Parameters.AddWithValue("@TotalQ", totalq); //done
                    cmd.Parameters.AddWithValue("@MarksOutOf", marksoutof); //done
                    cmd.Parameters.AddWithValue("@TotalMarks", totalm); //done
                    cmd.Parameters.AddWithValue("@Subject1Marks", s1marks); //done
                    cmd.Parameters.AddWithValue("@Subject1Total", s1total); //done
                    cmd.Parameters.AddWithValue("@Subject2Marks", s2marks); //done
                    cmd.Parameters.AddWithValue("@Subject2Total", s2total); //done
                    cmd.Parameters.AddWithValue("@QuesAttS1", qs1att); //done
                    cmd.Parameters.AddWithValue("@RightQuesS1", rs1);
                    cmd.Parameters.AddWithValue("@TotalQuesS1", totals1q); //done
                    cmd.Parameters.AddWithValue("@QuesAttS2", qs2att); //done
                    cmd.Parameters.AddWithValue("@RightQuesS2", rs2);
                    cmd.Parameters.AddWithValue("@TotalQuesS2", totals2q); //done
                    con.Open();
                    result = Convert.ToInt32(cmd.ExecuteScalar());
                    con.Close();
                }
            }
            catch (Exception exc)
            {
                Response.Write("Error in Insertion " + exc.Message);
            }
            Session["qatt"] = qatt;
            Session["qs1att"] = qs1att;
            Session["qs2att"] = qs2att;
            Session["s1marks"] = s1marks;
            Session["s2marks"] = s2marks;


            return result;

        }
        return 0;
    }

    
}