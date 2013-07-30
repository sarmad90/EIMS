using System;
using System.Web.Security;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class Membership_EnhancedCreateUserWizard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void NewUserWizard_CreatedUser(object sender, EventArgs e)
    {
        //Get the user id of the just created user
        MembershipUser newUser = Membership.GetUser(NewUserWizard.UserName);
        Guid newUserId = (Guid)newUser.ProviderUserKey;

        //insert a new record in the user profiles
        string connectionString = ConfigurationManager.ConnectionStrings["EIMSConnectionString"].ConnectionString;
        string insertSql = "INSERT INTO UserProfiles (UserId,HomeTown,HomePageUrl,Signature) VALUES(@UserID,@HomeTown,@HomePageUrl,@Signature)";

        using (SqlConnection myConnection = new SqlConnection(connectionString))
        {
            myConnection.Open();
            SqlCommand myCommand = new SqlCommand(insertSql, myConnection);
            myCommand.Parameters.AddWithValue("@UserId", newUserId);
            myCommand.Parameters.AddWithValue("@HomeTown", DBNull.Value);
            myCommand.Parameters.AddWithValue("@HomePageUrl", DBNull.Value);
            myCommand.Parameters.AddWithValue("@Signature", DBNull.Value);
            myCommand.ExecuteNonQuery();
            myConnection.Close();
        }
    }
}