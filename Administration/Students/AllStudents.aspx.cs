using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using System.Data.SqlClient;

public partial class Administration_AllStudents : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string[] allstudents;
        allstudents = Roles.GetUsersInRole("student");
        Repeater1.DataSource = allstudents;
        Repeater1.DataBind();
        
    }
}