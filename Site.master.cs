using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Site : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SuccessMessages.Visible = false;
        if (Session["Notice"] == null)
        {
            SuccessMessages.Visible = false;
        }
        else
        {
            SuccessMessages.Visible = true;
            SuccessMessage.Text = Session["Notice"].ToString();
            Session.Remove("Notice");
        }

        ErrorMessages.Visible = false;
        if (Session["Error"] == null)
        {
            ErrorMessages.Visible = false;
        }
        else
        {
            ErrorMessages.Visible = true;
            ErrorMessage.Text = Session["Error"].ToString();
            Session.Remove("Error");
        }
        
    }
}
