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

public partial class Administration_StudentProfile : System.Web.UI.Page
{
  //Attendance Code
  private SqlConnection sqlcon;
  //End of Attendance Code
  MembershipUser student;
  Guid studentId;
  MembershipUser parent;

    protected void Page_Load(object sender, EventArgs e)
    {
      EventCalendarLink.NavigateUrl = "~/Parents/EventCalendar.aspx?id=" + Request.QueryString["id"].ToString();
      //setting a user instance based on query string or session variable
      if (Request.QueryString["id"] != null)
      {
        student = Membership.GetUser(Request.QueryString["id"].ToString());
      }
      else
      {
        Session["error"] = "You must select a child first.";
        Response.Redirect("~/Parents/Children.aspx");
      }
      studentId = (Guid)student.ProviderUserKey;
      string connection = ConfigurationManager.ConnectionStrings["EIMSConnectionString"].ConnectionString;
      sqlcon = new SqlConnection(connection);
      if (!IsPostBack)
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
        //iterating through the data view and setting the fields in the form
        StudentUserName.Text = userName;
        DataView dvSql = (DataView)StudentDataSource.Select(DataSourceSelectArguments.Empty);
        foreach (DataRowView drvSql in dvSql)
        {
          EventCalendarLink.Text = "See " + drvSql["Name"].ToString() + "'s events calender.";
          StudentName.Text = drvSql["Name"].ToString();
          StudentDepartment.Text = drvSql["DepartmentName"].ToString();
          StudentBatch.Text = drvSql["BatchName"].ToString();
          StudentContact.Text = drvSql["Contact"].ToString();
          StudentRollNum.Text = drvSql["RollNo"].ToString();
          StudentEmail.Text = drvSql["Email"].ToString();
          if (drvSql["Avatar"].ToString() != "")
          {
            UserPicture.ImageUrl = drvSql["Avatar"].ToString();
          }
        }
        //iterating through the parent association data view to show the parent if found
        DataView dvSql2 = (DataView)AssociationDataSource.Select(DataSourceSelectArguments.Empty);
        foreach (DataRowView drvSql in dvSql2)
        {
          //checking if a record is present in the data view, then show the associated parent
          if (drvSql["ParentId"].ToString() != "")
          {
            ShowAssociationPanel.Visible = true;
            CreateAssociationPanel.Visible = false;
            AssociationMessage.Text = "This student has a parent account";
            parent = Membership.GetUser(drvSql["ParentId"]);
            ParentLink.NavigateUrl = "~/Shared/ParentProfile.aspx?id=" + parent.UserName.ToString();
            ParentLink.Text = parent.Email + "(" + parent.UserName + ")";
          }
        }
      }
      
    }


    //Setting the StudentId parameter for various data sources in this method/event handler
    protected void AssociationDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        //assign the currently logged on user's user id to the @userid parameter
        e.Command.Parameters["@StudentId"].Value = studentId;
    }
   
    protected void StudentAssignmentDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
      e.Command.Parameters["@StudentId"].Value = studentId;
      e.Command.Parameters["@AssignmentDate"].Value = DateTime.Now.Date;
    }
    protected void StudentQuizDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
      e.Command.Parameters["@StudentId"].Value = studentId;
      e.Command.Parameters["@QuizDate"].Value = DateTime.Now.Date;
    }
    
}