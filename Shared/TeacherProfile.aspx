﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="TeacherProfile.aspx.cs" Inherits="Administration_TeacherProfile" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row">
        <div class="col-md-8 col-md-offset-1">
            <asp:Label ID="TeacherName" runat="server" Font-Bold="True" Font-Size="X-Large"></asp:Label>&nbsp;<asp:Label ID="TeacherLastName" runat="server" Font-Bold="True" Font-Size="X-Large"></asp:Label>
        </div> 
    </div>
    <div class="row">&nbsp;</div>
    <div class="row">
        <div class="col-md-6 col-md-offset-1">
            <table class="table table-striped">
                <tr>
                    <td> UserName:</td>
                    <td>
                        <asp:Label ID="TeacherUserName" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td> Education:</td>
                    <td><asp:Label ID="TeacherEducation" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td> Designation:</td>
                    <td><asp:Label ID="TeacherDesignation" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td> Email:</td>
                    <td><asp:Label ID="TeacherEmail" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td> Contact No. :</td>
                    <td><asp:Label ID="TeacherContact" runat="server" Text=""></asp:Label></td>
                </tr>
            </table>
          <div class="row">
            <div class="col-md-2">
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-default" PostBackUrl='javascript:history.go(-1)'>Back</asp:LinkButton>
            </div>
          </div>
        </div>
        <div class="col-md-5">
          <asp:Image runat="server" ID="UserPicture" CssClass="Display-pic-medium" ImageUrl="~/img/help_48.png"></asp:Image>
        </div>
    </div>
    <asp:SqlDataSource ID="TeacherDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" OnSelecting="TeacherDataSource_Selecting" SelectCommand="SELECT aspnet_Membership.Email, TeacherProfiles.Education, TeacherProfiles.FirstName, TeacherProfiles.LastName, TeacherProfiles.Contact, TeacherProfiles.Designation, TeacherProfiles.Avatar
FROM TeacherProfiles
INNER JOIN aspnet_Membership
ON aspnet_Membership.UserId=TeacherProfiles.TeacherId WHERE (TeacherProfiles.TeacherId = @TeacherId);">
                <SelectParameters>
                    <asp:Parameter Name="TeacherId" />
                </SelectParameters>
            </asp:SqlDataSource>
    </asp:Content>