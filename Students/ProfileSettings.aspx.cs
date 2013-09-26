using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Students_ProfileSettings : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      DataView studentDataView = (DataView)StudentDataSource.Select(DataSourceSelectArguments.Empty);
      foreach (DataRowView dvr in studentDataView)
      {
        TxtFirstName.Text = dvr["FirstName"].ToString();
        TxtLastName.Text = dvr["LastName"].ToString();
        TxtContact.Text = dvr["Contact"].ToString();
        TxtEmail.Text = dvr["Email"].ToString();
        TxtAddress.Text = dvr["Address"].ToString();
        LblBatch.Text = dvr["BatchName"].ToString();
        LblDepartment.Text = dvr["DepartmentName"].ToString();
        LblRollNum.Text = dvr["RollNo"].ToString();
        if (dvr["Gender"].ToString()=="Female")
        {
          DDGender.SelectedIndex = 1;
        }
        if (dvr["Avatar"].ToString()!="")
        {
          DisplayPicture.ImageUrl = dvr["Avatar"].ToString();
        }
      }
    }
    protected void StudentDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
      MembershipUser student = Membership.GetUser(User.Identity.Name);
      Guid studentId = (Guid)student.ProviderUserKey;
      e.Command.Parameters["@StudentId"].Value = studentId;
    }
    protected void UpdateProfile_Click(object sender, EventArgs e)
    {
      //FUDisplayPic.SaveAs("~/img/StudentAvatars/Display_picture_" + User.Identity.Name);
      string ext = System.IO.Path.GetExtension(this.FUDisplayPic.PostedFile.FileName);
      FUDisplayPic.SaveAs(Server.MapPath("~/img/StudentAvatars/Display_picture_" + User.Identity.Name + ext));
      LblBatch.Text = Server.MapPath("~/img/StudentAvatars/Display_picture_" + User.Identity.Name + ext);
    }
}