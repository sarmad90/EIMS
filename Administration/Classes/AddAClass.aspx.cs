using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Administration_Classes_AddAClass : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Course.DataSource = CoursesDataSource;
            Course.DataTextField = "CourseName";
            Course.DataValueField = "CourseId";
            Course.DataBind();
            Batch.DataSource = BatchesDataSource;
            Batch.DataTextField = "BatchName";
            Batch.DataValueField = "BatchId";
            Batch.DataBind();
            Section.DataSource = SectionsDataSource;
            Section.DataTextField = "SectionName";
            Section.DataValueField = "SectionId";
            Section.DataBind();
            Teacher.DataSource = TeachersDataSource;
            Teacher.DataValueField = "TeacherId";
            Teacher.DataTextField = "TeacherName";
            Teacher.DataBind();
            Department.DataSource = DepartmentsDataSource;
            Department.DataValueField = "DepartmentId";
            Department.DataTextField = "DepartmentName";
            Department.DataBind();
            Semester.DataSource = SemestersDataSource;
            Semester.DataValueField = "SemesterId";
            Semester.DataTextField = "SemesterName";
            Semester.DataBind();
        }
    }
    protected void CreateClass_Click(object sender, EventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["EIMSConnectionString"].ConnectionString;
        string insertSql = "INSERT INTO Classes(TeacherId, CourseId, BatchId, SectionId, DepartmentId, SemesterId, CreditHours) VALUES(@TeacherId, @CourseId, @BatchId, @SectionId, @DepartmentId, @SemesterId, @CreditHours)";
        using (SqlConnection myConnection = new SqlConnection(connectionString))
        {
            myConnection.Open();
            SqlCommand myCommand = new SqlCommand(insertSql, myConnection);
            myCommand.Parameters.AddWithValue("@TeacherId", Teacher.SelectedItem.Value);
            myCommand.Parameters.AddWithValue("@CourseId", Course.SelectedItem.Value);
            myCommand.Parameters.AddWithValue("@BatchId", Batch.SelectedItem.Value);
            myCommand.Parameters.AddWithValue("@SectionId", Section.SelectedItem.Value);
            myCommand.Parameters.AddWithValue("@DepartmentId", Department.SelectedItem.Value);
            myCommand.Parameters.AddWithValue("@SemesterId", Semester.SelectedItem.Value);
            myCommand.Parameters.AddWithValue("@CreditHours", CreditHours.SelectedItem.Value);
            myCommand.ExecuteNonQuery();
            myConnection.Close();
            Session["Notice"]="A class has been added";
            Response.Redirect("~/Administration/AdminHome.aspx");
        }
    }
}