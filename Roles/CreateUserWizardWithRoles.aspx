<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CreateUserWizardWithRoles.aspx.cs" Inherits="Roles_CreateUserWizardWithRoles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:CreateUserWizard ID="RegisterUserWithRoles" runat="server" OnActiveStepChanged="RegisterUserWithRoles_ActiveStepChanged" CompleteSuccessText="The account has been successfully created." LoginCreatedUser="False">
        <WizardSteps>
            <asp:CreateUserWizardStep runat="server" />
            <asp:WizardStep ID="SpecifyRolesStep" runat="server" AllowReturn="False" StepType="Step">
                <asp:CheckBoxList ID="RoleList" runat="server">
                </asp:CheckBoxList>
            </asp:WizardStep>
            <asp:CompleteWizardStep runat="server" />
        </WizardSteps>
    </asp:CreateUserWizard>
</asp:Content>


