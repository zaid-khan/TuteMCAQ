<%@ Page Title="Start Mock Exam - Tute MCAQ" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MockExam.aspx.cs" Inherits="RegisteredContent_MockExam" %>

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

        #mediumfont {
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

        #center
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
        <h2 class="form-signin-heading" id="center">Online Exam</h2>
        <h3>Please read the following instructions about the Exam carefully :</h3>
        
        <div id="instruction" class="well alert alert-info">


            <ol id="mediumfont">
                <li class="gap">The test is based on a specific amount of time which is given by the Timer value indicated by
                    <asp:Image Height="20" ImageUrl="~/RegisteredContent/ImagesExam/Timer.JPG" BorderStyle="Ridge" BorderWidth="3" runat="server" />
                    <ul class="unorlist">
                        
                        <li>
                            <span style="background-color: yellow;">Yellow</span> indicates <em>less</em> than a minute remaining.
                        </li>
                        <li>
                            <span style="background-color: red; color: white;">Red</span> indicates only 10 seconds remaining.
                        </li>

                    </ul>
                </li>

                <li class="gap">To navigate to the different questions you can use the navigation tab.
                    <asp:Image Height="30" ImageUrl="~/RegisteredContent/ImagesExam/Navigation.JPG" BorderStyle="Ridge" BorderWidth="3" runat="server" />
                    <ul class="unorlist">
                        <li>It also provides <em>Flag</em>(Flag mark) Option to review a particular question later and, 
                        </li>
                        <li>the <em>Clear</em>(Cross mark) Option to remove a Selected Option so that it is NOT considered as an answer.</li>
                    </ul>
                </li>
                <li class="gap">The other way to navigate is using a Drop-Down List indicated by
                    <asp:Image Height="27" BorderStyle="Ridge" BorderWidth="3" ImageUrl="~/RegisteredContent/ImagesExam/QuestionDropDown.JPG" runat="server" />
                </li>
                <li class="gap">The Drop-Down List is Color Mapped to indicate the status of a question
                    <asp:Image Height="50" BorderStyle="Ridge" BorderWidth="3" ImageUrl="~/RegisteredContent/ImagesExam/QuestionLegend.JPG" runat="server" />
                    <ul class="unorlist">
                        <li>
                            <span style="background-color: green; color: white;">Green</span> indicates Question Attempted and Will be Considered.
                        </li>
                        <li>
                            <span style="background-color: yellow;">Yellow</span> indicates Question Flagged and Not Attempted.
                        </li>
                        <li>
                            <span style="background-color: red; color: white;">Red</span> indicates Question Not Attempted.
                        </li>

                    </ul>
                </li>
                <li class="gap">At the end there are two buttons which allow us to either <strong>Submit!</strong> or to <strong>Quit!</strong> the Exam.
                    <asp:Image Height="50" BorderStyle="Ridge" BorderWidth="3" ImageUrl="~/RegisteredContent/ImagesExam/Submit.JPG" runat="server" />
                    <ul class="unorlist">
                        <li>
                            <strong>Submit!</strong> forwards to the result page.

                        </li>
                        <li>
                            <strong>Quit!</strong> cancels the exam.
                        </li>
                        <li>
                            <strong>Quit!</strong> <em>does not</em> produces a result.
                        </li>
                        
                        <li>
                            <em>Note that if the Timer elapses then the Buttons have no work.</em>
                        </li>
                    </ul>
                </li>
                <li class="gap">Each RIGHT ANSWER carries 4 marks and a WRONG ANSWER deducts a mark!
                </li>

            </ol>
        </div>
        <h3>Choose Category :</h3>
        
        <div id="instruction1" class="well alert alert-info">
            <asp:RadioButton Enabled="false" CssClass="RadioButs clearfix" runat="server" ID="Option1"
                Text="Specific Category (Currently not available)" GroupName="OptionME" AutoPostBack="true"
                OnCheckedChanged="Option1_CheckedChanged" />
            <div id="divto" class="well">

                <asp:SqlDataSource
                    ID="SqlDataSource1"
                    runat="server"
                    ConnectionString="<%$ ConnectionStrings:TuteDB %>"
                    SelectCommand="SELECT TypeID, Name FROM Type"></asp:SqlDataSource>
                <asp:DropDownList ID="drpType" runat="server" Width="200px"
                    AutoPostBack="True" AppendDataBoundItems="True" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="TypeID">
                    <asp:ListItem Text="" Value="" />
                </asp:DropDownList>


            </div>
            <asp:RadioButton CssClass="RadioButs clearfix" runat="server" ID="Option2" Text="Normal Mode"
                GroupName="OptionME" Checked="true"
                AutoPostBack="true" OnCheckedChanged="Option1_CheckedChanged" />

        </div>


        <a href="#myModal" id="btnpress" role="button" class="btn pull-right" data-toggle="modal">Launch Exam!</a>

        <!-- Modal -->
        <div class="modal hide fade" id="myModal" tabindex="-1" role="dialog">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="myModalLabel">Are you sure to start?</h3>
            </div>
            <div class="modal-body">
                <p>
                    You have selected 
                        <%= Option2.Checked ? "<strong>Normal</strong> mode for the exam." : " the topic <strong>" + drpType.SelectedItem.Text + "</strong>."  %>
                </p>
            </div>
            <div class="modal-footer">
                <button class="btn" data-dismiss="modal" aria-hidden="true">No</button>
                <button runat="server" onserverclick="OpenWindow" class="btn btn-primary">Yes!</button>
            </div>
        </div>
    </form>
</asp:Content>

