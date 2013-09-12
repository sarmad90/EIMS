using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Net.Mail;


public partial class Administration_AddParent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }


    protected void AddNewParent_ActiveStepChanged(object sender, EventArgs e)
    {
        //Get the UserID for the just added user
        MembershipUser newUser = Membership.GetUser(AddNewParent.UserName);
        Guid newUserId = (Guid)newUser.ProviderUserKey;

        // Have we JUST reached the Complete step?
        if (AddNewParent.ActiveStep.Title == "Complete")
        {
            //CreateUserWizardStep CustStep = AddNewStudent.FindControl("CreateUserWizardStep1") as CreateUserWizardStep;
            //TemplateControl CustStep = CreateUserWizardStep1.ContentTemplate as TemplateControl;
            TextBox FirstName = AddNewParent.CreateUserStep.ContentTemplateContainer.FindControl("FirstName") as TextBox;
            TextBox Email = AddNewParent.CreateUserStep.ContentTemplateContainer.FindControl("Email") as TextBox;
            TextBox UserName = AddNewParent.CreateUserStep.ContentTemplateContainer.FindControl("UserName") as TextBox;
            TextBox Password = AddNewParent.CreateUserStep.ContentTemplateContainer.FindControl("Password") as TextBox;
            // Programmatically reference the TextBox controls
            //TextBox FirstName = CreateUserWizardStep1.FindControl("FirstName") as TextBox;
            TextBox LastName = AddNewParent.CreateUserStep.ContentTemplateContainer.FindControl("LastName") as TextBox;
            TextBox Contact = AddNewParent.CreateUserStep.ContentTemplateContainer.FindControl("Contact") as TextBox;
            TextBox Address = AddNewParent.CreateUserStep.ContentTemplateContainer.FindControl("Address") as TextBox;
            //Insert a new record into student profiles
            string connectionString = ConfigurationManager.ConnectionStrings["EIMSConnectionString"].ConnectionString;
            //string insertSql = "INSERT INTO StudentProfiles(FirstName, LastName, Contact, Department, Batch, RollNo) VALUES(@FirstName, @LastName, @Contact, @Department, @Batch, @RollNo)";
            string insertSql = "INSERT INTO ParentProfiles(ParentId, FirstName, LastName, Contact, Address) VALUES(@UserId, @FirstName, @LastName, @Contact, @Address)";

            using (SqlConnection myConnection = new SqlConnection(connectionString))
            {
                myConnection.Open();
                SqlCommand myCommand = new SqlCommand(insertSql, myConnection);
                myCommand.Parameters.AddWithValue("@FirstName", FirstName.Text.Trim());
                myCommand.Parameters.AddWithValue("@LastName", LastName.Text.Trim());
                myCommand.Parameters.AddWithValue("@Contact", Contact.Text.Trim());
                myCommand.Parameters.AddWithValue("@Address", Address.Text.Trim());
                myCommand.Parameters.AddWithValue("@UserId", newUserId);
                myCommand.ExecuteNonQuery();
                myConnection.Close();
            }

            Roles.AddUserToRole(AddNewParent.UserName, "parent");
            //Email
            string recipient = Email.Text;
            string from = "noreply@eims.com";
            string subject = "Welcome to Educational Institute Management System";
            string body = "Hi Mr." + FirstName.Text + " " + LastName.Text + ", you are now a registered user.\nUserName:" + UserName.Text + "\nPassword:" + Password.Text;
            MailMessage objMail = new MailMessage(from, recipient, subject, body);
            NetworkCredential objNC = new NetworkCredential("noreply.eims@live.com", "admin123");
            SmtpClient objsmtp = new SmtpClient("smtp.live.com", 587); // for hotmail
            objsmtp.EnableSsl = true;
            objsmtp.Credentials = objNC;
            objsmtp.Send(objMail);
        }

    }
}