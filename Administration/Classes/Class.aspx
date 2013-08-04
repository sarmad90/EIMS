<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Class.aspx.cs" Inherits="Administration_Classes_Class" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row">
        <div class="span3 offset1">
            <asp:Label ID="Course" runat="server" Font-Bold="True" Font-Size="X-Large"></asp:Label>
        </div> 
    </div>
    <div class="row">&nbsp;</div>
    <div class="row">
        <div class="span6 offset1">
            <table class="table table-striped">
                <tr>
                    <td> Teacher Name:</td>
                    <td>
                        <asp:Label ID="Teacher" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td> Batch:</td>
                    <td><asp:Label ID="Batch" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td> Department:</td>
                    <td><asp:Label ID="Department" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td> Section:</td>
                    <td><asp:Label ID="Section" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td> Semester:</td>
                    <td><asp:Label ID="Semester" runat="server" Text=""></asp:Label></td>
                </tr>
            </table>
        </div>
    </div>

    <asp:SqlDataSource ID="ClassDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" SelectCommand="select Classes.ClassId,Courses.CourseName,Sections.SectionName,(TeacherProfiles.FirstName + ' ' + TeacherProfiles.LastName) as TeacherName, Batches.BatchName, Semesters.SemesterName,Departments.DepartmentName from Classes
INNER JOIN TeacherProfiles ON Classes.TeacherId=TeacherProfiles.TeacherId
INNER JOIN Courses ON Classes.CourseId=Courses.CourseId
INNER JOIN Sections ON Classes.SectionId=Sections.SectionId
INNER JOIN Batches ON Classes.BatchId=Batches.BatchId
INNER JOIN Semesters ON Batches.SemesterId=Semesters.SemesterId
INNER JOIN Departments ON Courses.DepartmentId=Departments.DepartmentId
WHERE Classes.ClassId = @ClassId" OnSelecting="ClassDataSource_Selecting">
        <SelectParameters>
            <asp:Parameter Name="ClassId" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>

