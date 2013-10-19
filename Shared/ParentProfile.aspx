<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ParentProfile.aspx.cs" Inherits="Administration_ParentProfile" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <asp:Panel ID="ParentProfilePanel" runat="server">
    <div class="row">
        <div class="span8 offset1">
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
            <div class="row">
            <div class="span2">
                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn" PostBackUrl='javascript:history.go(-1)'>Back</asp:LinkButton>
            </div>
          </div>
        </div>
        <div class="span6">
          <asp:Image runat="server" ID="UserPicture" CssClass="Display-pic-medium" ImageUrl="~/img/help_48.png"></asp:Image>
        </div>
    </div>
  </asp:Panel>
  <asp:Panel ID="NoParentFound" runat="server">
    <div class="row">
      <div class="span12 offset1">
        <h1>You don't have an associated parent account yet.</h1>
      </div>
    </div>
  </asp:Panel>
       
            <asp:SqlDataSource ID="ParentDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" OnSelecting="ParentDataSource_Selecting" SelectCommand="SELECT aspnet_Membership.Email, ParentProfiles.Address, ParentProfiles.FirstName, ParentProfiles.LastName, ParentProfiles.Contact, ParentProfiles.Contact, ParentProfiles.Avatar
FROM ParentProfiles
INNER JOIN aspnet_Membership
ON aspnet_Membership.UserId=ParentProfiles.ParentId WHERE (ParentProfiles.ParentId = @ParentId);">
                <SelectParameters>
                    <asp:Parameter Name="ParentId" />
                </SelectParameters>
            </asp:SqlDataSource>
</asp:Content>

