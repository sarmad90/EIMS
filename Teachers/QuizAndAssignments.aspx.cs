using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
public partial class Teachers_QuizAndAssignments : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      if (!IsPostBack)
      {
        DDAssignmentClass.DataSource = ClassesDataSource;
        DDAssignmentClass.DataTextField = "CourseName";
        DDAssignmentClass.DataValueField = "ClassId";
        DDAssignmentClass.DataBind();
        DDQuizClass.DataSource = ClassesDataSource;
        DDQuizClass.DataTextField = "CourseName";
        DDQuizClass.DataValueField = "ClassId";
        DDQuizClass.DataBind();
      }
    }
    protected void AddQuiz_Click(object sender, EventArgs e)
    {
      string connectionString = ConfigurationManager.ConnectionStrings["EIMSConnectionString"].ConnectionString;
      string insertSql = "insert into quizzes values(@ClassId,@Title,@Description,@TotalMarks,@QuizDate)";
      using (SqlConnection sqlConn = new SqlConnection(connectionString))
      {
        sqlConn.Open();
        SqlCommand cmd = new SqlCommand(insertSql, sqlConn);
        cmd.Parameters.AddWithValue("@ClassId", DDQuizClass.SelectedValue);
        cmd.Parameters.AddWithValue("@Title", QuizTitle.Text);
        cmd.Parameters.AddWithValue("@Description", QuizDescription.Text);
        cmd.Parameters.AddWithValue("@QuizDate", QuizDate.SelectedDate);
        cmd.Parameters.AddWithValue("@TotalMarks", QuizTotalMarks.Text);
        cmd.ExecuteNonQuery();
      }
    }
    protected void AddAssignment_Click(object sender, EventArgs e)
    {
      string connectionString = ConfigurationManager.ConnectionStrings["EIMSConnectionString"].ConnectionString;
      string insertSql = "insert into assignments values(@ClassId,@Title,@Description,@SubmissionDate,@AssignmentDate,@TotalMarks)";
      using (SqlConnection sqlConn = new SqlConnection(connectionString))
      {
        sqlConn.Open();
        SqlCommand cmd = new SqlCommand(insertSql, sqlConn);
        cmd.Parameters.AddWithValue("@ClassId", DDAssignmentClass.SelectedValue);
        cmd.Parameters.AddWithValue("@Title", AssignmentTitle.Text);
        cmd.Parameters.AddWithValue("@Description", AssignmentDescription.Text);
        cmd.Parameters.AddWithValue("@SubmissionDate", AssignmentSubmissionDate.SelectedDate);
        cmd.Parameters.AddWithValue("@AssignmentDate", DateTime.Now.Date);
        cmd.Parameters.AddWithValue("@TotalMarks", AssignmentTotalMarks.Text);
        cmd.ExecuteNonQuery();
      }
    }
    protected void ClassesDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
      MembershipUser user = Membership.GetUser(User.Identity.Name);
      Guid userId = (Guid)user.ProviderUserKey;
      e.Command.Parameters["@TeacherId"].Value = userId;
    }
}