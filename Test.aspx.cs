using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Test : System.Web.UI.Page
{
  DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
      Response.Write(DateTime.Now);
      dt.Columns.Add("date");
      dt.Columns.Add("event");

      dt.Rows.Add(new string[] {"11/14/2013", "Test1"});
      dt.Rows.Add(new string[] { "11/14/2013", "Exam" });
      dt.Rows.Add(new string[] {"11/18/2013", "Quiz"});
      dt.Rows.Add(new string[] {"11/22/2013", "Assign"});
    }

    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    {

      DataView dvSql = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
      foreach (DataRowView drvSql in dvSql)
      {
        DateTime date = (DateTime)drvSql["SubmissionDate"];
        //Response.Write(date.ToShortDateString());
        if(date.ToShortDateString()==e.Day.Date.ToShortDateString())
        {
          Literal l = new Literal();
          l.Visible = true;
          l.Text = "<br/>";
          e.Cell.Controls.Add(l);
          Label lb = new Label();
          lb.Visible = true;
          lb.BackColor = System.Drawing.Color.Blue;
          lb.Text = drvSql["Title"].ToString();
          string a = lb.Text;
          e.Cell.Controls.Add(lb);
        }
      }


      DataView dvSql2 = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
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
          Label lb = new Label();
          lb.Visible = true;
          
          lb.BackColor = System.Drawing.Color.Red;
          lb.Text = drvSql["Title"].ToString();
          string a = lb.Text;
          e.Cell.Controls.Add(lb);
        }
      }
    }
}