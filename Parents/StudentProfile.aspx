<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="StudentProfile.aspx.cs" Inherits="Administration_StudentProfile" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row">
        <div class="col-md-8 col-md-offset-1">
            <asp:Label ID="StudentName" runat="server" Font-Bold="True" Font-Size="X-Large"></asp:Label>
        </div> 
    </div>
  <div class="row">
    &nbsp;
  </div>
  <div class="row">
        <div class="col-md-8 col-md-offset-1">
            <asp:HyperLink ID="EventCalendarLink" runat="server">Event Calendar</asp:HyperLink>
        </div> 
    </div>
    <div class="row">&nbsp;</div>
    <div class="row">
        <div class="col-md-6 col-md-offset-1">
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
          <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-default" PostBackUrl='javascript:history.go(-1)'>Back</asp:LinkButton>
        </div>
      <!-- User pic section -->
      <div class="col-md-5">
        <asp:Image runat="server" ID="UserPicture" CssClass="Display-pic-medium" ImageUrl="~/img/help_48.png"></asp:Image>
      </div>
      <!-- User pic section END-->
    </div>
    <div class="row">
      <div class="col-md-6 col-md-offset-1">
        <!-- Parents association section START -->
        <asp:Panel ID="CreateAssociationPanel" runat="server">
                <asp:Label ID="CreateAssociationLabel" runat="server" Text="This student does not have an associated parent yet."></asp:Label>
        </asp:Panel>
        <asp:Panel ID="ShowAssociationPanel" runat="server" Visible="False">
            <asp:Label ID="AssociationMessage" runat="server" Text=""></asp:Label>
            <asp:HyperLink ID="ParentLink" runat="server">Parent Link</asp:HyperLink>
        </asp:Panel>
        <!-- Parents association section END -->
      </div>
    </div>
    <div class="row"> &nbsp;</div>
    <div class="row">
      <!-- Administrator section-->
      <!-- Assignments,Quizzes,Results and Attendance section start -->
      <asp:Panel ID="NonAdminPanel" runat="server">
        <div class="col-md-10 col-md-offset-1">
          <div class="panel-group" id="accordionAttendance">
            <div class="panel panel-default">
              <div class="panel-heading">
                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordionAttendance" href="#collapseAttendance1">Attendance</a></h4>
              </div>
              <div id="collapseAttendance1" class="panel-collapse collapse in">
                <div class="panel-body">
                  <asp:GridView ID="StudentAttendanceGrid" runat="server" AutoGenerateColumns="False" DataSourceID="StudentAttendanceDataSource" AllowPaging="True" PageSize="5" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                    <Columns>
                      <asp:BoundField DataField="AttendanceWeek" HeaderText="Week" SortExpression="AttendanceWeek" />
                      <asp:BoundField DataField="SemesterName" HeaderText="Semester" SortExpression="SemesterName" />
                      <asp:BoundField DataField="TotalClasses" HeaderText="TotalClasses" SortExpression="TotalClasses" />
                      <asp:BoundField DataField="ClassesAttended" HeaderText="Attended" SortExpression="ClassesAttended" />
                      <asp:BoundField DataField="ClassesMissed" HeaderText="Missed" SortExpression="ClassesMissed" />
                      <asp:BoundField DataField="AttendancePercentage" HeaderText="Attendance" SortExpression="AttendancePercentage" DataFormatString="{0:f2} %" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                    <emptydatarowstyle backcolor="LightBlue" />
                    <emptydatatemplate>
                      <asp:image id="NoDataImage" imageurl="~/img/cancel.png" alternatetext="No Image" runat="server"/>
                        No Data Found.  
                    </emptydatatemplate>
                  </asp:GridView>
                  <asp:SqlDataSource ID="StudentAttendanceDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" OnSelecting="AssociationDataSource_Selecting" SelectCommand="SELECT attendance.AttendanceWeek, Semesters.SemesterName, attendance.TotalClasses,
