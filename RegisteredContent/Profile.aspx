<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="RegisteredContent_Profile" EnableViewState="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        body {
            background-color: #f5f5f5;
        }
        
        .form-signin {
            max-width: 100%;
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
        .aligncenter
        {
            width: 95%;
            margin: auto;
        }
    </style>
    <%--<script type="text/javascript">
        var button = document.getElementById('hideshow'); // Assumes element with id='button'

        button.onclick = function () {
            var div = document.getElementById('content');
            if (div.style.display !== 'none') {
                div.style.display = 'none';
            }
            else {
                div.style.display = 'block';
            }
        };
    </script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <form runat="server">
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span3">
                    <div class="form-signin">
                        <div class="btn-group btn-group-vertical aligncenter">
                            <input runat="server" onserverclick="ViewP_ServerClick" type="button" class="btn" id="ViewP" value="View Profile" causesvalidation="false" />
                            <input runat="server" onserverclick="ViewR_ServerClick" type="button" class="btn" id="ViewR" value="View Results" causesvalidation="false" />
                            <input runat="server" onserverclick="ChnP_ServerClick" type="button" class="btn" id="ChnP" value="Change Password" causesvalidation="false" />
                        </div>
                    </div>
                </div>
                <div class="span9">

                    <div class="form-signin">

                        <div runat="server" id="content1">
                            <h2 class="form-signin-heading">User Profile</h2>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                ConnectionString="<%$ ConnectionStrings:TuteDB %>"
                                SelectCommand="SELECT UserID, Name, Location, Email, 
                                Reputation, SiteRank FROM User_Profile WHERE (UserID = @UserID)"
                                UpdateCommand="UPDATE User_Profile 
                                SET Name = @Name, Location = @Location, Email = @Email 
                                WHERE (UserID = @UserID)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="UserID" SessionField="UserIDP" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Name" Type="String" />
                                    <asp:Parameter Name="Location" Type="String" />
                                    <asp:Parameter Name="Email" Type="String" />
                                    <asp:SessionParameter Name="UserID" SessionField="UserIDP" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <asp:DetailsView ID="DetailsView1"
                                runat="server"
                                DataSourceID="SqlDataSource1" AutoGenerateRows="false"
                                BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None"
                                BorderWidth="1px" CellPadding="3"
                                CellSpacing="2"
                                Height="50px" Width="350px"
                                OnItemUpdated="DetailsView1_ItemUpdated" OnItemUpdating="DetailsView1_ItemUpdating">
                                <Fields>
                                    <asp:TemplateField ControlStyle-Font-Bold="true" HeaderText="Name ">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtName" runat="server"
                                                Text='<%# Bind("Name") %>' MaxLength="29"></asp:TextBox>
                                            <asp:RequiredFieldValidator
                                                ID="RequiredFieldValidator1" runat="server"
                                                ControlToValidate="txtName"
                                                ErrorMessage="Name is required." ValidationGroup="ProfileValidation">*
                                            </asp:RequiredFieldValidator>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server"
                                                Text='<%# Eval("Name") %>'></asp:Label>
                                        </ItemTemplate>

                                        <ControlStyle Font-Bold="True"></ControlStyle>

                                    </asp:TemplateField>

                                    <asp:TemplateField ControlStyle-Font-Bold="true" HeaderText="Location ">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtLocation" runat="server"
                                                Text='<%# Bind("Location") %>' MaxLength="19"></asp:TextBox>

                                            <asp:RequiredFieldValidator
                                                ID="RequiredFieldValidator2" runat="server"
                                                ControlToValidate="txtLocation"
                                                ErrorMessage="Location is required." ValidationGroup="ProfileValidation">*
                                            </asp:RequiredFieldValidator>
                                        </EditItemTemplate>

                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server"
                                                Text='<%# Eval("Location") %>'></asp:Label>
                                        </ItemTemplate>

                                        <ControlStyle Font-Bold="True"></ControlStyle>
                                    </asp:TemplateField>


                                    <asp:TemplateField ControlStyle-Font-Bold="true" HeaderText="Email ">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEmail" runat="server"
                                                Text='<%# Bind("Email") %>' MaxLength="49"></asp:TextBox>
                                            <asp:RequiredFieldValidator
                                                ID="RequiredFieldValidator3" runat="server"
                                                ControlToValidate="txtEmail" Display="Dynamic"
                                                ErrorMessage="Email is required." ValidationGroup="ProfileValidation">*
                                            </asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="ValidateEmailRegular"
                                                ControlToValidate="txtEmail"
                                                runat="server" Display="Dynamic"
                                                ErrorMessage="Enter a valid E-mail" 
                                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="ProfileValidation">*</asp:RegularExpressionValidator>
                                            <asp:CustomValidator ID="EmailCustomValidation" 
                                                runat="server" 
                                                ControlToValidate="txtEmail" Display="Dynamic"
                                                ErrorMessage="*E-mail already in use" 
                                                OnServerValidate="EmailCustomValidation_ServerValidate" ValidationGroup="ProfileValidation">*</asp:CustomValidator>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server"
                                                Text='<%# Eval("Email") %>'></asp:Label>
                                        </ItemTemplate>

                                        <ControlStyle Font-Bold="True"></ControlStyle>
                                    </asp:TemplateField>

                                    <asp:CommandField ButtonType="Button" ValidationGroup="ProfileValidation" ShowEditButton="True" CausesValidation="true" EditText="Edit Profile" ControlStyle-CssClass="btn btn-inverse" />

                                </Fields>
                                <EditRowStyle BackColor="#292250" ForeColor="White" />
                                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                <RowStyle BorderWidth="3px" Font-Size="Medium" BackColor="#FFF7E7" ForeColor="#8C4510" />
                                <CommandRowStyle BorderColor="#DEBA84" BorderWidth="3px" BackColor="White" />
                            </asp:DetailsView>

                            <asp:ValidationSummary ID="ValidationSummary1" runat="server"
                                HeaderText="Please correct the following errors:" CssClass="error" ValidationGroup="ProfileValidation" />
                            <p>
                                <asp:Label ID="lblError" runat="server" EnableViewState="False" CssClass="error" Font-Bold="True"></asp:Label>
                            </p>
                            <p>
                                <asp:Label ID="lblSuccess" runat="server" EnableViewState="False" CssClass="success" Font-Bold="True"></asp:Label>
                            </p>


                            <hr />
                            <asp:DetailsView ID="DetailsView2"
                                runat="server"
                                DataSourceID="SqlDataSource1" AutoGenerateRows="False"
                                BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None"
                                BorderWidth="1px" CellPadding="3"
                                CellSpacing="2"
                                Height="50px" Width="150px">

                                <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                <Fields>
                                    <asp:TemplateField ItemStyle-Font-Size="Medium" ItemStyle-HorizontalAlign="Center" ControlStyle-Font-Bold="true" HeaderText="Reputation ">

                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server"
                                                Text='<%# Eval("Reputation") %>'></asp:Label>
                                        </ItemTemplate>

                                        <ControlStyle Font-Bold="True"></ControlStyle>

                                    </asp:TemplateField>

                                    <asp:TemplateField ItemStyle-Font-Size="Medium" ItemStyle-HorizontalAlign="Center" ControlStyle-Font-Bold="true" HeaderText="Rank ">

                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server"
                                                Text='<%# Eval("SiteRank") %>'></asp:Label>
                                        </ItemTemplate>

                                        <ControlStyle Font-Bold="True"></ControlStyle>

                                    </asp:TemplateField>
                                </Fields>

                                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                <RowStyle BorderWidth="3px" Font-Size="Medium" BackColor="#FFF7E7" ForeColor="#8C4510" />

                            </asp:DetailsView>
                        </div>

















                        <div runat="server" id="content2" hidden="hidden">
                            <h2 class="form-signin-heading">Results</h2>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                ConnectionString="<%$ ConnectionStrings:TuteDB %>"
                                SelectCommand="SELECT [ResultID], [DateAppeared], [MarksOutOf], [TotalMarks] FROM [Result] WHERE ([UserID] = @UserID)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="UserID" SessionField="UserIDP" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:GridView ID="GridView1" runat="server"
                                AllowPaging="True" AutoGenerateColumns="False"
                                DataKeyNames="ResultID"
                                DataSourceID="SqlDataSource2" CellPadding="1" PageSize="4" 
                                AllowSorting="True" ShowHeaderWhenEmpty="True" EmptyDataText="No Records Found. Seems you haven't given a test yet!">
                                <Columns>
                                    <asp:BoundField DataField="ResultID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ResultID">
                                        <ItemStyle HorizontalAlign="Center" Width="50px" />

                                    </asp:BoundField>
                                    <asp:BoundField DataField="DateAppeared" HeaderText="Date" SortExpression="DateAppeared">
                                        <ItemStyle HorizontalAlign="Center" Width="200px" Height="75px" VerticalAlign="Middle" />
                                    </asp:BoundField>

                                    <asp:BoundField DataField="MarksOutOf" HeaderText="Marks" SortExpression="MarksOutOf">
                                        <ItemStyle HorizontalAlign="Center" Width="200px" Height="75px" VerticalAlign="Middle" />
                                    </asp:BoundField>

                                    <asp:BoundField DataField="TotalMarks" HeaderText="Out of Marks" SortExpression="TotalMarks">
                                        <ItemStyle HorizontalAlign="Center" Width="200px" Height="75px" VerticalAlign="Middle" />
                                    </asp:BoundField>
                                </Columns>
                                <HeaderStyle BackColor="Gray" Font-Bold="True" ForeColor="White" />
                                <RowStyle BackColor="White" ForeColor="Black" />
                                <AlternatingRowStyle BackColor="LightGray" ForeColor="Black" />
                                
                                <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NextPreviousFirstLast" NextPageText="Next" PreviousPageText="Previous" />
                                <PagerStyle BackColor="Gray" ForeColor="White"
                                    HorizontalAlign="Center" />
                                <SortedAscendingCellStyle BackColor="#99FF66" />
                                <SortedDescendingCellStyle BackColor="#FF8C8C" />
                            </asp:GridView>
                        </div>



                        <!--INBETWEEN THIS -->


                        <div runat="server" id="content3" hidden="hidden">
                            <h2 class="form-signin-heading">Change Password</h2>
                            <div class="form-horizontal">
                                <div class="control-group">
                                    <label class="control-label" for="inputOld">Old Password</label>
                                    <div class="controls">
                                        <input runat="server" type="password" id="inputOld" placeholder="Old Password" maxlength="12" />
                                        <asp:RequiredFieldValidator ValidationGroup="PasswordChange" ID="RequiredFieldValidator14" ControlToValidate="inputOld" Text="*Please enter your old Password!" Display="Dynamic" runat="server" EnableClientScript="true" CssClass="ValidationForm"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <hr />
                                <div class="control-group">
                                    <label class="control-label" for="inputPassword">New Password</label>
                                    <div class="controls">
                                        <input runat="server" type="password" id="inputPassword" placeholder="New Password" maxlength="12" />
                                        <asp:RequiredFieldValidator ValidationGroup="PasswordChange" ID="valinputPassword" ControlToValidate="inputPassword" Text="*Password cannot be empty!" Display="Dynamic" runat="server" EnableClientScript="true" CssClass="ValidationForm"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ValidationGroup="PasswordChange" ID="ValidatePassword" ControlToValidate="inputPassword" runat="server" Text="*Password should be min 6(max 11) chars with mixture of alphabets, numbers and special symbols" CssClass="ValidationForm" EnableClientScript="true" ValidationExpression="((?=.*\d)(?=.*[a-z])(?=.*[\W]).{6,11})" Display="Dynamic"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="inputConfirm">Confirm New Password</label>
                                    <div class="controls">
                                        <input runat="server" type="password" id="inputConfirm" placeholder="Confirm New Password" maxlength="12" />
                                        <asp:RequiredFieldValidator ValidationGroup="PasswordChange" ID="valinputConfirm" ControlToValidate="inputConfirm" Text="*Password required again!" Display="Dynamic" runat="server" EnableClientScript="true" CssClass="ValidationForm"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator ValidationGroup="PasswordChange" ID="ComparePassword" ControlToCompare="inputPassword" ControlToValidate="inputConfirm" Text="*Password's must match" Display="Dynamic" EnableClientScript="true" runat="server" CssClass="ValidationForm"></asp:CompareValidator>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <div class="controls">
                                        <button runat="server" class="btn btn-inverse" validationgroup="PasswordChange" onserverclick="ChangedPassword_ServerClick" type="submit">Change Password</button>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <div class="controls">
                                        <asp:Label runat="server" ID="lblNot" Font-Bold="True"></asp:Label>
                                    </div>
                                </div>
                            </div>

                            <!--INBETWEEN THIS -->

                        </div>
                    </div>
                </div>
            </div>
            <%--<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu">
                <li><a tabindex="-1" href="#">Action</a></li>
                <li><a tabindex="-1" href="#">Another action</a></li>
                <li><a tabindex="-1" href="#">Something else here</a></li>
                <li class="divider"></li>
                <li><a tabindex="-1" href="#">Separated link</a></li>
            </ul>--%>
            <%--            <div class="container-fluid">
                <div class="row-fluid">
                    <div class="span3">
                        
                        
                        <asp:Menu ID="Menu1" runat="server" CssClass="nav nav-list" DynamicHorizontalOffset="10" DynamicVerticalOffset="20" Font-Bold="True" ForeColor="#000066">
                            <Items>
                                <asp:MenuItem Text="View Profile" Value="View Profile" NavigateUrl="#vipr"></asp:MenuItem>
                                <asp:MenuItem Text="View Results" Value="View Results"></asp:MenuItem>
                                <asp:MenuItem Text="Change Password" Value="Change Password"></asp:MenuItem>
                            </Items>
                        </asp:Menu>
                        
                    </div>
                    <div class="span9">
                        <div id="vipr">
                            Some text
                        </div>
                    </div>
                </div>
            </div>--%>
        </div>
    </form>
</asp:Content>

