<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AddAClass.aspx.cs" Inherits="Administration_Classes_AddAClass" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row">
        <div class="row">
            <div class="col-md-1 col-md-offset-3"><asp:Label ID="Label1" runat="server" Text="Course:"></asp:Label></div>
            <div class="col-md-3"><asp:DropDownList ID="Course" runat="server" CssClass="form-control"></asp:DropDownList></div>
        </div>
        <div class="row">&nbsp;</div>
        <div class="row">
            <div class="col-md-1 col-md-offset-3"><asp:Label ID="Label5" runat="server"  Text="Department:"></asp:Label></div>
            <div class="col-md-3"><asp:DropDownList ID="Department" runat="server" CssClass="form-control"></asp:DropDownList></div>
        </div>
      <div class="row">&nbsp;</div>
        <div class="row">
            <div class="col-md-1 col-md-offset-3"><asp:Label ID="Label7" runat="server" Text="Semester:"></asp:Label></div>
            <div class="col-md-3"><asp:DropDownList ID="Semester" runat="server" CssClass="form-control"></asp:DropDownList></div>
        </div>
      <div class="row">&nbsp;</div>
        <div class="row">    
            <div class="col-md-1 col-md-offset-3"><asp:Label ID="Label2" runat="server" Text="Batch:"></asp:Label></div>
            <div class="col-md-3"><asp:DropDownList ID="Batch" runat="server" CssClass="form-control"></asp:DropDownList></div>
        </div>
      <div class="row">&nbsp;</div>
        <div class="row">    
            <div class="col-md-1 col-md-offset-3"><asp:Label ID="Label3" runat="server" Text="Section:"></asp:Label></div>
            <div class="col-md-3"><asp:DropDownList ID="Section" runat="server" CssClass="form-control"></asp:DropDownList></div>
        </div>
      <div class="row">&nbsp;</div>
        <div class="row">    
            <div class="col-md-1 col-md-offset-3"><asp:Label ID="Label6" runat="server" Text="Credit Hours:"></asp:Label></div>
            <div class="col-md-3"><asp:DropDownList ID="CreditHours" CssClass="form-control" runat="server">
              <asp:ListItem Value="1"></asp:ListItem>
              <asp:ListItem Value="2"></asp:ListItem>
              <asp:ListItem Value="3"></asp:ListItem>
              <asp:ListItem Value="4"></asp:ListItem>
              <asp:ListItem Value="5"></asp:ListItem>
              </asp:DropDownList></div>
        </div>
      <div class="row">&nbsp;</div>
        <div class="row">    
            <div class="col-md-1 col-md-offset-3"><asp:Label ID="Label4" runat="server" Text="Teacher:"></asp:Label></div>
            <div class="col-md-3"><asp:DropDownList ID="Teacher" runat="server" CssClass="form-control"></asp:DropDownList></div>
        </div>
      <div class="row">&nbsp;</div>
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <div class="form-actions">
                    <div class="col-md-1 col-md-offset-3"><asp:Button ID="CreateClass" runat="server" CssClass="btn btn-primary" Text="Create Class" OnClick="CreateClass_Click"/></div>
                </div>
            </div>
              
        </div>
    </div>
    <asp:SqlDataSource ID="CoursesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" SelectCommand="SELECT [CourseId], [CourseName] FROM [Courses]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="BatchesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" SelectCommand="SELECT [BatchId], [BatchName] FROM [Batches]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SectionsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" SelectCommand="SELECT [SectionId], [SectionName] FROM [Sections]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SemestersDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" SelectCommand="SELECT [SemesterId], [SemesterName] FROM [Semesters]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="TeachersDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" SelectCommand="select TeacherProfiles.TeacherId,(TeacherProfiles.FirstName + ' ' + TeacherProfiles.LastName) as TeacherName from TeacherProfiles"></asp:SqlDataSource>
    <asp:SqlDataSource ID="DepartmentsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" SelectCommand="SELECT [DepartmentId], [DepartmentName] FROM [Departments]"></asp:SqlDataSource>
</asp:Content>

