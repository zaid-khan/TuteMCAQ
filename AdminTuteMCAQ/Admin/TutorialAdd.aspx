<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TutorialAdd.aspx.cs" Inherits="AdminTuteMCAQ_Admin_TutorialAdd" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Upload Tutorials - TuteMCAQ Admin Maintainance</title>
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
                    <h1>Upload Tutorials</h1>
                    <div class="Gap">
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </div>
                    <div class="Gap">
                        Type : <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="TypeID">
                            
                        </asp:DropDownList>
                        
                    </div>
                    <div class="Gap">
                        Name : <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                        
                    </div>
                    <div class="Gap">
                        Description : 
                    </div>
                    <div class="Gap">
                        <asp:TextBox ID="txtDesc" Height="80" Width="200" TextMode="MultiLine" runat="server" ></asp:TextBox>
                    </div>
                    <asp:RegularExpressionValidator ID="regexValidator" runat="server"
                        ControlToValidate="FileUpload1"
                        ErrorMessage="Only XML Files are allowed"
                        ValidationExpression="(.*\.([Pp][Dd][Ff])$)">
                    </asp:RegularExpressionValidator>
                    <%--|.*\.([Jj][Pp][Ee][Gg])--%>
                    <div class="Gap">
                        <asp:Button Text="Upload" ID="btnUpload" runat="server" OnClick="btnUpload_Click" />
                    </div>
                    <div class="Gap">
                        <asp:Label Font-Bold="True" Width="90%" ID="lblMessage" runat="server" />
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TuteDB %>" SelectCommand="SELECT [TypeID], [Name] FROM [Type]"></asp:SqlDataSource>
                    </div>

                </div>
                <div id="sideupload">
                    <ol id="liststyle">
                        <li ><em>Choose</em> the PDF file.
                        </li>
                        <li class="Gap">Enter the <strong>Name </strong> of the PDF file.
                        </li>
                        <li class="Gap">Enter the <strong>Description <br /></strong><em>(optional)</em> of the PDF file.
                        </li>
                        <li class="Gap"><em>Upload</em> the PDF file.
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
