<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AddStudent.aspx.cs" Inherits="Administration_AddStudent" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <asp:CreateUserWizard ID="AddNewStudent" runat="server" LoginCreatedUser="False" OnCreatedUser="AddNewStudent_CreatedUser" Question="What's your mother first name?" OnActiveStepChanged="AddNewStudent_ActiveStepChanged" CreateUserButtonText="Create Account" AutoGeneratePassword="True" ContinueDestinationPageUrl="~/Administration/Dashboard.aspx">    
    <WizardSteps>
      <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
        <ContentTemplate>
        <!-- -->
          <div class="container" id="wrap">
	          <div class="row">
              <div class="col-md-6 col-md-offset-3">
                <legend>Students Registraion</legend>
                <h4>Educational Institute Management System</h4>
                <div class="row">
                  <div class="col-xs-6 col-md-6">
                    <asp:TextBox ID="FirstName" runat="server" CssClass="form-control input-lg" placeholder="First Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="FirstNameRequired" runat="server" ControlToValidate="FirstName" ErrorMessage="First Name is required." ToolTip="First Name is required." ValidationGroup="AddNewStudent">*</asp:RequiredFieldValidator>
                  </div>
                  <div class="col-xs-6 col-md-6">
                    <asp:TextBox ID="LastName" runat="server" required="true" CssClass="form-control input-lg" placeholder="Last Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="LastName" ErrorMessage="Last Name is required." ToolTip="Last Name is required." ValidationGroup="AddNewStudent">*</asp:RequiredFieldValidator>
                  </div>
                </div>
                <div class="row">&nbsp;</div>
                <div class="row">
                  <div class="col-xs-6 col-md-6">
                    <asp:TextBox ID="UserName" runat="server" CssClass="form-control input-lg" placeholder="Username"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="AddNewStudent">*</asp:RequiredFieldValidator>
                  </div>
                  <div class="col-xs-6 col-md-6">
                    <asp:TextBox ID="RollNum" runat="server" CssClass="form-control input-lg" placeholder="Roll No"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="RollNum" ErrorMessage="Roll No. is required." ToolTip="Roll No. is required." ValidationGroup="AddNewStudent">*</asp:RequiredFieldValidator>
                  </div>
                </div>
                <div class="row">&nbsp;</div>
                <div class="row">
                  <div class="col-md-12">
                    <asp:TextBox ID="Email" runat="server" CssClass="form-control input-lg" placeholder="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="AddNewStudent">*</asp:RequiredFieldValidator>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-12">
                    <asp:TextBox ID="Address" runat="server" CssClass="form-control input-lg" placeholder="Address"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="Address" ErrorMessage="Address is required." ToolTip="Address is required." ValidationGroup="AddNewStudent">*</asp:RequiredFieldValidator>
                  </div>
                </div>
                <div class="row">&nbsp;</div>
                <div class="row">
                  <div class="col-xs-6 col-md-6">
                    <asp:TextBox ID="Contact" runat="server" CssClass="form-control input-lg" placeholder="Contact No"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Contact" ErrorMessage="Contact No. is required." ToolTip="Contact No. is required." ValidationGroup="AddNewStudent">*</asp:RequiredFieldValidator>
                  </div>
                  <div class="col-xs-6 col-md-6">
                    <asp:DropDownList ID="Department" runat="server" CssClass="form-control input-lg"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Department" ErrorMessage="Department is required." ToolTip="Department is required." ValidationGroup="AddNewStudent">*</asp:RequiredFieldValidator>
                  </div>
                </div>
                <div class="row">&nbsp;</div>
                <div class="row">
                  <div class="col-xs-6 col-md-6">
                    <asp:DropDownList ID="Gender" runat="server" CssClass="form-control input-lg">
                      <asp:ListItem Selected="True">Male</asp:ListItem>
                      <asp:ListItem>Female</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="Gender" ErrorMessage="Gender is required." ToolTip="Gender is required." ValidationGroup="AddNewStudent">*</asp:RequiredFieldValidator>
                  </div>
                  <div class="col-xs-6 col-md-6">
                    <asp:DropDownList ID="Batch" runat="server" CssClass="form-control input-lg"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Batch" ErrorMessage="Batch is required." ToolTip="Batch is required." ValidationGroup="AddNewStudent">*</asp:RequiredFieldValidator>
                  </div>
                </div>
                <div class="row">&nbsp;</div>
                <div class="row">
                  <div class="col-xs-6 col-md-6">
                    <input type="password" name="password" value="" class="form-control input-lg" placeholder="SecurityQuestion"  />

                  </div>
                  <div class="col-xs-6 col-md-6">
                    <input type="password" name="confirm_password" value="" class="form-control input-lg" placeholder="SecurityAnswer"  />

                  </div>
                </div>
                <div class="row">&nbsp;</div>
                <div class="row">
                  <div class="col-xs-6 col-md-6">
                    <input type="password" name="password" value="" class="form-control input-lg" placeholder="Password"  />

                  </div>
                  <div class="col-xs-6 col-md-6">
                    <input type="password" name="confirm_password" value="" class="form-control input-lg" placeholder="Confirm Password"  />

                  </div>
                </div>
                <div class="row">
                  <div class="col-md-12">
                    <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                  </div>
                </div>
                <br />
                <button class="btn btn-lg btn-primary btn-block signup-btn" type="submit">Create account</button>         
              </div>
            </div>            
          </div>
        <!-- -->
          <table>
            <tr>
                <td align="center" colspan="2">Register a student</td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                </td>
                <td>
                    
                </td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Label ID="FirstNameLabel" runat="server" AssociatedControlID="FirstName">First Name:</asp:Label>
                </td>
                <td>
                   
                </td>
            </tr>
              <tr>
                <td align="right">
                    <asp:Label ID="LastNameLabel" runat="server" AssociatedControlID="LastName">Last Name:</asp:Label>
                </td>
                <td>
                    
                </td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Label ID="ContactLabel" runat="server" AssociatedControlID="Contact">Contact No.:</asp:Label>
                </td>
                <td>
                    
                </td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Label ID="Label1" runat="server" AssociatedControlID="Gender">Gender:</asp:Label>
                </td>
                <td>
                    
                </td>
            </tr>
              <tr>
                <td align="right">
                    <asp:Label ID="DepartmentLabel" runat="server" AssociatedControlID="Department">Department:</asp:Label>
                </td>
                <td>
                    
                </td>
            </tr>
              <tr>
                <td align="right">
                    <asp:Label ID="BatchLabel" runat="server" AssociatedControlID="Batch">Batch:</asp:Label>
                </td>
                <td>
                    
                </td>
            </tr>
              <tr>
                <td align="right">
                    <asp:Label ID="RollNumLabel" runat="server" AssociatedControlID="RollNum">Roll No.:</asp:Label>
                </td>
                <td>
                    
                </td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Label ID="Label2" runat="server" AssociatedControlID="Address">Address :</asp:Label>
                </td>
                <td>
                    
                </td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                </td>
                <td>
                    
                </td>
            </tr>
      
            <tr>
              <td align="center" colspan="2">
            </tr>
            <tr>
              <td align="center" colspan="2" style="color:Red;"></td>
            </tr>
          </table>
        </ContentTemplate>
      </asp:CreateUserWizardStep>
        <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
        </asp:CompleteWizardStep>
    </WizardSteps>
  </asp:CreateUserWizard>
  <asp:SqlDataSource ID="DepartmentsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" SelectCommand="SELECT [DepartmentId], [DepartmentName], [DepartmentInitials] FROM [Departments]"></asp:SqlDataSource>
  <asp:SqlDataSource ID="BatchesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" SelectCommand="SELECT [BatchId], [BatchName] FROM [Batches]"></asp:SqlDataSource>
</asp:Content>

