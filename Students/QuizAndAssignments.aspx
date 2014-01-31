<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="QuizAndAssignments.aspx.cs" Inherits="Students_QuizAndAssignments" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <div class="row">
    <div class="col-md-12">
      <h2 class="text-center">Upcoming Quizzes</h2>
    </div>
  </div>
  <div class="row">
    <div class="col-md-12">
      <asp:GridView ID="StudentQuizGrid" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="QuizId" DataSourceID="StudentQuizDataSource" Width="1000px">
                    <Columns>
                      <asp:BoundField DataField="CourseName" HeaderText="Class" SortExpression="CourseName" />
                      <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                      <asp:BoundField DataField="QuizDate" HeaderText="Quiz Date" SortExpression="QuizDate" DataFormatString="{0:dd MMMM, yyyy}" />
                      <asp:BoundField DataField="TotalMarks" HeaderText="Total Marks" SortExpression="TotalMarks" />
                      <asp:BoundField DataField="Description" HeaderText="Description" />
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
    </div>
  </div>
  <div class="row">&nbsp;</div>
  <div class="row">
    <div class="col-md-12">
      <h2 class="text-center">Due Assignments</h2>
    </div>
  </div>
  <div class="row">
    <div class="col-md-12">
      <asp:GridView ID="StudentAssignmentGrid" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="AssignmentId" DataSourceID="StudentAssignmentDataSource" Width="1000px">
                    <Columns>
                      <asp:BoundField DataField="CourseName" HeaderText="Class" SortExpression="CourseName" />
                      <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                      <asp:BoundField DataField="SubmissionDate" HeaderText="Submission Date" SortExpression="SubmissionDate" DataFormatString="{0:dd MMMM, yyyy}" />
                      <asp:BoundField DataField="TotalMarks" HeaderText="Total Marks" SortExpression="TotalMarks" />
                      <asp:BoundField DataField="Description" HeaderText="Description" />
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
    </div>
  </div>
  <asp:SqlDataSource ID="StudentAssignmentDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" OnSelecting="StudentAssignmentDataSource_Selecting" SelectCommand="select Assignments.AssignmentId,Classes.CourseId, Assignments.Description,Courses.CourseName,Assignments.Title,Assignments.SubmissionDate,Assignments.TotalMarks
from Assignments
INNER JOIN Classes ON Classes.ClassId = Assignments.ClassId
INNER JOIN Courses ON Courses.CourseId=Classes.CourseId
where Assignments.ClassId IN (select Classes.ClassId from Classes where Classes.ClassId IN (select ClassStudents.ClassId from ClassStudents where ClassStudents.StudentId=@StudentId)) and Assignments.AssignmentDate &gt;= @AssignmentDate">
                    <SelectParameters>
                      <asp:Parameter Name="StudentId" />
                      <asp:Parameter Name="AssignmentDate" />
                    </SelectParameters>
                  </asp:SqlDataSource>
  <asp:SqlDataSource ID="StudentQuizDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" SelectCommand="select Quizzes.QuizId,Classes.CourseId,Courses.CourseName,Quizzes.Title, Quizzes.Description, Quizzes.QuizDate,Quizzes.TotalMarks
from Quizzes
INNER JOIN Classes ON Classes.ClassId = Quizzes.ClassId
INNER JOIN Courses ON Courses.CourseId=Classes.CourseId
where Quizzes.ClassId IN (select Classes.ClassId from Classes where Classes.ClassId IN (select ClassStudents.ClassId from ClassStudents where ClassStudents.StudentId=@StudentId)) and Quizzes.QuizDate &gt;= @QuizDate" OnSelecting="StudentQuizDataSource_Selecting">
                    <SelectParameters>
                      <asp:Parameter Name="StudentId" />
                      <asp:Parameter Name="QuizDate" />
                    </SelectParameters>
                  </asp:SqlDataSource>
</asp:Content>