attendance.ClassesAttended, attendance.ClassesMissed,
attendance.AttendancePercentage
FROM Attendance
INNER JOIN Semesters ON Semesters.SemesterId=Attendance.SemesterId
WHERE Attendance.StudentId = @StudentId">
                    <SelectParameters>
                      <asp:Parameter Name="StudentId" Type="Object" />
                    </SelectParameters>
                  </asp:SqlDataSource>
                </div>
              </div>
            </div>
            <div class="panel panel-default">
              <div class="panel-heading">
                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordionAttendance" href="#collapseAttendance2">Results</a></h4>
              </div>
              <div id="collapseAttendance2" class="panel-collapse collapse">
                <div class="panel-body">
                  <asp:GridView ID="StudentResultGrid" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="StudentResultDataSource">
                    <Columns>
                      <asp:TemplateField>
                        <ItemTemplate>
                          <asp:HyperLink ID="HyperLink1" runat="server">Details</asp:HyperLink>
                        </ItemTemplate>
                      </asp:TemplateField>
                      <asp:BoundField DataField="Status" HeaderText="Status" />
                      <asp:BoundField DataField="SemesterName" HeaderText="Semester" />
                      <asp:BoundField DataField="PassingDate" HeaderText="Passing Date" DataFormatString="{0:dd MMMM, yyyy}" />
                      <asp:BoundField DataField="Attendance" DataFormatString="{0:f2} %" HeaderText="Attendance" />
                      <asp:BoundField DataField="GPA" DataFormatString="{0:f2}" HeaderText="GPA" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                    <emptydatarowstyle backcolor="LightBlue" />
                    <emptydatatemplate>
                      <asp:image id="NoDataImage" imageurl="~/img/cancel.png" alternatetext="No Image" runat="server"/>
                        No Data Found.  
                    </emptydatatemplate> 
                  </asp:GridView>
                  <asp:SqlDataSource ID="StudentResultDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" OnSelecting="AssociationDataSource_Selecting" SelectCommand="SELECT results.status, semesters.SemesterName, results.passingdate,
results.attendance, results.gpa
FROM results
INNER JOIN Semesters ON Semesters.SemesterId=results.SemesterId
WHERE results.StudentId = @StudentId">
                    <SelectParameters>
                      <asp:Parameter Name="StudentId" />
                    </SelectParameters>
                  </asp:SqlDataSource>
                </div>
              </div>
            </div>
            <div class="panel panel-default">
              <div class="panel-heading">
                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordionAttendance" href="#collapseAttendance3">Due Assignments</a></h4>
              </div>
              <div id="collapseAttendance3" class="panel-collapse collapse">
                <div class="panel-body">
                  <asp:GridView ID="StudentAssignmentGrid" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="AssignmentId" DataSourceID="StudentAssignmentDataSource">
                    <Columns>
                      <asp:TemplateField><ItemTemplate><asp:HyperLink ID="HyperLink2" runat="server">Details</asp:HyperLink></ItemTemplate></asp:TemplateField>
                      <asp:BoundField DataField="CourseName" HeaderText="Class" SortExpression="CourseName" />
                      <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                      <asp:BoundField DataField="SubmissionDate" HeaderText="Submission Date" SortExpression="SubmissionDate" DataFormatString="{0:dd MMMM, yyyy}" />
                      <asp:BoundField DataField="TotalMarks" HeaderText="Total Marks" SortExpression="TotalMarks" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                    <emptydatarowstyle backcolor="LightBlue" />
                    <emptydatatemplate>
                      <asp:image id="NoDataImage" imageurl="~/img/cancel.png" alternatetext="No Image" runat="server"/>
                        No Data Found / No assignments issued yet.  
                    </emptydatatemplate>
                  </asp:GridView>
                  <asp:SqlDataSource ID="StudentAssignmentDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" OnSelecting="StudentAssignmentDataSource_Selecting" SelectCommand="select Assignments.AssignmentId,Classes.CourseId,Courses.CourseName,Assignments.Title,Assignments.SubmissionDate,Assignments.TotalMarks
from Assignments
INNER JOIN Classes ON Classes.ClassId = Assignments.ClassId
INNER JOIN Courses ON Courses.CourseId=Classes.CourseId
where Assignments.ClassId IN (select Classes.ClassId from Classes where Classes.ClassId IN (select ClassStudents.ClassId from ClassStudents where ClassStudents.StudentId=@StudentId)) and Assignments.SubmissionDate &gt;= @AssignmentDate">
                    <SelectParameters>
                      <asp:Parameter Name="StudentId" />
                      <asp:Parameter Name="AssignmentDate" />
                    </SelectParameters>
                  </asp:SqlDataSource>
                </div>
              </div>
            </div>
            <div class="panel panel-default">
              <div class="panel-heading">
                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordionAttendance" href="#collapseAttendance4">Upcoming Quizzes</a></h4>
              </div>
              <div id="collapseAttendance4" class="panel-collapse collapse">
                <div class="panel-body">
                  <asp:GridView ID="StudentQuizGrid" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="QuizId" DataSourceID="StudentQuizDataSource">
                    <Columns>
                      <asp:TemplateField><ItemTemplate><asp:HyperLink ID="HyperLink3" runat="server">Details</asp:HyperLink></ItemTemplate></asp:TemplateField>
                      <asp:BoundField DataField="CourseName" HeaderText="Class" SortExpression="CourseName" />
                      <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                      <asp:BoundField DataField="QuizDate" HeaderText="Quiz Date" SortExpression="QuizDate" DataFormatString="{0:dd MMMM, yyyy}" />
                      <asp:BoundField DataField="TotalMarks" HeaderText="Total Marks" SortExpression="TotalMarks" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                    <emptydatarowstyle backcolor="LightBlue" />
                    <emptydatatemplate>
                      <asp:image id="NoDataImage" imageurl="~/img/cancel.png" alternatetext="No Image" runat="server"/>
                        No Data Found / No coming quizzes scheduled yet.  
                    </emptydatatemplate>
                  </asp:GridView>
                  <asp:SqlDataSource ID="StudentQuizDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" SelectCommand="select Quizzes.QuizId,Classes.CourseId,Courses.CourseName,Quizzes.Title,Quizzes.QuizDate,Quizzes.TotalMarks
