<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ParentProfile.aspx.cs" Inherits="Administration_ParentProfile" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
       <div class="row">
        <div class="span3 offset1">
            <asp:Label ID="ParentName" runat="server" Font-Bold="True" Font-Size="X-Large"></asp:Label>&nbsp;<asp:Label ID="ParentLastName" runat="server" Font-Bold="True" Font-Size="X-Large"></asp:Label>
        </div> 
    </div>
    <div class="row">&nbsp;</div>
    <div class="row">
        <div class="span6 offset1">
            <table class="table table-striped">
                <tr>
                    <td> UserName:</td>
                    <td>
                        <asp:Label ID="ParentUserName" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td> Address :</td>
                    <td><asp:Label ID="ParentAddress" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td> Email:</td>
                    <td><asp:Label ID="ParentEmail" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td> Contact No. :</td>
                    <td><asp:Label ID="ParentContact" runat="server" Text=""></asp:Label></td>
                </tr>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="span2 offset1">
            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn" PostBackUrl="~/Administration/Parents/AllParents.aspx">Back</asp:LinkButton>
            <asp:SqlDataSource ID="ParentDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" OnSelecting="ParentDataSource_Selecting" SelectCommand="SELECT aspnet_Membership.Email, ParentProfiles.Address, ParentProfiles.FirstName, ParentProfiles.LastName, ParentProfiles.Contact, ParentProfiles.Contact
FROM ParentProfiles
INNER JOIN aspnet_Membership
ON aspnet_Membership.UserId=ParentProfiles.ParentId WHERE (ParentProfiles.ParentId = @ParentId);">
                <SelectParameters>
                    <asp:Parameter Name="ParentId" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>

