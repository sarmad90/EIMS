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
        if (Request.QueryString["id"] != null)
        {

            //MembershipUser student = Membership.GetUser(Request.QueryString["id"].ToString());
            //StudentEmail.Text = student.Email.ToString();
            //StudentUserName.Text = student.UserName.ToString();
            TeacherUserName.Text= Request.QueryString["id"].ToString();
            DataView dvSql = (DataView)TeacherDataSource.Select(DataSourceSelectArguments.Empty);
            foreach (DataRowView drvSql in dvSql)
            {
                TeacherName.Text = drvSql["FirstName"].ToString();
                TeacherLastName.Text = drvSql["LastName"].ToString();
                TeacherEducation.Text = drvSql["Education"].ToString();
                TeacherContact.Text = drvSql["Contact"].ToString();
                TeacherEmail.Text = drvSql["Email"].ToString();
                TeacherDesignation.Text = drvSql["Designation"].ToString();
            }

        }
    }

    protected void TeacherDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        MembershipUser teacher = Membership.GetUser(Request.QueryString["id"].ToString());
        Guid teacherId = (Guid)teacher.ProviderUserKey;
        //assign the currently logged on user's user id to the @userid parameter
        e.Command.Parameters["@TeacherId"].Value = teacherId;
    }
}