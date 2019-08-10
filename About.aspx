<%@ Page Title="About Tute MCAQ" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

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

        #center {
            margin: auto;
            width: 300px;
            text-align: center;
            margin-bottom: 30px;
        }

        #centerimage {
            margin: auto;
            width: 150px;
        }

        #paragraph {
            font-size: 17px;
        }

        #fontincrease {
            font-size: 13.5px;
            font-style: italic;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <form class="form-signin clearfix" runat="server">
        <h2 class="form-signin-heading" id="center">About Me</h2>
        <div id="centerimage" class="container">
            <ul class="thumbnails">
                <li class="span2">
                    <div class="thumbnail">
                        <img src="App_Themes/img/FinalPassportSize.jpg" alt="Zaid Khan" />
                        <h3>Me.. Mr. Zaid.</h3>
                        <p id="fontincrease">
                            I'm a student at Akbar Peerbhoy College of Economics and Commerce and this website
                        is my final year project.
                        </p>
                    </div>
                </li>

            </ul>

        </div>
        <div id="paragraph" class="well">
            <p>
                I'd like to use this <em>About</em> page as a means to <strong>Thank everybody</strong> who have helped me with the project including the <em>teaching</em> as well as the <em>non-teaching staff at <strong>Akbar Peerbhoy College of Economics and Commerce</strong></em>.
            </p>
            <p>
                Naming a few .....
            </p>

            <ul style="list-style: square; margin-left: 30px; margin-bottom: 10px;">
                <li>Prof. Ahetesham Shaikh.</li>
                <li>Prof. Altaf Merchant.</li>
                <li>Prof. Shahid Pervez.</li>
                <li>Prof. Hanif Lakdawala.</li>
                <li>My colleagues here at the college.</li>
                <li>My family and relatives, especially my mother.</li>
            </ul>

            <p>
                It's with the help of such people that I have been able to make this website and I have reached this stage of my life to be very honest.
            </p>
        </div>

    </form>
</asp:Content>

