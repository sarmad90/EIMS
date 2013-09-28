using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using System.Data.SqlClient;

public partial class Administration_TeacherProfile : System.Web.UI.Page
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
          TeacherUserName.Text = userName;
          DataView dvSql = (DataView)TeacherDataSource.Select(DataSourceSelectArguments.Empty);
          foreach (DataRowView drvSql in dvSql)
          {
              TeacherName.Text = drvSql["FirstName"].ToString();
              TeacherLastName.Text = drvSql["LastName"].ToString();
              TeacherEducation.Text = drvSql["Education"].ToString();
              TeacherContact.Text = drvSql["Contact"].ToString();
              TeacherEmail.Text = drvSql["Email"].ToString();
              TeacherDesignation.Text = drvSql["Designation"].ToString();
              if (drvSql["Avatar"].ToString() != "")
              {
                UserPicture.ImageUrl = drvSql["Avatar"].ToString();
              }
          }
    }

    protected void TeacherDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
      MembershipUser teacher;

      if (Request.QueryString["id"] != null)
      {
        teacher = Membership.GetUser(Request.QueryString["id"].ToString());
      }
      // if user name is not present in the query string then look for it in the session then assigns it to the datasource parameter
      else
      {
        teacher = Membership.GetUser(User.Identity.Name);
      }
      Guid teacherId = (Guid)teacher.ProviderUserKey;
      //assign the currently logged on user's user id to the @userid parameter
      e.Command.Parameters["@TeacherId"].Value = teacherId;
    }
}