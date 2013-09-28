<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="UnauthorizedAccess.aspx.cs" Inherits="Shared_UnauthorizedAccess" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <div class="row">
    <div class="span10 offset1">
       <h2>Unauthorized Access</h2>
       <asp:Image ID="Image1" runat="server" ImageUrl="~/img/No-Access.jpg" />
       <p>
        You have attempted to access a page that you are not authorized to view.
       </p>
       <p>
        If you have any questions, please contact the site administrator.
       </p>
    </div>
  </div>
  
</asp:Content>

