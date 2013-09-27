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

public partial class Parents_ProfileSettings : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    if (!IsPostBack)
    {
      DataView studentDataView = (DataView)ParentDataSource.Select(DataSourceSelectArguments.Empty);
      foreach (DataRowView dvr in studentDataView)
      {
        TxtFirstName.Text = dvr["FirstName"].ToString();
        TxtLastName.Text = dvr["LastName"].ToString();
        TxtContact.Text = dvr["Contact"].ToString();
        TxtEmail.Text = dvr["Email"].ToString();
        TxtAddress.Text = dvr["Address"].ToString();
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
  protected void ParentDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
  {
    MembershipUser parent = Membership.GetUser(User.Identity.Name);
    Guid parentId = (Guid)parent.ProviderUserKey;
    e.Command.Parameters["@ParentId"].Value = parentId;
  }
  protected void UpdateProfile_Click(object sender, EventArgs e)
  {
    MembershipUser parent = Membership.GetUser(User.Identity.Name);
    Guid parentId = (Guid)parent.ProviderUserKey;
    string connectionString = ConfigurationManager.ConnectionStrings["EIMSConnectionString"].ConnectionString;

    string updateSql = "UPDATE ParentProfiles SET FirstName=@FirstName,LastName=@LastName,Contact=@Contact,Address=@Address,Gender=@Gender,Avatar=@Avatar WHERE ParentId=@ParentId";
    string fileName;
    string ext = System.IO.Path.GetExtension(this.FUDisplayPic.PostedFile.FileName);
    fileName = Server.MapPath("~/img/ParentAvatars/Display_picture_" + User.Identity.Name + ext);
    using (SqlConnection myConnection = new SqlConnection(connectionString))
    {
      myConnection.Open();
      SqlCommand myCommand = new SqlCommand(updateSql, myConnection);
      myCommand.Parameters.AddWithValue("@FirstName", TxtFirstName.Text);
      myCommand.Parameters.AddWithValue("@LastName", TxtLastName.Text);
      myCommand.Parameters.AddWithValue("@Contact", TxtContact.Text);
      myCommand.Parameters.AddWithValue("@Address", TxtAddress.Text);
      myCommand.Parameters.AddWithValue("@Gender", DDGender.SelectedValue);
      myCommand.Parameters.AddWithValue("@ParentId", parentId);
      if (FUDisplayPic.HasFile)
      {
        myCommand.Parameters.AddWithValue("@Avatar", "~/img/ParentAvatars/Display_picture_" + User.Identity.Name + ext);
        FUDisplayPic.SaveAs(fileName);
      }
      else
      {
        myCommand.Parameters.AddWithValue("@Avatar", DisplayPicture.ImageUrl);
      }
      myCommand.ExecuteNonQuery();
    }
    parent.Email = TxtEmail.Text;
    Membership.UpdateUser(parent);
    Session["Notice"] = "Your Profile has been updated!";
    Response.Redirect("~/parents/profilesettings.aspx");
  }
}