using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Web.Security;
using System.Data;
using System.Data.SqlClient;

public partial class Administration_AddStudent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void AddNewStudent_CreatedUser(object sender, EventArgs e)
    {
        ////Get the UserID for the just added user
        //MembershipUser newUser = Membership.GetUser(AddNewStudent.UserName);
        //Guid newUserId = (Guid)newUser.ProviderUserKey;

        //TemplatedWizardStep CustStep = CreateUserWizardStep1.FindControl("ContentTemplate") as TemplatedWizardStep;
        

        //// Programmatically reference the TextBox controls
        //TextBox FirstName = CustStep.FindControl("FirstName") as TextBox;
        //TextBox LastName = CustStep.FindControl("LastName") as TextBox;
        //TextBox Contact = CustStep.FindControl("Contact") as TextBox;
        //TextBox Department = CustStep.FindControl("Department") as TextBox;
        //TextBox Batch = CustStep.FindControl("Batch") as TextBox;
        //TextBox RollNum = CustStep.FindControl("RollNum") as TextBox;
        ////Insert a new record into student profiles
        //string connectionString = ConfigurationManager.ConnectionStrings["EIMSConnectionString"].ConnectionString;
        ////string insertSql = "INSERT INTO StudentProfiles(FirstName, LastName, Contact, Department, Batch, RollNo) VALUES(@FirstName, @LastName, @Contact, @Department, @Batch, @RollNo)";
        //string updateSql = "UPDATE StudentProfiles SET FirstName = @FirstName, LastName= @LastName, Contact = @Contact, Department = @Department, Batch = @Batch, RollNo = @RollNo WHERE UserId = @UserId";

        //using (SqlConnection myConnection = new SqlConnection(connectionString))
        //{
        //    myConnection.Open();
        //    SqlCommand myCommand = new SqlCommand(updateSql, myConnection);
        //    myCommand.Parameters.AddWithValue("@FirstName", FirstName.Text.Trim());
        //    myCommand.Parameters.AddWithValue("@LastName", LastName.Text.Trim());
        //    myCommand.Parameters.AddWithValue("@Contact", Contact.Text.Trim());
        //    myCommand.Parameters.AddWithValue("@Department", Department.Text.Trim());
        //    myCommand.Parameters.AddWithValue("@Batch", Batch.Text.Trim());
        //    myCommand.Parameters.AddWithValue("@RollNo", RollNum.Text.Trim());
        //    myCommand.Parameters.AddWithValue("@UserId", newUserId);
        //    myCommand.ExecuteNonQuery();
        //    myConnection.Close();
        //}

    }
    protected void AddNewStudent_ActiveStepChanged(object sender, EventArgs e)
    {
        //Get the UserID for the just added user
        MembershipUser newUser = Membership.GetUser(AddNewStudent.UserName);
        Guid newUserId = (Guid)newUser.ProviderUserKey;

         // Have we JUST reached the Complete step?
        if (AddNewStudent.ActiveStep.Title == "Complete")
        {
            //CreateUserWizardStep CustStep = AddNewStudent.FindControl("CreateUserWizardStep1") as CreateUserWizardStep;
            //TemplateControl CustStep = CreateUserWizardStep1.ContentTemplate as TemplateControl;
            TextBox FirstName = AddNewStudent.CreateUserStep.ContentTemplateContainer.FindControl("FirstName") as TextBox;
            // Programmatically reference the TextBox controls
            //TextBox FirstName = CreateUserWizardStep1.FindControl("FirstName") as TextBox;
            TextBox LastName = AddNewStudent.CreateUserStep.ContentTemplateContainer.FindControl("LastName") as TextBox;
            TextBox Contact = AddNewStudent.CreateUserStep.ContentTemplateContainer.FindControl("Contact") as TextBox;
            TextBox Department = AddNewStudent.CreateUserStep.ContentTemplateContainer.FindControl("Department") as TextBox;
            TextBox Batch = AddNewStudent.CreateUserStep.ContentTemplateContainer.FindControl("Batch") as TextBox;
            TextBox RollNum = AddNewStudent.CreateUserStep.ContentTemplateContainer.FindControl("RollNum") as TextBox;
            //Insert a new record into student profiles
            string connectionString = ConfigurationManager.ConnectionStrings["EIMSConnectionString"].ConnectionString;
            //string insertSql = "INSERT INTO StudentProfiles(FirstName, LastName, Contact, Department, Batch, RollNo) VALUES(@FirstName, @LastName, @Contact, @Department, @Batch, @RollNo)";
            string insertSql = "INSERT INTO StudentProfiles(StudentId, FirstName, LastName, Contact, Department, Batch, RollNo) VALUES(@UserId, @FirstName, @LastName, @Contact, @Department, @Batch, @RollNo)";

            using (SqlConnection myConnection = new SqlConnection(connectionString))
            {
                myConnection.Open();
                SqlCommand myCommand = new SqlCommand(insertSql, myConnection);
                myCommand.Parameters.AddWithValue("@FirstName", FirstName.Text.Trim());
                myCommand.Parameters.AddWithValue("@LastName", LastName.Text.Trim());
                myCommand.Parameters.AddWithValue("@Contact", Contact.Text.Trim());
                myCommand.Parameters.AddWithValue("@Department", Department.Text.Trim());
                myCommand.Parameters.AddWithValue("@Batch", Batch.Text.Trim());
                myCommand.Parameters.AddWithValue("@RollNo", RollNum.Text.Trim());
                myCommand.Parameters.AddWithValue("@UserId", newUserId);
                myCommand.ExecuteNonQuery();
                myConnection.Close();
            }

            Roles.AddUserToRole(AddNewStudent.UserName, "student");
        }
 
    }
}