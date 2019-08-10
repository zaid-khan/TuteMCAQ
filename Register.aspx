<%@ Page Title="Register on Tute MCAQ!" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="HeadofRegistration" ContentPlaceHolderID="HeadContent" runat="Server">
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

            .form-signin, .form-signin-heading,
            .form-signin {
                margin-bottom: 20px;
                border-bottom: 2px double #e5e5e5;
            }

        .checkbox {
            margin-bottom: 20px;
            padding-top: 25px;
            margin-top: 10px;
            border-top: 3px solid #e5e5e5;
        }

        .form-signin input[type="text"],
        .form-signin input[type="password"] {
            font-size: 14px;
            height: 25px;
            margin-bottom: 5px;
            padding: 7px 9px;
        }

        .radioclass {
            /*height: auto;*/
            height: auto;
            margin-bottom: 5px;
            padding: 7px 6px;
        }

        .ValidationForm {
            color: red;
            text-align: right;
            font-style: italic;
        }
        /*#checkAvail {
            ali
        }*/
    </style>
    <script type="text/javascript">
        function acceptAgreement(obj) {
            document.getElementById('<%=btnregister.ClientID%>').disabled = !obj.checked;
        }
    </script>
</asp:Content>




<asp:Content ID="BodyofRegistration" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">

        <form class="form-signin" runat="server">
            <h2 class="form-signin-heading">Registration</h2>
            <div class="control-group">
                <div class="controls">
                    <label class="control-label" for="inputName">Name</label>
                    <asp:TextBox ID="inputName" CssClass="input-block-level" placeholder="Enter Name" runat="server" required="required" MaxLength="29" ValidationGroup="ValGroup1"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="valinputName" ControlToValidate="inputName" Text="*Name cannot be empty!" Display="Dynamic" runat="server" EnableClientScript="true" CssClass="ValidationForm" ValidationGroup="ValGroup1"></asp:RequiredFieldValidator>
                </div>
            </div>

            <%--<div class="control-group">
                <div class="controls">
                    <label class="control-label" for="inputUserID">User ID</label>
                    <asp:TextBox ID="inputUserID" CssClass="input-block-level" placeholder="Enter a Unique ID" runat="server"></asp:TextBox>
                    <asp:Button runat="server" ID="checkAvail" Text="Check Availability!" CssClass="btn pull-right btn-small btn-info " OnClick="checkAvail_Click" />
                </div>
            </div>--%>

            <div class="control-group">
                <div class="controls">
                    <label class="control-label" for="inputPassword">Password</label>
                    <asp:TextBox ID="inputPassword" CssClass="input-block-level" placeholder="Enter Password" TextMode="Password" runat="server" required="required"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="valinputPassword" ControlToValidate="inputPassword" Text="*Password cannot be empty!" Display="Dynamic" runat="server" EnableClientScript="true" CssClass="ValidationForm"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="ValidatePassword" ControlToValidate="inputPassword" runat="server" Text="*Password should be min 6(max 11) chars with mixture of alphabets, numbers and special symbols" CssClass="ValidationForm" EnableClientScript="true" ValidationExpression="((?=.*\d)(?=.*[a-z])(?=.*[\W]).{6,11})" Display="Dynamic"></asp:RegularExpressionValidator>
                    <%--(           # Start of group
                        (?=.*\d)      #   must contains one digit from 0-9
                        (?=.*[a-z])   #   must contains one lowercase characters
                        (?=.*[\W])    #   must contains at least one special character
                             .        #     match anything with previous condition checking
                        {6,11}        #        length at least 6 characters and maximum of 11 
                        )   
                    # End of group--%>
                </div>
            </div>

            <div class="control-group">
                <div class="controls">
                    <label class="control-label" for="inputConfirm">Confirm Password</label>
                    <asp:TextBox ID="inputConfirm" CssClass="input-block-level" placeholder="Enter Password Again" TextMode="Password" runat="server" required="required"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="valinputConfirm" ControlToValidate="inputConfirm" Text="*Password required again!" Display="Dynamic" runat="server" EnableClientScript="true" CssClass="ValidationForm"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="ComparePassword" ControlToCompare="inputPassword" ControlToValidate="inputConfirm" Text="*Password's must match" Display="Dynamic" EnableClientScript="true" runat="server" CssClass="ValidationForm"></asp:CompareValidator>
                </div>
            </div>


            <div class="control-group">
                <div class="controls">
                    <label class="control-label" for="inputEmail">E-mail</label>
                    <asp:TextBox ID="inputEmail" CssClass="input-block-level" placeholder="Enter E-mail" runat="server" required="required" MaxLength="49"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="valinputEmail" ControlToValidate="inputEmail" Text="*E-mail cannot be empty!" Display="Dynamic" runat="server" EnableClientScript="true" CssClass="ValidationForm"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="ValidateEmailRegular" ControlToValidate="inputEmail" runat="server" Text="*Enter a valid E-mail" CssClass="ValidationForm" EnableClientScript="true" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="EmailCustomValidation" runat="server" CssClass="ValidationForm" ControlToValidate="inputEmail" ErrorMessage="*E-mail already in use" OnServerValidate="EmailCustomValidation_ServerValidate" Display="Dynamic"></asp:CustomValidator>
                </div>
            </div>

            <div class="control-group">
                <div class="controls">
                    <label class="control-label" for="inputLocation">Location</label>
                    <asp:TextBox ID="inputLocation" CssClass="input-block-level" placeholder="Enter Location" runat="server" required="required" MaxLength="19"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="valinputLocation" ControlToValidate="inputLocation" Text="*Location cannot be empty!" Display="Dynamic" runat="server" EnableClientScript="true" CssClass="ValidationForm"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="control-group">
                <div class="controls">
                    <label class="control-label" for="inputDOB">Date of Birth</label>
                    <asp:TextBox ID="inputDOB" ClientIDMode="Static" CssClass="input-block-level" placeholder="2016-12-31" TextMode="Date" Min="1950-01-01" Max="2004-12-31" runat="server" required="required"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="valinputDOB" ControlToValidate="inputDOB" Text="*Date of Birth cannot be empty!" Display="Dynamic" runat="server" EnableClientScript="true" CssClass="ValidationForm"></asp:RequiredFieldValidator>
                    <asp:RangeValidator runat="server" ID="DOBRangeValidation" ControlToValidate="inputDOB" Type="Date" MinimumValue="1950-01-01" MaximumValue="2004-12-31" Display="Dynamic" CssClass="ValidationForm" ErrorMessage="*Invalid Date.  Must be between 1950-01-01 and 2004-12-31"></asp:RangeValidator>
                    <%--<asp:CustomValidator ID="DOBCustomValidation" runat="server" CssClass="ValidationForm" ErrorMessage="*DOB must be between 1950-01-01 and 2004-12-31" ControlToValidate="inputDOB" OnServerValidate="DOBCustomValidation_ServerValidate" Display="Dynamic"></asp:CustomValidator>--%>
                </div>
            </div>

            <div class="control-group">
                <div class="controls">
                    <label class="control-label" for="inputDOB">Gender</label>
                    <label class="radio inline control-label" for="inputGenderMale">Male</label>
                    <asp:RadioButton ID="inputGenderMale" CssClass="radioclass" runat="server" Checked="true" GroupName="Gender" />
                    <label class="radio inline control-label" for="inputGenderFemale">Female</label>
                    <asp:RadioButton ID="inputGenderFemale" CssClass="radioclass" runat="server" GroupName="Gender" />
                    <label class="radio inline control-label" for="inputGenderLGBT">L.G.B.T.</label>
                    <asp:RadioButton ID="inputGenderLGBT" CssClass="radioclass" runat="server" GroupName="Gender" />
                </div>
            </div>

            <div class="checkbox">
                <div class="control-group">
                    <div class="controls">
                        <br />
                        <asp:CheckBox EnableViewState="false" ID="checkTerms" runat="server" OnClick="acceptAgreement(this)" Checked="false" />
                        <label class="radio control-label" for="checkTerms">
                            I have read and accepted the <strong>Terms of Service</strong> of Tute MCAQ!</label><br />
                        <asp:Button runat="server" ID="btnregister" CssClass="btn btn-large btn-primary pull-right" Text="Register" OnClick="register_Click" Enabled="False" ClientIDMode="Static" />
                        <asp:Button runat="server" ID="reset" CssClass="btn btn-large pull-left" Text="Cancel" OnClick="reset_Click" CausesValidation="false"  UseSubmitBehavior="false" />
                    </div>
                </div>
            </div>

        </form>

    </div>

</asp:Content>
