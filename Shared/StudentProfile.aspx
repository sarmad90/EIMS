<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="StudentProfile.aspx.cs" Inherits="Administration_StudentProfile" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <link href="css/Crud.css" rel="stylesheet" type="text/css" />
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
        </div>
    </div>
    <div class="row">
        <div class="span2 offset1">
            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn" PostBackUrl='javascript:history.go(-1)'>Back</asp:LinkButton>
        </div>
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

