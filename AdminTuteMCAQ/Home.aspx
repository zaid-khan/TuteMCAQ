<%@ Page Title="Home Admin - TuteMCAQ" Language="C#" MasterPageFile="/TuteMCAQ/AdminTuteMCAQ/Admin.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="AdminTuteMCAQ_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    
    <style type="text/css">
        .hnotitalics {
            font-style: normal !important;
        }
    </style>
</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form runat="server">
    <asp:LoginView runat="server" ID="AdminContents">
        <AnonymousTemplate>
            <div class="container">
                    <div class="alert alert-block">
                        <%--<button type="button" class="close" data-dismiss="alert">×</button>--%>
                        <h3>Warning!</h3>
                        <div class="alert alert-error">
                            <strong>Best check yourself, if you are NOT an Administrator</strong>!
                        </div>
                    </div>
                    <div class="accordion" id="accordion2">
                        <div class="accordion-group">
                            <div class="accordion-heading">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">Sign In as Administrator
                                </a>
                            </div>
                            <div id="collapseOne" class="accordion-body collapse">
                                <div class="accordion-inner">
                                    <p class="alert-block">To <a href="LoginAdmin.aspx" class="btn btn-inverse btn-small">Login</a> as an administrator.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            
        </AnonymousTemplate>
        <LoggedInTemplate>
            <div class="container">
                <div class="hero-unit">
                    <h2 class="hnotitalics">Type Data Management</h2>
                    <p class="alert-block hnotitalics">To manage the type of questions please navigate to the <span class="btn btn-success"><a href="Admin/TypesofQ.aspx" style="color:white;">Type Management</a></span> page.</p>
                    
                </div>
                <div class="hero-unit">
                    <h2 class="hnotitalics">Question Data Management</h2>
                    <p class="alert-block hnotitalics">To manage the database of questions and their respective answers, please navigate to the <span class="btn btn-success"><a href="Admin/QuestionsAdd.aspx" style="color:white;">Question Management</a></span> page.</p>
                </div>
                <div class="hero-unit">
                    <h2 class="hnotitalics">Question Bulk Upload</h2>
                    <p class="alert-block hnotitalics">To insert large amounts of questions in the database, please navigate to the <span class="btn btn-success"><a href="Admin/UploadBulk.aspx" style="color:white;">Question Bulk Upload</a></span> page.</p>
                </div>
                <div class="hero-unit">
                    <h2 class="hnotitalics">Tutorials Management</h2>
                    <p class="alert-block hnotitalics">To manage the Tutorial sections navigate to the <span class="btn btn-success"><a href="Admin/TutorialAdd.aspx" style="color:white;">Tutorial Management</a></span> page.</p>
                    
                </div>
                <div class="hero-unit">
                    <h2 class="hnotitalics">Website Statistics</h2>
                    <p class="alert-block hnotitalics">To view the website stats navigate to the <span class="btn btn-success"><a href="Admin/Stats.aspx" style="color:white;">Statistics</a></span> page.</p>
                    
                </div>
                <asp:Button ID="Logout" runat="server" OnClick="Logout_Click" Text="Logout" CssClass="btn btn-danger pull-right" />
            </div>
        </LoggedInTemplate>
    </asp:LoginView>
        </form>
</asp:Content>

