<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="StudentProfile.aspx.cs" Inherits="Administration_StudentProfile" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <!--<script type="text/javascript" src="/js/StudentProfile.js"></script>-->
    <div class="row">
        <div class="span3 offset1">
            <asp:Label ID="StudentName" runat="server" Font-Bold="True" Font-Size="X-Large"></asp:Label>
        </div> 
    </div>
    <div class="row">&nbsp;</div>
    <div class="row">
        <div class="span6 offset1">
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
          <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn" PostBackUrl='javascript:history.go(-1)'>Back</asp:LinkButton>
        </div>
      <!-- Results Section Start -->
      <asp:Panel ID="ResultsAdminPanel" runat="server">
      <div class="span6">
        <div class="accordion" id="accordion2">
          <div class="accordion-group">
            <div class="accordion-heading">
              <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
                Collapsible Group Item #1
              </a>
            </div>
            <div id="collapseOne" class="accordion-body collapse in">
              <div class="accordion-inner">
                Anim pariatur cliche...
              </div>
            </div>
          </div>
          <div class="accordion-group">
            <div class="accordion-heading">
              <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">
                Add Results
              </a>
            </div>
            <div id="collapseTwo" class="accordion-body collapse">
              <div class="accordion-inner">
                <div class="row">
                  <div class="span1"><asp:Label ID="Label2" runat="server" Text="Semester:  "></asp:Label></div>
                  <div class="span1"><asp:TextBox ID="TxtSemester" CssClass="input-mini" runat="server"></asp:TextBox></div>
                  <div class="span1"><asp:Label ID="Label3" runat="server" Text="Status:  "></asp:Label></div>
                  <div class="span1"><asp:TextBox ID="TxtStatus" CssClass="input-mini" runat="server"></asp:TextBox></div>
                </div>
                <div class="row">
                  <div class="span1"><asp:Label ID="Label4" runat="server" Text="GPA:  "></asp:Label></div>
                  <div class="span1"><asp:TextBox ID="TxtGPA" CssClass="input-mini" runat="server"></asp:TextBox></div>
                  <div class="span1"><asp:Label ID="Label6" runat="server" Text="Attendance:  "></asp:Label></div>
                  <div class="span1"><asp:TextBox ID="TxtAttendance" CssClass="input-mini" runat="server"></asp:TextBox></div>
                </div>
                <div class="row">
                  <div class="span1"><asp:Label ID="Label5" runat="server" Text="Passing Date:  "></asp:Label></div>
                  <div class="span1">
                    <asp:Calendar ID="PassingDate" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
                      <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                      <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                      <OtherMonthDayStyle ForeColor="#999999" />
                      <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                      <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                      <TodayDayStyle BackColor="#CCCCCC" />
                    </asp:Calendar>
                  </div>
                </div>
                <div class="row"><div class="span4 offset1"><hr /></div></div>
                <div class="row">
                  <div class="span6">
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
                  <div class="span6">
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
                  <div class="span6">
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
                  <div class="span6">
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
                  <div class="span6">
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
                  <div class="span6">
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
              </div>
              <div class="form-actions">
                <asp:Button ID="AddResult" runat="server" Text="Add" CssClass="btn btn-primary" OnClick="AddResult_Click" />
              </div>
            </div>
          </div>
        </div>
      </div>
      </asp:Panel>
      <!-- Results Section End -->
    </div>
    <div class="row"> &nbsp;</div>
    <div class="row">
      <!-- Administrator section-->
        <asp:Panel ID="CreateAssociationPanel" runat="server">
            <div class="span6 offset1">
                <div class="row">
                    <div class="span1"><asp:Label ID="Label1" runat="server" Text="Email: "></asp:Label></div>
                    <div class="span3"><asp:TextBox ID="ParentEmail" runat="server"></asp:TextBox></div>
                    <div class="span2"><asp:Button ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" /></div>
                </div>
                <asp:GridView ID="ParentAssociation" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False" OnSelectedIndexChanged="ParentAssociation_SelectedIndexChanged" >
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:BoundField DataField="UserName" HeaderText="UserName" />
                    </Columns>
                </asp:GridView>
                <asp:Label ID="CreateAssociationLabel" runat="server" Text=""></asp:Label>
            </div>
                  </asp:Panel>
            <asp:Panel ID="ShowAssociationPanel" runat="server" Visible="False">
              <div class="span6 offset1">
                <asp:Label ID="AssociationMessage" runat="server" Text=""></asp:Label>
                <asp:HyperLink ID="ParentLink" runat="server">asdasd</asp:HyperLink>
              </div>
            </asp:Panel>
      <!-- Assignments,Quizzes,Results and Attendance section start -->
      <asp:Panel ID="NonAdminPanel" runat="server">
        <div class="span10 offset1">
          <div class="accordion" id="Div1">
            <div class="accordion-group">
              <div class="accordion-heading">
                <a class="accordion-toggle" data-toggle="collapse" data-parent="#Div1" href="#Div2">
                  Attendance
                </a>
              </div>
              <div id="Div2" class="accordion-body collapse in">
                <div class="accordion-inner">
                  <p class="text-center"><b>Attendance</b></p>
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
                  Assignments
                </a>
              </div>
              <div id="Div4" class="accordion-body collapse">
                <div class="accordion-inner">
                  No Assignments
                </div>
              </div>
            </div>
          </div>
        </div>
      </asp:Panel>
      <!-- Assignments,Quizzes,Results and Attendance section end -->
      <asp:Panel ID="AttendancePanel" runat="server">
        <div class="span10 offset1">
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
StudentProfiles.RollNo, StudentProfiles.Contact
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

