<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="QuizAndAssignments.aspx.cs" Inherits="Teachers_QuizAndAssignments" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <div class="row">
    <div class="span6">
      <h1 class="text-center">Assignment</h1>
      <div class="row">
                  <div class="span6">Title:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="AssignmentTitle" runat="server" CssClass="input-medium"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Total Marks:  <asp:TextBox ID="AssignmentTotalMarks" runat="server" CssClass="input-mini"></asp:TextBox></div>
                </div>
                <div class="row">
                  <div class="span1">Description:  </div>
                  <div class="span4"><asp:TextBox ID="AssignmentDescription" runat="server" Rows="5" TextMode="MultiLine" Width="335px"></asp:TextBox></div>
                </div>
                <div class="row">
                  <div class="span1">Class:  </div>
                  <div class="span4"><asp:DropDownList ID="DDAssignmentClass" runat="server"></asp:DropDownList></div>
                </div>
                <div class="row">
                  <div class="span1">Submission Date:  </div>
                  <div class="span1">
                    <asp:Calendar ID="AssignmentSubmissionDate" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
                      <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                      <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                      <OtherMonthDayStyle ForeColor="#999999" />
                      <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                      <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                      <TodayDayStyle BackColor="#CCCCCC" />
                    </asp:Calendar>
                  </div>
                </div>
                <div class="row">
                  <div class="span5"></div>
                  <div class="span1">
                    <asp:Button ID="AddAssignment" runat="server" Text="Assign" CssClass="btn btn-primary" OnClick="AddAssignment_Click" /></div>
                </div>
    </div>
    <div class="span6">
      <h1 class="text-center">Quiz</h1>
      <div class="row">
                  <div class="span6">Title:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="QuizTitle" runat="server" CssClass="input-medium"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Total Marks:  <asp:TextBox ID="QuizTotalMarks" runat="server" CssClass="input-mini"></asp:TextBox></div>
                </div>
                <div class="row">
                  <div class="span1">Description:  </div>
                  <div class="span4"><asp:TextBox ID="QuizDescription" runat="server" Rows="5" TextMode="MultiLine" Width="335px"></asp:TextBox></div>
                </div>
                <div class="row">
                  <div class="span1">Class:  </div>
                  <div class="span4"><asp:DropDownList ID="DDQuizClass" runat="server"></asp:DropDownList></div>
                </div>
                <div class="row">
                  <div class="span1">Quiz Date:  </div>
                  <div class="span1">
                    <asp:Calendar ID="QuizDate" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
                      <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                      <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                      <OtherMonthDayStyle ForeColor="#999999" />
                      <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                      <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                      <TodayDayStyle BackColor="#CCCCCC" />
                    </asp:Calendar>
                  </div>
                </div>
                <div class="row">
                  <div class="span5"></div>
                  <div class="span1">
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

