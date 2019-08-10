<%@ Page Language="C#" AutoEventWireup="true" CodeFile="QuestionsAdd.aspx.cs" Inherits="AdminTuteMCAQ_Admin_QuestionsAdd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Questions - TuteMCAQ Admin Maintainence</title>
    <link href="MainQ.css" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" type="image/ico" href="/TuteMCAQ/App_Themes/img/favoriteicon/tutemcaqicon.ico" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="page">
            <div id="header">
                <asp:Image AlternateText="Logo" CssClass="ImageHeader"
                    ID="Image1" runat="server"
                    ImageUrl="/TuteMCAQ/App_Themes/img/TuteMCAQAdmin.png" />
            </div>
            <div id="main">
                <div id="gridview">
                    <asp:GridView ID="GridView1" runat="server"
                        AllowPaging="True" AutoGenerateColumns="False"
                        DataKeyNames="QuestionID"
                        DataSourceID="SqlDataSource1" SelectedIndex="0" CellPadding="1" PageSize="4" OnPageIndexChanged="GridView1_PageIndexChanged" AllowSorting="True">
                        <Columns>
                            <asp:BoundField DataField="QuestionID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="QuestionID">
                                <ItemStyle HorizontalAlign="Center" Width="50px" />

                            </asp:BoundField>

                            <asp:TemplateField HeaderText="Question" SortExpression="QuestText">
                                <ItemTemplate>
                                    <div style="width: 100px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("QuestText") %>' ToolTip='<%# Eval("QuestText") %>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                                <ItemStyle Height="75px" HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" />
                            </asp:TemplateField>


                            <asp:BoundField DataField="Name" HeaderText="Type" SortExpression="Name">
                                <ItemStyle HorizontalAlign="Center" Width="200px" Height="75px" VerticalAlign="Middle" />
                            </asp:BoundField>

                            <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                        </Columns>
                        <HeaderStyle BackColor="Gray" Font-Bold="True" ForeColor="White" />
                        <RowStyle BackColor="White" ForeColor="Black" />
                        <AlternatingRowStyle BackColor="LightGray" ForeColor="Black" />
                        <SelectedRowStyle BackColor="#000066" ForeColor="White" />
                        <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NextPreviousFirstLast" NextPageText="Next" PreviousPageText="Previous" />
                        <PagerStyle BackColor="Gray" ForeColor="White"
                            HorizontalAlign="Center" />
                        <SortedAscendingCellStyle BackColor="#99FF66" />
                        <SortedDescendingCellStyle BackColor="#FF8C8C" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                        ConnectionString="<%$ ConnectionStrings:TuteDB %>"
                        SelectCommand="SELECT Question.QuestionID, Question.QuestText, Type.Name 
                        FROM Question INNER JOIN 
                        Type ON Question.TypeOfQ = Type.TypeID 
                        ORDER BY Type.Name, Question.QuestionID"></asp:SqlDataSource>
                </div>
                <div id="detailsview">
                    <asp:DetailsView ID="DetailsView1" runat="server"
                        BackColor="White" BorderColor="White" BorderStyle="Ridge"
                        BorderWidth="2px" CellPadding="3"
                        CellSpacing="1" GridLines="None"
                        Height="50px" Width="350px"
                        DataSourceID="SqlDataSource2" AutoGenerateRows="False"
                        OnItemDeleted="DetailsView1_ItemDeleted"
                        OnItemInserted="DetailsView1_ItemInserted"
                        OnItemUpdated="DetailsView1_ItemUpdated">
                        <Fields>


                            <asp:TemplateField HeaderText="ID" SortExpression="QuestionID">

                                <EditItemTemplate>
                                    <%--<asp:DynamicControl ID="DynamicControl1" runat="server" DataField="QuestionID" Mode="Edit" />--%>
                                    <asp:Label ID="Label2" runat="server"
                                        Text='<%# Eval("QuestionID") %>'></asp:Label>
                                </EditItemTemplate>
                                <%-- <InsertItemTemplate>
                                    <asp:DynamicControl ID="DynamicControl1" runat="server" DataField="QuestionID" Mode="Insert" />
                                </InsertItemTemplate>--%>

                                <ItemTemplate>
                                    <%--<asp:DynamicControl ID="DynamicControl1" runat="server" DataField="QuestionID" Mode="ReadOnly" />--%>
                                    <asp:Label ID="Label1" runat="server"
                                        Text='<%# Eval("QuestionID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>



                            <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="Question" SortExpression="QuestText">

                                <EditItemTemplate>
                                    <%--<asp:DynamicControl ID="DynamicControl2" runat="server" DataField="QuestText" Mode="Edit" />--%>
                                    <asp:TextBox ID="txtQuestion" runat="server"
                                        Text='<%# Bind("QuestText") %>'
                                        TextMode="MultiLine" Rows="3"></asp:TextBox>
                                    <asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator1" runat="server"
                                        ControlToValidate="txtQuestion"
                                        ErrorMessage="Question is required.">*
                                    </asp:RequiredFieldValidator>
                                </EditItemTemplate>

                                <InsertItemTemplate>
                                    <%--<asp:DynamicControl ID="DynamicControl2" runat="server" DataField="QuestText" Mode="Insert" />--%>
                                    <asp:TextBox ID="txtQuestion" runat="server"
                                        Text='<%# Bind("QuestText") %>'
                                        TextMode="MultiLine" Rows="3"></asp:TextBox>
                                    <asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator2" runat="server"
                                        ControlToValidate="txtQuestion"
                                        ErrorMessage="Question is required.">*
                                    </asp:RequiredFieldValidator>
                                </InsertItemTemplate>

                                <ItemTemplate>
                                    <%--<asp:DynamicControl ID="DynamicControl2" runat="server" DataField="QuestText" Mode="ReadOnly" />--%>
                                    <asp:Label ID="Label3" runat="server"
                                        Text='<%# Eval("QuestText") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="Type" SortExpression="TypeOfQ">
                                <EditItemTemplate>
                                    <%--<asp:DynamicControl ID="DynamicControl3" runat="server" DataField="TypeOfQ" Mode="Edit" />--%>
                                    <asp:DropDownList ID="DropDownList1" runat="server"
                                        DataSourceID="SqlDataSource3" DataTextField="Name"
                                        DataValueField="TypeID"
                                        SelectedValue='<%# Bind("TypeOfQ") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <%--<asp:DynamicControl ID="DynamicControl3" runat="server" DataField="TypeOfQ" Mode="Insert" />--%>
                                    <asp:DropDownList ID="DropDownList2" runat="server"
                                        DataSourceID="SqlDataSource3" DataTextField="Name"
                                        DataValueField="TypeID"
                                        SelectedValue='<%# Bind("TypeOfQ") %>'>
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <%-- <asp:DynamicControl ID="DynamicControl3" runat="server" DataField="TypeOfQ" Mode="ReadOnly" />--%>
                                    <asp:Label ID="Label4" runat="server"
                                        Text='<%# Eval("Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>



                            <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="Option A" SortExpression="Option1">

                                <EditItemTemplate>
                                    <%--<asp:DynamicControl ID="DynamicControl4" runat="server" DataField="Option1" Mode="Edit" />--%>
                                    <asp:TextBox ID="txtOption1" runat="server"
                                        Text='<%# Bind("Option1") %>'></asp:TextBox>

                                    <asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator3" runat="server"
                                        ControlToValidate="txtOption1"
                                        ErrorMessage="First Option is required.">*
                                    </asp:RequiredFieldValidator>
                                </EditItemTemplate>

                                <InsertItemTemplate>
                                    <%--<asp:DynamicControl ID="DynamicControl4" runat="server" DataField="Option1" Mode="Insert" />--%>
                                    <asp:TextBox ID="txtOption1" runat="server"
                                        Text='<%# Bind("Option1") %>'></asp:TextBox>

                                    <asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator4" runat="server"
                                        ControlToValidate="txtOption1"
                                        ErrorMessage="First Option is required.">*
                                    </asp:RequiredFieldValidator>
                                </InsertItemTemplate>

                                <ItemTemplate>
                                    <%--<asp:DynamicControl ID="DynamicControl4" runat="server" DataField="Option1" Mode="ReadOnly" />--%>
                                    <asp:Label ID="Label5" runat="server"
                                        Text='<%# Eval("Option1") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>



                            <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="Option B" SortExpression="Option2">

                                <EditItemTemplate>
                                    <%-- <asp:DynamicControl ID="DynamicControl5" runat="server" DataField="Option2" Mode="Edit" />--%>
                                    <asp:TextBox ID="txtOption2" runat="server"
                                        Text='<%# Bind("Option2") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator5" runat="server"
                                        ControlToValidate="txtOption2"
                                        ErrorMessage="Second Option is required.">*
                                    </asp:RequiredFieldValidator>
                                </EditItemTemplate>

                                <InsertItemTemplate>
                                    <%--<asp:DynamicControl ID="DynamicControl5" runat="server" DataField="Option2" Mode="Insert" />--%>
                                    <asp:TextBox ID="txtOption2" runat="server"
                                        Text='<%# Bind("Option2") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator6" runat="server"
                                        ControlToValidate="txtOption2"
                                        ErrorMessage="Second Option is required.">*
                                    </asp:RequiredFieldValidator>
                                </InsertItemTemplate>

                                <ItemTemplate>
                                    <%-- <asp:DynamicControl ID="DynamicControl5" runat="server" DataField="Option2" Mode="ReadOnly" />--%>
                                    <asp:Label ID="Label6" runat="server"
                                        Text='<%# Eval("Option2") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>



                            <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="Option C" SortExpression="Option3">

                                <EditItemTemplate>
                                    <%--<asp:DynamicControl ID="DynamicControl6" runat="server" DataField="Option3" Mode="Edit" />--%>
                                    <asp:TextBox ID="txtOption3" runat="server"
                                        Text='<%# Bind("Option3") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator7" runat="server"
                                        ControlToValidate="txtOption3"
                                        ErrorMessage="Third Option is required.">*
                                    </asp:RequiredFieldValidator>
                                </EditItemTemplate>

                                <InsertItemTemplate>
                                    <%--<asp:DynamicControl ID="DynamicControl6" runat="server" DataField="Option3" Mode="Insert" />--%>
                                    <asp:TextBox ID="txtOption3" runat="server"
                                        Text='<%# Bind("Option3") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator8" runat="server"
                                        ControlToValidate="txtOption3"
                                        ErrorMessage="Third Option is required.">*
                                    </asp:RequiredFieldValidator>
                                </InsertItemTemplate>

                                <ItemTemplate>
                                    <%--<asp:DynamicControl ID="DynamicControl6" runat="server" DataField="Option3" Mode="ReadOnly" />--%>
                                    <asp:Label ID="Label7" runat="server"
                                        Text='<%# Eval("Option3") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>



                            <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="Option D" SortExpression="Option4">

                                <EditItemTemplate>
                                    <%--<asp:DynamicControl ID="DynamicControl7" runat="server" DataField="Option4" Mode="Edit" />--%>
                                    <asp:TextBox ID="txtOption4" runat="server"
                                        Text='<%# Bind("Option4") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator9" runat="server"
                                        ControlToValidate="txtOption4"
                                        ErrorMessage="Fourth Option is required.">*
                                    </asp:RequiredFieldValidator>
                                </EditItemTemplate>

                                <InsertItemTemplate>
                                    <%--<asp:DynamicControl ID="DynamicControl7" runat="server" DataField="Option4" Mode="Insert" />--%>
                                    <asp:TextBox ID="txtOption4" runat="server"
                                        Text='<%# Bind("Option4") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator10" runat="server"
                                        ControlToValidate="txtOption4"
                                        ErrorMessage="Fourth Option is required.">*
                                    </asp:RequiredFieldValidator>
                                </InsertItemTemplate>

                                <ItemTemplate>
                                    <%--<asp:DynamicControl ID="DynamicControl7" runat="server" DataField="Option4" Mode="ReadOnly" />--%>
                                    <asp:Label ID="Label8" runat="server"
                                        Text='<%# Eval("Option4") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>



                            <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="Correct Option" SortExpression="CorrectOption">
                                <EditItemTemplate>
                                    <%--<asp:DynamicControl ID="DynamicControl8" runat="server" DataField="CorrectOption" Mode="Edit" />--%>
                                    <asp:DropDownList ID="DropDownList3" runat="server"
                                        SelectedValue='<%# Bind("CorrectOption") %>'>
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <%--<asp:DynamicControl ID="DynamicControl8" runat="server" DataField="CorrectOption" Mode="Insert" />--%>
                                    <asp:DropDownList ID="DropDownList4" runat="server"
                                        SelectedValue='<%# Bind("CorrectOption") %>'>
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <%--<asp:DynamicControl ID="DynamicControl8" runat="server" DataField="CorrectOption" Mode="ReadOnly" />--%>
                                    <asp:Label ID="Label9" runat="server"
                                        Text='<%# Eval("CorrectOption") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ButtonType="Button"
                                ShowDeleteButton="True"
                                ShowEditButton="True"
                                ShowInsertButton="True" />
                        </Fields>
                        <RowStyle BackColor="LightGray" ForeColor="Black" />
                        <EditRowStyle BackColor="Gray" ForeColor="White" />
                        <FooterStyle BackColor="LightGray" />
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                        ConnectionString="<%$ ConnectionStrings:TuteDB %>"
                        DeleteCommand="DELETE FROM [Question] WHERE [QuestionID] = @QuestionID"
                        InsertCommand="INSERT INTO [Question] ([QuestText], [TypeOfQ], [Option2], [Option1], [Option3], [Option4], [CorrectOption]) VALUES (@QuestText, @TypeOfQ, @Option2, @Option1, @Option3, @Option4, @CorrectOption)"
                        SelectCommand="SELECT Question.QuestionID, Question.QuestText, Question.TypeOfQ, Question.Option1, Question.Option2, Question.Option3, Question.Option4, Question.CorrectOption, Type.Name
                        FROM Question INNER JOIN
                         Type ON Question.TypeOfQ = Type.TypeID WHERE (QuestionID = @QuestionID)"
                        UpdateCommand="UPDATE [Question] SET 
                        [QuestText] = @QuestText, [TypeOfQ] = @TypeOfQ, [Option2] = @Option2, [Option1] = @Option1, [Option3] = @Option3, [Option4] = @Option4, [CorrectOption] = @CorrectOption WHERE [QuestionID] = @QuestionID">
                        <DeleteParameters>
                            <asp:ControlParameter ControlID="GridView1" Name="QuestionID" PropertyName="SelectedValue" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="QuestText" Type="String" />
                            <asp:Parameter Name="TypeOfQ" Type="Byte" />
                            <asp:Parameter Name="Option2" Type="String" />
                            <asp:Parameter Name="Option1" Type="String" />
                            <asp:Parameter Name="Option3" Type="String" />
                            <asp:Parameter Name="Option4" Type="String" />
                            <asp:Parameter Name="CorrectOption" Type="Byte" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridView1" Name="QuestionID" PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="QuestText" Type="String" />
                            <asp:Parameter Name="TypeOfQ" Type="Byte" />
                            <asp:Parameter Name="Option2" Type="String" />
                            <asp:Parameter Name="Option1" Type="String" />
                            <asp:Parameter Name="Option3" Type="String" />
                            <asp:Parameter Name="Option4" Type="String" />
                            <asp:Parameter Name="CorrectOption" Type="Byte" />
                            <asp:ControlParameter ControlID="GridView1" Name="QuestionID" PropertyName="SelectedValue" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                        ConnectionString="<%$ ConnectionStrings:TuteDB %>"
                        SelectCommand="SELECT [TypeID], [Name] FROM [Type]"></asp:SqlDataSource>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server"
                        HeaderText="Please correct the following errors:" CssClass="error" />
                    <p>
                        <asp:Label ID="lblError" runat="server" EnableViewState="False" CssClass="error"></asp:Label>
                    </p>
                </div>
            </div>

        </div>
        <div class="AtTheBottom">
            <a href="../Home.aspx">HOME</a>
        </div>
    </form>
</body>
</html>
