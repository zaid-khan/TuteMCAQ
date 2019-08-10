<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Recovery.aspx.cs" Inherits="Recovery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        body {
            background-color: #f5f5f5;
        }

        .form-signin {
            max-width: 300px;
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
        }

        .success {
            color: Green;
            margin-top: 1em;
        }

        .error {
            color: Red;
            margin-top: 1em;
        }

        .ValidationForm {
            color: red;
            text-align: right;
            font-style: italic;
        }

        .aligncenter {
            width: 95%;
            margin: auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container">

        <form class="form-signin" runat="server">
            <h2 class="form-signin-heading">Change your Password</h2>
            <div class="control-group">
                <div class="controls">
                    <asp:TextBox runat="server" TextMode="Password" ID="inputPassword" CssClass="input-block-level" placeholder="New Password" required="required" />
                    <asp:RequiredFieldValidator ValidationGroup="PasswordChange" ID="valinputPassword" ControlToValidate="inputPassword" Text="*Password cannot be empty!" Display="Dynamic" runat="server" EnableClientScript="true" CssClass="ValidationForm"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ValidationGroup="PasswordChange" ID="ValidatePassword" ControlToValidate="inputPassword" runat="server" Text="*Password should be min 6(max 11) chars with mixture of alphabets, numbers and special symbols" CssClass="ValidationForm" EnableClientScript="true" ValidationExpression="((?=.*\d)(?=.*[a-z])(?=.*[\W]).{6,11})" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>
            </div>



            <div class="control-group">
                <%--<label class="control-label" for="inputConfirm">Confirm New Password</label>--%>
                <div class="controls">
                    <asp:TextBox runat="server" TextMode="Password" ID="inputConfirm" CssClass="input-block-level" placeholder="Confirm Password" required="required" />
                    <asp:RequiredFieldValidator ValidationGroup="PasswordChange" ID="valinputConfirm" ControlToValidate="inputConfirm" Text="*Password required again!" Display="Dynamic" runat="server" EnableClientScript="true" CssClass="ValidationForm"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ValidationGroup="PasswordChange" ID="ComparePassword" ControlToCompare="inputPassword" ControlToValidate="inputConfirm" Text="*Password's must match" Display="Dynamic" EnableClientScript="true" runat="server" CssClass="ValidationForm"></asp:CompareValidator>
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <%--<button runat="server" class="btn btn-inverse" validationgroup="PasswordChange" onserverclick="ChangedPassword_ServerClick" type="submit">Change Password</button>--%>
                    <button runat="server" class="btn btn-primary" validationgroup="PasswordChange" onserverclick="ChangedPassword_ServerClick" type="submit">Change Password</button>
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <asp:Label runat="server" ID="lblNot" Font-Bold="True"></asp:Label>
                </div>
            </div>
        </form>

    </div>

</asp:Content>

