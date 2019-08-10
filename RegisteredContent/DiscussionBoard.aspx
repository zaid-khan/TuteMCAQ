<%@ Page Title="Analysis - Tute MCAQ" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DiscussionBoard.aspx.cs" Inherits="RegisteredContent_DiscussionBoard" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>


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

        .center {
            margin: auto;
            width: 300px;
            text-align: center;
            margin-bottom: 30px;
        }

        #centeredview {
            width: 300px;
            margin: auto;
            border: 5px solid #292250;
        }

        #instruction {
            margin-top: 20px;
        }
    </style>

</asp:Content>







<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <form class="form-signin clearfix" runat="server">
        <h2 class="form-signin-heading center">Analyze Results</h2>

        <h3>Choose Category :</h3>

        <asp:DropDownList runat="server" AutoPostBack="true" ID="DropDownList1" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem Text="Recent Results" Value="1" />
            <asp:ListItem Text="Comp. Sci. vs Quan. Ap." Value="2" />
            <asp:ListItem Text="No. of Ques. Attempted" Value="3" />
            <asp:ListItem Text="Your Average Score" Value="4" />
            <asp:ListItem Text="Right Questions" Value="5" />
        </asp:DropDownList>

        <div id="centeredview">
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View1" runat="server">

                    <asp:Chart ID="Chart1" runat="server">
                        <Titles>
                            <asp:Title Text="Recent Results"></asp:Title>
                        </Titles>
                        <Series>
                            <asp:Series Name="Series1" ChartType="Line">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                                <AxisX Title="Date"></AxisX>
                                <AxisY Title="Total Marks"></AxisY>
                                <Area3DStyle Enable3D="True" Inclination="2" LightStyle="Realistic" Rotation="-5" />
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>

                </asp:View>





                <asp:View ID="View2" runat="server">

                    <asp:Chart ID="Chart2" runat="server" Palette="Excel">
                        <Titles>
                            <asp:Title Text="Composition of Marks"></asp:Title>
                        </Titles>
                        <Series>
                            <asp:Series Name="Series1" ChartType="Pie">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                                <Area3DStyle Enable3D="True" />
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>

                </asp:View>



                <asp:View ID="View3" runat="server">

                    <asp:Chart ID="Chart3" runat="server">
                        <Titles>
                            <asp:Title Text="No. of Questions Attempted(Cumulative)"></asp:Title>
                        </Titles>
                        <Series>
                            <asp:Series Name="Series1" ChartType="Doughnut">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                                <Area3DStyle Enable3D="True" LightStyle="Realistic" Rotation="45" />
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>

                </asp:View>



                <asp:View ID="View4" runat="server">

                    <asp:Chart ID="Chart4" runat="server" Palette="EarthTones">
                        <Titles>
                            <asp:Title Text="Your Average Score Vs. Average of Other Users"></asp:Title>
                        </Titles>
                        <Series>
                            <asp:Series Name="Series1" ChartType="Bubble">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                                <Area3DStyle Enable3D="True" Inclination="5" LightStyle="Realistic" PointDepth="200" PointGapDepth="150" Rotation="5" />
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>

                </asp:View>




                <asp:View ID="View5" runat="server">

                    <asp:Chart ID="Chart5" runat="server" Palette="SeaGreen">
                        <Titles>
                            <asp:Title Text="Right Questions Vs. Questions Attempted"></asp:Title>
                        </Titles>
                        <Series>
                            <asp:Series Name="Series1" ChartType="Column">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                                <Area3DStyle Enable3D="True" />
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>

                </asp:View>



            </asp:MultiView>
            <asp:Label ID="Label1" Font-Bold="true" Font-Size="Large" runat="server" Text="" ForeColor="Red"></asp:Label>

        </div>
        <div id="instruction" class="well well-small alert alert-block">
            <ul id="mediumfont">
                <li class="gap"><strong>NOTE</strong> : You can download the Graph by <em>Right Clicking</em> on the Graph, and then <em>Clicking</em> on <em>Save Image</em>.
                </li>
            </ul>
        </div>



    </form>
</asp:Content>

