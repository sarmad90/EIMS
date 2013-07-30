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

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.IsAuthenticated)
        {
            WelcomeBackMessage.Text = "Welcome back, " + User.Identity.Name + "!";

            // Get User Data from FormsAuthenticationTicket and show it in WelcomeBackMessage
            //FormsIdentity ident = User.Identity as FormsIdentity;
            //if (ident != null)
            //{
            //    FormsAuthenticationTicket ticket = ident.Ticket;
            //    string userDataString = ticket.UserData;

            //    // Split on the |
            //    string[] userDataPieces = userDataString.Split("|".ToCharArray());
            //    string companyName = userDataPieces[0];
            //    string titleAtCompany = userDataPieces[1];

            //    WelcomeBackMessage.Text += string.Format(" You are the {0} of {1}.", titleAtCompany, companyName);
            //}

            // Reference the CustomPrincipal / CustomIdentity
            CustomIdentity ident = User.Identity as CustomIdentity;
            if (ident != null)
                WelcomeBackMessage.Text += string.Format(" You are the {0} of {1}.", ident.Title, ident.CompanyName);

            AuthenticatedMessagePanel.Visible = true;
            AnonymousMessagePanel.Visible = false;
        }
        else
        {
            AuthenticatedMessagePanel.Visible = false;
            AnonymousMessagePanel.Visible = true;
        }
    }
}
