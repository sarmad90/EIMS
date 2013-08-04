using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Administration_Classes_Class : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
        {
            DataView dvSql = (DataView)ClassDataSource.Select(DataSourceSelectArguments.Empty);
            foreach (DataRowView drvSql in dvSql)
            {
                Course.Text = drvSql["CourseName"].ToString();
                Teacher.Text = drvSql["TeacherName"].ToString();
                Batch.Text = drvSql["BatchName"].ToString();
                Department.Text = drvSql["DepartmentName"].ToString();
                Section.Text = drvSql["SectionName"].ToString();
                Semester.Text = drvSql["SemesterName"].ToString();
            }
        }
    }


    protected void ClassDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        e.Command.Parameters["@ClassId"].Value = Request.QueryString["id"];
    }
}