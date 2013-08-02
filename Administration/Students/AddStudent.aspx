<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AddStudent.aspx.cs" Inherits="Administration_AddStudent" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:CreateUserWizard ID="AddNewStudent" runat="server" LoginCreatedUser="False" OnCreatedUser="AddNewStudent_CreatedUser" Question="What's your mother first name?" OnActiveStepChanged="AddNewStudent_ActiveStepChanged">
        <WizardSteps>
            <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                <ContentTemplate>
                    <table>
                        <tr>
                            <td align="center" colspan="2">Register a student</td>
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
                                <asp:TextBox ID="LastName" runat="server" required="true"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="LastName" ErrorMessage="Last Name is required." ToolTip="Last Name is required." ValidationGroup="AddNewStudent">*</asp:RequiredFieldValidator>
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
                                <asp:Label ID="Label1" runat="server" AssociatedControlID="Gender">Gender:</asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="Gender" runat="server">
                                    <asp:ListItem Selected="True">Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="Gender" ErrorMessage="Gender is required." ToolTip="Gender is required." ValidationGroup="AddNewStudent">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                         <tr>
                            <td align="right">
                                <asp:Label ID="DepartmentLabel" runat="server" AssociatedControlID="Department">Department:</asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="Department" runat="server"></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Department" ErrorMessage="Department is required." ToolTip="Department is required." ValidationGroup="AddNewStudent">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                         <tr>
                            <td align="right">
                                <asp:Label ID="BatchLabel" runat="server" AssociatedControlID="Batch">Batch:</asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="Batch" runat="server"></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Batch" ErrorMessage="Batch is required." ToolTip="Batch is required." ValidationGroup="AddNewStudent">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                         <tr>
                            <td align="right">
                                <asp:Label ID="RollNumLabel" runat="server" AssociatedControlID="RollNum">Roll No.:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="RollNum" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="RollNum" ErrorMessage="Roll No. is required." ToolTip="Roll No. is required." ValidationGroup="AddNewStudent">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="Label2" runat="server" AssociatedControlID="Address">Address :</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Address" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="Address" ErrorMessage="Address is required." ToolTip="Address is required." ValidationGroup="AddNewStudent">*</asp:RequiredFieldValidator>
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
    <asp:SqlDataSource ID="DepartmentsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" SelectCommand="SELECT [DepartmentId], [DepartmentName], [DepartmentInitials] FROM [Departments]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="BatchesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EIMSConnectionString %>" SelectCommand="SELECT [BatchId], [BatchName] FROM [Batches]"></asp:SqlDataSource>
</asp:Content>

