<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="RegisteredContent_Default" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Online Exam - Tute MCAQ</title>
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

        #navigationbuts {
            width: 300px;
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

        #submittab {
            margin-top: 30px;
        }

        #btnSubmit {
            margin-left: 15px;
        }

        .well-sm {
            padding-left: 10px !important;
        }
    </style>



    <script type="text/javascript">
        window.onload = function () {
            var interval = parseInt(document.getElementById('target_interval').value, 10); //ten minutes = 10 minutes X 60 seconds X 1000 miliseconds
            //document.getElementsByClassName('target_time')[0].valueOf = new Date(Date.parse(new Date().toUTCString()) + interval);
            document.getElementById('target_time').value = new Date(Date.parse(new Date().toUTCString()) + interval);
            //var ldt = new Date(Date.parse(new Date().toUTCString()) + 15000);

            function countdown() {
                var dt = new Date(),
                    ndt = new Date(document.getElementById('target_time').value); //hidden field
                var timeleft = ndt - dt, //ldt - dt;
                    days = Math.floor(timeleft / (24 * 60 * 60 * 1000)),
                    hrs = Math.floor((timeleft - (days * 24 * 60 * 60 * 1000)) / (60 * 60 * 1000)),
                    mins = Math.floor((timeleft - (days * 24 * 60 * 60 * 1000) - (hrs * 60 * 60 * 1000)) / (60 * 1000)),
                    secs = Math.floor((timeleft - (days * 24 * 60 * 60 * 1000) - (hrs * 60 * 60 * 1000) - (mins * 60 * 1000)) / 1000);
                //document.getElementById('countdown').innerHTML = 'days:'+days+';hrs:'+hrs+';mins:'+mins+';secs:'+secs;

                if (secs < 10 && mins < 10)
                    document.getElementById('Timeleft').innerHTML = "0" + mins + ':' + "0" + secs; //span field
                else if (secs > 9 && mins < 10)
                    document.getElementById('Timeleft').innerHTML = "0" + mins + ':' + secs; //span field
                else if (secs < 10 && mins > 9)
                    document.getElementById('Timeleft').innerHTML = mins + ':' + "0" + secs; //span field
                else
                    document.getElementById('Timeleft').innerHTML = mins + ':' + secs; //span field


                if (days === 0 && hrs === 0 && mins === 0 && secs === 0) {
                    window.clearInterval(timer);
                    document.getElementById('Timeleft').innerHTML = "Time Over."
                    //TO DO 

                    //document.getElementById('content').style.pointerEvents = "none"
                    //document.getElementById('content').style.opacity = "0.4";

                    //document.getElementById('float_timer').style.display = 'none'; //Div
                }

                if (mins === 0 && secs > 10) {
                    var ele = document.getElementById('Timeleft');
                    ele.style.backgroundColor = 'yellow';
                    ele.style.color = 'black';
                }

                if (mins === 0 && secs < 10) {
                    var ele = document.getElementById('Timeleft');
                    ele.style.backgroundColor = 'red';
                    ele.style.color = 'white';
                }

            }
            countdown();
            var timer = window.setInterval(countdown, 1000);
        }
    </script>

    <%--<style>
        #float_timer {
            position: fixed;
            right: 0px;
            top: 0px;
            width: 5%;
            background-color: limegreen;
            text-align: center;
            color: white;
            padding-top: 3px;
            padding-bottom: 3px;
            font-weight: bold;
            font-size: larger;
        }
    </style>--%>




    <!-- Bootstrap -->
    <link href="../bootstrap337/dist/css/bootstrap.css" rel="stylesheet">
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

        <h1 class="text-center">Online Examination</h1>


        <!--FOR TIMER CONTROL -->
        <div id="float_timer">
            <span id="countdown"></span>
            <input type="hidden" id="target_time" />
            <input type="hidden" id="target_interval" runat="server" />
        </div>
        <!-- -->


        <%--START OF SCRIPT MANAGER--%>

        <asp:ScriptManager runat="server" ID="ScriptManager1">
        </asp:ScriptManager>

        <%--END OF SCRIPT MANAGER--%>

        <div class="container">
            <div class="panel panel-primary">
                <div class="panel-heading clearfix">
                    <h3 class="panel-title pull-right">Time Remaining :
                        <asp:Label ID="Timeleft" runat="server"></asp:Label></h3>
                </div>
                <div class="panel-body">
                    <asp:UpdatePanel runat="server">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="DropDownList1" />
                            <asp:AsyncPostBackTrigger ControlID="btnNext" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="btnPrev" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="btnFlag" EventName="Click" />
                        </Triggers>
                        <ContentTemplate>

                            <div class="well">

                                <asp:DropDownList ID="DropDownList1"
                                    runat="server" Width="70px"
                                    DataSourceID="SqlDataSource1"
                                    DataTextField="QuestionNo"
                                    DataValueField="QuestionID" Font-Size="15" Font-Bold="true" AutoPostBack="true" CssClass="dropdownmiddle pull-right">
                                </asp:DropDownList>
                                <span class="pull-right" id="questionno">Question No. 
                                </span>
                                <div id="navigationbuts">
                                    <asp:LinkButton CssClass="btn btn-primary glyphicon glyphicon-arrow-left" ID="btnPrev" runat="server" OnClick="btnPrev_Click"></asp:LinkButton>
                                    <asp:LinkButton CssClass="btn btn-primary glyphicon glyphicon-arrow-right" ID="btnNext" runat="server" OnClick="btnNext_Click" />
                                    <asp:LinkButton CssClass="btn btn-warning glyphicon glyphicon-flag" ID="btnFlag" runat="server" OnClick="btnFlag_Click" />
                                    <asp:LinkButton CssClass="btn btn-danger glyphicon glyphicon-remove" ID="btnClear" runat="server" OnClick="btnClear_Click" />
                                </div>
                                <%--OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"--%>
                            </div>

                            <div class="well well-lg">
                                <div id="questab">
                                    <asp:DetailsView ID="DetailsView1" runat="server"
                                        AutoGenerateRows="False" DataKeyNames="QuestionID"
                                        DataSourceID="SqlDataSource2" Height="50px" BorderStyle="Ridge" BorderWidth="5" CellPadding="4" ForeColor="#333333" GridLines="None">

                                        <AlternatingRowStyle BackColor="White" />
                                        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                                        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />

                                        <Fields>
                                            <asp:TemplateField HeaderText="" SortExpression="QuestText" ItemStyle-BackColor="Black"
                                                ItemStyle-ForeColor="White" ControlStyle-BorderWidth="0"
                                                ControlStyle-Font-Size="12.5" ControlStyle-CssClass="questiontextmain">

                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("QuestText") %>'></asp:Label>
                                                </ItemTemplate>

                                                <ControlStyle BorderWidth="0px"></ControlStyle>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="" SortExpression="Option1"
                                                ControlStyle-BorderWidth="0px" ControlStyle-CssClass="questiontext">

                                                <ItemTemplate>
                                                    <asp:RadioButton AutoPostBack="true" runat="server" ID="Option1"
                                                        Text='<%# Eval("Option1")%>' GroupName="Options"
                                                        OnCheckedChanged="Option1_CheckedChanged" />

                                                </ItemTemplate>

                                                <ControlStyle BorderWidth="0px"></ControlStyle>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="" SortExpression="Option2"
                                                ControlStyle-BorderWidth="0" ControlStyle-CssClass="questiontext">

                                                <ItemTemplate>
                                                    <asp:RadioButton AutoPostBack="true" runat="server" ID="Option2"
                                                        Text='<%# Eval("Option2") %>' GroupName="Options"
                                                        OnCheckedChanged="Option2_CheckedChanged" />
                                                </ItemTemplate>

                                                <ControlStyle BorderWidth="0px"></ControlStyle>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="" SortExpression="Option3"
                                                ControlStyle-BorderWidth="0" ControlStyle-CssClass="questiontext">

                                                <ItemTemplate>
                                                    <asp:RadioButton AutoPostBack="true" runat="server" ID="Option3"
                                                        Text='<%# Eval("Option3") %>' GroupName="Options"
                                                        OnCheckedChanged="Option3_CheckedChanged" />
                                                </ItemTemplate>

                                                <ControlStyle BorderWidth="0px"></ControlStyle>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="" SortExpression="Option4"
                                                ControlStyle-BorderWidth="0" ControlStyle-CssClass="questiontext">

                                                <ItemTemplate>
                                                    <asp:RadioButton AutoPostBack="true" runat="server" ID="Option4"
                                                        Text='<%# Eval("Option4") %>' GroupName="Options"
                                                        OnCheckedChanged="Option4_CheckedChanged" />
                                                </ItemTemplate>

                                                <ControlStyle BorderWidth="0px"></ControlStyle>
                                            </asp:TemplateField>
                                        </Fields>
                                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />


                                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                    </asp:DetailsView>
                                </div>
                            </div>

                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div id="submittab" class="well well-sm clearfix">
                        <asp:LinkButton runat="server"
                            CssClass="btn btn-lg btn-success glyphicon glyphicon-thumbs-up pull-right"
                            ID="btnSubmit" OnClick="btnSubmit_Click" />
                        <asp:LinkButton runat="server" ID="btnQuit"
                            CssClass="btn btn-lg btn-danger glyphicon glyphicon-thumbs-down pull-right" 
                            OnClick="btnQuit_Click"  />


                    </div>
                </div>
            </div>
        </div>
















        <!--DATA SOURCES -->

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TuteDB %>"
            DeleteCommand="DELETE FROM [Question] WHERE [QuestionID] = @QuestionID"
            InsertCommand="INSERT INTO [Question] ([QuestText], [TypeOfQ], [Option1], [Option2], [Option3], [Option4], 
            [CorrectOption], [SelectedOption]) VALUES (@QuestText, @TypeOfQ, @Option1, @Option2, @Option3, @Option4, @CorrectOption, @SelectedOption)"
            SelectCommand="SELECT 
            Question.QuestionID, 
            Question.QuestText, Question.Option4, 
            Question.Option1, Question.Option2, 
            Question.Option3, 
            Question.CorrectOption FROM Question
            WHERE [QuestionID] = @QuestionIDD"
            UpdateCommand="UPDATE [Question] SET [QuestText] = @QuestText, [TypeOfQ] = @TypeOfQ, [Option1] = @Option1, [Option2] = @Option2, [Option3] = @Option3, [Option4] = @Option4, [CorrectOption] = @CorrectOption, [SelectedOption] = @SelectedOption WHERE [QuestionID] = @QuestionID">
            <DeleteParameters>
                <asp:Parameter Name="QuestionID" Type="Int32" />
            </DeleteParameters>

            <InsertParameters>
                <asp:Parameter Name="QuestText" Type="String" />
                <asp:Parameter Name="TypeOfQ" Type="Byte" />
                <asp:Parameter Name="Option1" Type="String" />
                <asp:Parameter Name="Option2" Type="String" />
                <asp:Parameter Name="Option3" Type="String" />
                <asp:Parameter Name="Option4" Type="String" />
                <asp:Parameter Name="CorrectOption" Type="Byte" />
                <asp:Parameter Name="SelectedOption" Type="String" />
            </InsertParameters>

            <UpdateParameters>
                <asp:Parameter Name="QuestText" Type="String" />
                <asp:Parameter Name="TypeOfQ" Type="Byte" />
                <asp:Parameter Name="Option1" Type="String" />
                <asp:Parameter Name="Option2" Type="String" />
                <asp:Parameter Name="Option3" Type="String" />
                <asp:Parameter Name="Option4" Type="String" />
                <asp:Parameter Name="CorrectOption" Type="Byte" />
                <asp:Parameter Name="SelectedOption" Type="String" />
                <asp:Parameter Name="QuestionID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

         <%--SelectCommand="SELECT TOP 5 ROW_NUMBER() OVER (ORDER BY NEWID()) 
            QuestionNo, Question.QuestionID, Question.QuestText, 
            Question.Option4, Question.Option1, Question.Option2, 
            Question.Option3, Question.CorrectOption FROM Question"--%>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TuteDB %>"
            DeleteCommand="DELETE FROM [Question] WHERE [QuestionID] = @QuestionID"
            InsertCommand="INSERT INTO [Question] ([QuestText], [TypeOfQ], [Option1], [Option2], [Option3], [Option4], 
            [CorrectOption], [SelectedOption]) VALUES (@QuestText, @TypeOfQ, @Option1, @Option2, @Option3, @Option4, @CorrectOption, @SelectedOption)"
            SelectCommand="SELECT TOP 5 ROW_NUMBER() OVER (ORDER BY NEWID()) 
            QuestionNo, Question.QuestionID, Question.TypeOfQ,  Question.QuestText, 
            Question.Option4, Question.Option1, Question.Option2, 
            Question.Option3, Question.CorrectOption FROM Question Where TypeOfQ = 1 
            UNION
            SELECT TOP 5 ROW_NUMBER() OVER (ORDER BY NEWID()) 
            QuestionNo, Question.QuestionID, Question.TypeOfQ,  Question.QuestText, 
            Question.Option4, Question.Option1, Question.Option2, 
            Question.Option3, Question.CorrectOption FROM Question Where TypeOfQ = 7"
           
            UpdateCommand="UPDATE [Question] SET [QuestText] = @QuestText, [TypeOfQ] = @TypeOfQ, [Option1] = @Option1, [Option2] = @Option2, [Option3] = @Option3, [Option4] = @Option4, [CorrectOption] = @CorrectOption, [SelectedOption] = @SelectedOption WHERE [QuestionID] = @QuestionID">

            <DeleteParameters>
                <asp:Parameter Name="QuestionID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="QuestText" Type="String" />
                <asp:Parameter Name="TypeOfQ" Type="Byte" />
                <asp:Parameter Name="Option1" Type="String" />
                <asp:Parameter Name="Option2" Type="String" />
                <asp:Parameter Name="Option3" Type="String" />
                <asp:Parameter Name="Option4" Type="String" />
                <asp:Parameter Name="CorrectOption" Type="Byte" />
                <asp:Parameter Name="SelectedOption" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="QuestText" Type="String" />
                <asp:Parameter Name="TypeOfQ" Type="Byte" />
                <asp:Parameter Name="Option1" Type="String" />
                <asp:Parameter Name="Option2" Type="String" />
                <asp:Parameter Name="Option3" Type="String" />
                <asp:Parameter Name="Option4" Type="String" />
                <asp:Parameter Name="CorrectOption" Type="Byte" />
                <asp:Parameter Name="SelectedOption" Type="String" />
                <asp:Parameter Name="QuestionID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <!--END OF DATA SOURCES-->



        <!--TIMER CONTROL -->
        <asp:Timer runat="server" ID="Timer2" OnTick="Timer2_Tick"></asp:Timer>
        <!--END TIMER CONTROL -->
    </form>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="../bootstrap337/dist/js/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../bootstrap337/dist/js/bootstrap.js"></script>
</body>
</html>
