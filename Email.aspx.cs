using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Email : System.Web.UI.Page
{
  private SqlConnection sqlcon;
  private SqlCommand sqlcom;
  private SqlDataAdapter sqladp;

    protected void Page_Load(object sender, EventArgs e)
    {
      string connection = ConfigurationManager.ConnectionStrings["EIMSConnectionString"].ConnectionString;
      sqlcon = new SqlConnection(connection);
      if (!IsPostBack)
      {
        BindGrid();
      }

    }

    private void BindGrid()
    {
      using (sqlcom = new SqlCommand("select * from departments", sqlcon))
      {
        sqladp = new SqlDataAdapter(sqlcom);
        DataSet ds = new DataSet();
        sqladp.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
          gvCrud.DataSource = ds;
          gvCrud.DataBind();
        }
        else
        {
          FirstGridViewRow();
        }
      }
    }

    private void FirstGridViewRow()
    {
      DataTable dt = new DataTable();
      DataRow dr = null;
      dt.Columns.Add(new DataColumn("DepartmentId", typeof(int)));
      dt.Columns.Add(new DataColumn("DepartmentName", typeof(string)));
      dt.Columns.Add(new DataColumn("DepartmentInitials", typeof(string)));
      //dt.Columns.Add(new DataColumn("ADDRESS", typeof(string)));
      dr = dt.NewRow();
      dr[0] = 1;
      dr[1] = string.Empty;
      dr[2] = string.Empty;
      dr[3] = string.Empty;
      dt.Rows.Add(dr);

      ViewState["StoreFirstRow"] = dt;

      gvCrud.DataSource = dt;
      gvCrud.DataBind();
    }

    protected void btnInsert_Click(object sender, ImageClickEventArgs e)
    {
      TextBox txtName = (TextBox)gvCrud.FooterRow.FindControl("txtNameInsert");
      DropDownList ddlCountry = (DropDownList)gvCrud.FooterRow.FindControl("ddlCountryInsert");
      TextBox txtAddress = (TextBox)gvCrud.FooterRow.FindControl("txtAddressInsert");

      sqlcon.Open();

      using (sqlcom = new SqlCommand("insert into dbo.Departments VALUES(@DepartmentName,@DepartmentInitials)", sqlcon))
      {
        sqlcom.CommandType = CommandType.Text;
        sqlcom.Parameters.AddWithValue("@DepartmentName",txtName.Text);
        sqlcom.Parameters.AddWithValue("@DepartmentInitials", ddlCountry.SelectedValue);
        //sqlcom.Parameters.Add("@ADDRESS", SqlDbType.VarChar).Value = txtAddress.Text.Trim();
        int rows = sqlcom.ExecuteNonQuery();
        if (rows > 0)
        {
          Response.Write("Record Inserted!");
          BindGrid();
        }
      }
    }

    protected void gvCrud_RowDataBound(object sender, GridViewRowEventArgs e)
    {
      if (e.Row.RowState == DataControlRowState.Edit || e.Row.RowState ==
          (DataControlRowState.Edit | DataControlRowState.Alternate))
      {
        DropDownList ddlCountry = (DropDownList)e.Row.FindControl("ddlCountryEdit");
        ddlCountry.SelectedValue = DataBinder.Eval(e.Row.DataItem, "COUNTRY").ToString();
      }
      if (e.Row.RowType == DataControlRowType.DataRow && ViewState["StoreFirstRow"] != null)
      {
        ViewState["StoreFirstRow"] = null;
        e.Row.Visible = false;
      }
    }
    protected void gvCrud_RowEditing(object sender, GridViewEditEventArgs e)
    {
      gvCrud.EditIndex = e.NewEditIndex;
      BindGrid();
    }
    protected void gvCrud_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
      gvCrud.EditIndex = -1;
      BindGrid();
    }

    protected void gvCrud_RowCommand(object sender, GridViewCommandEventArgs e)
    {
      if (e.CommandName == "Modify")
      {
        long id = Convert.ToInt64(e.CommandArgument);
        GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
        int index = row.RowIndex;

        TextBox txtName = (TextBox)gvCrud.Rows[index].FindControl("txtNameEdit");
        DropDownList ddlCountry = (DropDownList)gvCrud.Rows[index].FindControl("ddlCountryEdit");
        TextBox txtAddress = (TextBox)gvCrud.Rows[index].FindControl("txtAddressEdit");

        sqlcon.Open();

        using (sqlcom = new SqlCommand("UPDATE_RECORD", sqlcon))
        {
          sqlcom.CommandType = CommandType.StoredProcedure;
          sqlcom.Parameters.Add("@NAME", SqlDbType.VarChar).Value = txtName.Text.Trim();
          sqlcom.Parameters.Add("@COUNTRY", SqlDbType.VarChar).Value = ddlCountry.SelectedValue;
          sqlcom.Parameters.Add("@ADDRESS", SqlDbType.VarChar).Value = txtAddress.Text.Trim();

          sqlcom.Parameters.Add("@ID", SqlDbType.BigInt).Value = id;
          int rows = sqlcom.ExecuteNonQuery();
          if (rows > 0)
          {
            Response.Write("Record Updated!");
            gvCrud.EditIndex = -1;
            BindGrid();
          }
        }
      }
    }

    protected void gvCrud_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
      long id = int.Parse(gvCrud.DataKeys[e.RowIndex].Value.ToString());

      sqlcon.Open();

      using (sqlcom = new SqlCommand("DELETE_RECORD", sqlcon))
      {
        sqlcom.CommandType = CommandType.StoredProcedure;
        sqlcom.Parameters.Add("@ID", SqlDbType.BigInt).Value = id;
        int rows = sqlcom.ExecuteNonQuery();
        if (rows > 0)
        {
          Response.Write("Record Deleted!");
          BindGrid();
        }
      }
    }

}