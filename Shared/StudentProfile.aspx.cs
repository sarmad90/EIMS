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
    protected void Page_Load(object sender, EventArgs e)
    {
      string userName;
      if (Request.QueryString["id"] != null)
      {
        userName = Request.QueryString["id"].ToString();        
      }
      else
      {
        userName = Session["UserName"].ToString();
      }
      StudentUserName.Text = userName;
      DataView dvSql = (DataView)StudentDataSource.Select(DataSourceSelectArguments.Empty);
      foreach (DataRowView drvSql in dvSql)
      {
        StudentName.Text = drvSql["Name"].ToString();
        StudentDepartment.Text = drvSql["DepartmentName"].ToString();
        StudentBatch.Text = drvSql["BatchName"].ToString();
        StudentContact.Text = drvSql["Contact"].ToString();
        StudentRollNum.Text = drvSql["RollNo"].ToString();
        StudentEmail.Text = drvSql["Email"].ToString();
      }
      DataView dvSql2 = (DataView)AssociationDataSource.Select(DataSourceSelectArguments.Empty);
      foreach (DataRowView drvSql in dvSql2)
      {
        if (drvSql["ParentId"].ToString() != "")
        {
          ShowAssociationPanel.Visible = true;
          CreateAssociationPanel.Visible = false;
          AssociationMessage.Text = "You have a parent account";
          MembershipUser parent = Membership.GetUser(drvSql["ParentId"]);
          ParentLink.NavigateUrl = "~/Administration/Parents/ParentProfile.aspx?id=" + parent.UserName.ToString();
          ParentLink.Text = parent.Email + "(" + parent.UserName + ")";
        }
      }

    }
    protected void StudentDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
      // Checks for the user name in the query string then assigns it the datasource parameter
      MembershipUser student;
      if (Request.QueryString["id"] != null)
      {
        student = Membership.GetUser(Request.QueryString["id"].ToString());
      }
      // if user name is not present in the query string then look for it in the session then assigns it to the datasource parameter
      else
      {
        student = Membership.GetUser(Session["UserName"].ToString());
      }
      
      // retrieves the user key from the user instance
      Guid studentId = (Guid)student.ProviderUserKey;

      //assign the currently logged on user's user id to the @userid parameter
      e.Command.Parameters["@StudentId"].Value = studentId;
      

    }

  // Search Parent Button Code
    protected void Button1_Click(object sender, EventArgs e)
    {
        string parentUserName = Membership.GetUserNameByEmail(ParentEmail.Text);
        //MembershipUser parent = Membership.GetUser(parentUserName);
        ParentAssociation.DataSource = Membership.FindUsersByEmail(ParentEmail.Text);
        ParentAssociation.DataBind();
    }

    protected void ParentAssociation_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = ParentAssociation.SelectedRow;
        MembershipUser parent = Membership.GetUser(row.Cells[2].Text);
        Guid parentId = (Guid)parent.ProviderUserKey;

        MembershipUser student = Membership.GetUser(Request.QueryString["id"].ToString());
        Guid studentId = (Guid)student.ProviderUserKey;

        string connectionString = ConfigurationManager.ConnectionStrings["EIMSConnectionString"].ConnectionString;
        //string insertSql = "INSERT INTO StudentProfiles(FirstName, LastName, Contact, Department, Batch, RollNo) VALUES(@FirstName, @LastName, @Contact, @Department, @Batch, @RollNo)";
        string insertSql = "INSERT INTO associations (StudentId,ParentId) VALUES (@StudentId, @ParentId)";

        using (SqlConnection myConnection = new SqlConnection(connectionString))
        {
            myConnection.Open();
            SqlCommand myCommand = new SqlCommand(insertSql, myConnection);
            myCommand.Parameters.AddWithValue("@StudentId",studentId);
            myCommand.Parameters.AddWithValue("@ParentId", parentId);
            myCommand.ExecuteNonQuery();
            CreateAssociationPanel.Visible = false;
            ShowAssociationPanel.Visible = true;
            AssociationDetails.Text = row.Cells[2].Text;
            AssociationMessage.Text = "A parent for this student was added";

        }

    }
    protected void AssociationDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
      MembershipUser student;
      if (Request.QueryString["id"] != null)
      {
        student = Membership.GetUser(Request.QueryString["id"].ToString());
      }
      else
      {
        student = Membership.GetUser(Session["UserName"].ToString());
      }
      
        Guid studentId = (Guid)student.ProviderUserKey;
        //assign the currently logged on user's user id to the @userid parameter
        e.Command.Parameters["@StudentId"].Value = studentId;
    }
}