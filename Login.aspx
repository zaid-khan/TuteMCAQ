<%@ Page Title="Login To Tute MCAQ" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container">

        <form class="form-signin" runat="server">
            <h2 class="form-signin-heading">Please sign in</h2>
            <div class="control-group">
                <div class="controls">
                    <asp:TextBox runat="server" ID="inputUserID" CssClass="input-block-level" placeholder="User ID" required="required" />
                    <asp:RequiredFieldValidator ID="UserIdReq" runat="server" ControlToValidate="inputUserID" Display="Dynamic" CssClass="ValidationForm" EnableClientScript="true" Text="*User ID is required"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeofNos" runat="server" ControlToValidate="inputUserID" Type="Integer" Display="Dynamic" CssClass="ValidationForm" EnableClientScript="true" MinimumValue="1" MaximumValue="1000" Text="*User ID should be a number"></asp:RangeValidator>
                </div>
            </div>


             <div class="control-group">
                <div class="controls">
            <asp:TextBox runat="server" ID="inputPassword" TextMode="Password" CssClass="input-block-level" placeholder="Password" required="required" />
            <asp:RequiredFieldValidator ID="PasswordReq" runat="server" ControlToValidate="inputPassword" Display="Dynamic" CssClass="ValidationForm" EnableClientScript="true" Text="*Password is required"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="ValidatePassword" ControlToValidate="inputPassword" runat="server" Text="*Password should be min 6(max 11) chars with mixture of alphabets, numbers and special symbols" CssClass="ValidationForm" EnableClientScript="true" ValidationExpression="((?=.*\d)(?=.*[a-z])(?=.*[\W]).{6,11})" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>
            </div>
            <label class="checkbox">
                <asp:CheckBox runat="server" ID="RememberMe" />
                Remember me
                <span class="icon-ok"></span>
                <a href="Forgot.aspx" class="checkbox">Forgot your password?</a>
                <%--<asp:LinkButton CssClass="checkbox" runat="server" ID="Forgot"  PostBackUrl="~/Forgot.aspx" Text="" ></asp:LinkButton>--%>
            </label>
            
            <div class="alert-error erroratlabel">
                <asp:Label runat="server" ID="MessageforLogin" Text=""></asp:Label>
            </div>
            <asp:Button runat="server" ID="LogInbtn" CssClass="btn btn-primary" Text="Sign In" OnClick="LogInbtn_Click" />
            <%--<button class="btn btn-large btn-primary" type="submit">Sign in</button>--%>
        </form>

    </div>
</asp:Content>

