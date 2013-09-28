using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class Site : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
      // Display Picture Code
      if (Page.User.Identity.IsAuthenticated && !Page.User.IsInRole("Administrator"))
      {
        Image UserPic = LoginView1.FindControl("UserPicture") as Image;
        string strConn = ConfigurationManager.ConnectionStrings["EIMSConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(strConn))
        {
          MembershipUser user = Membership.GetUser(Page.User.Identity.Name);
          Guid userId = (Guid)user.ProviderUserKey;
          conn.Open();
          SqlCommand cmd = new SqlCommand();
          cmd.Connection = conn;
          string avatarQuery;
          if (Page.User.IsInRole("Student"))
          {
            avatarQuery = "select StudentProfiles.Avatar from StudentProfiles where StudentProfiles.StudentId=@StudentId";
            cmd.CommandText=avatarQuery;
            cmd.Parameters.AddWithValue("@StudentId", userId);
          }
          else if (Page.User.IsInRole("Teacher"))
          {
            avatarQuery = "select TeacherProfiles.Avatar from TeacherProfiles where TeacherProfiles.TeacherId=@TeacherId";
            cmd.CommandText = avatarQuery;
            cmd.Parameters.AddWithValue("@TeacherId", userId);
          }
          else
          {
            avatarQuery = "select ParentProfiles.Avatar from ParentProfiles where ParentProfiles.ParentId=@ParentId";
            cmd.CommandText = avatarQuery;
            cmd.Parameters.AddWithValue("@ParentId", userId);
          }
          SqlDataReader dr = cmd.ExecuteReader();
          while (dr.Read())
          {
            if(dr["Avatar"].ToString()!="")
            {
              UserPic.ImageUrl = dr["Avatar"].ToString();
            }
          }
        }
      }
      // Display Picture Code
        SuccessMessages.Visible = false;
        if (Session["Notice"] == null)
        {
            SuccessMessages.Visible = false;
        }
        else
        {
            SuccessMessages.Visible = true;
            SuccessMessage.Text = Session["Notice"].ToString();
            Session.Remove("Notice");
        }

        ErrorMessages.Visible = false;
        if (Session["Error"] == null)
        {
            ErrorMessages.Visible = false;
        }
        else
        {
            ErrorMessages.Visible = true;
            ErrorMessage.Text = Session["Error"].ToString();
            Session.Remove("Error");
        }
        
    }
}
