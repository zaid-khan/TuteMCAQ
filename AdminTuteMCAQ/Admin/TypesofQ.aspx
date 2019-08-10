<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TypesofQ.aspx.cs" Inherits="AdminTuteMCAQ_Admin_TypesofQ" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Types - TuteMCAQ Admin Maintainence</title>
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
                <h1>Types of Questions</h1>
                <asp:GridView ID="GridView1" runat="server"
                    AllowSorting="True" AutoGenerateColumns="False"
                    CellPadding="4" DataKeyNames="TypeID"
                    DataSourceID="SqlDataSource1"
                    ForeColor="Black" GridLines="None"
                    OnRowDeleted="GridView1_RowDeleted" OnRowUpdated="GridView1_RowUpdated" OnRowUpdating="GridView1_RowUpdating">
                    <Columns>
                        <asp:BoundField DataField="TypeID" HeaderText="ID" SortExpression="ID">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="100px" />
                        </asp:BoundField>
                        <asp:CommandField ButtonType="Button" CausesValidation="False"
                            ShowEditButton="True" />
                        <asp:CommandField ButtonType="Button" CausesValidation="False"
                            ShowDeleteButton="True" />
                    </Columns>
                    <HeaderStyle BackColor="Gray" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="White" ForeColor="Black" />
                    <AlternatingRowStyle BackColor="LightGray" ForeColor="Black" />
                    <EditRowStyle BackColor="#F46D11" ForeColor="White" />
                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TuteDB %>"
                    DeleteCommand="DELETE FROM [Type] WHERE [TypeID] = @TypeID"
                    InsertCommand="INSERT INTO [Type] ([Name]) VALUES (@Name)"
                    SelectCommand="SELECT [Name], [TypeID] FROM [Type] ORDER BY [Name]"
                    UpdateCommand="UPDATE Type SET Name= @Name WHERE (TypeID = @TypeID)">
                    <DeleteParameters>
                        <asp:Parameter Name="TypeID" Type="Byte" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Name" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Name" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <p id="new">To create a new type, enter the type information and click <strong>New Type.</strong></p>
                <p>
                    <asp:Label ID="lblError" runat="server" EnableViewState="False" CssClass="error"></asp:Label>
                </p>
                <p class="label">Name:</p>
                <p class="entry">
                    <asp:TextBox ID="txtName" runat="server"
                        Width="100" MaxLength="10">
                    </asp:TextBox>&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                    runat="server" ControlToValidate="txtName" CssClass="error"
                    ErrorMessage="Name is a required field.">
                </asp:RequiredFieldValidator>
                </p>
                <p>
                    <asp:Button ID="btnAdd" runat="server" Text="New Type"
                        OnClick="btnAdd_Click" />
                </p>
            </div>
        </div>
        <div class="AtTheBottom">
            <a href="../Home.aspx">HOME</a>
        </div>
    </form>

</body>
</html>
