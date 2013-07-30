using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Administration_AllParents : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string[] allstudents;
        allstudents = Roles.GetUsersInRole("parent");
        Repeater1.DataSource = allstudents;
        Repeater1.DataBind();
    }
}