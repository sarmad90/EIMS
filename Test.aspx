<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="Test" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
  <p>Date: <input type="text" id="datepicker" class="datepicker"/></p>
  <asp:TextBox ID="TextBox1" runat="server" class="datepicker"></asp:TextBox>
  <asp:TextBox ID="TextBox2" runat="server" TextMode="Date"></asp:TextBox>
</asp:Content>