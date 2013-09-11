<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="StudentProfile.aspx.cs" Inherits="Administration_StudentProfile" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row">
        <div class="span3 offset1">
            <asp:Label ID="StudentName" runat="server" Font-Bold="True" Font-Size="X-Large"></asp:Label>
        </div> 
    </div>
    <div class="row">&nbsp;</div>
    <div class="row">
        <div class="span6 offset1">
            <table class="table table-striped">
                <tr>
                    <td> UserName:</td>
                    <td><asp:Label ID="StudentUserName" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td> Batch:</td>
                    <td><asp:Label ID="StudentBatch" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td> Department:</td>
                    <td><asp:Label ID="StudentDepartment" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td> Roll No. :</td>
                    <td><asp:Label ID="StudentRollNum" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td> Email:</td>
                    <td><asp:Label ID="StudentEmail" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td> Contact No. :</td>
                    <td><asp:Label ID="StudentContact" runat="server" Text=""></asp:Label></td>
                </tr>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="span2 offset1">
            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn" PostBackUrl='javascript:history.go(-1)'>Back</asp:LinkButton>
        </div>
    </div>
    <div class="row"> &nbsp;</div>
    <div class="row">
        <asp:Panel ID="CreateAssociationPanel" runat="server">
            <div class="span6 offset1">
                <div class="row">
                    <div class="span1"> <asp:Label ID="Label1" runat="server" Text="Email: "></asp:Label> </div>
                    <div class="span3"><asp:TextBox ID="ParentEmail" runat="server"></asp:TextBox></div>
                    <div class="span2"> <asp:Button ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" /></div>
                </div>
                <asp:GridView ID="ParentAssociation" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False" OnSelectedIndexChanged="ParentAssociation_SelectedIndexChanged" >
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:BoundField DataField="UserName" HeaderText="UserName" />
                    </Columns>
                </asp:GridView>
                <asp:Label ID="CreateAssociationLabel" runat="server" Text=""></asp:Label>
            </div>
        </asp:Panel>
        <div class="span6 offset1">
            <asp:Panel ID="ShowAssociationPanel" runat="server" Visible="False">
                <asp:Label ID="AssociationDetails" runat="server" Text="SabihUddin"></asp:Label>
                <asp:Label ID="AssociationMessage" runat="server" Text=""></asp:Label>
                <asp:HyperLink ID="ParentLink" runat="server">asdasd</asp:HyperLink>
            </asp:Panel>
        </div>
    </div>
    
    <asp:SqlDataSource ID="AssociationDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" OnSelecting="AssociationDataSource_Selecting" SelectCommand="select ParentId from Associations where (StudentId = @StudentId) ;">
        <SelectParameters>
            <asp:Parameter Name="StudentId" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="StudentDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" OnSelecting="StudentDataSource_Selecting" SelectCommand="SELECT aspnet_Membership.Email, Departments.DepartmentName, Batches.BatchName,
(StudentProfiles.FirstName+' '+ StudentProfiles.LastName) as Name, StudentProfiles.Contact,
StudentProfiles.RollNo, StudentProfiles.Contact
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

