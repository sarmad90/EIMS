using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;

public partial class Parents_Children : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      Repeater1.DataSource = ChildrenDataSource;
      Repeater1.DataBind();
      
    }
    protected void ChildrenDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
      // retrieves the user key from the user instance
      //MembershipUser parent = Membership.GetUser(User);

      //assign the currently logged on user's user id to the @userid parameter
      MembershipUser parent = Membership.GetUser(User.Identity.Name);
      Guid parentId = (Guid)parent.ProviderUserKey;
      e.Command.Parameters["@ParentId"].Value = parentId;
    }
}