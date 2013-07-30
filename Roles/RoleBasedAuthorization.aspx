<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="RoleBasedAuthorization.aspx.cs" Inherits="Roles_RoleBasedAuthorization" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:LoginView ID="LoginView1" runat="server">
        <LoggedInTemplate>
          You are not a member of the Supervisors or Administrators roles. Therefore you
          cannot edit or delete any user information.
     </LoggedInTemplate>
     <AnonymousTemplate>
          You are not logged into the system. Therefore you cannot edit or delete any user

          information.
     </AnonymousTemplate>
        <RoleGroups>
            <asp:RoleGroup Roles="Administrator">
                <ContentTemplate>
                    As an Administrator, you may edit and delete user accounts. 
                    Remember: With great power comes great responsibility!

               </ContentTemplate>
            </asp:RoleGroup>
            <asp:RoleGroup Roles="Parent">
                <ContentTemplate>
                    As a Supervisor, you may edit users&#39; Email and Comment information. 
                    Simply click the Edit button, make your changes, and then click Update.
               </ContentTemplate>
            </asp:RoleGroup>
        </RoleGroups>
    </asp:LoginView>
    <asp:GridView ID="UserGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="UserName" OnRowCancelingEdit="UserGrid_RowCancelingEdit" OnRowEditing="UserGrid_RowEditing" OnRowUpdating="UserGrid_RowUpdating" OnRowDeleting="UserGrid_RowDeleting" OnRowCreated="UserGrid_RowCreated">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="UserName" HeaderText="UserName" ReadOnly="True" />
            <asp:BoundField DataField="LastLoginDate" DataFormatString="{0:d}" HeaderText="Last Login" HtmlEncode="False" ReadOnly="True" />
            <asp:TemplateField HeaderText="Email">
                <EditItemTemplate>
                    <asp:TextBox ID="Email" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"    
               ControlToValidate="Email" Display="Dynamic"    
               ErrorMessage="You must provide an email address." 
               SetFocusOnError="True">*</asp:RequiredFieldValidator>    

          <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"    
               ControlToValidate="Email" Display="Dynamic"    
               ErrorMessage="The email address you have entered is not valid. Please fix 
               this and try again."    
               SetFocusOnError="True"    

               ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*
          </asp:RegularExpressionValidator>    
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Comment">
                <EditItemTemplate>
                    <asp:TextBox ID="Comment" runat="server" Columns="40" Rows="4" Text='<%# Bind("Comment") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Comment") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:ValidationSummary ID="ValidationSummary1"
               runat="server"
               ShowMessageBox="True"
               ShowSummary="False" />
</asp:Content>


