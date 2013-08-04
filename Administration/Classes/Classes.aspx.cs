using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administration_Classes_Classes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Repeater1.DataSource = ClassesDataSource;
        Repeater1.DataBind();
    }
    protected void ClassesDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        if (Request.QueryString["Batch"]!="")
        {
            e.Command.Parameters["@Batch"].Value = Request.QueryString["Batch"].ToString();
        }
    }
}