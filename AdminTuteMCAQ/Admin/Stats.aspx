<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Stats.aspx.cs" Inherits="AdminTuteMCAQ_Admin_Stats" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Website Statistics - TuteMCAQ Admin Maintainence</title>
    <link href="MainQ.css" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" type="image/ico" href="/TuteMCAQ/App_Themes/img/favoriteicon/tutemcaqicon.ico" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="page">
            <div id="header">
                <asp:Image AlternateText="Logo" CssClass="ImageHeader"
                    ID="Image1" runat="server"
                    ImageUrl="/TuteMCAQ/App_Themes/img/TuteMCAQAdmin.png" />
            </div>
            <div id="main">
            </div>
            <asp:Table runat="server" ID="tblStats" BorderWidth="3px"  GridLines="Both">
                <asp:TableHeaderRow runat="server" ID="HeaderRow" Height="30px">
                    <asp:TableHeaderCell>Statistic Name</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Value</asp:TableHeaderCell>
                </asp:TableHeaderRow>
                <asp:TableRow Height="30px">
                  <asp:TableCell><asp:Label runat="server" Text="No. of Questions" ID="Label1"></asp:Label></asp:TableCell>
                  <asp:TableCell><asp:Label runat="server" ID="lblQuesNo"></asp:Label></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow Height="30px">
                  <asp:TableCell><asp:Label runat="server" Text="No. of Users" ID="Label2"></asp:Label></asp:TableCell>
                  <asp:TableCell><asp:Label runat="server" ID="lblUsers"></asp:Label></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow Height="30px">
                  <asp:TableCell><asp:Label runat="server" Text="No. of Types" ID="Label3"></asp:Label></asp:TableCell>
                  <asp:TableCell><asp:Label runat="server" ID="lblTypes"></asp:Label></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow Height="30px">
                  <asp:TableCell><asp:Label runat="server" Text="No. of Tutorials" ID="Label4"></asp:Label></asp:TableCell>
                  <asp:TableCell><asp:Label runat="server" ID="lblTutorials"></asp:Label></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow Height="30px">
                  <asp:TableCell><asp:Label runat="server" Text="No. of Results" ID="Label5"></asp:Label></asp:TableCell>
                  <asp:TableCell><asp:Label runat="server" ID="lblResults"></asp:Label></asp:TableCell>
                </asp:TableRow>
            </asp:Table>

        </div>
        <div class="AtTheBottom">
            <a href="../Home.aspx">HOME</a>
        </div>
    </form>
</body>
</html>
