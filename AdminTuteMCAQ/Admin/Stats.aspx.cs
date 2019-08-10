using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
public partial class AdminTuteMCAQ_Admin_Stats : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string CS = ConfigurationManager.ConnectionStrings["TuteDB"].ConnectionString;
        try
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SELECT COUNT(QuestionID) FROM[TuteMCAQ].[dbo].[Question]", con);
                cmd.CommandType = System.Data.CommandType.Text;
                con.Open();
                int noofques = Convert.ToInt32(cmd.ExecuteScalar());
                lblQuesNo.Text = noofques.ToString();
                cmd = new SqlCommand("SELECT COUNT(UserID) FROM[TuteMCAQ].[dbo].[User_Basic]", con);
                noofques = Convert.ToInt32(cmd.ExecuteScalar());
                lblUsers.Text = noofques.ToString();
                cmd = new SqlCommand("SELECT COUNT(TypeID) FROM[TuteMCAQ].[dbo].[Type]", con);
                noofques = Convert.ToInt32(cmd.ExecuteScalar());
                lblTypes.Text = noofques.ToString();
                cmd = new SqlCommand("SELECT COUNT(TuteID) FROM[TuteMCAQ].[dbo].[Tutorial]", con);
                noofques = Convert.ToInt32(cmd.ExecuteScalar());
                lblTutorials.Text = noofques.ToString();
                cmd = new SqlCommand("SELECT COUNT(ResultID) FROM[TuteMCAQ].[dbo].[Result]", con);
                noofques = Convert.ToInt32(cmd.ExecuteScalar());
                lblResults.Text = noofques.ToString();
                con.Close();

            }
        }
        catch (Exception exc)
        {

        }
    }
}