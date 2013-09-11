using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;

public partial class Administration_ParentProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      string userName;
      //setting the userName variable based on query string or user name value in the session
      if (Request.QueryString["id"] != null)
      {
        userName = Request.QueryString["id"].ToString();
      }
      else
      {
        userName = User.Identity.Name;
      }
          ParentUserName.Text = userName;
            DataView dvSql = (DataView)ParentDataSource.Select(DataSourceSelectArguments.Empty);
            foreach (DataRowView drvSql in dvSql)
            {
                ParentName.Text = drvSql["FirstName"].ToString();
                ParentLastName.Text = drvSql["LastName"].ToString();
                ParentAddress.Text = drvSql["Address"].ToString();
                ParentContact.Text = drvSql["Contact"].ToString();
                ParentEmail.Text = drvSql["Email"].ToString();
            }
    }

    protected void ParentDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
      MembershipUser parent;
      if (Request.QueryString["id"] != null)
      {
        parent = Membership.GetUser(Request.QueryString["id"].ToString());
      }
      // if user name is not present in the query string then look for it in the session then assigns it to the datasource parameter
      else
      {
        parent = Membership.GetUser(User.Identity.Name);
      }
      Guid parentId = (Guid)parent.ProviderUserKey;
      //assign the currently logged on user's user id to the @userid parameter
      e.Command.Parameters["@ParentId"].Value = parentId;
    }
}