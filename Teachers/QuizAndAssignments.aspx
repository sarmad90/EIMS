<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="QuizAndAssignments.aspx.cs" Inherits="Teachers_QuizAndAssignments" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <div class="row">
    <div class="col-md-6">
      <h1 class="text-center">Assignment</h1>
      <div class="row">
                  <div class="col-md-3">Title</div><div class="col-md-4"><asp:TextBox ID="AssignmentTitle" runat="server" CssClass="input-medium form-control"></asp:TextBox></div>
                </div>
      <div class="row">&nbsp;</div>
      <div class="row">
        <div class="col-md-3">Total Marks:  </div><div class="col-md-4"><asp:TextBox ID="AssignmentTotalMarks" runat="server" CssClass="input-mini form-control"></asp:TextBox></div>
      </div>
      <div class="row">&nbsp;</div>
                <div class="row">
                  <div class="col-md-3">Description:  </div>
                  <div class="col-md-4"><asp:TextBox ID="AssignmentDescription" runat="server" Rows="5" TextMode="MultiLine" Width="235px" CssClass="form-control"></asp:TextBox></div>
                </div>
      <div class="row">&nbsp;</div>
                <div class="row">
                  <div class="col-md-3">Class:  </div>
                  <div class="col-md-5"><asp:DropDownList ID="DDAssignmentClass" runat="server" CssClass="form-control"></asp:DropDownList></div>
                </div>
      <div class="row">&nbsp;</div>
                <div class="row">
                  <div class="col-md-3">Submission Date:  </div>
                  <div class="col-md-4">
                    <asp:TextBox ID="AssignmentSubmissionDate" runat="server" CssClass="input-mini datepicker form-control"></asp:TextBox>
                  </div>
                </div>
      <div class="row">&nbsp;</div>
                <div class="row">
                  <div class="col-md-5"></div>
                  <div class="col-md-1">
                    <asp:Button ID="AddAssignment" runat="server" Text="Assign" CssClass="btn btn-primary" OnClick="AddAssignment_Click" /></div>
                </div>
    </div>
    <div class="col-md-6">
      <h1 class="text-center">Quiz</h1>
      <div class="row">
                  <div class="col-md-3">Title:</div><div class="col-md-4"><asp:TextBox ID="QuizTitle" runat="server" CssClass="input-medium form-control"></asp:TextBox></div>
                </div>
      <div class="row">&nbsp;</div>
      <div class="row">
        <div class="col-md-3">Total Marks:</div><div class="col-md-4"><asp:TextBox ID="QuizTotalMarks" runat="server" CssClass="input-mini form-control"></asp:TextBox></div>
      </div>
      <div class="row">&nbsp;</div>
                <div class="row">
                  <div class="col-md-3">Description:  </div>
                  <div class="col-md-4"><asp:TextBox ID="QuizDescription" runat="server" Rows="5" TextMode="MultiLine" Width="235px" CssClass="form-control"></asp:TextBox></div>
                </div>
      <div class="row">&nbsp;</div>
                <div class="row">
                  <div class="col-md-3">Class:  </div>
                  <div class="col-md-5"><asp:DropDownList ID="DDQuizClass" runat="server" CssClass="form-control"></asp:DropDownList></div>
                </div>
      <div class="row">&nbsp;</div>
                <div class="row">
                  <div class="col-md-3">Quiz Date:  </div>
                  <div class="col-md-4">
                    <asp:TextBox ID="QuizDate" runat="server" CssClass="input-mini datepicker form-control"></asp:TextBox>
                  </div>
                </div>
      <div class="row">&nbsp;</div>
                <div class="row">
                  <div class="col-md-5"></div>
                  <div class="col-md-1">
                    <asp:Button ID="AddQuiz" runat="server" Text="Add Quiz" CssClass="btn btn-primary pull-right" OnClick="AddQuiz_Click" /></div>
                </div>
      
    </div>
  </div>
  <asp:SqlDataSource ID="ClassesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" OnSelecting="ClassesDataSource_Selecting" SelectCommand="select Classes.ClassId,Courses.CourseName,Sections.SectionName,(TeacherProfiles.FirstName + ' ' + TeacherProfiles.LastName) as TeacherName, Batches.BatchName, Semesters.SemesterName,Departments.DepartmentName from Classes
INNER JOIN TeacherProfiles ON Classes.TeacherId=TeacherProfiles.TeacherId
INNER JOIN Courses ON Classes.CourseId=Courses.CourseId
INNER JOIN Sections ON Classes.SectionId=Sections.SectionId
INNER JOIN Batches ON Classes.BatchId=Batches.BatchId
INNER JOIN Semesters ON Classes.SemesterId=Semesters.SemesterId
INNER JOIN Departments ON Classes.DepartmentId=Departments.DepartmentId
WHERE TeacherProfiles.TeacherId = @TeacherId">
    <SelectParameters>
      <asp:Parameter Name="TeacherId" />
    </SelectParameters>
  </asp:SqlDataSource>
</asp:Content>

