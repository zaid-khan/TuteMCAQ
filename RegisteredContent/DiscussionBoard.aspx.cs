using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.DataVisualization.Charting;
using System.Data.SqlClient;
using System.Configuration;

public partial class RegisteredContent_DiscussionBoard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            MultiView1.ActiveViewIndex = 0;
            DropDownList1.SelectedIndex = 0;
            if (CheckandCall())
                GetChartData();
            else
                Label1.Text = "Session Expired!";
        }
    }

    private void GetChartData()
    {
        string userid = Session["UserIDP"].ToString();
        string CS = ConfigurationManager.ConnectionStrings["TuteDB"].ConnectionString;
        int no = 0;
        Series series = Chart1.Series["Series1"];
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("Select COUNT(ResultID) FROM Result WHERE UserID = " + userid, con);
            con.Open();
            no = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            if (no >= 3)
            {
                Label1.Text = "";
                cmd = new SqlCommand("Select TOP 3 DateAppeared, MarksOutOf FROM Result WHERE UserID = " + userid + " ORDER BY DateAppeared DESC ", con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    series.Points.AddXY(reader["DateAppeared"], reader["MarksOutOf"]);
                }
                con.Close();

            }
            else
            {
                Label1.Text = "Sufficient Data not available!";
                Chart1.Enabled = false;
            }
        }

    }

    private void GetChartData2()
    {
        string userid = Session["UserIDP"].ToString();
        string CS = ConfigurationManager.ConnectionStrings["TuteDB"].ConnectionString;
        Series series = Chart2.Series["Series1"];
        int no = 0;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("Select COUNT(ResultID) FROM Result where UserID = " + userid, con);
            con.Open();
            no = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            if (no > 0)
            {
                Label1.Text = "";
                cmd = new SqlCommand("Select SUM(Subject1Marks) as \"Computer Science Marks\" FROM Result WHERE UserID = " + userid, con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                cmd = new SqlCommand("Select SUM(Subject2Marks) as \"Quantitative Aptitude Marks\" FROM Result WHERE UserID = " + userid, con);
                while (reader.Read())
                {
                    series.Points.AddXY("Computer Science Marks", reader["Computer Science Marks"]);
                }
                reader.Close();
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    series.Points.AddXY("Quantitative Aptitude Marks", reader["Quantitative Aptitude Marks"]);
                }
                con.Close();

            }
            else
            {
                Label1.Text = "Sufficient Data not available!";
                Chart2.Enabled = false;
            }
        }

    }





    private void GetChartData3()
    {
        string userid = Session["UserIDP"].ToString();
        string CS = ConfigurationManager.ConnectionStrings["TuteDB"].ConnectionString;
        Series series = Chart3.Series["Series1"];
        int no = 0;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("Select COUNT(ResultID) FROM Result where UserID = " + userid, con);
            con.Open();
            no = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            if (no > 0)
            {
                Label1.Text = "";
                int attempted = 0;
                cmd = new SqlCommand("Select SUM(QuesAttempted) as \"Questions Attempted\" FROM Result WHERE UserID = " + userid, con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    attempted = Convert.ToInt32(reader["Questions Attempted"]);
                    series.Points.AddXY("Questions Attempted", attempted);
                }
                reader.Close();
                cmd = new SqlCommand("Select SUM(TotalQuestions) as \"Total Questions\" FROM Result WHERE UserID = " + userid, con);
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    series.Points.AddXY("Questions Not Attempted", (Convert.ToInt32(reader["Total Questions"]) - attempted));
                }
                con.Close();

            }
            else
            {
                Label1.Text = "Sufficient Data not available!";
                Chart3.Enabled = false;
            }
        }

    }





    private void GetChartData4()
    {
        string userid = Session["UserIDP"].ToString();
        string CS = ConfigurationManager.ConnectionStrings["TuteDB"].ConnectionString;
        Series series = Chart4.Series["Series1"];
        int no = 0;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("Select COUNT(ResultID) FROM Result WHERE UserID = " + userid, con);
            con.Open();
            no = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            if (no > 2)
            {
                Label1.Text = "";
                cmd = new SqlCommand("SELECT AVG(MarksOutOf) AS \"Average Marks\" FROM Result WHERE UserID <> " + userid, con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    series.Points.AddXY("Average of Other Users", Convert.ToInt32(reader["Average Marks"]));
                }
                reader.Close();
                cmd = new SqlCommand("SELECT AVG(MarksOutOf) AS \"Average Marks\" FROM Result WHERE UserID = " + userid, con);
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    series.Points.AddXY("Average of Your Score", Convert.ToInt32(reader["Average Marks"]));
                }
                con.Close();

            }
            else
            {
                Label1.Text = "Sufficient Data not available!";
                Chart4.Enabled = false;
            }
        }

    }




    private void GetChartData5()
    {
        string userid = Session["UserIDP"].ToString();
        string CS = ConfigurationManager.ConnectionStrings["TuteDB"].ConnectionString;
        Series series = Chart5.Series["Series1"];
        int no = 0;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("Select COUNT(ResultID) FROM Result where UserID = " + userid, con);
            con.Open();
            no = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            if (no > 0)
            {
                Label1.Text = "";
                cmd = new SqlCommand("SELECT (SUM(RightQuesS1) + SUM(RightQuesS2)) AS \"RightQuestions\" FROM Result WHERE UserID =  " + userid, con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    series.Points.AddXY("Total Right Questions", Convert.ToInt32(reader["RightQuestions"]));
                }
                reader.Close();
                cmd = new SqlCommand("SELECT SUM(QuesAttempted) AS \"QuesAttempted\" FROM Result WHERE UserID = " + userid, con);
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    series.Points.AddXY("Total Questions Attempted", Convert.ToInt32(reader["QuesAttempted"]));
                }
                con.Close();

            }
            else
            {
                Label1.Text = "Sufficient Data not available!";
                Chart3.Enabled = false;
            }
        }

    }



    private Boolean CheckandCall()
    {
        if (Session["UserIDP"] != null)
            return true;
        else
            return false;
    }


    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex == 0)
        {
            MultiView1.ActiveViewIndex = 0;
            if (CheckandCall())
                GetChartData();
            else
                Label1.Text = "Session Expired!";
        }
        else if (DropDownList1.SelectedIndex == 1)
        {
            MultiView1.ActiveViewIndex = 1;
            if (CheckandCall())
                GetChartData2();
            else
                Label1.Text = "Session Expired!";
        }
        else if (DropDownList1.SelectedIndex == 2)
        {
            MultiView1.ActiveViewIndex = 2;
            if (CheckandCall())
                GetChartData3();
            else
                Label1.Text = "Session Expired!";
        }
        else if (DropDownList1.SelectedIndex == 3)
        {
            MultiView1.ActiveViewIndex = 3;
            if (CheckandCall())
                GetChartData4();
            else
                Label1.Text = "Session Expired!";
        }
        else
        {
            MultiView1.ActiveViewIndex = 4;
            if (CheckandCall())
                GetChartData5();
            else
                Label1.Text = "Session Expired!";
        }

    }
}