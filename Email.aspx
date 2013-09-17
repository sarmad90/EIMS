<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Email.aspx.cs" Inherits="Email" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <h1>CRUD Operation in GridView</h1>
        <asp:GridView ID="gvCrud" runat="server" DataKeyNames="DepartmentId" CssClass="GridView" ShowFooter="true" AutoGenerateColumns="false" OnRowDataBound="gvCrud_RowDataBound" OnRowCancelingEdit="gvCrud_RowCancelingEdit" OnRowEditing="gvCrud_RowEditing" OnRowCommand="gvCrud_RowCommand" OnRowDeleting="gvCrud_RowDeleting">
            <EmptyDataTemplate>
                Data Not Found!
            </EmptyDataTemplate>
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton ID="btnEdit" runat="server" CommandName="Edit" ImageUrl="~/img/edit.png" ImageAlign="AbsMiddle" CausesValidation="false" ToolTip="Edit Record" />
                        <asp:ImageButton ID="btnDelete" runat="server" CommandName="Delete" ImageUrl="~/img/delete.png" ImageAlign="AbsMiddle" CausesValidation="false" ToolTip="Delete Record" OnClientClick="return confirm('Are you Sure Delete this Record')" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:ImageButton ID="btnUpdate" runat="server" Text="Update" CommandName="Modify" ImageUrl="~/img/edit.png" ImageAlign="AbsMiddle" CommandArgument='<%# Eval("DepartmentId") %>' ValidationGroup="Edit" ToolTip="Update Record" />
                        <asp:ImageButton ID="btnCancel" runat="server" Text="Cancel" CommandName="Cancel" ImageUrl="~/img/cancel.png" ImageAlign="AbsMiddle" CausesValidation="false" ToolTip="Cancel" />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:ImageButton ID="btnInsert" runat="server" Text="Insert" OnClick="btnInsert_Click" ImageUrl="~/img/add.png" ImageAlign="AbsMiddle" ValidationGroup="Insert" ToolTip="Insert Record" />
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <%# Eval("DepartmentName") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtNameEdit" runat="server" Text='<%# Eval("DepartmentName") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvInsertName" runat="server" ControlToValidate="txtNameEdit" SetFocusOnError="true" ValidationGroup="Edit" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtNameInsert" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvInsertName" runat="server" ControlToValidate="txtNameInsert" SetFocusOnError="true" ValidationGroup="Insert" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Country">
                    <ItemTemplate>
                        <%# Eval("DepartmentInitials") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlCountryEdit" runat="server">
                            <asp:ListItem Text="–Select–"></asp:ListItem>
                            <asp:ListItem Text="Pakistan" Value="Pakistan"></asp:ListItem>
                            <asp:ListItem Text="India" Value="India"></asp:ListItem>
                            <asp:ListItem Text="USA" Value="USA"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvEditCountry" runat="server" ControlToValidate="ddlCountryEdit" SetFocusOnError="true" ValidationGroup="Edit" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="ddlCountryInsert" runat="server">
                            <asp:ListItem Text="–Select–"></asp:ListItem>
                            <asp:ListItem Text="Pakistan" Value="Pakistan"></asp:ListItem>
                            <asp:ListItem Text="India" Value="India"></asp:ListItem>
                            <asp:ListItem Text="USA" Value="USA"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvCountryInsert" runat="server" ControlToValidate="ddlCountryInsert" SetFocusOnError="true" ValidationGroup="Insert" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="Header-Class" />
            <RowStyle CssClass="Row-Class" />
            <AlternatingRowStyle CssClass="Alternet-Row-Class" />
            <FooterStyle CssClass="Footer-Class" />
        </asp:GridView>
        <!–CODE END –>
</asp:Content>


