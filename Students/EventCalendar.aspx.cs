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
      DataView dvSql = (DataView)AssignmentsDataSource.Select(DataSourceSelectArguments.Empty);
      foreach (DataRowView drvSql in dvSql)
      {
        DateTime date = (DateTime)drvSql["SubmissionDate"];
        //Response.Write(date.ToShortDateString());
        if (date.ToShortDateString() == e.Day.Date.ToShortDateString())
        {
          Literal l = new Literal();
          l.Visible = true;
          l.Text = "<br/>";
          e.Cell.Controls.Add(l);
          System.Text.StringBuilder modalLink = new System.Text.StringBuilder();
          modalLink.AppendFormat("<a href=" + "#myModal" + " role=" + "button" + " class=" + "event" + " id=" + "Assignment" + drvSql["AssignmentId"] + " data-toggle=" + "modal" + ">" + "Assignment" + "</a>");
          Literal l2 = new Literal();
          l2.Visible = true;
          l2.Text = modalLink.ToString();
          e.Cell.Controls.Add(l2);
          HiddenField hf = new HiddenField();
          hf.Value = drvSql["Title"].ToString();
          hf.ID = "Assignment" + drvSql["AssignmentId"] + "Title";
          e.Cell.Controls.Add(hf);
          HiddenField hf2 = new HiddenField();
          hf2.Value = drvSql["Description"].ToString();
          hf2.ID = "Assignment" + drvSql["AssignmentId"] + "Description";
          e.Cell.Controls.Add(hf2);
          HiddenField hf3 = new HiddenField();
          hf3.Value = date.ToLongDateString();
          hf3.ID = "Assignment" + drvSql["AssignmentId"] + "Date";
          e.Cell.Controls.Add(hf3);
          HiddenField hf4 = new HiddenField();
          hf4.Value = drvSql["TotalMarks"].ToString();
          hf4.ID = "Assignment" + drvSql["AssignmentId"] + "Marks";
          e.Cell.Controls.Add(hf4);
          HiddenField hf5 = new HiddenField();
          hf5.Value = drvSql["TeacherName"].ToString();
          hf5.ID = "Assignment" + drvSql["AssignmentId"] + "Teacher";
          e.Cell.Controls.Add(hf5);
          HiddenField hf6 = new HiddenField();
          hf6.Value = drvSql["CourseName"].ToString();
          hf6.ID = "Assignment" + drvSql["AssignmentId"] + "Course";
          e.Cell.Controls.Add(hf6);
          //Label lb = new Label();
          //lb.Visible = true;
          //lb.ForeColor = System.Drawing.Color.Blue;
          ////lb.Text = drvSql["Title"].ToString();
          //lb.Text = "Assignment";
          //string a = lb.Text;
          //e.Cell.Controls.Add(lb);
        }
      }


      DataView dvSql2 = (DataView)QuizzesDataSource.Select(DataSourceSelectArguments.Empty);
      foreach (DataRowView drvSql in dvSql2)
      {
        DateTime date = (DateTime)drvSql["QuizDate"];
        //Response.Write(date.ToShortDateString());
        if (date.ToShortDateString() == e.Day.Date.ToShortDateString())
        {
          Literal l = new Literal();
          l.Visible = true;
          l.Text = "<br/>";
          e.Cell.Controls.Add(l);
          //HyperLink hl = new HyperLink();
          //hl.Visible = true;
          System.Text.StringBuilder modalLink = new System.Text.StringBuilder();
          modalLink.AppendFormat("<a href=" + "#myModal" + " role=" + "button"+ " class="+ "event" + " id=" + "Quiz"+drvSql["QuizId"]  +" data-toggle=" + "modal" +">" + "Quiz" + "</a>");
          Literal l2 = new Literal();
          l2.Visible=true;
          l2.Text = modalLink.ToString();
          e.Cell.Controls.Add(l2);
          HiddenField hf = new HiddenField();
          hf.Value = drvSql["Title"].ToString();
          hf.ID = "Quiz" + drvSql["QuizId"]+"Title";
          e.Cell.Controls.Add(hf);
          HiddenField hf2 = new HiddenField();
          hf2.Value = drvSql["Description"].ToString();
          hf2.ID = "Quiz" + drvSql["QuizId"] + "Description";
          e.Cell.Controls.Add(hf2);
          HiddenField hf3 = new HiddenField();
          hf3.Value = date.ToLongDateString();
          hf3.ID = "Quiz" + drvSql["QuizId"] + "Date";
          e.Cell.Controls.Add(hf3);
          HiddenField hf4 = new HiddenField();
          hf4.Value = drvSql["TotalMarks"].ToString();
          hf4.ID = "Quiz" + drvSql["QuizId"] + "Marks";
          e.Cell.Controls.Add(hf4);
          HiddenField hf5 = new HiddenField();
          hf5.Value = drvSql["TeacherName"].ToString();
          hf5.ID = "Quiz" + drvSql["QuizId"] + "Teacher";
          e.Cell.Controls.Add(hf5);
          HiddenField hf6 = new HiddenField();
          hf6.Value = drvSql["CourseName"].ToString();
          hf6.ID = "Quiz" + drvSql["QuizId"] + "Course";
          e.Cell.Controls.Add(hf6);
          //hl.ForeColor = System.Drawing.Color.Purple;
          //lb.Text = drvSql["Title"].ToString();
          //hl.Text = "Quiz";  
          
          //e.Cell.Controls.Add(hl);
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