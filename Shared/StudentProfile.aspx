<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="StudentProfile.aspx.cs" Inherits="Administration_StudentProfile" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <script type="text/javascript">
    $(document).ready(function () {
      if ($('#MainContent_TxtStatus').val() != "" || $('#MainContent_TxtSemester').val() != "" || $('#MainContent_TxtGPA').val() != "" || $('#MainContent_TxtAttendance').val() != "")
      {
        $(".collapse").collapse();
        if ($('.subject_fields_2').is(':visible'))
        {
          $('#MainContent_subject_fields_button_2').hide();
        }
        if ($('.subject_fields_3').is(':visible')) {
          $('#MainContent_subject_fields_button_3').hide();
        }
        if ($('.subject_fields_4').is(':visible')) {
          $('#MainContent_subject_fields_button_4').hide();
        }
        if ($('.subject_fields_5').is(':visible')) {
          $('#MainContent_subject_fields_button_5').hide();
        }
        if ($('.subject_fields_6').is(':visible')) {
          $('#MainContent_subject_fields_button_6').hide();
        }
      }
      else
      {
        $('.subject_fields_2').hide();
        $('.subject_fields_3').hide();
        $('.subject_fields_4').hide();
        $('.subject_fields_5').hide();
        $('.subject_fields_6').hide();
        $('#MainContent_subject_fields_button_3').hide();
        $('#MainContent_subject_fields_button_4').hide();
        $('#MainContent_subject_fields_button_5').hide();
        $('#MainContent_subject_fields_button_6').hide();
      }
      $('#MainContent_subject_fields_button_2').click(function () {
        $('.subject_fields_2').show();
        $('#MainContent_subject_fields_button_2').hide();
        $('#MainContent_subject_fields_button_3').show();
      });
      $('#MainContent_subject_fields_button_3').click(function () {
        $('.subject_fields_3').show();
        $('#MainContent_subject_fields_button_3').hide();
        $('#MainContent_subject_fields_button_4').show();
      });
      $('#MainContent_subject_fields_button_4').click(function () {
        $('.subject_fields_4').show();
        $('#MainContent_subject_fields_button_4').hide();
        $('#MainContent_subject_fields_button_5').show();
      });
      $('#MainContent_subject_fields_button_5').click(function () {
        $('.subject_fields_5').show();
        $('#MainContent_subject_fields_button_5').hide();
        $('#MainContent_subject_fields_button_6').show();
      });
      $('#MainContent_subject_fields_button_6').click(function () {
        $('.subject_fields_6').show();
        $('#MainContent_subject_fields_button_6').hide();
      });
    });
  </script>
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
                      <asp:TextBox ID="TextBox4" runat="server" CssClass="input-mini"></asp:TextBox>
                      <asp:Label ID="Label8" runat="server" Text="MarksObtained: "></asp:Label>
                      <asp:TextBox ID="TextBox6" runat="server" CssClass="input-mini" Width="25px"></asp:TextBox>
                      <asp:Label ID="Label9" runat="server" Text="TotalMarks: "></asp:Label>
                      <asp:TextBox ID="TextBox7" runat="server" CssClass="input-mini" Width="25px"></asp:TextBox>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="span6">
                    <asp:Image ID="subject_fields_button_2" runat="server" ImageUrl="~/img/add.png" />
                    <span class="subject_fields_2">
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <asp:Label ID="Label10" runat="server" Text="Subject: "></asp:Label>
                      <asp:TextBox ID="TextBox8" runat="server" CssClass="input-mini"></asp:TextBox>
                      <asp:Label ID="Label11" runat="server" Text="MarksObtained: "></asp:Label>
                      <asp:TextBox ID="TextBox9" runat="server" CssClass="input-mini" Width="25px"></asp:TextBox>
                      <asp:Label ID="Label12" runat="server" Text="TotalMarks: "></asp:Label>
                      <asp:TextBox ID="TextBox10" runat="server" CssClass="input-mini" Width="25px"></asp:TextBox>
                    </span>
                  </div>
                </div>
                <div class="row">
                  <div class="span6">
                    <asp:Image ID="subject_fields_button_3" runat="server" ImageUrl="~/img/add.png" />
                    <span class="subject_fields_3">
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <asp:Label ID="Label13" runat="server" Text="Subject: "></asp:Label>
                      <asp:TextBox ID="TextBox11" runat="server" CssClass="input-mini"></asp:TextBox>
                      <asp:Label ID="Label14" runat="server" Text="MarksObtained: "></asp:Label>
                      <asp:TextBox ID="TextBox12" runat="server" CssClass="input-mini" Width="25px"></asp:TextBox>
                      <asp:Label ID="Label15" runat="server" Text="TotalMarks: "></asp:Label>
                      <asp:TextBox ID="TextBox13" runat="server" CssClass="input-mini" Width="25px"></asp:TextBox>
                    </span>
                  </div>
                </div>
                <div class="row">
                  <div class="span6">
                    <asp:Image ID="subject_fields_button_4" runat="server" ImageUrl="~/img/add.png" />
                    <span class="subject_fields_4">
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <asp:Label ID="Label16" runat="server" Text="Subject: "></asp:Label>
                      <asp:TextBox ID="TextBox1" runat="server" CssClass="input-mini"></asp:TextBox>
                      <asp:Label ID="Label17" runat="server" Text="MarksObtained: "></asp:Label>
                      <asp:TextBox ID="TextBox2" runat="server" CssClass="input-mini" Width="25px"></asp:TextBox>
                      <asp:Label ID="Label18" runat="server" Text="TotalMarks: "></asp:Label>
                      <asp:TextBox ID="TextBox3" runat="server" CssClass="input-mini" Width="25px"></asp:TextBox>
                    </span>
                  </div>
                </div>
                <div class="row">
                  <div class="span6">
                    <asp:Image ID="subject_fields_button_5" runat="server" ImageUrl="~/img/add.png" />
                    <span class="subject_fields_5">
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <asp:Label ID="Label19" runat="server" Text="Subject: "></asp:Label>
                      <asp:TextBox ID="TextBox5" runat="server" CssClass="input-mini"></asp:TextBox>
                      <asp:Label ID="Label20" runat="server" Text="MarksObtained: "></asp:Label>
                      <asp:TextBox ID="TextBox14" runat="server" CssClass="input-mini" Width="25px"></asp:TextBox>
                      <asp:Label ID="Label21" runat="server" Text="TotalMarks: "></asp:Label>
                      <asp:TextBox ID="TextBox15" runat="server" CssClass="input-mini" Width="25px"></asp:TextBox>
                    </span>
                  </div>
                </div>
                <div class="row">
                  <div class="span6">
                    <asp:Image ID="subject_fields_button_6" runat="server" ImageUrl="~/img/add.png" />
                    <span class="subject_fields_6">
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <asp:Label ID="Label22" runat="server" Text="Subject: "></asp:Label>
                      <asp:TextBox ID="TextBox16" runat="server" CssClass="input-mini"></asp:TextBox>
                      <asp:Label ID="Label23" runat="server" Text="MarksObtained: "></asp:Label>
                      <asp:TextBox ID="TextBox17" runat="server" CssClass="input-mini" Width="25px"></asp:TextBox>
                      <asp:Label ID="Label24" runat="server" Text="TotalMarks: "></asp:Label>
                      <asp:TextBox ID="TextBox18" runat="server" CssClass="input-mini" Width="25px"></asp:TextBox>
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
      <div class="span6 offset1">
            <asp:Panel ID="ShowAssociationPanel" runat="server" Visible="False">
                <asp:Label ID="AssociationMessage" runat="server" Text=""></asp:Label>
                <asp:HyperLink ID="ParentLink" runat="server">asdasd</asp:HyperLink>
            </asp:Panel>
        </div>
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

