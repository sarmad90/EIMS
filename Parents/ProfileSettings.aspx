<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ProfileSettings.aspx.cs" Inherits="Parents_ProfileSettings" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <!--Parent Profile Settings-->
  <div class="row">
    <div class="col-md-4"><asp:Image ID="DisplayPicture" runat="server" ImageUrl="~/img/graduated-icon_585.png" CssClass="Display-pic-medium" /></div>
    <div class="col-md-8">
      <div class="row"><div class="col-md-2"><b>First Name: </b></div><div class="col-md-3"><asp:TextBox ID="TxtFirstName" runat="server" CssClass="form-control"></asp:TextBox></div></div>
      <div class="row">&nbsp;</div>
      <div class="row"><div class="col-md-2"><b>Last Name: </b></div><div class="col-md-3"><asp:TextBox ID="TxtLastName" runat="server" CssClass="form-control" required="true"></asp:TextBox></div></div>
      <div class="row">&nbsp;</div>
      <div class="row"><div class="col-md-2"><b>Contact Number: </b></div><div class="col-md-3"><asp:TextBox ID="TxtContact" runat="server" required="true" CssClass="form-control"></asp:TextBox></div></div>
      <div class="row">&nbsp;</div>
      <div class="row"><div class="col-md-2"><b>Email: </b></div><div class="col-md-3"><asp:TextBox ID="TxtEmail" runat="server" required="true" CssClass="form-control"></asp:TextBox></div></div>
      <div class="row">&nbsp;</div>
      <div class="row"><div class="col-md-2"><b>Address: </b></div><div class="col-md-3"><asp:TextBox ID="TxtAddress" runat="server" required="true" CssClass="form-control"></asp:TextBox></div></div>
      <div class="row">&nbsp;</div>
      <div class="row"><div class="col-md-2"><b>Gender: </b></div><div class="col-md-3"><asp:DropDownList ID="DDGender" runat="server" CssClass="form-control">
        <asp:ListItem Selected="True">Male</asp:ListItem>
        <asp:ListItem>Female</asp:ListItem>
        </asp:DropDownList></div></div>
      <div class="row">&nbsp;</div>
      <div class="row"><div class="col-md-2"><b>Display Picture: </b></div><div class="col-md-3"><asp:FileUpload ID="FUDisplayPic" runat="server" CssClass="form-control" /></div></div>
      <div class="row">&nbsp;</div>
      <div class="form-actions">
        <div class="col-md-2">
          <asp:Button ID="UpdateProfile" CssClass="btn btn-primary" runat="server" Text="Update Profile" OnClick="UpdateProfile_Click" /></div>
        <div class="col-md-2"><asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-default" PostBackUrl='javascript:history.go(-1)'>Back</asp:LinkButton></div>
      </div>
    </div>
  </div>
  <asp:SqlDataSource ID="ParentDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" OnSelecting="ParentDataSource_Selecting" SelectCommand="SELECT aspnet_Membership.Email,
ParentProfiles.FirstName,ParentProfiles.LastName, ParentProfiles.Contact,
ParentProfiles.Address, ParentProfiles.Avatar,ParentProfiles.Gender
FROM ParentProfiles
INNER JOIN aspnet_Membership ON aspnet_Membership.UserId=ParentProfiles.ParentId
WHERE (ParentProfiles.ParentId =@ParentId)">
        <SelectParameters>
            <asp:Parameter Name="ParentId" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
