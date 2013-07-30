<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ManageRoles.aspx.cs" Inherits="Roles_ManageRoles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <b>Enter a new Role: </b>
    <asp:TextBox ID="RoleName" runat="server">&nbsp;&nbsp;&nbsp;</asp:TextBox>
    <asp:Button ID="CreateRoleButton" runat="server" Text="Create Role" OnClick="CreateRoleButton_Click" CssClass="btn btn-fix" />
    <br />
    <asp:GridView ID="RoleList" runat="server" AutoGenerateColumns="False" OnRowDeleting="RoleList_RowDeleting" CssClass="table table-striped">
        <Columns>
            <asp:TemplateField HeaderText="Role">
                <ItemTemplate>
                    <asp:Label ID="RoleNameLabel" runat="server" Text='<%# Container.DataItem %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField DeleteText="Delete Role" ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
    <br />
</asp:Content>


