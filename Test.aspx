<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="Test" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

  <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
  <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
  <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
  <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

</asp:Content>