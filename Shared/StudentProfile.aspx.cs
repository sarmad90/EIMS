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
  private SqlCommand sqlcom;
  private SqlDataAdapter sqladp;
  //End of Attendance Code
  MembershipUser student;
  Guid studentId;

    protected void Page_Load(object sender, EventArgs e)
    {
      
      //setting a user instance based on query string or session variable
      if (Request.QueryString["id"] != null)
      {
        student = Membership.GetUser(Request.QueryString["id"].ToString());
      }
      else
      {
        student = Membership.GetUser(User.Identity.Name);
      }
      studentId = (Guid)student.ProviderUserKey;
      string connection = ConfigurationManager.ConnectionStrings["EIMSConnectionString"].ConnectionString;
      sqlcon = new SqlConnection(connection);
      if (!IsPostBack)
      {
        BindGrid();

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
          StudentName.Text = drvSql["Name"].ToString();
          StudentDepartment.Text = drvSql["DepartmentName"].ToString();
          StudentBatch.Text = drvSql["BatchName"].ToString();
          StudentContact.Text = drvSql["Contact"].ToString();
          StudentRollNum.Text = drvSql["RollNo"].ToString();
          StudentEmail.Text = drvSql["Email"].ToString();
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
            AssociationMessage.Text = "You have a parent account";
            MembershipUser parent = Membership.GetUser(drvSql["ParentId"]);
            ParentLink.NavigateUrl = "~/Shared/ParentProfile.aspx?id=" + parent.UserName.ToString();
            ParentLink.Text = parent.Email + "(" + parent.UserName + ")";
          }
        }
        if (!Roles.IsUserInRole("Administrator"))
        {
          CreateAssociationPanel.Visible = false;
          ResultsAdminPanel.Visible = false;
          AttendancePanel.Visible = false;
        }
      }
      
    }

  //querying student data
    protected void StudentDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
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

  //Creating parent association
    protected void ParentAssociation_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = ParentAssociation.SelectedRow;
      //setting a parent instance from the parent Id colum from the row
        MembershipUser parent = Membership.GetUser(row.Cells[2].Text);
        Guid parentId = (Guid)parent.ProviderUserKey;

        string connectionString = ConfigurationManager.ConnectionStrings["EIMSConnectionString"].ConnectionString;

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
            //AssociationDetails.Text = row.Cells[2].Text;
            AssociationMessage.Text = "A parent for this student was added";
            ParentLink.NavigateUrl = "~/Shared/ParentProfile.aspx?id=" + parent.UserName.ToString();
            ParentLink.Text = parent.Email + "(" + parent.UserName + ")";

        }

    }

  //Finding the parent on the page load event
    protected void AssociationDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        //assign the currently logged on user's user id to the @userid parameter
        e.Command.Parameters["@StudentId"].Value = studentId;
    }

  //Attendance Code -------------Start
    private void BindGrid()
    {
      using (sqlcom = new SqlCommand("select * from attendance where studentId=@StudentId", sqlcon))
      {
        
        sqlcom.Parameters.AddWithValue("@StudentId", studentId);
        sqladp = new SqlDataAdapter(sqlcom);
        DataSet ds = new DataSet();
        sqladp.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
          gvCrud.DataSource = ds;
          gvCrud.DataBind();
        }
        else
        {
          FirstGridViewRow();
        }
      }
    }

    private void FirstGridViewRow()
    {
      DataTable dt = new DataTable();
      DataRow dr = null;
      dt.Columns.Add(new DataColumn("AttendanceId", typeof(int)));
      dt.Columns.Add(new DataColumn("TotalClasses", typeof(int)));
      dt.Columns.Add(new DataColumn("AttendanceWeek", typeof(string)));
      dt.Columns.Add(new DataColumn("ClassesAttended", typeof(int)));
      dt.Columns.Add(new DataColumn("ClassesMissed", typeof(int)));
      dt.Columns.Add(new DataColumn("AttendancePercentage", typeof(float)));
      dr = dt.NewRow();
      dr[0] = 1;
      dr[1] = 1;
      dr[2] = string.Empty;
      dr[3] = 1;
      dr[4] = 1;
      dr[5] = 78.98;
      dt.Rows.Add(dr);

      ViewState["StoreFirstRow"] = dt;

      gvCrud.DataSource = dt;
      gvCrud.DataBind();
    }

    protected void btnInsert_Click(object sender, ImageClickEventArgs e)
    { 
      if (Request.QueryString["id"] != null)
      {
        TextBox TotalClasses = (TextBox)gvCrud.FooterRow.FindControl("TotalClassesInsert");
        DropDownList AttendanceWeek = (DropDownList)gvCrud.FooterRow.FindControl("AttendanceWeekSelect");
        TextBox ClassesAttended = (TextBox)gvCrud.FooterRow.FindControl("ClassesAttendedInsert");
        TextBox ClassesMissed = (TextBox)gvCrud.FooterRow.FindControl("ClassesMissedInsert");
        float attendancePercentage = (Convert.ToSingle(ClassesAttended.Text) / Convert.ToSingle(TotalClasses.Text)) * 100;
        sqlcon.Open();
        using (sqlcom = new SqlCommand("insert into attendance values(@Week,@StudentId,@SemesterId,@TotalClasses,@ClassesAttended,@ClassesMissed,@AttendancePercentage)", sqlcon))
        {
          sqlcom.CommandType = CommandType.Text;
          sqlcom.Parameters.AddWithValue("@Week", AttendanceWeek.SelectedValue);
          sqlcom.Parameters.AddWithValue("@StudentId", studentId);
          //TODO semester ID from drop down
          sqlcom.Parameters.AddWithValue("@SemesterId", 8);
          sqlcom.Parameters.AddWithValue("@TotalClasses", TotalClasses.Text);
          sqlcom.Parameters.AddWithValue("@ClassesAttended", ClassesAttended.Text);
          sqlcom.Parameters.AddWithValue("@ClassesMissed", ClassesMissed.Text);
          sqlcom.Parameters.AddWithValue("@AttendancePercentage", attendancePercentage);
          int rows = sqlcom.ExecuteNonQuery();
          if (rows > 0)
          {
            Session["Notice"] = "Attendance record has been added!";
            BindGrid();
          }
        }
      }
    }

    protected void gvCrud_RowDataBound(object sender, GridViewRowEventArgs e)
    {
      if (e.Row.RowState == DataControlRowState.Edit || e.Row.RowState ==
          (DataControlRowState.Edit | DataControlRowState.Alternate))
      {
        DropDownList AttendanceWeekEdit = (DropDownList)e.Row.FindControl("AttendanceWeekSelectEdit");
        AttendanceWeekEdit.SelectedValue = DataBinder.Eval(e.Row.DataItem, "AttendanceWeek").ToString();
      }
      if (e.Row.RowType == DataControlRowType.DataRow && ViewState["StoreFirstRow"] != null)
      {
        ViewState["StoreFirstRow"] = null;
        e.Row.Visible = false;
      }
    }
    protected void gvCrud_RowEditing(object sender, GridViewEditEventArgs e)
    {
      gvCrud.EditIndex = e.NewEditIndex;
      BindGrid();
    }
    protected void gvCrud_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
      gvCrud.EditIndex = -1;
      BindGrid();
    }

    protected void gvCrud_RowCommand(object sender, GridViewCommandEventArgs e)
    {
      if (e.CommandName == "Modify")
      {
        long id = Convert.ToInt64(e.CommandArgument);
        GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
        int index = row.RowIndex;

        TextBox TotalClasses = (TextBox)gvCrud.Rows[index].FindControl("TotalClassesEdit");
        DropDownList AttendanceWeek = (DropDownList)gvCrud.Rows[index].FindControl("AttendanceWeekSelectEdit");
        TextBox ClassesAttended = (TextBox)gvCrud.Rows[index].FindControl("ClassesAttendedEdit");
        TextBox ClassesMissed = (TextBox)gvCrud.Rows[index].FindControl("ClassesMissedEdit");
        float attendancePercentage = (Convert.ToSingle(ClassesAttended.Text) / Convert.ToSingle(TotalClasses.Text)) * 100;

        sqlcon.Open();
        using (sqlcom = new SqlCommand("UPDATE Attendance SET AttendanceWeek=@Week,SemesterId=@SemesterId,TotalClasses=@TotalClasses,ClassesAttended=@ClassesAttended,ClassesMissed=@ClassesMissed,AttendancePercentage=@AttendancePercentage WHERE AttendanceId=@ID", sqlcon))
        {
          sqlcom.CommandType = CommandType.Text;
          sqlcom.Parameters.AddWithValue("@Week", AttendanceWeek.SelectedValue);
          //TODO semester ID from drop down
          sqlcom.Parameters.AddWithValue("@SemesterId", 8);
          sqlcom.Parameters.AddWithValue("@TotalClasses", TotalClasses.Text);
          sqlcom.Parameters.AddWithValue("@ClassesAttended", ClassesAttended.Text);
          sqlcom.Parameters.AddWithValue("@ClassesMissed", ClassesMissed.Text);
          sqlcom.Parameters.AddWithValue("@AttendancePercentage", attendancePercentage);

          sqlcom.Parameters.Add("@ID", SqlDbType.BigInt).Value = id;
          int rows = sqlcom.ExecuteNonQuery();
          if (rows > 0)
          {
            Response.Write("Record Updated!");
            gvCrud.EditIndex = -1;
            BindGrid();
          }
        }
      }
    }

    protected void gvCrud_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
      long id = int.Parse(gvCrud.DataKeys[e.RowIndex].Value.ToString());

      sqlcon.Open();

      using (sqlcom = new SqlCommand("delete from Attendance where AttendanceId=@ID", sqlcon))
      {
        sqlcom.CommandType = CommandType.Text;
        sqlcom.Parameters.Add("@ID", SqlDbType.BigInt).Value = id;
        int rows = sqlcom.ExecuteNonQuery();
        if (rows > 0)
        {
          Response.Write("Record Deleted!");
          BindGrid();
        }
      }
    }

  //Attendance Code -------------End

  //Result Code ------------Start
    protected void AddResult_Click(object sender, EventArgs e)
    {      
      sqlcon.Open();
      string insertResultQuery = "INSERT INTO Results Output inserted.ResultId VALUES(@SemesterId,@PassingDate,@Status,@GPA,@Attendance,@StudentId)";
      sqlcom = new SqlCommand(insertResultQuery,sqlcon);
      sqlcom.Parameters.AddWithValue("@SemesterId", TxtSemester.Text);
      sqlcom.Parameters.AddWithValue("@PassingDate", PassingDate.SelectedDate);
      sqlcom.Parameters.AddWithValue("@Status", TxtStatus.Text);
      sqlcom.Parameters.AddWithValue("@GPA", TxtGPA.Text);
      sqlcom.Parameters.AddWithValue("@Attendance", TxtAttendance.Text);
      sqlcom.Parameters.AddWithValue("@StudentId", studentId);
      Int32 newId = (Int32)sqlcom.ExecuteScalar();
      string insertSubjectsQuery = "INSERT INTO Subjects VALUES(@ResultId,@SubjectName,@SubjectTotalMarks,@SubjectMarksObtained)";
      SqlCommand sqlcom2 = new SqlCommand(insertSubjectsQuery, sqlcon);
      //sqlcom2.Parameters.AddWithValue("@ResultId", newId);
      if (TxtSubject1.Text != "")
      {
        sqlcom2.Parameters.AddWithValue("@ResultId", newId);
        sqlcom2.Parameters.AddWithValue("@SubjectName", TxtSubject1.Text);
        sqlcom2.Parameters.AddWithValue("@SubjectTotalMarks", TxtTotalMarks1.Text);
        sqlcom2.Parameters.AddWithValue("@SubjectMarksObtained", TxtMarksObtained1.Text);
        sqlcom2.ExecuteNonQuery();
      }
      if (TxtSubject2.Text != "")
      {
        sqlcom2.Parameters.Clear();
        sqlcom2.Parameters.AddWithValue("@ResultId", newId);
        sqlcom2.Parameters.AddWithValue("@SubjectName", TxtSubject2.Text);
        sqlcom2.Parameters.AddWithValue("@SubjectTotalMarks", TxtTotalMarks2.Text);
        sqlcom2.Parameters.AddWithValue("@SubjectMarksObtained", TxtMarksObtained2.Text);
        sqlcom2.ExecuteNonQuery();
      }
      if (TxtSubject3.Text != "")
      {
        sqlcom2.Parameters.Clear();
        sqlcom2.Parameters.AddWithValue("@ResultId", newId);
        sqlcom2.Parameters.AddWithValue("@SubjectName", TxtSubject3.Text);
        sqlcom2.Parameters.AddWithValue("@SubjectTotalMarks", TxtTotalMarks3.Text);
        sqlcom2.Parameters.AddWithValue("@SubjectMarksObtained", TxtMarksObtained3.Text);
        sqlcom2.ExecuteNonQuery();
      }
      if (TxtSubject4.Text != "")
      {
        sqlcom2.Parameters.Clear();
        sqlcom2.Parameters.AddWithValue("@ResultId", newId);
        sqlcom2.Parameters.AddWithValue("@SubjectName", TxtSubject4.Text);
        sqlcom2.Parameters.AddWithValue("@SubjectTotalMarks", TxtTotalMarks4.Text);
        sqlcom2.Parameters.AddWithValue("@SubjectMarksObtained", TxtMarksObtained4.Text);
        sqlcom2.ExecuteNonQuery();
      }
      if (TxtSubject5.Text != "")
      {
        sqlcom2.Parameters.Clear();
        sqlcom2.Parameters.AddWithValue("@ResultId", newId);
        sqlcom2.Parameters.AddWithValue("@SubjectName", TxtSubject5.Text);
        sqlcom2.Parameters.AddWithValue("@SubjectTotalMarks", TxtTotalMarks5.Text);
        sqlcom2.Parameters.AddWithValue("@SubjectMarksObtained", TxtMarksObtained5.Text);
        sqlcom2.ExecuteNonQuery();
      }
      if (TxtSubject6.Text != "")
      {
        sqlcom2.Parameters.Clear();
        sqlcom2.Parameters.AddWithValue("@ResultId", newId);
        sqlcom2.Parameters.AddWithValue("@SubjectName", TxtSubject6.Text);
        sqlcom2.Parameters.AddWithValue("@SubjectTotalMarks", TxtTotalMarks6.Text);
        sqlcom2.Parameters.AddWithValue("@SubjectMarksObtained", TxtMarksObtained6.Text);
        sqlcom2.ExecuteNonQuery();
      }
    }
  //Result Code ---------------End
}