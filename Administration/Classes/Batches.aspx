<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Batches.aspx.cs" Inherits="Administration_Classes_Batches" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Repeater ID="Repeater1" runat="server">
        <HeaderTemplate>

            <p>All Students</p>
            <ul>
        </HeaderTemplate>
        
        <ItemTemplate>
            <li>
                <asp:HyperLink ID="lnkMenuItem" runat="server" NavigateUrl='<%# "~/Administration/Classes/Classes.aspx?id=" + Eval("BatchName") %>'><%# Eval("BatchName") %></asp:HyperLink>
            </li>
        </ItemTemplate>
        <FooterTemplate>
            </ul>
            </FooterTemplate>
    </asp:Repeater>
    <asp:SqlDataSource ID="BatchesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" SelectCommand="SELECT [BatchName] FROM [Batches]"></asp:SqlDataSource>
</asp:Content>

