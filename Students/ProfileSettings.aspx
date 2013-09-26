<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ProfileSettings.aspx.cs" Inherits="Students_ProfileSettings" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <!--Student Profile Settings-->
  <div class="row">
    <div class="span4"><asp:Image ID="DisplayPicture" runat="server" ImageUrl="~/img/graduated-icon_585.png" Height="200px" Width="200px" /></div>
    <div class="span8">
      <div class="row"><div class="span2"><b>First Name: </b></div><div class="span3"><asp:TextBox ID="TxtFirstName" runat="server" required="true"></asp:TextBox></div></div>
      <div class="row"><div class="span2"><b>Last Name: </b></div><div class="span3"><asp:TextBox ID="TxtLastName" runat="server" required="true"></asp:TextBox></div></div>
      <div class="row"><div class="span2"><b>Contact Number: </b></div><div class="span3"><asp:TextBox ID="TxtContact" runat="server" required="true"></asp:TextBox></div></div>
      <div class="row"><div class="span2"><b>Email: </b></div><div class="span3"><asp:TextBox ID="TxtEmail" runat="server" required="true"></asp:TextBox></div></div>
      <div class="row"><div class="span2"><b>Address: </b></div><div class="span3"><asp:TextBox ID="TxtAddress" runat="server" required="true"></asp:TextBox></div></div>
      <div class="row"><div class="span2"><b>Batch: </b></div><div class="span3"><asp:TextBox ID="TxtBatch" runat="server" ReadOnly="True"></asp:TextBox></div></div>
      <div class="row"><div class="span2"><b>Department: </b></div><div class="span3"><asp:TextBox ID="TxtDepartment" runat="server" ReadOnly="True"></asp:TextBox></div></div>
      <div class="row"><div class="span2"><b>Roll Number: </b></div><div class="span3"><asp:TextBox ID="TxtRollNum" runat="server" ReadOnly="True"></asp:TextBox></div></div>
      <div class="row"><div class="span2"><b>Gender: </b></div><div class="span3"><asp:DropDownList ID="DDGender" runat="server">
        <asp:ListItem Selected="True">Male</asp:ListItem>
        <asp:ListItem>Female</asp:ListItem>
        </asp:DropDownList></div></div>
      <div class="row"><div class="span2"><b>Display Picture: </b></div><div class="span3"><asp:FileUpload ID="FUDisplayPic" runat="server" /></div></div>
      <div class="form-actions">
        <div class="span2">
          <asp:Button ID="UpdateProfile" CssClass="btn btn-primary" runat="server" Text="Update Profile" OnClick="UpdateProfile_Click" /></div>
        <div class="span2"><asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn" PostBackUrl='javascript:history.go(-1)'>Back</asp:LinkButton></div>
      </div>
    </div>
  </div>
  <asp:SqlDataSource ID="StudentDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" OnSelecting="StudentDataSource_Selecting" SelectCommand="SELECT aspnet_Membership.Email, Departments.DepartmentName, Batches.BatchName,
StudentProfiles.FirstName,StudentProfiles.LastName, StudentProfiles.Contact,
StudentProfiles.RollNo, StudentProfiles.Contact, StudentProfiles.Avatar,StudentProfiles.Gender,StudentProfiles.Address
FROM StudentProfiles
INNER JOIN Batches ON Batches.BatchId=StudentProfiles.BatchId
INNER JOIN Departments ON Departments.DepartmentId=StudentProfiles.DepartmentId
INNER JOIN aspnet_Membership ON aspnet_Membership.UserId=StudentProfiles.StudentId 
WHERE (StudentProfiles.StudentId = @StudentId);">
        <SelectParameters>
            <asp:Parameter Name="StudentId" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

