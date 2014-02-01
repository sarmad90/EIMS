<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Class.aspx.cs" Inherits="Administration_Classes_Class" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <div class="row">
    <div class="col-md-8">
      <asp:Label ID="Course" runat="server" Font-Bold="True" Font-Size="X-Large"></asp:Label>
    </div> 
  </div>
  <div class="row">&nbsp;</div>
  <div class="row">
    <!-- Class Details Start !-->
    <div class="col-md-6">
      <table class="table table-striped">
        <tr>
          <td> Teacher Name:</td>
          <td><asp:Label ID="Teacher" runat="server" Text=""></asp:Label></td>
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
        <tr>
          <td> Credit Hours:</td>
          <td><asp:Label ID="CreditHours" runat="server" Text=""></asp:Label></td>
        </tr>
      </table>
      <!-- Class Details End !-->
      <div class="row">
        <div class="col-md-12">
        <!-- Students in the class Start !-->
        <!-- Collapse Start !-->
          <!-- !-->
          <div class="panel-group" id="Div12">
            <div class="panel panel-default">
              <div class="panel-heading">
                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">Students in the class</a></h4>
              </div>
              <div id="collapseOne" class="panel-collapse collapse in">
                <div class="panel-body">
                  <asp:GridView ID="ClassStudentsGridview" CssClass="table table-hover" runat="server" AutoGenerateColumns="False">
                    <Columns>
                      <asp:TemplateField HeaderText="Profile">
                        <ItemTemplate>
                          <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/Shared/StudentProfile.aspx?id=" + Eval("UserName")   %>'>View Profile</asp:HyperLink>
                        </ItemTemplate>
                      </asp:TemplateField>
                      <asp:BoundField DataField="Name" HeaderText="Name" />
                      <asp:BoundField DataField="Roll Number" HeaderText="Roll Number" />
                      <asp:BoundField DataField="Batch" HeaderText="Batch" />
                      <asp:BoundField DataField="Dept" HeaderText="Dept" />
                    </Columns>
                  </asp:GridView>
                </div>
              </div>
            </div>
            <div class="panel panel-default">
              <div class="panel-heading">
                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">Add students to the class</a></h4>
              </div>
              <div id="collapseTwo" class="panel-collapse collapse">
                <div class="panel-body">
                  <asp:GridView ID="AddStudents" runat="server" CssClass="table table-hover" DataKeyNames="Roll Number" AutoGenerateColumns="False">
                    <Columns>
                      <asp:TemplateField HeaderText="Select">
                        <ItemTemplate>
                          <asp:CheckBox ID="chkSelect" runat="server" /> 
                        </ItemTemplate>
                      </asp:TemplateField>
                      <asp:BoundField DataField="Name" HeaderText="Name" />
                      <asp:BoundField DataField="Roll Number" HeaderText="Roll Number" />
                      <asp:BoundField DataField="Batch" HeaderText="Batch" />
                      <asp:BoundField DataField="Dept" HeaderText="Dept" />
                    </Columns>
                  </asp:GridView>
                  <asp:Button ID="AddStudentsButton" runat="server" Text="Add Students" CssClass="btn" OnClick="AddStudentsButton_Click" />
                </div>
              </div>
            </div>
          </div>
          <div class="row">&nbsp;</div>
        <!-- Collapse END !-->
        <!-- Students in the class End !-->
        </div>
      </div>
    </div>
    <!-- Assignments and Quizzes Secction START-->
    <div class="col-md-6">
      <div class="panel-group" id="accordion2">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion2" href="#collapseFour">Due Assignments</a></h4>
          </div>
          <div id="collapseFour" class="panel-collapse collapse in">
            <div class="panel-body">
              No Assignments
            </div>
          </div>
        </div>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion2" href="#collapseThree">Add Assignemnts</a></h4>
          </div>
          <div id="collapseThree" class="panel-collapse collapse">
            <div class="panel-body">
              <div class="row">
                <div class="col-md-1">Title:</div><div class="col-md-4"><asp:TextBox ID="AssignmentTitle" runat="server" CssClass="input-medium form-control"></asp:TextBox></div>
                <div class="col-md-2">Marks:</div><div class="col-md-3">  <asp:TextBox ID="AssignmentTotalMarks" runat="server" CssClass="input-mini form-control"></asp:TextBox></div>
              </div>
              <div class="row">&nbsp;</div>
              <div class="row">
                <div class="col-md-2">Description:  </div>
                <div class="col-md-4"><asp:TextBox ID="AssignmentDescription" runat="server" Rows="5" TextMode="MultiLine" Width="335px" CssClass="form-control"></asp:TextBox></div>
              </div>
              <div class="row">&nbsp;</div>
              <div class="row">
                <div class="col-md-2">Submission Date:</div>
                <div class="col-md-4"><asp:TextBox ID="AssignmentDate" runat="server" class="datepicker form-control"></asp:TextBox></div>
                <div class="col-md-2">
                  <asp:Button ID="AddAssignment" runat="server" Text="Assign" CssClass="btn btn-primary" OnClick="AddAssignment_Click" /></div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- Divider between two accordians -->
      <div class="row">&nbsp;</div>
      <div class="panel-group" id="accordion3">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion3" href="#collapseFive">Coming Quizzes</a></h4>
          </div>
          <div id="collapseFive" class="panel-collapse collapse in">
            <div class="panel-body">
              No Upcoming Quizzes
            </div>
          </div>
        </div>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion3" href="#collapseSix">Add Quiz</a></h4>
          </div>
          <div id="collapseSix" class="panel-collapse collapse">
            <div class="panel-body">
              <div class="row">
                <div class="col-md-1">Title:</div><div class="col-md-4"><asp:TextBox ID="QuizTitle" runat="server" CssClass="input-medium form-control"></asp:TextBox></div>
                <div class="col-md-2">Total Marks:</div><div class="col-md-3"><asp:TextBox ID="QuizTotalMarks" runat="server" CssClass="input-mini form-control"></asp:TextBox></div>
              </div>
              <div class="row">&nbsp;</div>
              <div class="row">
                <div class="col-md-2">Description:  </div>
                <div class="col-md-4"><asp:TextBox ID="QuizDescription" runat="server" Rows="5" TextMode="MultiLine" Width="335px" CssClass="form-control"></asp:TextBox></div>
              </div>
              <div class="row">&nbsp;</div>
              <div class="row">
                <div class="col-md-1">Quiz Date:  </div>
                <div class="col-md-4"><asp:TextBox ID="QuizDate" runat="server" class="datepicker form-control"></asp:TextBox></div>
                <div class="col-md-2">
                  <asp:Button ID="AddQuiz" runat="server" Text="Add Quiz" CssClass="btn btn-primary" OnClick="AddQuiz_Click" /></div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- Divider between two accordians -->
      <div class="row">&nbsp;</div>
      <div class="panel-group" id="accordion4">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion4" href="#collapseSeven">Coming Presentations</a></h4>
          </div>
          <div id="collapseSeven" class="panel-collapse collapse in">
            <div class="panel-body">
              No Upcoming Presentations
            </div>
          </div>
        </div>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion4" href="#collapseEight">Schedule Presentations</a></h4>
          </div>
          <div id="collapseEight" class="panel-collapse collapse">
            <div class="panel-body">
              <div class="row">
                <div class="col-md-1">Title:</div><div class="col-md-3"><asp:TextBox ID="PresentationTitle" runat="server" CssClass="input-medium form-control"></asp:TextBox></div>
                <div class="col-md-2">Total Marks:</div><div class="col-md-3"><asp:TextBox ID="PresentationMarks" runat="server" CssClass="form-control input-mini"></asp:TextBox></div>
              </div>
              <div class="row">&nbsp;</div>
              <div class="row">
                <div class="col-md-2">Description:  </div>
                <div class="col-md-4"><asp:TextBox ID="PresentationDescription" runat="server" Rows="5" TextMode="MultiLine" Width="335px" CssClass="form-control"></asp:TextBox></div>
              </div>
              <div class="row">&nbsp;</div>
              <div class="row">
                <div class="col-md-2">Presentation Date: </div>
                <div class="col-md-3"><asp:TextBox ID="PresentationDate" runat="server" class="datepicker form-control"></asp:TextBox></div>
                <div class="col-md-2">
                  <asp:Button ID="AddPresentation" runat="server" Text="Add Presentation" CssClass="btn btn-primary" OnClick="AddPresentation_Click" /></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--Assignments and Quizzes section END -->
  </div>
  <asp:SqlDataSource ID="StudentsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" OnSelecting="StudentsDataSource_Selecting" SelectCommand="SELECT (StudentProfiles.FirstName + ' ' + StudentProfiles.LastName) as Name,(StudentProfiles.RollNo) as 'Roll Number',Batches.BatchName as Batch,Departments.DepartmentInitials as Dept, StudentProfiles.StudentId
