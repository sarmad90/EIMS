using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;

public partial class Email : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
      string recipient = "sssabih@comstar.com.pk";
      string from = "noreply@eims.com";
      string subject = "Welcome to Educational Institute Management System";
      string body = "Hi Mr.abc you are now a registered user";
      MailMessage objMail = new MailMessage(from, recipient , subject, body);
      NetworkCredential objNC = new NetworkCredential("noreply.eims@live.com", "admin123");
      SmtpClient objsmtp = new SmtpClient("smtp.live.com", 587); // for hotmail
      objsmtp.EnableSsl = true;
      objsmtp.Credentials = objNC;
      objsmtp.Send(objMail);


    //  MailAddress from = new MailAddress("ben@contoso.com", "Ben Miller");
    //  MailAddress to = new MailAddress("sssabih@comstar.com.pk", "Jane Clayton");
    //  MailMessage message = new MailMessage(from, to);
    //  // message.Subject = "Using the SmtpClient class.";
    //  message.Subject = "Using the SmtpClient class.";
    //  message.Body = @"Using this feature, you can send an e-mail message from an application very easily.";
    //  // Add a carbon copy recipient.
    //  MailAddress copy = new MailAddress("Notification_List@contoso.com");
    //  message.CC.Add(copy);
    //  SmtpClient client = new SmtpClient("smtp.live.com",587);
    //  NetworkCredential objNC = new NetworkCredential("sam_sarmad@hotmail.com", "singlesam2490");
    //  client.Credentials = objNC;
    //  client.EnableSsl = true;
    //  // Include credentials if the server requires them.
    //  //client.Credentials = CredentialCache.DefaultNetworkCredentials;
    //  Console.WriteLine("Sending an e-mail message to {0} by using the SMTP host {1}.",
    //     to.Address, client.Host);
    //    client.Send(message);
     
    }

}