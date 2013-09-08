using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      string userName = User.Identity.Name;
      Session["UserName"] = userName;
      Label1.Text = Session["UserName"].ToString();
    }
}