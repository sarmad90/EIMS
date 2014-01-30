<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Batches.aspx.cs" Inherits="Administration_Classes_Batches" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <div class="row">
    <div class="col-md-10">
      <asp:Repeater ID="Repeater1" runat="server">
        <HeaderTemplate>
          <h4>Batches</h4>
        </HeaderTemplate>
        <ItemTemplate>
          <p>
            <asp:HyperLink ID="lnkMenuItem" runat="server" NavigateUrl='<%# "~/Shared/Classes.aspx?batch=" + Eval("BatchName") %>'><%# Eval("BatchName") %></asp:HyperLink>
          </p>
        </ItemTemplate>
        <FooterTemplate>
        </FooterTemplate>
      </asp:Repeater>
    </div>
  </div>
  <asp:SqlDataSource ID="BatchesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" SelectCommand="SELECT [BatchName] FROM [Batches]"></asp:SqlDataSource>
</asp:Content>