from Quizzes
INNER JOIN Classes ON Classes.ClassId = Quizzes.ClassId
INNER JOIN Courses ON Courses.CourseId=Classes.CourseId
where Quizzes.ClassId IN (select Classes.ClassId from Classes where Classes.ClassId IN (select ClassStudents.ClassId from ClassStudents where ClassStudents.StudentId=@StudentId)) and Quizzes.QuizDate &gt;= @QuizDate" OnSelecting="StudentQuizDataSource_Selecting">
                    <SelectParameters>
                      <asp:Parameter Name="StudentId" />
                      <asp:Parameter Name="QuizDate" />
                    </SelectParameters>
                  </asp:SqlDataSource>
                </div>
              </div>
            </div>
            <div class="panel panel-default">
              <div class="panel-heading">
                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordionAttendance" href="#collapseAttendance5">My Classes</a></h4>
              </div>
              <div id="collapseAttendance5" class="panel-collapse collapse">
                <div class="panel-body">
                  <asp:GridView ID="StudentClassGrid" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="StudentClassesDataSource">
                    <Columns>
                      <asp:TemplateField><ItemTemplate> <asp:HyperLink ID="HyperLink4" runat="server">Details</asp:HyperLink></ItemTemplate></asp:TemplateField>
                      <asp:BoundField DataField="CourseName" HeaderText="Class" SortExpression="CourseName" />
                      <asp:BoundField DataField="SectionName" HeaderText="Section" SortExpression="SectionName" />
                      <asp:BoundField DataField="SemesterName" HeaderText="Semester" SortExpression="SemesterName" />
                      <asp:BoundField DataField="CreditHours" HeaderText="Credit Hours" SortExpression="CreditHours" />
                      <asp:BoundField DataField="Teacher" HeaderText="Teacher" ReadOnly="True" SortExpression="Teacher" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                    <emptydatarowstyle backcolor="LightBlue" />
                    <emptydatatemplate>
                      <asp:image id="NoDataImage" imageurl="~/img/cancel.png" alternatetext="No Image" runat="server"/>
                        No Data Found.  
                    </emptydatatemplate>
                  </asp:GridView>
                  <asp:SqlDataSource ID="StudentClassesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" SelectCommand="select Courses.CourseName,Sections.SectionName,Semesters.SemesterName,Classes.CreditHours,(TeacherProfiles.FirstName+ ' ' +TeacherProfiles.LastName) as Teacher
from Classes
INNER JOIN Courses ON Courses.CourseId=Classes.CourseId
INNER JOIN Sections ON Sections.SectionId=Classes.SectionId
INNER JOIN Semesters ON Semesters.SemesterId=Classes.SemesterId
INNER JOIN TeacherProfiles ON TeacherProfiles.TeacherId=Classes.TeacherId
where Classes.ClassId IN (select ClassStudents.ClassId from ClassStudents where ClassStudents.StudentId=@StudentId)" OnSelecting="AssociationDataSource_Selecting">
                    <SelectParameters>
                      <asp:Parameter Name="StudentId" />
                    </SelectParameters>
                  </asp:SqlDataSource>
                </div>
              </div>
            </div>
            </div>
        </div>
      </asp:Panel>
      <!-- Assignments,Quizzes,Results and Attendance section end -->
      
      <!-- End of Administrator section-->
    </div>
    
    <asp:SqlDataSource ID="AssociationDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" OnSelecting="AssociationDataSource_Selecting" SelectCommand="select ParentId from Associations where (StudentId = @StudentId) ;">
        <SelectParameters>
            <asp:Parameter Name="StudentId" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="StudentDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" OnSelecting="AssociationDataSource_Selecting" SelectCommand="SELECT aspnet_Membership.Email, Departments.DepartmentName, Batches.BatchName,
(StudentProfiles.FirstName+' '+ StudentProfiles.LastName) as Name, StudentProfiles.Contact,
StudentProfiles.RollNo, StudentProfiles.Contact, StudentProfiles.Avatar
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

