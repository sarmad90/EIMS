<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="StudentProfile.aspx.cs" Inherits="Administration_StudentProfile" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <script type="text/javascript" src="/js/StudentProfile.js"></script>
    <div class="row">
        <div class="col-md-8 col-md-offset-1">
            <asp:Label ID="StudentName" runat="server" Font-Bold="True" Font-Size="X-Large"></asp:Label>
        </div> 
    </div>
  <div class="row">
        <div class="col-md-8 col-md-offset-1">
          <asp:LoginView ID="LoginView1" runat="server">
            <RoleGroups>
              <asp:RoleGroup Roles="Parent">
                <ContentTemplate>
                  <asp:HyperLink ID="EventCalendarLink" runat="server">Event Calendar</asp:HyperLink>
                </ContentTemplate>
              </asp:RoleGroup>
            </RoleGroups>
          </asp:LoginView>
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
                <div class="row">
                    <p class="text-center"><b>Enter Parent's Email</b></p>
                    <div class="col-md-1"><asp:Label ID="Label1" runat="server" Text="Email: "></asp:Label></div>
                    <div class="col-md-3"><asp:TextBox ID="ParentEmail" runat="server"></asp:TextBox></div>
                    <div class="col-md-2"><asp:Button ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" /></div>
                </div>
                <asp:GridView ID="ParentAssociation" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False" OnSelectedIndexChanged="ParentAssociation_SelectedIndexChanged" >
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:BoundField DataField="UserName" HeaderText="UserName" />
                    </Columns>
                </asp:GridView>
                <asp:Label ID="CreateAssociationLabel" runat="server" Text=""></asp:Label>
        </asp:Panel>
        <asp:Panel ID="ShowAssociationPanel" runat="server" Visible="False">
            <asp:Label ID="AssociationMessage" runat="server" Text=""></asp:Label>
            <asp:HyperLink ID="ParentLink" runat="server">asdasd</asp:HyperLink>
        </asp:Panel>
        <!-- Parents association section END -->
      </div>
      <!-- Results Section Start -->
      <div class="col-md-6 col-md-offset-1">
      <asp:Panel ID="ResultsAdminPanel" runat="server">
        <!-- !-->
        <div class="panel-group" id="accordionResults">
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordionResults" href="#collapseResults1">Results</a></h4>
            </div>
            <div id="collapseResults1" class="panel-collapse collapse in">
              <div class="panel-body">
                No Results
              </div>
            </div>
          </div>
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordionResults" href="#collapseResults2">Add Results</a></h4>
            </div>
            <div id="collapseResults2" class="panel-collapse collapse">
              <div class="panel-body">
                <div class="row">
                    <div class="col-md-1"><asp:Label ID="Label2" runat="server" Text="Semester:  "></asp:Label></div>
                    <div class="col-md-1"><asp:TextBox ID="TxtSemester" CssClass="input-mini" runat="server"></asp:TextBox></div>
                    <div class="col-md-1"><asp:Label ID="Label3" runat="server" Text="Status:  "></asp:Label></div>
                    <div class="col-md-1"><asp:TextBox ID="TxtStatus" CssClass="input-mini" runat="server"></asp:TextBox></div>
                  </div>
                  <div class="row">
                    <div class="col-md-1"><asp:Label ID="Label4" runat="server" Text="GPA:  "></asp:Label></div>
                    <div class="col-md-1"><asp:TextBox ID="TxtGPA" CssClass="input-mini" runat="server"></asp:TextBox></div>
                    <div class="col-md-1"><asp:Label ID="Label6" runat="server" Text="Attendance:  "></asp:Label></div>
                    <div class="col-md-1"><asp:TextBox ID="TxtAttendance" CssClass="input-mini" runat="server"></asp:TextBox></div>
                  </div>
                  <div class="row">
                    <div class="col-md-1"><asp:Label ID="Label5" runat="server" Text="Passing Date:  "></asp:Label></div>
                    <div class="col-md-1">
                      <div class="span5">Passing Date:  <asp:TextBox ID="PassingDate" runat="server" class="datepicker"></asp:TextBox></div>
                    </div>
                  </div>
                  <div class="row"><div class="col-md-4 col-md-offset-1"><hr /></div></div>
                  <div class="row">
                    <div class="col-md-6">
                      <div>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label7" runat="server" Text="Subject: "></asp:Label>
                        <asp:TextBox ID="TxtSubject1" runat="server" CssClass="input-mini"></asp:TextBox>
                        <asp:Label ID="Label8" runat="server" Text="MarksObtained: "></asp:Label>
                        <asp:TextBox ID="TxtMarksObtained1" runat="server" CssClass="input-mini" Width="25px"></asp:TextBox>
                        <asp:Label ID="Label9" runat="server" Text="TotalMarks: "></asp:Label>
                        <asp:TextBox ID="TxtTotalMarks1" runat="server" CssClass="input-mini" Width="25px"></asp:TextBox>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <asp:Image ID="subject_fields_button_2" runat="server" ImageUrl="~/img/add.png" />
                      <span class="subject_fields_2">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label10" runat="server" Text="Subject: "></asp:Label>
                        <asp:TextBox ID="TxtSubject2" runat="server" CssClass="input-mini"></asp:TextBox>
                        <asp:Label ID="Label11" runat="server" Text="MarksObtained: "></asp:Label>
                        <asp:TextBox ID="TxtMarksObtained2" runat="server" CssClass="input-mini" Width="25px"></asp:TextBox>
                        <asp:Label ID="Label12" runat="server" Text="TotalMarks: "></asp:Label>
                        <asp:TextBox ID="TxtTotalMarks2" runat="server" CssClass="input-mini" Width="25px"></asp:TextBox>
                      </span>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <asp:Image ID="subject_fields_button_3" runat="server" ImageUrl="~/img/add.png" />
                      <span class="subject_fields_3">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label13" runat="server" Text="Subject: "></asp:Label>
                        <asp:TextBox ID="TxtSubject3" runat="server" CssClass="input-mini"></asp:TextBox>
                        <asp:Label ID="Label14" runat="server" Text="MarksObtained: "></asp:Label>
                        <asp:TextBox ID="TxtMarksObtained3" runat="server" CssClass="input-mini" Width="25px"></asp:TextBox>
                        <asp:Label ID="Label15" runat="server" Text="TotalMarks: "></asp:Label>
                        <asp:TextBox ID="TxtTotalMarks3" runat="server" CssClass="input-mini" Width="25px"></asp:TextBox>
                      </span>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <asp:Image ID="subject_fields_button_4" runat="server" ImageUrl="~/img/add.png" />
                      <span class="subject_fields_4">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label16" runat="server" Text="Subject: "></asp:Label>
                        <asp:TextBox ID="TxtSubject4" runat="server" CssClass="input-mini"></asp:TextBox>
                        <asp:Label ID="Label17" runat="server" Text="MarksObtained: "></asp:Label>
                        <asp:TextBox ID="TxtMarksObtained4" runat="server" CssClass="input-mini" Width="25px"></asp:TextBox>
                        <asp:Label ID="Label18" runat="server" Text="TotalMarks: "></asp:Label>
                        <asp:TextBox ID="TxtTotalMarks4" runat="server" CssClass="input-mini" Width="25px"></asp:TextBox>
                      </span>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <asp:Image ID="subject_fields_button_5" runat="server" ImageUrl="~/img/add.png" />
                      <span class="subject_fields_5">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label19" runat="server" Text="Subject: "></asp:Label>
                        <asp:TextBox ID="TxtSubject5" runat="server" CssClass="input-mini"></asp:TextBox>
                        <asp:Label ID="Label20" runat="server" Text="MarksObtained: "></asp:Label>
                        <asp:TextBox ID="TxtMarksObtained5" runat="server" CssClass="input-mini" Width="25px"></asp:TextBox>
                        <asp:Label ID="Label21" runat="server" Text="TotalMarks: "></asp:Label>
                        <asp:TextBox ID="TxtTotalMarks5" runat="server" CssClass="input-mini" Width="25px"></asp:TextBox>
                      </span>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <asp:Image ID="subject_fields_button_6" runat="server" ImageUrl="~/img/add.png" />
                      <span class="subject_fields_6">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label22" runat="server" Text="Subject: "></asp:Label>
                        <asp:TextBox ID="TxtSubject6" runat="server" CssClass="input-mini"></asp:TextBox>
                        <asp:Label ID="Label23" runat="server" Text="MarksObtained: "></asp:Label>
                        <asp:TextBox ID="TxtMarksObtained6" runat="server" CssClass="input-mini" Width="25px"></asp:TextBox>
                        <asp:Label ID="Label24" runat="server" Text="TotalMarks: "></asp:Label>
                        <asp:TextBox ID="TxtTotalMarks6" runat="server" CssClass="input-mini" Width="25px"></asp:TextBox>
                      </span>
                    </div>
                  </div>
                  <div class="form-actions">
                    <asp:Button ID="AddResult" runat="server" Text="Add" CssClass="btn btn-primary" OnClick="AddResult_Click" />
                  </div>
              </div>
            </div>
          </div>
        </div>
        <!-- !-->
      </asp:Panel>
      </div>
      <!-- Results Section End -->
    </div>
    <div class="row"> &nbsp;</div>
    <div class="row">
      <!-- Administrator section-->
      <!-- Assignments,Quizzes,Results and Attendance section start -->
      <asp:Panel ID="NonAdminPanel" runat="server">
        <div class="col-md-10 col-md-offset-1">
          <div class="accordion" id="Div1">
            <div class="accordion-group">
              <div class="accordion-heading">
                <a class="accordion-toggle" data-toggle="collapse" data-parent="#Div1" href="#Div2">
                  Attendance
                </a>
              </div>
              <div id="Div2" class="accordion-body collapse in">
                <div class="accordion-inner">
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
                  <asp:SqlDataSource ID="StudentAttendanceDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" OnSelecting="StudentAttendanceDataSource_Selecting" SelectCommand="SELECT attendance.AttendanceWeek, Semesters.SemesterName, attendance.TotalClasses,
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
            <div class="accordion-group">
              <div class="accordion-heading">
                <a class="accordion-toggle" data-toggle="collapse" data-parent="#Div1" href="#Div3">
                  Results
                </a>
              </div>
              <div id="Div3" class="accordion-body collapse">
                <div class="accordion-inner">
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
                  <asp:SqlDataSource ID="StudentResultDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" OnSelecting="StudentResultDataSource_Selecting" SelectCommand="SELECT results.status, semesters.SemesterName, results.passingdate,
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
            <div class="accordion-group">
              <div class="accordion-heading">
                <a class="accordion-toggle" data-toggle="collapse" data-parent="#Div1" href="#Div4">
                  Due Assignments
                </a>
              </div>
              <div id="Div4" class="accordion-body collapse">
                <div class="accordion-inner">
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
            <div class="accordion-group">
              <div class="accordion-heading">
                <a class="accordion-toggle" data-toggle="collapse" data-parent="#Div1" href="#Div5">
                  Upcoming Quizzes
                </a>
              </div>
              <div id="Div5" class="accordion-body collapse">
                <div class="accordion-inner">
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
            <div class="accordion-group">
              <div class="accordion-heading">
                <a class="accordion-toggle" data-toggle="collapse" data-parent="#Div1" href="#Div6">
                  Classes
                </a>
              </div>
              <div id="Div6" class="accordion-body collapse">
                <div class="accordion-inner">
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
where Classes.ClassId IN (select ClassStudents.ClassId from ClassStudents where ClassStudents.StudentId=@StudentId)" OnSelecting="StudentClassesDataSource_Selecting">
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
      <asp:Panel ID="AttendancePanel" runat="server">
        <div class="col-md-10 col-md-offset-1">
            <h1>Attendance</h1>
                  <asp:GridView ID="gvCrud" runat="server" DataKeyNames="AttendanceId" CssClass="GridView" ShowFooter="true" AutoGenerateColumns="false" OnRowDataBound="gvCrud_RowDataBound" OnRowCancelingEdit="gvCrud_RowCancelingEdit" OnRowEditing="gvCrud_RowEditing" OnRowCommand="gvCrud_RowCommand" OnRowDeleting="gvCrud_RowDeleting">
                      <EmptyDataTemplate>
                          Data Not Found!
                      </EmptyDataTemplate>
                      <Columns>
                          <asp:TemplateField>
                              <ItemTemplate>
                                  <asp:ImageButton ID="btnEdit" runat="server" CommandName="Edit" ImageUrl="~/img/edit.png" ImageAlign="AbsMiddle" CausesValidation="false" ToolTip="Edit Record" />
                                  <asp:ImageButton ID="btnDelete" runat="server" CommandName="Delete" ImageUrl="~/img/delete.png" ImageAlign="AbsMiddle" CausesValidation="false" ToolTip="Delete Record" OnClientClick="return confirm('Are you Sure Delete this Record')" />
                              </ItemTemplate>
                              <EditItemTemplate>
                                  <asp:ImageButton ID="btnUpdate" runat="server" Text="Update" CommandName="Modify" ImageUrl="~/img/edit.png" ImageAlign="AbsMiddle" CommandArgument='<%# Eval("AttendanceId") %>' ValidationGroup="Edit" ToolTip="Update Record" />
                                  <asp:ImageButton ID="btnCancel" runat="server" Text="Cancel" CommandName="Cancel" ImageUrl="~/img/cancel.png" ImageAlign="AbsMiddle" CausesValidation="false" ToolTip="Cancel" />
                              </EditItemTemplate>
                              <FooterTemplate>
                                  <asp:ImageButton ID="btnInsert" runat="server" Text="Insert" OnClick="btnInsert_Click" ImageUrl="~/img/add.png" ImageAlign="AbsMiddle" ValidationGroup="Insert" ToolTip="Insert Record" />
                              </FooterTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="Total Classes">
                              <ItemTemplate>
                                  <%# Eval("TotalClasses") %>
                              </ItemTemplate>
                              <EditItemTemplate>
                                  <asp:TextBox ID="TotalClassesEdit" runat="server" Text='<%# Eval("TotalClasses") %>' CssClass="input-mini"></asp:TextBox>
                              </EditItemTemplate>
                              <FooterTemplate>
                                  <asp:TextBox ID="TotalClassesInsert" runat="server" CssClass="input-mini"></asp:TextBox>
                              </FooterTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="Week">
                              <ItemTemplate>
                                  <%# Eval("AttendanceWeek") %>
                              </ItemTemplate>
                              <EditItemTemplate>
                                  <asp:DropDownList ID="AttendanceWeekSelectEdit" runat="server" CssClass="input-small">
                                       <asp:ListItem Text="–Select–"></asp:ListItem>
                                      <asp:ListItem Text="Week 1" Value="Week 1"></asp:ListItem>
                                      <asp:ListItem Text="Week 2" Value="Week 2"></asp:ListItem>
                                      <asp:ListItem Text="Week 3" Value="Week 3"></asp:ListItem>
                                      <asp:ListItem Text="Week 4" Value="Week 4"></asp:ListItem>
                                      <asp:ListItem Text="Week 5" Value="Week 5"></asp:ListItem>
                                  </asp:DropDownList>
                              </EditItemTemplate>
                              <FooterTemplate>
                                  <asp:DropDownList ID="AttendanceWeekSelect" runat="server" CssClass="input-small">
                                      <asp:ListItem Text="–Select–"></asp:ListItem>
                                      <asp:ListItem Text="Week 1" Value="Week 1"></asp:ListItem>
                                      <asp:ListItem Text="Week 2" Value="Week 2"></asp:ListItem>
                                      <asp:ListItem Text="Week 3" Value="Week 3"></asp:ListItem>
                                      <asp:ListItem Text="Week 4" Value="Week 4"></asp:ListItem>
                                      <asp:ListItem Text="Week 5" Value="Week 5"></asp:ListItem>
                                  </asp:DropDownList>
                              </FooterTemplate>
                          </asp:TemplateField>
                        <asp:TemplateField HeaderText="Classes Attended">
                              <ItemTemplate>
                                  <%# Eval("ClassesAttended") %>
                              </ItemTemplate>
                              <EditItemTemplate>
                                  <asp:TextBox ID="ClassesAttendedEdit" runat="server" Text='<%# Eval("ClassesAttended") %>' CssClass="input-mini"></asp:TextBox>
                              </EditItemTemplate>
                              <FooterTemplate>
                                  <asp:TextBox ID="ClassesAttendedInsert" runat="server" CssClass="input-mini"></asp:TextBox>
                              </FooterTemplate>
                          </asp:TemplateField>
                        <asp:TemplateField HeaderText="Classes Missed">
                              <ItemTemplate>
                                  <%# Eval("ClassesMissed") %>
                              </ItemTemplate>
                              <EditItemTemplate>
                                  <asp:TextBox ID="ClassesMissedEdit" runat="server" CssClass="input-mini" Text='<%# Eval("ClassesMissed") %>'></asp:TextBox>
                              </EditItemTemplate>
                              <FooterTemplate>
                                  <asp:TextBox ID="ClassesMissedInsert" runat="server" CssClass="input-mini"></asp:TextBox>
                              </FooterTemplate>
                          </asp:TemplateField>
                        <asp:TemplateField HeaderText="Attendance Percentage">
                              <ItemTemplate>
                                  <%# String.Format("{0:f2}",DataBinder.Eval(Container.DataItem, "AttendancePercentage"))%>%
                              </ItemTemplate>
                          </asp:TemplateField>
                      </Columns>
                      <HeaderStyle CssClass="Header-Class" />
                      <RowStyle CssClass="Row-Class" />
                      <AlternatingRowStyle CssClass="Alternet-Row-Class" />
                      <FooterStyle CssClass="Footer-Class" />
                  </asp:GridView>
                  <!–CODE END –>
          </div>
      </asp:Panel>
      <!-- End of Administrator section-->
    </div>
    
    <asp:SqlDataSource ID="AssociationDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" OnSelecting="AssociationDataSource_Selecting" SelectCommand="select ParentId from Associations where (StudentId = @StudentId) ;">
        <SelectParameters>
            <asp:Parameter Name="StudentId" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="StudentDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" OnSelecting="StudentDataSource_Selecting" SelectCommand="SELECT aspnet_Membership.Email, Departments.DepartmentName, Batches.BatchName,
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

