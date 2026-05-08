using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;


public partial class SectionMaster : System.Web.UI.Page
{
    static string constr = WebConfigurationManager.ConnectionStrings["INSConnectionString"].ConnectionString;
    SqlConnection con = new SqlConnection(constr);
    SqlCommand cmd = null;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["UserID"] == null)
        {
            Response.Redirect("~/ErrorPage.aspx");
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (btnSave.Text == "Save")
        {
            string query = "insert into SectionMaster(SectionName,Description)values(@SectionName,@Description)";
            cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@SectionName", txtdivision.Text);
            cmd.Parameters.AddWithValue("@Description", memodescription.Text);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            griddivision.DataBind();

            lblmsg.Text = "Data Saved Successfully";
        }
        else if (btnSave.Text == "Update")
        {
            SqlCommand cmd = new SqlCommand("Update SectionMaster set SectionName=@SectionName,Description=@Description where SectionID=@SectionID", con);

            cmd.Parameters.AddWithValue("@SectionName", txtdivision.Text);
            cmd.Parameters.AddWithValue("@Description", memodescription.Text);
            cmd.Parameters.AddWithValue("@SectionID", Convert.ToInt32(Session["SectionID"]));
            con.Open();
            cmd.ExecuteNonQuery();
            // Response.Write("update successfully");
            con.Close();
            lblmsg.Text = "Data Updated Successfully";
            btnSave.Text = "Save";
        }
        Clear();
        griddivision.DataBind();
    }

    //protected void btnEdit_Click(object sender, EventArgs e)
    //{
    

    //}

    protected void griddivision_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        string str = e.CommandArgs.CommandName.ToString();
        Session["SectionID"] = griddivision.GetRowValuesByKeyValue(e.KeyValue, "SectionID").ToString();
        if (str == "Edit")
        {
            txtdivision.Text = griddivision.GetRowValuesByKeyValue(e.KeyValue, "SectionName").ToString();
            memodescription.Text = griddivision.GetRowValuesByKeyValue(e.KeyValue, "Description").ToString();
            btnSave.Text = "Update";
        }
        if (str == "Delete")
        {
            SqlCommand cmd = new SqlCommand("Update SectionMaster set Status=@status where SectionID=@SectionID", con);
            cmd.Parameters.AddWithValue("@status", "InActive");
            cmd.Parameters.AddWithValue("@SectionID", Session["SectionID"].ToString());

            con.Open();
            cmd.ExecuteNonQuery();
            //Response.Write("delete successfully");
            con.Close();
            lblmsg.Text = "Data Deleted Successfully";
            griddivision.DataBind();
        }
    }
    public void Clear()
    {
        txtdivision.Text = "";
        memodescription.Text = "";
    }


   
}
