<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Class.aspx.cs" Inherits="Administration_Classes_Class" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row">
        <div class="span8 offset1">
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
                <tr>
                    <td> Credit Hours:</td>
                    <td><asp:Label ID="CreditHours" runat="server" Text=""></asp:Label></td>
                </tr>
            </table>
          <div class="row">
            <div class="span6">
                <div class="accordion" id="accordion2">
          <div class="accordion-group">
            <div class="accordion-heading">
              <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
                Students in the class
              </a>
            </div>
            <div id="collapseOne" class="accordion-body collapse in">
              <div class="accordion-inner">
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
          <div class="accordion-group">
            <div class="accordion-heading">
              <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">
                Add students to the class
              </a>
            </div>
            <div id="collapseTwo" class="accordion-body collapse">
              <div class="accordion-inner">
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
            </div>
          </div>
        </div>
      <div class="span6">
        <div class="accordion" id="Div1">
          <div class="accordion-group">
            <div class="accordion-heading">
              <a class="accordion-toggle" data-toggle="collapse" data-parent="#Div1" href="#Div2">
                Due Assignments
              </a>
            </div>
            <div id="Div2" class="accordion-body collapse in">
              <div class="accordion-inner">
                No Assignment
              </div>
            </div>
          </div>
          <div class="accordion-group">
            <div class="accordion-heading">
              <a class="accordion-toggle" data-toggle="collapse" data-parent="#Div1" href="#Div3">
                Add Assignments
              </a>
            </div>
            <div id="Div3" class="accordion-body collapse">
              <div class="accordion-inner">
                <div class="row">
                  <div class="span6">Title:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="AssignmentTitle" runat="server" CssClass="input-medium"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Total Marks:  <asp:TextBox ID="AssignmentTotalMarks" runat="server" CssClass="input-mini"></asp:TextBox></div>
                </div>
                <div class="row">
                  <div class="span1">Description:  </div>
                  <div class="span4"><asp:TextBox ID="AssignmentDescription" runat="server" Rows="5" TextMode="MultiLine" Width="335px"></asp:TextBox></div>
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
                  <div class="span2">
                    <asp:Button ID="AddAssignment" runat="server" Text="Assign" CssClass="btn btn-primary" OnClick="AddAssignment_Click" /></div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- Divider between two accordians -->
        <div class="accordion" id="Div4">
          <div class="accordion-group">
            <div class="accordion-heading">
              <a class="accordion-toggle" data-toggle="collapse" data-parent="#Div4" href="#Div5">
                Coming Quizzes
              </a>
            </div>
            <div id="Div5" class="accordion-body collapse in">
              <div class="accordion-inner">
                No Upcoming Quizzes
              </div>
            </div>
          </div>
          <div class="accordion-group">
            <div class="accordion-heading">
              <a class="accordion-toggle" data-toggle="collapse" data-parent="#Div4" href="#Div6">
                Add Quizzes
              </a>
            </div>
            <div id="Div6" class="accordion-body collapse">
              <div class="accordion-inner">
                <div class="row">
                  <div class="span6">Title:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="QuizTitle" runat="server" CssClass="input-medium"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Total Marks:  <asp:TextBox ID="QuizTotalMarks" runat="server" CssClass="input-mini"></asp:TextBox></div>
                </div>
                <div class="row">
                  <div class="span1">Description:  </div>
                  <div class="span4"><asp:TextBox ID="QuizDescription" runat="server" Rows="5" TextMode="MultiLine" Width="335px"></asp:TextBox></div>
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
                  <div class="span2">
                    <asp:Button ID="AddQuiz" runat="server" Text="Add Quiz" CssClass="btn btn-primary" OnClick="AddQuiz_Click" /></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
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

