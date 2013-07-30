<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="UserBasedAuthorization.aspx.cs" Inherits="Membership_UserBasedAuthorization" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:LoginView ID="LoginViewForFileContentsTextBox" runat="server">
        <LoggedInTemplate>
            <asp:TextBox ID="FileContents" runat="server" Rows="10" TextMode="MultiLine" Width="95%"></asp:TextBox>
        </LoggedInTemplate>
    </asp:LoginView>
    <asp:GridView ID="FilesGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="FullName" OnSelectedIndexChanged="FilesGrid_SelectedIndexChanged" OnRowDeleting="FilesGrid_RowDeleting">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LoginView ID="LoginView1" runat="server">
        <LoggedInTemplate>
            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" Text="View"></asp:LinkButton>
            </LoggedInTemplate>
    </asp:LoginView>
                    </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowDeleteButton="True" />
            <asp:BoundField DataField="Name" HeaderText="Name" />
            <asp:BoundField DataField="Length" DataFormatString="{0:N0}" HeaderText="Size in bytes" HtmlEncode="False" />
        </Columns>
    </asp:GridView>
</asp:Content>

