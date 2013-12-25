using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;

public partial class Students_EventCalendar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void EventCalendar_DayRender(object sender, DayRenderEventArgs e)
    {
      //Assignments population
      DataView dvSql = (DataView)AssignmentsDataSource.Select(DataSourceSelectArguments.Empty);
      foreach (DataRowView drvSql in dvSql)
      {
        DateTime date = (DateTime)drvSql["SubmissionDate"];
        if (date.ToShortDateString() == e.Day.Date.ToShortDateString())
        {
          Literal l = new Literal();
          l.Visible = true;
          l.Text = "<br/>";
          e.Cell.Controls.Add(l);
          HyperLink hl = new HyperLink();
          hl.Visible = true;
          hl.Attributes.Add("href","#myModal"); hl.Attributes.Add("role","button"); hl.Attributes.Add("class","event");
          hl.Attributes.Add("data-toggle","modal"); hl.Attributes.Add("data-type","Assignment"); hl.Attributes.Add("data-title",drvSql["Title"].ToString());
          hl.Attributes.Add("data-description",drvSql["Description"].ToString()); hl.Attributes.Add("data-marks",drvSql["TotalMarks"].ToString());
          hl.Attributes.Add("data-teacher",drvSql["TeacherName"].ToString());hl.Attributes.Add("data-course",drvSql["CourseName"].ToString());
          hl.Attributes.Add("data-date",date.ToLongDateString());hl.Text = "Assignment"; e.Cell.Controls.Add(hl);
        }
      }

      //Quizzes population
      DataView dvSql2 = (DataView)QuizzesDataSource.Select(DataSourceSelectArguments.Empty);
      foreach (DataRowView drvSql in dvSql2)
      {
        DateTime date = (DateTime)drvSql["QuizDate"];
        if (date.ToShortDateString() == e.Day.Date.ToShortDateString())
        {
          Literal l = new Literal();
          l.Visible = true;
          l.Text = "<br/>";
          e.Cell.Controls.Add(l);
          HyperLink hl = new HyperLink();
          hl.Visible = true;
          hl.Attributes.Add("href", "#myModal");
          hl.Attributes.Add("role", "button");
          hl.Attributes.Add("class", "event");
          hl.Attributes.Add("data-toggle", "modal");
          hl.Attributes.Add("data-type", "Quiz");
          hl.Attributes.Add("data-title", drvSql["Title"].ToString());
          hl.Attributes.Add("data-description", drvSql["Description"].ToString());
          hl.Attributes.Add("data-marks", drvSql["TotalMarks"].ToString());
          hl.Attributes.Add("data-teacher", drvSql["TeacherName"].ToString());
          hl.Attributes.Add("data-course", drvSql["CourseName"].ToString());
          hl.Attributes.Add("data-date", date.ToLongDateString());
          hl.Text = "Quiz";
          e.Cell.Controls.Add(hl);
        }
      }

      //Presentations population
      DataView dvSql3 = (DataView)PresentationsDataSource.Select(DataSourceSelectArguments.Empty);
      foreach (DataRowView drvSql in dvSql3)
      {
        DateTime date = (DateTime)drvSql["PresentationDate"];
        if (date.ToShortDateString() == e.Day.Date.ToShortDateString())
        {
          Literal l = new Literal();
          l.Visible = true;
          l.Text = "<br/>";
          e.Cell.Controls.Add(l);
          HyperLink hl = new HyperLink();
          hl.Visible = true;
          hl.Attributes.Add("href", "#myModal"); hl.Attributes.Add("role", "button"); hl.Attributes.Add("class", "event");
          hl.Attributes.Add("data-toggle", "modal"); hl.Attributes.Add("data-type", "Presentation"); hl.Attributes.Add("data-title", drvSql["Title"].ToString());
          hl.Attributes.Add("data-description", drvSql["Description"].ToString()); hl.Attributes.Add("data-marks", drvSql["TotalMarks"].ToString());
          hl.Attributes.Add("data-teacher", drvSql["TeacherName"].ToString()); hl.Attributes.Add("data-course", drvSql["CourseName"].ToString());
          hl.Attributes.Add("data-date", date.ToLongDateString()); hl.Text = "Presentation"; e.Cell.Controls.Add(hl);
        }
      }
    }
    protected void AssignmentsDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
      MembershipUser student = Membership.GetUser(User.Identity.Name);
      Guid studentId = (Guid)student.ProviderUserKey;
      e.Command.Parameters["@StudentId"].Value = studentId;
    }
    
}