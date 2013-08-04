<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AllStudents.aspx.cs" Inherits="Administration_AllStudents" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Repeater ID="Repeater1" runat="server">
        <HeaderTemplate>

            <p>Batches</p>
            <ul>
        </HeaderTemplate>
        
        <ItemTemplate>
            <li>
                <asp:HyperLink ID="lnkMenuItem" runat="server" NavigateUrl='<%# "~/Administration/Students/StudentProfile.aspx?id=" + Container.DataItem.ToString() %>'><%# Container.DataItem %></asp:HyperLink>
            </li>
        </ItemTemplate>
        <FooterTemplate>
            </ul>
            </FooterTemplate>
    </asp:Repeater>
</asp:Content>

