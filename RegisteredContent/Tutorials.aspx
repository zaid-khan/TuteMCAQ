<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Tutorials.aspx.cs" Inherits="Tutorials" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        body {
            background-color: #f5f5f5;
        }

        .form-signin {
            max-width: 70%;
            padding: 19px 29px 40px;
            margin: 0 auto 20px;
            background-color: #fff;
            border: 1px solid #e5e5e5;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
            -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
            box-shadow: 0 1px 2px rgba(0,0,0,.05);
        }

        .form-signin-heading {
            margin-bottom: 20px;
            border-bottom: 2px double #e5e5e5;
            font-style: normal !important;
        }

        .largefont {
            font-size: 15px;
            margin-right: 20px;
            display: block;
            clear: both;
            background-color: yellow;
            margin-bottom: 4px !important;
        }

        input[type=radio] {
            display: inline;
            margin-right: 10px;
            float: left;
        }

        .RadioButs label {
            float: left;
            clear: right;
            padding-top: 1px;
        }

        #btnpress {
            margin-top: 30px;
        }

        .mediumfont {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            font-size: medium;
            font-weight: 500;
        }

        .unorlist {
            list-style-type: disc;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            font-size: small;
            font-weight: 500;
            padding-left: 20px;
            padding-top: 10px;
        }

        .gap {
            margin-bottom: 30px;
        }

        .center
        {
            margin: auto;
            width: 700px;
            text-align: center;
            margin-bottom: 5px;
        }

        #centerheading
        {
            margin: auto;
            width: 300px;
            text-align: center;
            margin-bottom: 30px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <form class="form-signin clearfix" runat="server">
        <h2 class="form-signin-heading" id="centerheading">Tutorials</h2>
        <h3>Select the Type</h3>
            <asp:SqlDataSource
                ID="SqlDataSource1"
                runat="server"
                ConnectionString="<%$ ConnectionStrings:TuteDB %>"
                SelectCommand="SELECT TypeID, Name FROM Type"></asp:SqlDataSource>
            <asp:DropDownList ID="drpType" runat="server" Width="200px"
                AutoPostBack="True" AppendDataBoundItems="True" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="TypeID">
               
            </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TuteDB %>" SelectCommand="SELECT [TuteID], [TuteName], [TuteDesc], [FileName], [Type] FROM [Tutorial] WHERE ([Type] = @Type)">
            <SelectParameters>
                <asp:ControlParameter ControlID="drpType" Name="Type" PropertyName="SelectedValue" Type="Byte" />
            </SelectParameters>
        </asp:SqlDataSource>


        <div id="instruction" class="well alert mediumfont">    
        <asp:GridView ID="GridView1" CssClass="center" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <EmptyDataTemplate>
                <asp:Label Text="No Data Available!" ID="LabelSorry" runat="server"></asp:Label>
            </EmptyDataTemplate>
            <Columns>
                <asp:TemplateField HeaderText="Name" SortExpression="TuteName">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("TuteName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Description" SortExpression="TuteDesc">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("TuteDesc") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Download File Link" SortExpression="FileName">
                    <ItemTemplate>
                        <asp:ImageButton OnClick="ImageButton1_Click" ToolTip='<%# Bind("FileName") %>'  ID="ImageButton1"   runat="server" Height="40px" ImageUrl="~/App_Themes/img/Download-PDF-Button.jpeg"  />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        </div>
    </form>
</asp:Content>

