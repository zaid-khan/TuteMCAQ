<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Result.aspx.cs" Inherits="RegisteredContent_Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../bootstrap337/dist/css/bootstrap.css" rel="stylesheet">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Result - Tute MCAQ</title>
    <style>
        img {
            width: 120px;
            height: 30px;
        }

        p.navbar-text, navbar-right {
            padding-right: 10px !important;
            padding-top: 5px !important;
        }

        #Timeleft {
            padding: 2px;
        }

        #questab {
            width: auto;
            margin: auto;
        }

        #DropDownList1 {
            margin-left: 10px;
        }

        #navigationbuts
        {
            width: 200px;
            margin: auto;
        }

        #btnFlag {
            margin-left: 30px;
        }

        #questionno {
            font-size: 20px;
            font-weight: bold;
        }

        select.dropdownmiddle {
            text-align: center;
        }

        .questiontextmain {
            margin: 10px;
        }

        .questiontext {
            margin: 4px;
        }

        #submittab
        {
            margin-top: 30px;
        }
        
        #btnSubmit
        {
            margin-left: 15px;
        }

        .well-sm
        {
            padding-left: 10px !important;
        }

        #dvincenter
        {
            align-content: center;
            width: 450px;
            margin: auto;
            /*margin-left: 400px;
            margin-right: 400px;*/
            margin-bottom: 30px;
        }

        #separator{
            margin: auto;
            width: 600px;
            display: block;
            background-color: dimgray;
            height: 4px;
            margin-bottom: 30px;
        }
    </style>
    <link href="../bootstrap337/dist/css/bootstrap.css" rel="stylesheet" />

    <script>
    function printpage() {

        var getpanel = document.getElementById("<%= Panel1.ClientID%>");
        var MainWindow = window.open('', '', 'height=500,width=800');
        MainWindow.document.write('<html><head>');
        MainWindow.document.write('</head><body>');
        MainWindow.document.write(getpanel.innerHTML);
        MainWindow.document.write('</body></html>');
        MainWindow.document.close();
        setTimeout(function () {
            MainWindow.print();
        }, 500);
        return false;

    }
 </script>
