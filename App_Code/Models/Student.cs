using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for Student
/// </summary>
public class Student
{
  public static string connection = ConfigurationManager.ConnectionStrings["EIMSConnectionString"].ConnectionString;
  

  public static string FullName(MembershipUser student)
  {
    SqlConnection sqlcon=new SqlConnection(connection);
    SqlCommand sqlcom = new SqlCommand();
    string studentId=student.ProviderUserKey.ToString();
    sqlcon.Open();
    sqlcom.CommandText = "select (StudentProfiles.FirstName + ' ' + StudentProfiles.LastName) as FullName from StudentProfiles where StudentProfiles.StudentId=@StudentId";
    sqlcom.Connection = sqlcon;
    sqlcom.Parameters.AddWithValue("@StudentId", studentId);
    string result = sqlcom.ExecuteScalar().ToString();
    sqlcon.Close();
    return result;
    
  }

  public static string Email(MembershipUser student)
  {
    string email = student.Email;
    return email;
  }

  public static string Email(string studentId)
  {
    MembershipUser student = Membership.GetUser(studentId);
    string email = student.Email;
    return email;
  }



}