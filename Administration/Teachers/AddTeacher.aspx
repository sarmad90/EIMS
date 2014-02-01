<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AddTeacher.aspx.cs" Inherits="Administration_AddTeachers" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:CreateUserWizard ID="AddNewTeacher" runat="server" LoginCreatedUser="False" Question="What's your mother first name?" OnActiveStepChanged="AddNewTeacher_ActiveStepChanged" CreateUserButtonText="Create Account" AutoGeneratePassword="True" ContinueDestinationPageUrl="~/Administration/Dashboard.aspx">
      <CreateUserButtonStyle CssClass="btn btn-lg btn-primary btn-block signup-btn" />
        <WizardSteps>
            <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                <ContentTemplate>
                <!-- -->
                  <div class="container" id="wrap">
	                  <div class="row">
                      <div class="col-md-6 col-md-offset-3">
                        <legend>Teachers Registraion</legend>
                        <h4>Educational Institute Management System</h4>
                        <div class="row">
                          <div class="col-xs-6 col-md-6"><input type="text" name="firstname" value="" class="form-control input-lg" placeholder="First Name"  /></div>
                          <div class="col-xs-6 col-md-6"><input type="text" name="lastname" value="" class="form-control input-lg" placeholder="Last Name"  /></div>
                        </div>
                        <div class="row">&nbsp;</div>
                        <div class="row"><div class="col-md-12"><input type="text" name="email" value="" class="form-control input-lg" placeholder="Your Email"  /></div></div>
                        <div class="row">&nbsp;</div>
                        <div class="row">
                          <div class="col-xs-6 col-md-6"><input type="password" name="password" value="" class="form-control input-lg" placeholder="Password"  /></div>
                          <div class="col-xs-6 col-md-6"><input type="password" name="confirm_password" value="" class="form-control input-lg" placeholder="Confirm Password"  /></div>
                        </div>
                        <label>Gender : </label>
                        <label class="radio-inline">
                          <input type="radio" name="gender" value="M" id=male />Male
                        </label>
                        <label class="radio-inline">
                          <input type="radio" name="gender" value="F" id=female />Female
                        </label>
                        <br />
                        <button class="btn btn-lg btn-primary btn-block signup-btn" type="submit">Create my account</button>         
                      </div>
                    </div>            
                  </div>
                <!-- -->
                    <table>
                        <tr>
                            <td align="center" colspan="2">Register a Teacher</td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="AddNewStudent">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="FirstNameLabel" runat="server" AssociatedControlID="FirstName">First Name:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="FirstName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="FirstNameRequired" runat="server" ControlToValidate="FirstName" ErrorMessage="First Name is required." ToolTip="First Name is required." ValidationGroup="AddNewStudent">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                         <tr>
                            <td align="right">
                                <asp:Label ID="LastNameLabel" runat="server" AssociatedControlID="LastName">Last Name:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="LastName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="LastName" ErrorMessage="Last Name is required." ToolTip="Last Name is required." ValidationGroup="AddNewStudent">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="Label1" runat="server" AssociatedControlID="Gender">Gender:</asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="Gender" runat="server">
                                    <asp:ListItem>Female</asp:ListItem>
                                    <asp:ListItem Selected="True">Male</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="Gender" ErrorMessage="Gender is required." ToolTip="Gender is required." ValidationGroup="AddNewStudent">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="ContactLabel" runat="server" AssociatedControlID="Contact">Contact No.:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Contact" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Contact" ErrorMessage="Contact No. is required." ToolTip="Contact No. is required." ValidationGroup="AddNewStudent">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="DesignationLabel" runat="server" AssociatedControlID="Designation">Designation:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Designation" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Designation" ErrorMessage="Designation is required." ToolTip="Designation is required." ValidationGroup="AddNewStudent">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>

                         <tr>
                            <td align="right">
                                <asp:Label ID="EducationLabel" runat="server" AssociatedControlID="Education">Education:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Education" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Education" ErrorMessage="Education is required." ToolTip="Education is required." ValidationGroup="AddNewStudent">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                         <tr>
                            <td align="right">
                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="AddNewStudent">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required." ValidationGroup="AddNewStudent">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="AddNewStudent">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">Security Question:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Question" runat="server">What&#39;s your mother first name?</asp:TextBox>
                                <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question" ErrorMessage="Security question is required." ToolTip="Security question is required." ValidationGroup="AddNewStudent">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Security Answer:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer" ErrorMessage="Security answer is required." ToolTip="Security answer is required." ValidationGroup="AddNewStudent">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match." ValidationGroup="AddNewStudent"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2" style="color:Red;">
                                <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:CreateUserWizardStep>
            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
            </asp:CompleteWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>
</asp:Content>