</head>
<body>
    <form runat="server" id="ExamForm">
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" style="padding-bottom: 40px !important;" href="#">
                        <img alt="Brand" src="../App_Themes/img/TuteMCAQLargeFont.png">
                    </a>

                </div>
                <p class="navbar-text navbar-right" id="TopUserName" runat="server">
                    
                </p>

            </div>
        </nav>

        <h3 class="text-center" runat="server" id="ResHeader">Your result is : </h3>
        <div id="separator" >
        </div>
        <asp:Panel ID="Panel1" runat="server">
        <div id="dvincenter">
            <%--<asp:GridView ID="GridView1" CssClass="text-center" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="DateAppeared" HeaderText="Date : " SortExpression="DateAppeared" />
                    <asp:BoundField DataField="QuesAttempted" HeaderText="Question Attempted :" SortExpression="QuesAttempted" />
                    <asp:BoundField DataField="TotalQuestions" HeaderText="Total No. of questions :" SortExpression="TotalQuestions" />
                    <asp:BoundField DataField="MarksOutOf" HeaderText="Marks Attained :" SortExpression="MarksOutOf" />
                    <asp:BoundField DataField="TotalMarks" HeaderText="Total Marks : " SortExpression="TotalMarks" />
                    <asp:BoundField DataField="Subject1Marks" HeaderText="Subject1Marks" SortExpression="Subject1Marks" />
                    <asp:BoundField DataField="Subject1Total" HeaderText="Subject1Total" SortExpression="Subject1Total" />
                    <asp:BoundField DataField="Subject2Marks" HeaderText="Subject2Marks" SortExpression="Subject2Marks" />
                    <asp:BoundField DataField="Subject2Total" HeaderText="Subject2Total" SortExpression="Subject2Total" />
                    <asp:BoundField DataField="QuesAttS1" HeaderText="QuesAttS1" SortExpression="QuesAttS1" />
                    <asp:BoundField DataField="TotalQuesS1" HeaderText="TotalQuesS1" SortExpression="TotalQuesS1" />
                    <asp:BoundField DataField="QuesAttS2" HeaderText="QuesAttS2" SortExpression="QuesAttS2" />
                    <asp:BoundField DataField="TotalQuesS2" HeaderText="TotalQuesS2" SortExpression="TotalQuesS2" />
                </Columns>
            </asp:GridView>--%>
            <asp:DetailsView CssClass="text-center" ID="DetailsView1" runat="server" Height="50px" Width="430px" AutoGenerateRows="False" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
                <Fields>
                    <asp:TemplateField HeaderText="Date :" SortExpression="DateAppeared">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DateAppeared") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DateAppeared") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("DateAppeared") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="No. of questions attempted : " SortExpression="QuesAttempted">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("QuesAttempted") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("QuesAttempted") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("QuesAttempted") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Total No. of questions :" SortExpression="TotalQuestions">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("TotalQuestions") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("TotalQuestions") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("TotalQuestions") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Marks attained : " SortExpression="MarksOutOf">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("MarksOutOf") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("MarksOutOf") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("MarksOutOf") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Total Marks : " SortExpression="TotalMarks">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("TotalMarks") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("TotalMarks") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("TotalMarks") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Computer Science Marks : " SortExpression="Subject1Marks">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Subject1Marks") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Subject1Marks") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("Subject1Marks") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="CS Total Marks : " SortExpression="Subject1Total">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Subject1Total") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Subject1Total") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("Subject1Total") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Quantitative Aptitude Marks : " SortExpression="Subject2Marks">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Subject2Marks") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Subject2Marks") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("Subject2Marks") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Quantitative Aptitude Total Marks : " SortExpression="Subject2Total">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Subject2Total") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Subject2Total") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("Subject2Total") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="C.S. Attempted Questions : " SortExpression="QuesAttS1">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("QuesAttS1") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("QuesAttS1") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label10" runat="server" Text='<%# Bind("QuesAttS1") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="C.S. Correct Answers : " SortExpression="RightQuesS1">
                        <ItemTemplate>
                            <asp:Label ID="Label100" runat="server" Text='<%# Bind("RightQuesS1") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="C.S. Total Questions : " SortExpression="TotalQuesS1">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("TotalQuesS1") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("TotalQuesS1") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label11" runat="server" Text='<%# Bind("TotalQuesS1") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Q.A. Attempted Questions : " SortExpression="QuesAttS2">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("QuesAttS2") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("QuesAttS2") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label12" runat="server" Text='<%# Bind("QuesAttS2") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Q.A. Correct Answers : " SortExpression="RightQuesS2">
                        <ItemTemplate>
                            <asp:Label ID="Label101" runat="server" Text='<%# Bind("RightQuesS2") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Q.A. Total Questions : " SortExpression="TotalQuesS2">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("TotalQuesS2") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("TotalQuesS2") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label13" runat="server" Text='<%# Bind("TotalQuesS2") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Fields>
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            </asp:DetailsView>
        </div>
            </asp:Panel>
        <asp:Label runat="server" id="testresult" ></asp:Label>
        
        <asp:Button ID="Button1" Text="Print Result" OnClientClick="return printpage();" 
        runat="server" CssClass="btn btn-info center-block" />
        
        <button id="submittab" type="button" class="btn btn-danger center-block"  
        onclick="window.open('', '_self', ''); window.close();">Close</button>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TuteDB %>" SelectCommand="SELECT DateAppeared, QuesAttempted, TotalQuestions, MarksOutOf, TotalMarks, Subject1Marks, Subject1Total, Subject2Marks, Subject2Total, QuesAttS1, RightQuesS1, TotalQuesS1, QuesAttS2, RightQuesS2, TotalQuesS2 FROM Result WHERE (ResultID = @ResultID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="ResultID" QueryStringField="ResID" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        
    
    </form>
</body>
</html>
