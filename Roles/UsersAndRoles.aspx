<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="UsersAndRoles.aspx.cs" Inherits="Roles_UsersAndRoles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Label ID="ActionStatus" runat="server" CssClass="Important"></asp:Label>
    <br />
    <asp:DropDownList ID="UserList" runat="server" AutoPostBack="True" DataTextField="UserName" DataValueField="UserName" OnSelectedIndexChanged="UserList_SelectedIndexChanged">
    </asp:DropDownList>
    <br />
    <br />
    
<asp:Repeater ID="UsersRoleList" runat="server"> 
     <ItemTemplate> 
          <asp:CheckBox runat="server" ID="RoleCheckBox" AutoPostBack="true" 

               Text='<%# Container.DataItem %>' OnCheckedChanged="RoleCheckBox_CheckChanged" /> 
          <br /> 
     </ItemTemplate> 
</asp:Repeater>
    <br />
    <h3>Manage Users By Role</h3> 
<p> 
     <b>Select a Role:</b> 
    <asp:DropDownList ID="RoleList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RoleList_SelectedIndexChanged">
    </asp:DropDownList>
    <br />
    </p>
    <asp:GridView ID="RolesUserList" runat="server" AutoGenerateColumns="False" EmptyDataText="No users belong to this role." OnRowDeleting="RolesUserList_RowDeleting">
        <Columns>
            <asp:TemplateField HeaderText="Users">
                <ItemTemplate>
                    <asp:Label ID="UserNameLabel" runat="server" Text="<%# Container.DataItem %>"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField DeleteText="Remove" ShowDeleteButton="True" />
        </Columns>  
    </asp:GridView>
    <p>
    <b>UserName:</b>
     <asp:TextBox ID="UserNameToAddToRole" runat="server"></asp:TextBox>
    
      <br /> 
     <asp:Button ID="AddUserToRoleButton" runat="server" Text="Add User to Role" OnClick="AddUserToRoleButton_Click" /> 
        </p>
</asp:Content>
    

