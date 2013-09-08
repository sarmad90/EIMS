<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Class.aspx.cs" Inherits="Administration_Classes_Class" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row">
        <div class="span3 offset1">
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
            </table>
        </div>
    </div>
  <div class="row">
    <div class="span6 offset1">
        <div class="accordion" id="accordion2">
  <div class="accordion-group">
    <div class="accordion-heading">
      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
        Students in the class:
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
    <asp:SqlDataSource ID="ClassDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" SelectCommand="select Classes.ClassId,Courses.CourseName,Sections.SectionName,(TeacherProfiles.FirstName + ' ' + TeacherProfiles.LastName) as TeacherName, Batches.BatchName, Semesters.SemesterName,Departments.DepartmentName from Classes
INNER JOIN TeacherProfiles ON Classes.TeacherId=TeacherProfiles.TeacherId
INNER JOIN Courses ON Classes.CourseId=Courses.CourseId
INNER JOIN Sections ON Classes.SectionId=Sections.SectionId
INNER JOIN Batches ON Classes.BatchId=Batches.BatchId
INNER JOIN Semesters ON Batches.SemesterId=Semesters.SemesterId
INNER JOIN Departments ON Courses.DepartmentId=Departments.DepartmentId
WHERE Classes.ClassId = @ClassId" OnSelecting="ClassDataSource_Selecting">
        <SelectParameters>
            <asp:Parameter Name="ClassId" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>

