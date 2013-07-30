using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Roles_UsersAndRoles : System.Web.UI.Page
{
    private void CheckRolesForSelectedUser()
    {
        //determine what roles the selected user belongs to
        string selectedUserName = UserList.SelectedValue;
        string[] selectedUserRoles = Roles.GetRolesForUser(selectedUserName);

        //Loop thorugh the repeater's items and check or uncheck the checkbox as needed
        foreach (RepeaterItem ri in UsersRoleList.Items)
        {
            //Programatically referance the checkbox
            CheckBox RoleCheckBox = ri.FindControl("RoleCheckBox") as CheckBox;
            
            //see if the RoleCheckBox.text is in selectedUserRoles
            if (selectedUserRoles.Contains<string>(RoleCheckBox.Text))
                RoleCheckBox.Checked = true;
            else
                RoleCheckBox.Checked = false;
        }

    }
    

    private void BindUsersToUserList()
    {
        // Get all of the user accounts 
        MembershipUserCollection users = Membership.GetAllUsers();
        UserList.DataSource = users;
        UserList.DataBind();
    }

    private void DisplayUsersBelongingToRole()
    {
        // Get the selected role 
        string selectedRoleName = RoleList.SelectedValue;

        // Get the list of usernames that belong to the role 
        string[] usersBelongingToRole = Roles.GetUsersInRole(selectedRoleName);

        // Bind the list of users to the GridView 
        RolesUserList.DataSource = usersBelongingToRole;
        RolesUserList.DataBind();
    }

    private void BindRolesToList()
    {
        // Get all of the roles 
        string[] roles = Roles.GetAllRoles();
        UsersRoleList.DataSource = roles;
        UsersRoleList.DataBind();

        RoleList.DataSource = roles;
        RoleList.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            // Bind the users and roles 
            BindUsersToUserList();
            BindRolesToList();
            // Check the selected user's roles 
            CheckRolesForSelectedUser();

            // Display those users belonging to the currently selected role 
            DisplayUsersBelongingToRole(); 
        } 
    }
    protected void UserList_SelectedIndexChanged(object sender, EventArgs e)
    {
        CheckRolesForSelectedUser(); 
    }

    protected void RoleCheckBox_CheckChanged(object sender, EventArgs e)
    {
        //reference the checkbox that raised the event
        CheckBox RoleCheckBox = sender as CheckBox;
        //Get the currently selected user and role
        string selectedUserName = UserList.SelectedValue;
        string roleName = RoleCheckBox.Text;

        //Determine if we need to add or remover the user from this role
        if (RoleCheckBox.Checked)
        {
            //Add the user to the role
            Roles.AddUserToRole(selectedUserName, roleName);
            //Display a status message
            ActionStatus.Text = string.Format("User {0} was added to the role {1}", selectedUserName, roleName);
        }
        else
        {
            //Remove the userfrom the role
            Roles.RemoveUserFromRole(selectedUserName, roleName);
            //display message
            ActionStatus.Text = string.Format("User {0} was removed from role {1}",selectedUserName,roleName);
        }
    }
    protected void RoleList_SelectedIndexChanged(object sender, EventArgs e)
    {
        DisplayUsersBelongingToRole(); 
    }
    protected void RolesUserList_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        // Get the selected role 
        string selectedRoleName = RoleList.SelectedValue;

        // Reference the UserNameLabel 
        Label UserNameLabel = RolesUserList.Rows[e.RowIndex].FindControl("UserNameLabel") as Label;

        // Remove the user from the role 
        Roles.RemoveUserFromRole(UserNameLabel.Text, selectedRoleName);

        // Refresh the GridView 
        DisplayUsersBelongingToRole();

        // Display a status message 
        ActionStatus.Text = string.Format("User {0} was removed from role {1}.", UserNameLabel.Text, selectedRoleName);

        // Refresh the "by user" interface 
        CheckRolesForSelectedUser(); 
    }
    protected void AddUserToRoleButton_Click(object sender, EventArgs e)
    {
        //Get the selected role and the username
        string selectedRoleName = RoleList.SelectedValue;
        string userNameToAddToRole = UserNameToAddToRole.Text;

        //make sure that a value was entered
        if (UserNameToAddToRole.Text.Trim().Length == 0)
        {
            ActionStatus.Text = "You must enter a username in the textbox";
            return;
        }

        //Make user the username exist in the system
        MembershipUser userInfo = Membership.GetUser(userNameToAddToRole);
        if (userInfo == null)
        {
            ActionStatus.Text=string.Format("The User {0} doesnt exist in the system",userNameToAddToRole);
            return;
        }   

        //Make sure that the user doesnt already belongs to this role
        if(Roles.IsUserInRole(userNameToAddToRole,selectedRoleName))
        {
            ActionStatus.Text=string.Format("User {0} already is a member of role {1}",userNameToAddToRole,selectedRoleName);
            return;
        }

        //if we reach here we need to add the user to the selected role
        Roles.AddUserToRole(userNameToAddToRole, selectedRoleName);

        //clear out the texbox
        UserNameToAddToRole.Text = string.Empty;

        //refresh the gridview
        DisplayUsersBelongingToRole();

        //display a status message
        ActionStatus.Text=string.Format("User{0} was added to the role {1}",userNameToAddToRole,selectedRoleName);

        // Refresh the "by user" interface 
        CheckRolesForSelectedUser(); 

    }
}