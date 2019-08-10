<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Administration.aspx.cs" Inherits="Administrator_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Main.css" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" type="image/ico" href="/TuteMCAQ/App_Themes/img/favoriteicon/tutemcaqicon.ico" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="page">
            <div id="header">
                <asp:Image CssClass="ImageHeader" ID="Image1" runat="server" ImageUrl="/TuteMCAQ/App_Themes/img/TuteMCAQAdmin.png" />
            </div>
            <div id="main">
                <h1>Category Maintenance</h1>
                <asp:GridView ID="GridView1" runat="server"
                    AutoGenerateColumns="False" DataKeyNames="CategoryID"
                    DataSourceID="ObjectDataSource1" ForeColor="Black"
                    OnRowDeleted="GridView1_RowDeleted" OnRowUpdated="GridView1_RowUpdated">
                    <Columns>
                        <asp:BoundField DataField="CategoryID" HeaderText="ID"
                            ReadOnly="True">
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ShortName" HeaderText="Short Name"
                            SortExpression="ShortName">
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="LongName" HeaderText="Long Name"
                            SortExpression="LongName">
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="200px" />
                        </asp:BoundField>
                        <asp:CommandField ButtonType="Button" ShowEditButton="True" />
                        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
                    </Columns>
                    <HeaderStyle BackColor="Gray" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="White" ForeColor="Black" />
                    <AlternatingRowStyle BackColor="LightGray" ForeColor="Black" />
                    <EditRowStyle BackColor="#F46D11" ForeColor="White" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"
                    DataObjectTypeName="Category" DeleteMethod="DeleteCategory"
                    InsertMethod="InsertCategory" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetCategories" TypeName="CategoryDB"
                    UpdateMethod="UpdateCategory" ConflictDetection="CompareAllValues"
                    OnDeleted="ObjectDataSource1_Deleted" OnUpdated="ObjectDataSource1_Updated">
                    <UpdateParameters>
                        <asp:Parameter Name="original_Category" Type="Object" />
                        <asp:Parameter Name="category" Type="Object" />
                    </UpdateParameters>
                </asp:ObjectDataSource>
                <p id="new">To create a new category, enter the category information and click Insert.</p>
                <p>
                    <asp:Label ID="lblError" runat="server" EnableViewState="False" ForeColor="Green">
                    </asp:Label>
                </p>
                <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="300px"
                    AutoGenerateRows="False" CellPadding="4" DataSourceID="ObjectDataSource1"
                    DefaultMode="Insert" GridLines="None"
                    OnItemInserted="DetailsView1_ItemInserted">
                    <Fields>
                        <asp:BoundField DataField="CategoryID" HeaderText="Category ID:"
                            SortExpression="CategoryID" />
                        <asp:BoundField DataField="ShortName" HeaderText="Short Name:"
                            SortExpression="ShortName" />
                        <asp:BoundField DataField="LongName" HeaderText="Long Name:"
                            SortExpression="LongName" />
                        <asp:CommandField ButtonType="Button" ShowInsertButton="True" />
                    </Fields>
                    <FieldHeaderStyle BackColor="Gray" Font-Bold="True" ForeColor="White" />
                    <InsertRowStyle BackColor="LightGray" />
                    <CommandRowStyle BackColor="#A9A9A9" />
                </asp:DetailsView>
            </div>
        </div>
    </form>
</body>
</html>
