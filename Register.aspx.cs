using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Register : System.Web.UI.Page
{

    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (Request.IsAuthenticated)
            Response.Redirect("~/Default.aspx");
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        checkTerms.Checked = false;
    }

    protected void register_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {

            string CS = ConfigurationManager.ConnectionStrings["TuteDB"].ConnectionString;
            string Gender = inputGenderMale.Checked ? "Male" :
                            inputGenderFemale.Checked ? "Female" :
                            "LGBT";
            DateTime dt = Convert.ToDateTime(inputDOB.Text);
            string empidreturn;
            try
            {
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("spAddNewUser", con);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Password", inputPassword.Text);
                    cmd.Parameters.AddWithValue("@Name", inputName.Text);
                    cmd.Parameters.AddWithValue("@Location", inputLocation.Text);
                    cmd.Parameters.AddWithValue("@Email", inputEmail.Text);
                    cmd.Parameters.AddWithValue("@Gender", Gender);
                    cmd.Parameters.AddWithValue("@DtBirth", dt.Date);
                    SqlParameter empID = new SqlParameter();
                    empID.ParameterName = "@UserIDReturn";
                    empID.SqlDbType = System.Data.SqlDbType.Int;
                    empID.Direction = System.Data.ParameterDirection.Output;
                    cmd.Parameters.Add(empID);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    empidreturn = empID.Value.ToString();
                    Session["Status"] = "Success";
                    Session["UserID"] = empidreturn;
                    Server.Transfer("Registrationresult.aspx");
                }
            }
            catch (Exception exc)
            {
                Session["Status"] = "Failure";
            }
        }

    }

    protected void EmailCustomValidation_ServerValidate(object source, ServerValidateEventArgs args)
    {
        string CS = ConfigurationManager.ConnectionStrings["TuteDB"].ConnectionString;
        try
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("spValidateEmail", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Email", inputEmail.Text);
                con.Open();
                bool validemail = Convert.ToBoolean(cmd.ExecuteScalar());
                if (!validemail)
                    args.IsValid = false;
                else
                    args.IsValid = true;
            }
        }
        catch (Exception exc)
        {

        }
    }
    //protected void checkAvail_Click(object sender, EventArgs e)
    //{

    //}

    //protected void DOBCustomValidation_ServerValidate(object source, ServerValidateEventArgs args)
    //{
    //    DateTime firstdt = new DateTime(1949, 12, 31);
    //    DateTime lastdt = new DateTime(2005, 01, 01);
    //    DateTime dt = Convert.ToDateTime(inputDOB.Text);
    //    if ((DateTime.Compare(dt, firstdt) == 1) && (DateTime.Compare(dt, lastdt) == -1))
    //        args.IsValid = true;
    //    else
    //        args.IsValid = false;
    //}

    protected void reset_Click(object sender, EventArgs e)
    {
        inputName.Text = "";
        inputPassword.Text = "";
        inputConfirm.Text = "";
        inputDOB.Text = "";
        inputEmail.Text = "";
        inputLocation.Text = "";
    }
}