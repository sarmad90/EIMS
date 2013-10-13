<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Attendance.aspx.cs" Inherits="Students_Attendance" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <div class="row">
    <div class="span10 offset1">
      <asp:GridView ID="StudentAttendanceGrid" runat="server" AutoGenerateColumns="False" DataSourceID="StudentAttendanceDataSource" AllowPaging="True" PageSize="20" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="800px">
                    <Columns>
                      <asp:BoundField DataField="AttendanceWeek" HeaderText="Week" SortExpression="AttendanceWeek" >
                      <ItemStyle HorizontalAlign="Center" />
                      </asp:BoundField>
                      <asp:BoundField DataField="SemesterName" HeaderText="Semester" SortExpression="SemesterName" >
                      <ItemStyle HorizontalAlign="Center" />
                      </asp:BoundField>
                      <asp:BoundField DataField="TotalClasses" HeaderText="TotalClasses" SortExpression="TotalClasses" >
                      <ItemStyle HorizontalAlign="Center" />
                      </asp:BoundField>
                      <asp:BoundField DataField="ClassesAttended" HeaderText="Attended" SortExpression="ClassesAttended" >
                      <ItemStyle HorizontalAlign="Center" />
                      </asp:BoundField>
                      <asp:BoundField DataField="ClassesMissed" HeaderText="Missed" SortExpression="ClassesMissed" >
                      <ItemStyle HorizontalAlign="Center" />
                      </asp:BoundField>
                      <asp:BoundField DataField="AttendancePercentage" HeaderText="Attendance" SortExpression="AttendancePercentage" DataFormatString="{0:f2} %" >
                      <ItemStyle HorizontalAlign="Center" />
                      </asp:BoundField>
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
</asp:Content>

