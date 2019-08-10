using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
public partial class AdminTuteMCAQ_Admin_UploadBulk : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //lblMessage.Text = Server.MapPath("~/XmlFiles"); = C:\Users\Bateman\Documents\Visual Studio 2015\WebSites\TuteMCAQ\AdminTuteMCAQ\
    }

    public void btnUpload_Click(object sender, EventArgs e)
    {
        const int sizeLimit = 5242880;
        if (FileUpload1.HasFile)
        {
            if (FileUpload1.PostedFile.ContentLength <= sizeLimit)
            {
                string path = @"C:\Users\Bateman\Documents\Visual Studio 2015\WebSites\TuteMCAQ\AdminTuteMCAQ\XmlFiles\" + FileUpload1.FileName;
                FileUpload1.SaveAs(path);
                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "File Uploaded to " + path;
                try
                {
                    string CS = ConfigurationManager.ConnectionStrings["TuteDB"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(CS))
                    {
                        DataSet ds = new DataSet();
                        //ds.ReadXml(Server.MapPath("~/MyXMLdata.xml"));
                        ds.ReadXml(path);
                        DataTable dtQues = ds.Tables["Question"];
                        con.Open();
                        using (SqlBulkCopy bc = new SqlBulkCopy(con))
                        {
                            bc.DestinationTableName = "Question";
                            //bc.ColumnMappings.Add("QuestionID", "QuestionID");
                            bc.ColumnMappings.Add("QuestText", "QuestText");
                            bc.ColumnMappings.Add("TypeOfQ", "TypeOfQ");
                            bc.ColumnMappings.Add("Option1", "Option1");
                            bc.ColumnMappings.Add("Option2", "Option2");
                            bc.ColumnMappings.Add("Option3", "Option3");
                            bc.ColumnMappings.Add("Option4", "Option4");
                            bc.ColumnMappings.Add("CorrectOption", "CorrectOption");
                            bc.WriteToServer(dtQues);

                        }
                        
                        if ((System.IO.File.Exists(path)))
                        {
                            System.IO.File.Delete(path);
                            lblMessage.ForeColor = System.Drawing.Color.Green;
                            lblMessage.Text = "Insertion Successful and File Deleted!";
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "File Uploaded but database exception occured - " + ex.Message;
                    if ((System.IO.File.Exists(path)))
                        System.IO.File.Delete(path);
                }

            }
            else
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "File exceeds size limit";
            }
        }
        else
        {
            lblMessage.ForeColor = System.Drawing.Color.Red;
            lblMessage.Text = "No file to upload. Choose a file first.";
        }


    }
}