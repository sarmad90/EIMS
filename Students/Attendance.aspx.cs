using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Students_Attendance : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void StudentAttendanceDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
      MembershipUser student = Membership.GetUser(User.Identity.Name);
      Guid studentId = (Guid)student.ProviderUserKey;
      e.Command.Parameters["@StudentId"].Value = studentId;
    }
}