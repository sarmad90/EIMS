<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ManageUsers.aspx.cs" Inherits="Administration_ManageUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Repeater ID="FilteringUI" runat="server" OnItemCommand="FilteringUI_ItemCommand">
        <ItemTemplate>
 <asp:LinkButton runat="server" ID="lnkFilter"
 Text='<%# Container.DataItem %>'
 CommandName='<%# Container.DataItem %>'></asp:LinkButton>
 </ItemTemplate>
 <SeparatorTemplate>|</SeparatorTemplate>
    </asp:Repeater>
    <asp:GridView ID="UserAccounts" runat="server" AutoGenerateColumns="False">
        <Columns>
 <asp:BoundField DataField="UserName" HeaderText="UserName"/>
 <asp:BoundField DataField="Email" HeaderText="Email" />
 <asp:CheckBoxField DataField="IsApproved" HeaderText="Approved?"/>
 <asp:CheckBoxField DataField="IsLockedOut" HeaderText="Locked Out?" />
 <asp:CheckBoxField DataField="IsOnline" HeaderText="Online?"/>
 <asp:BoundField DataField="Comment" HeaderText="Comment"/>
 </Columns>
    </asp:GridView>
    <p>
 <asp:LinkButton ID="lnkFirst" runat="server" OnClick="lnkFirst_Click"> First</asp:LinkButton> |
 <asp:LinkButton ID="lnkPrev" runat="server" OnClick="lnkPrev_Click">  Prev</asp:LinkButton>|
 <asp:LinkButton ID="lnkNext" runat="server" OnClick="lnkNext_Click">Next  </asp:LinkButton>|
 <asp:LinkButton ID="lnkLast" runat="server" OnClick="lnkLast_Click">Last  </asp:LinkButton>
</p>
</asp:Content>
