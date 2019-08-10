<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Registrationresult.aspx.cs" Inherits="Registrationresult" %>

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
        border-bottom: 4px solid black;
      }
      .form-signin input[type="text"],
      .form-signin input[type="password"] {
        font-size: 16px;
        height: auto;
        margin-bottom: 15px;
        padding: 7px 9px;
      }
      .largerMsg {
          font-size:large;
          font-weight:bold;
          margin-left: 3em;
      }
      .largerMsgID {
          font-size:large;
          font-weight:bolder;
          margin-left: 3.7em;
          padding-top: 6px !important;
          margin-top: 6px !important;
      }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="container">

      <form class="form-signin" runat="server">
        <h2 class="form-signin-heading">Result</h2>
        <asp:Label runat="server" ID="MessageReg">
        </asp:Label>
        <asp:Label runat="server" ID="MessageID"></asp:Label>
      </form>

    </div>
</asp:Content>

