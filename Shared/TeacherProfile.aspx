<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="TeacherProfile.aspx.cs" Inherits="Administration_TeacherProfile" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row">
        <div class="span3 offset1">
            <asp:Label ID="TeacherName" runat="server" Font-Bold="True" Font-Size="X-Large"></asp:Label>&nbsp;<asp:Label ID="TeacherLastName" runat="server" Font-Bold="True" Font-Size="X-Large"></asp:Label>
        </div> 
    </div>
    <div class="row">&nbsp;</div>
    <div class="row">
        <div class="span6 offset1">
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
        </div>
    </div>
    <div class="row">
        <div class="span2 offset1">
            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn" PostBackUrl='javascript:history.go(-1)'>Back</asp:LinkButton>
        </div>
    </div>
    
    <asp:SqlDataSource ID="TeacherDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" OnSelecting="TeacherDataSource_Selecting" SelectCommand="SELECT aspnet_Membership.Email, TeacherProfiles.Education, TeacherProfiles.FirstName, TeacherProfiles.LastName, TeacherProfiles.Contact, TeacherProfiles.Designation
FROM TeacherProfiles
INNER JOIN aspnet_Membership
ON aspnet_Membership.UserId=TeacherProfiles.TeacherId WHERE (TeacherProfiles.TeacherId = @TeacherId);">
                <SelectParameters>
                    <asp:Parameter Name="TeacherId" />
                </SelectParameters>
            </asp:SqlDataSource>
    </asp:Content>