FROM StudentProfiles
INNER JOIN batches ON StudentProfiles.BatchId=Batches.BatchId
INNER JOIN Departments ON StudentProfiles.DepartmentId=Departments.DepartmentId
WHERE StudentProfiles.StudentId NOT IN
    (SELECT ClassStudents.StudentId
     FROM ClassStudents where ClassStudents.ClassId=@ClassId
     ) and StudentProfiles.BatchId=@BatchId and StudentProfiles.DepartmentId=@DepartmentId">
    <SelectParameters>
      <asp:Parameter Name="ClassId" />
      <asp:Parameter Name="BatchId" />
      <asp:Parameter Name="DepartmentId" />
    </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="ClassStudentsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" SelectCommand="SELECT (StudentProfiles.FirstName + ' ' + StudentProfiles.LastName) as Name,(StudentProfiles.RollNo) as 'Roll Number',Batches.BatchName as Batch,Departments.DepartmentInitials as Dept, StudentProfiles.StudentId, aspnet_Users.UserName
FROM StudentProfiles
INNER JOIN batches ON StudentProfiles.BatchId=Batches.BatchId
INNER JOIN Departments ON StudentProfiles.DepartmentId=Departments.DepartmentId
INNER JOIN ClassStudents ON StudentProfiles.StudentId=ClassStudents.StudentId
INNER JOIN aspnet_Users ON StudentProfiles.StudentId=aspnet_Users.UserId
WHERE ClassStudents.ClassId=@ClassId" OnSelecting="ClassStudentsDataSource_Selecting">
      <SelectParameters>
        <asp:Parameter Name="ClassId" />
      </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="ClassDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" SelectCommand="select Classes.ClassId,Courses.CourseName,Sections.SectionName,(TeacherProfiles.FirstName + ' ' + TeacherProfiles.LastName) as TeacherName, Batches.BatchName, Semesters.SemesterName,Departments.DepartmentName,Classes.CreditHours, Classes.BatchId, Classes.DepartmentId from Classes
INNER JOIN TeacherProfiles ON Classes.TeacherId=TeacherProfiles.TeacherId
INNER JOIN Courses ON Classes.CourseId=Courses.CourseId
INNER JOIN Sections ON Classes.SectionId=Sections.SectionId
INNER JOIN Batches ON Classes.BatchId=Batches.BatchId
INNER JOIN Semesters ON Classes.SemesterId=Semesters.SemesterId
INNER JOIN Departments ON Classes.DepartmentId=Departments.DepartmentId
WHERE Classes.ClassId = @ClassId" OnSelecting="ClassDataSource_Selecting">
        <SelectParameters>
            <asp:Parameter Name="ClassId" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>

