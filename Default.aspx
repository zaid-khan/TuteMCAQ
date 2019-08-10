<%@ Page Title="Tute MCAQ - Exercise your brain!" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style>
        .SignInButtons
        {
            display: block;
            width: 100px;
            margin: auto;
        }

        #SignInButtonsDif
        {
            width: 50px;
            margin-bottom: 20px;
            margin-left: auto;
            margin-right: auto;
            font-style: normal;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <div class="container">
        <form runat="server">
            <%--<asp:Button ID="btncli" CssClass="btn btn-large pull-left" runat="server" Text="Hello!" OnClick="btncli_Click"></asp:Button>--%>
            <%--<asp:Label ID="Label1" CssClass="pull-right" runat="server" />--%>
        </form>

        <!-- start: Slider -->
        <div class="slider-wrapper">
            <div id="da-slider" class="da-slider">

                <div class="da-slide">
                    <h2>Tutorials</h2>
                    <p>Tute MCAQ offers a range of Tutorial material with their relative name and description for you to download and study. #TuteMCAQTutorials</p>
                    <a href="#" class="da-link">Read more</a>
                    <div class="da-img">
                        <img src="/TuteMCAQ/App_Themes/img/parallax-slider/Tutorials.png" alt="image02" />
                    </div>
                </div>

                <div class="da-slide">
                    <h2>Mock Exam</h2>
                    <p>Mock Exams are a great way for you to prepare for MAH-MCA 2017 and other similar tests providing you with the necessary confidence boost before you give the actual exam. #TuteMCAQExam</p>
                    <a href="#" class="da-link">Read more</a>
                    <div class="da-img">
                        <img src="/TuteMCAQ/App_Themes/img/parallax-slider/mockexam.png" alt="image01" />
                    </div>
                </div>

                <div class="da-slide">
                    <h2>Discussions</h2>
                    <p>This is an upcoming feature soon to be added on TuteMCAQ where you can interact with your other peers on the website as well ask a few questions to the Website Administrator.</p>
                    <a href="#" class="da-link">Read more</a>
                    <div class="da-img">
                        <img src="/TuteMCAQ/App_Themes/img/parallax-slider/Discussion.png" alt="image04" />
                    </div>
                </div>

                <div class="da-slide">
                    <h2>Performance Analyst</h2>
                    <p>Exams results are only useful for as long as they are carefully analyzed. #TuteMCAQAnalyst allows you to analyze your results seamlessly with simple metrics.</p>
                    <a href="#" class="da-link">Read more</a>
                    <div class="da-img">
                        <img src="/TuteMCAQ/App_Themes/img/parallax-slider/Performance.png" alt="image03" />
                    </div>
                </div>

                <nav class="da-arrows">
                    <span class="da-arrows-prev"></span>
                    <span class="da-arrows-next"></span>
                </nav>
            </div>

        </div>
        <!-- end: Slider -->




        <div class="hero-unit" id="herodiv">
            <h1>Tute MCAQ - Exercise your brain!</h1>
            <br />
            <p class="pherounit">
                Tute MCAQ is the website where you can do it all, from downloading tutorials, to taking mock exams, to discussing about things that interests you.
                And the best thing about that is ? You can do all of that for FREE.
                <br />
                Well, then without going into further discussions, let's get started.
                <br />
                <br />
            </p>
        

            






            <asp:LoginView runat="server" ID="DefaultLogSign">
                <AnonymousTemplate>
                    <p class="pherounit">
                        <a class="btn btn-success btn-large SignInButtons" href="/TuteMCAQ/Login.aspx">SIGN IN</a>
                        <h3 id="SignInButtonsDif"> -OR- </h3> 
                        <a class="btn btn-success btn-large SignInButtons" href="/TuteMCAQ/Register.aspx">REGISTER</a>
                    </p>
                </AnonymousTemplate>
                <LoggedInTemplate>
                    <p class="pherounit">
                       <strong>Welcome to Tute MCAQ! Now you can browse through the various services available on this website.</strong> 
                    </p>
                </LoggedInTemplate>
            </asp:LoginView>
        </div>



        <hr />
        <div class="row">
                <div class="icons-box-vert-container">
                    <!-- start: Icon Box Start -->
                    <div class="span6">
                        <div class="icons-box-vert">
                            <i class="ico-ok ico-color circle-color big"></i>
                            <div class="icons-box-vert-info">
                                <h3>Easy to use</h3>
                                <p>The website as a whole you'll find has a very easy to use and intuitive user interface design.</p>
                            </div>
                            <div class="clear"></div>
                        </div>
                    </div>
                    <!-- end: Icon Box-->
                    <!-- start: Icon Box Start -->
                    <div class="span6">
                        <div class="icons-box-vert">
                            <i class="ico-cup  ico-white circle-color-full big-color"></i>
                            <div class="icons-box-vert-info">
                                <h3>Best choice</h3>
                                <p>Tute MCAQ has been trusted by students and professionals alike for sample question sets and experience in giving an entrance exam.</p>
                            </div>
                            <div class="clear"></div>
                        </div>
                    </div>
                    <!-- end: Icon Box -->
                    <!-- start: Icon Box Start -->
                    <div class="span6">
                        <div class="icons-box-vert">
                            <i class="ico-ipad ico-color circle-color big"></i>
                            <div class="icons-box-vert-info">
                                <h3>Fully Responsive</h3>
                                <p>The website is compatible for devices of any screen size be it a smartphone, a tablet or a laptop or PC.</p>
                            </div>
                            <div class="clear"></div>
                        </div>
                    </div>
                    <!-- end: Icon Box -->
                    <!-- start: Icon Box Start -->
                    <div class="span6">
                        <div class="icons-box-vert">
                            <i class="ico-thumbs-up  ico-white circle-color-full big-color"></i>
                            <div class="icons-box-vert-info">
                                <h3>Social Network</h3>
                                <p>You can find the #TuteMCAQ team on the Social Media. We are on Twitter, Facebook and YouTube</p>
                            </div>
                            <div class="clear"></div>
                        </div>
                    </div>
                    <!-- end: Icon Box -->
                </div>
            </div>





    </div>
</asp:Content>

