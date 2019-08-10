<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UploadBulk.aspx.cs" Inherits="AdminTuteMCAQ_Admin_UploadBulk" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Upload Bulk Data - TuteMCAQ Admin Maintainence</title>
    <link href="Main.css" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" type="image/ico" href="/TuteMCAQ/App_Themes/img/favoriteicon/tutemcaqicon.ico" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="page">
            <div id="header">
                <asp:Image CssClass="ImageHeader" ID="Image1" runat="server" ImageUrl="/TuteMCAQ/App_Themes/img/TuteMCAQAdmin.png" />
            </div>
            <div id="containment">
                <div id="mainofuploadbulk">
                    <h1>Upload Bulk Data</h1>
                    <div class="Gap">
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </div>
                    <asp:RegularExpressionValidator ID="regexValidator" runat="server"
                        ControlToValidate="FileUpload1"
                        ErrorMessage="Only XML Files are allowed"
                        ValidationExpression="(.*\.([Xx][Mm][Ll])$)">
                    </asp:RegularExpressionValidator>
                    <%--|.*\.([Jj][Pp][Ee][Gg])--%>
                    <div class="Gap">
                        <asp:Button Text="Upload" ID="btnUpload" runat="server" OnClick="btnUpload_Click" />
                    </div>
                    <div class="Gap">
                        <asp:Label Font-Bold="True" Width="90%" ID="lblMessage" runat="server" />
                    </div>

                </div>
                <div id="sideupload">
                    <ol id="liststyle">
                        <li>
                           <strong><a id="downlink" href="/TuteMCAQ/AdminTuteMCAQ/XmlFiles/Template.xls" target="_blank">Download</a></strong>  the template to add bulk data. 
                        </li>
                        <li class="Gap"><em>Open</em> the downloaded file in Excel.
                        </li>
                        <li class="Gap">Enter the data. (Category should be entered <strong>ID</strong> wise. Go to the <a href="/TuteMCAQ/AdminTuteMCAQ/Admin/TypesofQ.aspx" id="downlink">Type ID</a> page.)
                        </li>

                        <li class="Gap"><em>Export</em> it to <strong>XML</strong> using <em>Developer</em> tab.
                        </li>
                        <li class="Gap"><em>Choose</em> the exported file.
                        </li>
                        <li class="Gap"><em>Upload</em> the exported file.
                        </li>

                    </ol>
                </div>
                <%--<div id="sidebelow">
                    
                </div>--%>
            </div>

        </div>
        <div class="AtTheBottom">
            <a href="../Home.aspx">HOME</a>
        </div>
    </form>
</body>
</html>
