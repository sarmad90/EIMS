<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="MyClasses.aspx.cs" Inherits="Students_MyClasses" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Repeater ID="Repeater1" runat="server">
        <HeaderTemplate>

            <h4>Classes</h4>
            
        </HeaderTemplate>
        
        <ItemTemplate>
            <p>
                <asp:HyperLink ID="lnkMenuItem" runat="server" NavigateUrl='<%# "~/Shared/Class.aspx?id=" + Eval("ClassId") %>'><%# Eval("CourseName")  + " - Section " + Eval("SectionName") + " - " + Eval("SemesterName") + "Semester" + " - Teacher: " + Eval("Teacher")  %></asp:HyperLink>
            </p>
        </ItemTemplate>
        <FooterTemplate>

            </FooterTemplate>
    </asp:Repeater>
    <asp:SqlDataSource ID="ClassesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" OnSelecting="ClassesDataSource_Selecting" SelectCommand="select Classes.ClassId, Courses.CourseName,Sections.SectionName,Semesters.SemesterName,Classes.CreditHours,(TeacherProfiles.FirstName+ ' ' +TeacherProfiles.LastName) as Teacher
from Classes
INNER JOIN Courses ON Courses.CourseId=Classes.CourseId
INNER JOIN Sections ON Sections.SectionId=Classes.SectionId
INNER JOIN Semesters ON Semesters.SemesterId=Classes.SemesterId
INNER JOIN TeacherProfiles ON TeacherProfiles.TeacherId=Classes.TeacherId
where Classes.ClassId IN (select ClassStudents.ClassId from ClassStudents where ClassStudents.StudentId=@StudentId)">
        <SelectParameters>
            <asp:Parameter Name="StudentId" />
        </SelectParameters>
    </asp:SqlDataSource>
  </asp:Content>
  


