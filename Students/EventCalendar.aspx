<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="EventCalendar.aspx.cs" Inherits="Students_EventCalendar" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <div class="row">
    <div class="span10 offset1">
      <asp:Calendar ID="EventCalendar" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="450px" NextPrevFormat="FullMonth" Width="900px" OnDayRender="EventCalendar_DayRender" SelectionMode="None">
        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
        <DayStyle BorderColor="Black" BorderStyle="None" BorderWidth="1px" />
        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
        <OtherMonthDayStyle ForeColor="#999999" />
        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
        <TodayDayStyle BackColor="#CCCCCC" />
      </asp:Calendar>
      <asp:SqlDataSource ID="AssignmentsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" SelectCommand="select (TeacherProfiles.FirstName + ' ' + TeacherProfiles.LastName) as TeacherName, Assignments.AssignmentId,Classes.CourseId, Assignments.Description,Courses.CourseName,Assignments.Title,Assignments.SubmissionDate,Assignments.TotalMarks
from Assignments
INNER JOIN Classes ON Classes.ClassId = Assignments.ClassId
INNER JOIN Courses ON Courses.CourseId=Classes.CourseId
INNER JOIN TeacherProfiles ON TeacherProfiles.TeacherId=Classes.TeacherId
where Assignments.ClassId IN (select Classes.ClassId from Classes where Classes.ClassId IN (select ClassStudents.ClassId from ClassStudents where ClassStudents.StudentId=@StudentId))" OnSelecting="AssignmentsDataSource_Selecting">
        <SelectParameters>
          <asp:Parameter Name="StudentId" />
        </SelectParameters>
      </asp:SqlDataSource>
      <asp:SqlDataSource ID="QuizzesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" SelectCommand="select (TeacherProfiles.FirstName+ ' ' + TeacherProfiles.LastName) as TeacherName, Quizzes.QuizId,Classes.CourseId,Courses.CourseName,Quizzes.Title, Quizzes.Description, Quizzes.QuizDate,Quizzes.TotalMarks
from Quizzes
INNER JOIN Classes ON Classes.ClassId = Quizzes.ClassId
INNER JOIN Courses ON Courses.CourseId=Classes.CourseId
INNER JOIN TeacherProfiles ON TeacherProfiles.TeacherId=Classes.TeacherId
where Quizzes.ClassId IN (select Classes.ClassId from Classes where Classes.ClassId IN (select ClassStudents.ClassId from ClassStudents where ClassStudents.StudentId=@StudentId))" OnSelecting="AssignmentsDataSource_Selecting">
        <SelectParameters>
          <asp:Parameter Name="StudentId" />
        </SelectParameters>
      </asp:SqlDataSource>
    </div>
  </div>
  <!-- Modal Start -->
  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="H1">Event Details</h4>
      </div>
      <div class="modal-body">
        <b>Subject: </b>
        <p id="course-modal"></p>
        <b>Teacher: </b>
        <p id="teacher-modal"></p>
        <b  id="date-label">Quiz Date: </b>
        <p id="date-modal"></p>
        <b>Total Marks: </b>
        <p id="marks-modal"></p>
        <b>Description: </b>
        <p id="body-modal">One fine body…</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
  <!-- Modal END -->

  <script type="text/javascript">
    $(document).ready(function () {
      $('.event').click(function () {
        var linkId = $(this).attr("id");
        var type = $(this).data("type");
        if (type=="Assignment" || type=="Quiz" || type=="Presentation")
        {
          $('#date-label').text(type + " Date");
          var title = $(this).data("title");
          var description = $(this).data("description");
          var date = $(this).data("date");
          var teacher = $(this).data("teacher");
          var course = $(this).data("course");
          var marks = $(this).data("marks");
          $('#myModalLabel').text(title);
          $('#body-modal').text(description);
          $('#date-modal').text(date);
          $('#marks-modal').text(marks);
          $('#teacher-modal').text(teacher);
          $('#course-modal').text(course);
        }
      });
    });
  </script>
  <asp:SqlDataSource ID="PresentationsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" SelectCommand="select (TeacherProfiles.FirstName+ ' ' + TeacherProfiles.LastName) as TeacherName, Presentations.PresentationId,Classes.CourseId,Courses.CourseName,Presentations.Title, Presentations.Description, Presentations.PresentationDate,Presentations.TotalMarks
from Presentations
INNER JOIN Classes ON Classes.ClassId = Presentations.ClassId
INNER JOIN Courses ON Courses.CourseId=Classes.CourseId
INNER JOIN TeacherProfiles ON TeacherProfiles.TeacherId=Classes.TeacherId
where Presentations.ClassId IN (select Classes.ClassId from Classes where Classes.ClassId IN (select ClassStudents.ClassId from ClassStudents where ClassStudents.StudentId=@StudentId))" OnSelecting="AssignmentsDataSource_Selecting">
    <SelectParameters>
      <asp:Parameter Name="StudentId" />
    </SelectParameters>
  </asp:SqlDataSource>
</asp:Content>
