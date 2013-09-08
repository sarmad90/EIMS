<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<ul class="nav nav-pills">  
  <li class="active">
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Shared/StudentProfile.aspx">My Profile</asp:HyperLink>
  </li>
  <li>
    <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Public/Departments.aspx">Departments</asp:LinkButton></li>
  <li><a href="#">...</a></li>
</ul>

  <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>


