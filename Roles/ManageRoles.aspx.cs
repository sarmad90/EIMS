using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Roles_ManageRoles : System.Web.UI.Page
{
    private void DisplayRolesInGrid()
    {
        RoleList.DataSource = Roles.GetAllRoles();
        RoleList.DataBind();
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            DisplayRolesInGrid();
    }
    protected void CreateRoleButton_Click(object sender, EventArgs e)
    {
        string newRoleName = RoleName.Text.Trim();
        if (!Roles.RoleExists(newRoleName))
        {
            //Create the role
            Roles.CreateRole(newRoleName);
            // Refresh the RoleList Grid    
            DisplayRolesInGrid();    
            
        }
        RoleName.Text = string.Empty;
    }
    protected void RoleList_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //get the RoleNameLabel
        Label RoleNameLabel = RoleList.Rows[e.RowIndex].FindControl("RoleNameLabel") as Label;

        //delete the role
        Roles.DeleteRole(RoleNameLabel.Text, false);
        DisplayRolesInGrid(); 
    }
}