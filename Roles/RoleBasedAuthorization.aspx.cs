using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Roles_RoleBasedAuthorization : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            BindUserGrid();   
    }

    private void BindUserGrid()
    {
        MembershipUserCollection allUsers = Membership.GetAllUsers();
        UserGrid.DataSource = allUsers;
        UserGrid.DataBind();
    }
    protected void UserGrid_RowEditing(object sender, GridViewEditEventArgs e)
    {
        // Set the grid's EditIndex and rebind the data

        UserGrid.EditIndex = e.NewEditIndex;
        BindUserGrid();
    }
    protected void UserGrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        // Revert the grid's EditIndex to -1 and rebind the data
        UserGrid.EditIndex = -1;
        BindUserGrid();
    }
    protected void UserGrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        //exit the page if invalid
        if (!Page.IsValid)
        {
            return;
        }

        //determine the username of the user we are editing
        string userName = UserGrid.DataKeys[e.RowIndex].Value.ToString();

        //read in the entered information and update the user
        TextBox EmailTextBox = UserGrid.Rows[e.RowIndex].FindControl("Email") as TextBox;
        TextBox CommentTextBox = UserGrid.Rows[e.RowIndex].FindControl("Comment") as TextBox;

        //return information about the user
        MembershipUser UserInfo = Membership.GetUser(userName);

        //update the user account information
        UserInfo.Email = EmailTextBox.Text.Trim();
        UserInfo.Comment = CommentTextBox.Text.Trim();

        Membership.UpdateUser(UserInfo);

        //revert the grid's editindex to -1 and  rebind the data
        UserGrid.EditIndex = -1;
        BindUserGrid();


    }

    protected void UserGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        // Determine the username of the user we are editing
        string UserName = UserGrid.DataKeys[e.RowIndex].Value.ToString();

        // Delete the user
        Membership.DeleteUser(UserName);

        // Revert the grid's EditIndex to -1 and rebind the data
        UserGrid.EditIndex = -1;
        BindUserGrid();
    }
    protected void UserGrid_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != UserGrid.EditIndex)
        {
            //programatically reference the edit and delete LinkButtons
            LinkButton EditButton = e.Row.FindControl("EditButton") as LinkButton;
            LinkButton DeleteButton = e.Row.FindControl("DeleteButton") as LinkButton;

            EditButton.Visible = (User.IsInRole("Administrator") || User.IsInRole("Parent"));
            DeleteButton.Visible = User.IsInRole("Administrator");
        }
    }
}