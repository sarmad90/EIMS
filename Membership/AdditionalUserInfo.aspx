<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AdditionalUserInfo.aspx.cs" Inherits="Membership_AdditionalUserInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:DetailsView ID="UserProfile" runat="server" AutoGenerateRows="False" DataKeyNames="UserId" DataSourceID="UserProfileDataSource" DefaultMode="Edit" OnItemUpdated="UserProfile_ItemUpdated">
        <Fields>
            <asp:BoundField DataField="HomeTown" HeaderText="HomeTown" SortExpression="HomeTown" />
            <asp:BoundField DataField="HomePageUrl" HeaderText="HomePageUrl" SortExpression="HomePageUrl" />
            <asp:BoundField DataField="Signature" HeaderText="Signature" SortExpression="Signature" />
            <asp:CommandField ShowEditButton="True" />
        </Fields>
    </asp:DetailsView>
    <asp:Label ID="SettingsUpdatedMessage" runat="server"
     Text="Your settings have been updated."
     EnableViewState="false"
     Visible="false"></asp:Label>
    <asp:SqlDataSource ID="UserProfileDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" OnSelecting="UserProfileDataSource_Selecting" SelectCommand="SELECT [UserId], [HomeTown], [HomePageUrl], [Signature] FROM [UserProfiles] WHERE ([UserId] = @UserId)" UpdateCommand="UPDATE UserProfiles SET
     HomeTown = @HomeTown,
     HomepageUrl = @HomepageUrl,
     Signature = @Signature
WHERE UserId = @UserId">
        <SelectParameters>
            <asp:Parameter Name="UserId" Type="Object" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="HomeTown" />
            <asp:Parameter Name="HomepageUrl" />
            <asp:Parameter Name="Signature" />
            <asp:Parameter Name="UserId" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

