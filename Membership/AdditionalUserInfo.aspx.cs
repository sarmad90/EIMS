using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Membership_AdditionalUserInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void UserProfileDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        //get a reference to the currently logged on user
        MembershipUser currentUser = Membership.GetUser();

        //determine the currently logged on user's user id
        Guid currentUserId = (Guid)currentUser.ProviderUserKey;

        //assign the currently logged on user's user id to the @userid parameter
        e.Command.Parameters["@UserId"].Value = currentUserId;
    }
    protected void UserProfile_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        SettingsUpdatedMessage.Visible = true;
    }
}