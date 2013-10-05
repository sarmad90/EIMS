using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Students_MyClasses : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      Repeater1.DataSource = ClassesDataSource;
      Repeater1.DataBind();
    }

    protected void ClassesDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
      MembershipUser user = Membership.GetUser(User.Identity.Name);
      Guid userId = (Guid)user.ProviderUserKey;
      e.Command.Parameters["@StudentId"].Value = userId;
    }
}