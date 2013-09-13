﻿
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Mail;

/// <summary>
/// Summary description for EimsHelper
/// </summary>
public class EimsHelper
{
	public EimsHelper()
	{
		
    
	}

  public static bool SendMail(string recipient, string subject, string body)
  {
    //string recipient = Email.Text;
    string from = "noreply@eims.com";
    //string subject = "Welcome to Educational Institute Management System";
    //string body = "Hi Mr." + FirstName.Text + " " + LastName.Text + ", you are now a registered user.\nUserName:" + UserName.Text + "\nPassword:" + Password.Text;
    MailMessage objMail = new MailMessage(from, recipient, subject, body);
    NetworkCredential objNC = new NetworkCredential("noreply.eims@live.com", "admin123");
    SmtpClient objsmtp = new SmtpClient("smtp.live.com", 587); // for hotmail
    objsmtp.EnableSsl = true;
    objsmtp.Credentials = objNC;
    objsmtp.Send(objMail);
    return true;
  }

}