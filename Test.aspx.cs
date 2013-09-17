using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
      float percent=(Convert.ToSingle(TextBox1.Text) / Convert.ToSingle(TextBox2.Text)) * 100;
      Label1.Text = percent.ToString();
    }
}