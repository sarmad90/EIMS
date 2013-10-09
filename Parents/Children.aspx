<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Children.aspx.cs" Inherits="Parents_Children" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Repeater ID="Repeater1" runat="server">
        <HeaderTemplate>

            <h3>Children</h3>
            <ul>
        </HeaderTemplate>
        
        <ItemTemplate>
            <li>
                <asp:HyperLink ID="lnkMenuItem" runat="server" NavigateUrl='<%# "~/Shared/StudentProfile.aspx?id=" + Eval("UserName").ToString() %>'><%# Eval("UserName") %></asp:HyperLink>
            </li>
        </ItemTemplate>
        <FooterTemplate>
            </ul>
            </FooterTemplate>
    </asp:Repeater>
  <asp:SqlDataSource ID="ChildrenDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" OnSelecting="ChildrenDataSource_Selecting" SelectCommand="select aspnet_users.UserName from aspnet_Users where aspnet_Users.UserId IN (select Associations.StudentId from Associations where Associations.ParentId=@ParentId)">
    <SelectParameters>
      <asp:Parameter Name="ParentId" />
    </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

