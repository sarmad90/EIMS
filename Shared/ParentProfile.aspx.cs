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
        if (Request.QueryString["id"] != null)
        {

            //MembershipUser student = Membership.GetUser(Request.QueryString["id"].ToString());
            //StudentEmail.Text = student.Email.ToString();
            //StudentUserName.Text = student.UserName.ToString();
            ParentUserName.Text = Request.QueryString["id"].ToString();
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
    }
    protected void ParentDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        MembershipUser parent = Membership.GetUser(Request.QueryString["id"].ToString());
        Guid parentId = (Guid)parent.ProviderUserKey;
        //assign the currently logged on user's user id to the @userid parameter
        e.Command.Parameters["@ParentId"].Value = parentId;
    }
}