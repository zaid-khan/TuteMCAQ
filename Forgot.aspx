<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Forgot.aspx.cs" Inherits="Forgot" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        body {
            background-color: #f5f5f5;
        }

        .form-signin {
            max-width: 300px;
            padding: 19px 29px 29px;
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

            .form-signin .form-signin-heading,
            .form-signin .checkbox {
                margin-bottom: 10px;
            }

            .form-signin input[type="text"],
            .form-signin input[type="password"] {
                font-size: 16px;
                height: auto;
                margin-bottom: 10px;
                padding: 7px 9px;
            }

        .erroratlabel {
            margin-bottom: 8px;
            font-style: italic;
            font-weight: bold;
        }

        .ValidationForm {
            color: red;
            text-align: right;
            font-style: italic;
            margin-top: 0;
        }
    </style>
</asp:Content>







<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="container">

        <form class="form-signin" runat="server">
            <h2 class="form-signin-heading">Forgot your Password</h2>
             <div class="control-group">
                <div class="controls">
                    <asp:TextBox runat="server" ID="inputUserID" CssClass="input-block-level" placeholder="Enter User ID" required="required" />
                    <asp:RequiredFieldValidator ID="UserIdReq" runat="server" ControlToValidate="inputUserID" Display="Dynamic" CssClass="ValidationForm" EnableClientScript="true" Text="*User ID is required"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeofNos" runat="server" ControlToValidate="inputUserID" Type="Integer" Display="Dynamic" CssClass="ValidationForm" EnableClientScript="true" MinimumValue="1" MaximumValue="1000" Text="*User ID should be a number"></asp:RangeValidator>
                </div>
            </div>



            <div class="control-group">
                <div class="controls">
                    <asp:TextBox runat="server" ID="inputEmailID" CssClass="input-block-level" placeholder="Enter Email ID" required="required" />
                    <asp:RequiredFieldValidator ID="EmailIDReq" runat="server" ControlToValidate="inputEmailID" Display="Dynamic" CssClass="ValidationForm" EnableClientScript="true" Text="*Email ID is required"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="ValidateEmailRegular" ControlToValidate="inputEmailID" runat="server" Text="*Enter a valid E-mail" CssClass="ValidationForm" EnableClientScript="true" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>
            </div>


             <div class="control-group">
                <div class="controls">
                    <asp:TextBox ID="inputDOB" ClientIDMode="Static" CssClass="input-block-level" placeholder="2016-12-31" TextMode="Date" Min="1950-01-01" Max="2004-12-31" runat="server" required="required"></asp:TextBox>
                   
                    <asp:RequiredFieldValidator ID="valinputDOB" ControlToValidate="inputDOB" Text="*Date of Birth cannot be empty!" Display="Dynamic" runat="server" EnableClientScript="true" CssClass="ValidationForm"></asp:RequiredFieldValidator>
                    <asp:RangeValidator runat="server" ID="DOBRangeValidation" ControlToValidate="inputDOB" Type="Date" MinimumValue="1950-01-01" MaximumValue="2004-12-31" Display="Dynamic" CssClass="ValidationForm" ErrorMessage="*Invalid Date.  Must be between 1950-01-01 and 2004-12-31"></asp:RangeValidator>
               </div>
            </div>
            <div class="alert-error erroratlabel">
                <asp:Label runat="server" ID="MessageforFailure" Text=""></asp:Label>
            </div>
            <div class="alert-success erroratlabel">
                <asp:Label runat="server" ID="MessageforSuccess" Text=""></asp:Label>
            </div>
            <asp:Button runat="server" ID="LogInbtn" CssClass="btn btn-primary" Text="Submit" OnClick="LogInbtn_Click" />
            <%--<button class="btn btn-large btn-primary" type="submit">Sign in</button>--%>
        </form>

    </div>
</asp:Content>

