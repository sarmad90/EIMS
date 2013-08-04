<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AddAClass.aspx.cs" Inherits="Administration_Classes_AddAClass" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row">
        <div class="row">
            <div class="span1 offset3"><asp:Label ID="Label1" runat="server" Text="Course:"></asp:Label></div>
            <div class="span2"><asp:DropDownList ID="Course" runat="server"></asp:DropDownList></div>
        </div>
        <div class="row">    
            <div class="span1 offset3"><asp:Label ID="Label2" runat="server" Text="Batch:"></asp:Label></div>
            <div class="span2"><asp:DropDownList ID="Batch" runat="server"></asp:DropDownList></div>
        </div>
        <div class="row">    
            <div class="span1 offset3"><asp:Label ID="Label3" runat="server" Text="Section:"></asp:Label></div>
            <div class="span2"><asp:DropDownList ID="Section" runat="server"></asp:DropDownList></div>
        </div>
        <div class="row">    
            <div class="span1 offset3"><asp:Label ID="Label4" runat="server" Text="Teacher:"></asp:Label></div>
            <div class="span2"><asp:DropDownList ID="Teacher" runat="server"></asp:DropDownList></div>
        </div>
        <div class="row">
            <div class="span6 offset2">
                <div class="form-actions">
                    <div class="span1 offset3"><asp:Button ID="CreateClass" runat="server" CssClass="btn btn-primary" Text="Create Class" OnClick="CreateClass_Click"/></div>
                </div>
            </div>
            
        </div>
    </div>
    <asp:SqlDataSource ID="CoursesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" SelectCommand="SELECT [CourseId], [CourseName] FROM [Courses]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="BatchesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" SelectCommand="SELECT [BatchId], [BatchName] FROM [Batches]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SectionsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" SelectCommand="SELECT [SectionId], [SectionName] FROM [Sections]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="TeachersDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" SelectCommand="select TeacherProfiles.TeacherId,(TeacherProfiles.FirstName + ' ' + TeacherProfiles.LastName) as TeacherName from TeacherProfiles"></asp:SqlDataSource>
</asp:Content>

