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

public partial class Teachers_ProfileSettings : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    if (!IsPostBack)
    {
      DataView studentDataView = (DataView)TeacherDataSource.Select(DataSourceSelectArguments.Empty);
      foreach (DataRowView dvr in studentDataView)
      {
        TxtFirstName.Text = dvr["FirstName"].ToString();
        TxtLastName.Text = dvr["LastName"].ToString();
        TxtContact.Text = dvr["Contact"].ToString();
        TxtEmail.Text = dvr["Email"].ToString();
        TxtEducation.Text = dvr["Education"].ToString();
        TxtDesignation.Text = dvr["Designation"].ToString();
        if (dvr["Gender"].ToString() == "Female")
        {
          DDGender.SelectedIndex = 1;
        }
        if (dvr["Avatar"].ToString() != "")
        {
          DisplayPicture.ImageUrl = dvr["Avatar"].ToString();
        }
      }
    }
  }
  protected void StudentDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
  {
    MembershipUser teacher = Membership.GetUser(User.Identity.Name);
    Guid teacherId = (Guid)teacher.ProviderUserKey;
    e.Command.Parameters["@TeacherId"].Value = teacherId;
  }
  protected void UpdateProfile_Click(object sender, EventArgs e)
  {
    MembershipUser teacher = Membership.GetUser(User.Identity.Name);
    Guid teacherId = (Guid)teacher.ProviderUserKey;
    string connectionString = ConfigurationManager.ConnectionStrings["EIMSConnectionString"].ConnectionString;

    string updateSql = "UPDATE TeacherProfiles SET FirstName=@FirstName,LastName=@LastName,Contact=@Contact,Education=@Education,Gender=@Gender,Avatar=@Avatar WHERE TeacherId=@TeacherId";
    string fileName;
    string ext = System.IO.Path.GetExtension(this.FUDisplayPic.PostedFile.FileName);
    fileName = Server.MapPath("~/img/TeacherAvatars/Display_picture_" + User.Identity.Name + ext);
    using (SqlConnection myConnection = new SqlConnection(connectionString))
    {
      myConnection.Open();
      SqlCommand myCommand = new SqlCommand(updateSql, myConnection);
      myCommand.Parameters.AddWithValue("@FirstName", TxtFirstName.Text);
      myCommand.Parameters.AddWithValue("@LastName", TxtLastName.Text);
      myCommand.Parameters.AddWithValue("@Contact", TxtContact.Text);
      myCommand.Parameters.AddWithValue("@Education", TxtEducation.Text);
      myCommand.Parameters.AddWithValue("@Gender", DDGender.SelectedValue);
      myCommand.Parameters.AddWithValue("@TeacherId", teacherId);
      if (FUDisplayPic.HasFile)
      {
        myCommand.Parameters.AddWithValue("@Avatar", "~/img/TeacherAvatars/Display_picture_" + User.Identity.Name + ext);
        FUDisplayPic.SaveAs(fileName);
      }
      else
      {
        myCommand.Parameters.AddWithValue("@Avatar", DisplayPicture.ImageUrl);
      }
      myCommand.ExecuteNonQuery();
    }
    //FUDisplayPic.SaveAs(fileName);
    teacher.Email = TxtEmail.Text;
    Membership.UpdateUser(teacher);
    Session["Notice"] = "Your Profile has been updated!";
    Response.Redirect("~/teachers/profilesettings.aspx");
  }
}