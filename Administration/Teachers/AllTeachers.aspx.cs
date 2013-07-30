using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Administration_AllTeachers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string[] allTeachers;
        allTeachers = Roles.GetUsersInRole("teacher");
        Repeater1.DataSource = allTeachers;
        Repeater1.DataBind();
    }
}