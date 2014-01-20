<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Events.aspx.cs" Inherits="Administration_Events" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <div class="row">
    <div class="span2"> <h2>Events</h2> </div>
  </div>
  <div class="row">
    <div class="span4"> <h6>Add Event </h6></div>
  </div>
  <div class="row">
    <div class="span3"> <asp:DropDownList ID="EventType" runat="server"></asp:DropDownList> </div>
  </div>
  <div class="row">
    <div class="span2">Batches: </div> <div class="span3"> <asp:CheckBoxList ID="BatchesList" runat="server"></asp:CheckBoxList> </div>
  </div>
  <div class="row">
    <div class="span2">Departments: </div> <div class="span3"> <asp:CheckBoxList ID="DepartmentsList" runat="server"></asp:CheckBoxList> </div>
  </div>
  <div class="row">
    <div class="span6">Title: <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></div>
    <div class="span6">Description: <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></div>
  </div>
  <asp:SqlDataSource ID="BatchesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" SelectCommand="SELECT [BatchId], [BatchName] FROM [Batches]"></asp:SqlDataSource>
  <asp:SqlDataSource ID="DepartmentsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" SelectCommand="SELECT [DepartmentId], [DepartmentName] FROM [Departments]"></asp:SqlDataSource>
</asp:Content>
