<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="Test" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <a href="#myModal" role="button" class="btn" data-toggle="modal">Launch demo modal</a>
 
<!-- Modal -->
<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">Modal header</h3>
  </div>
  <div class="modal-body">
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
  <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
  <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
  <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
    <button class="btn btn-primary">Save changes</button>
  </div>
</div>
  

</asp:Content>