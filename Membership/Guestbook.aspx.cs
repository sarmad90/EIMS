using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Security;

public partial class Membership_Guestbook : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void PostCommentButton_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid)
            return;

        //Determine the currently logged on user's user id
        MembershipUser currentUser = Membership.GetUser();
        Guid currentUserId = (Guid)currentUser.ProviderUserKey;

        //insert a new record into guestbookComments
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["EIMSConnectionString"].ConnectionString;
        string insertSql = "INSERT INTO GuestbookComments(Subject, Body, UserId) VALUES(@Subject,@Body, @UserId)";
        using (SqlConnection myConnection = new SqlConnection(connectionString))
        {
            myConnection.Open();
            SqlCommand myCommand = new SqlCommand(insertSql, myConnection);
            myCommand.Parameters.AddWithValue("@Subject", Subject.Text.Trim());
            myCommand.Parameters.AddWithValue("@Body", Body.Text.Trim());
            myCommand.Parameters.AddWithValue("@UserId", currentUserId);
            myCommand.ExecuteNonQuery();
            myConnection.Close();
            Subject.Text = string.Empty;
            Body.Text = string.Empty;
        }
    }
}