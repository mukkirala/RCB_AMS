using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class AddServiceType : System.Web.UI.Page
{
    SqlConnection conAMS = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBAMSConnectionString"].ConnectionString);
    SqlCommand myCommand;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"]==null)
        {
            Response.Redirect("ErrorPage.aspx");
            return;
        }
        string message = "Do you want to Submit?";
        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        sb.Append("return confirm('");
        sb.Append(message);
        sb.Append("');");
        ClientScript.RegisterOnSubmitStatement(this.GetType(), "alert", sb.ToString());
    }



    //protected void Page_Load(object sender, EventArgs e)
    //{
    //    string message = "Do you want to Submit?";
    //    System.Text.StringBuilder sb = new System.Text.StringBuilder();
    //    sb.Append("return confirm('");
    //    sb.Append(message);
    //    sb.Append("');");
    //    ClientScript.RegisterOnSubmitStatement(this.GetType(), "alert", sb.ToString());
    //}
    protected void btn_save_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtservicetypename.Text == "")
            {
                lbl_msg.Text = "ServiceType Required";
                return;
            }
            if (txtDesc.Text == "")
            {
                lbl_msg.Text = "Description Required";
                return;
            }
            if (btn_save.Text == "Save")
            {
                myCommand = new SqlCommand("IF(NOT EXISTS(SELECT * FROM ServiceTypeMaster WHERE ServiceTypeName = @ServiceTypeName))BEGIN Insert into ServiceTypeMaster(ServiceTypeName,Status,Description,CreatedDate)values(@ServiceTypeName,@Status,@Description,@CreatedDate)END", conAMS);
                myCommand.Parameters.AddWithValue("ServiceTypeName", txtservicetypename.Text.ToString());
                myCommand.Parameters.AddWithValue("Status", "Active");
                myCommand.Parameters.AddWithValue("Description", txtDesc.Text.ToString());
                myCommand.Parameters.AddWithValue("CreatedDate", System.DateTime.Now);


                conAMS.Open();
                myCommand.ExecuteNonQuery();
                conAMS.Close();
                Clear();
                ASPxGridView.DataBind();
                lbl_msg.Text = "Saved Successfully";

            }
            else if (btn_save.Text == "Update")
            {

                SqlCommand cmd1 = new SqlCommand("update ServiceTypeMaster set ServiceTypeName=@ServiceTypeName,Description=@Description where ServiceTypeID=@ServiceTypeID", conAMS);
                cmd1.Parameters.AddWithValue("@ServiceTypeName", txtservicetypename.Text.ToString());
                cmd1.Parameters.AddWithValue("@ServiceTypeID", Session["ServiceTypeID"]);
                cmd1.Parameters.AddWithValue("@Description", txtDesc.Text.ToString());
                //myCommand.Parameters.AddWithValue("Designation", "Non User");

                conAMS.Open();
                cmd1.ExecuteNonQuery();
                conAMS.Close();
                Clear();
                ASPxGridView.DataBind();
                btn_save.Text = "Save";
                lbl_msg.Text = "Updated Successfully";

            }
        }
        catch (Exception ex)
        {

        }


    }
    protected void Clear()
    {
        txtservicetypename.Text = txtDesc.Text = "";

    }
    protected void ASPxGridView_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        lbl_msg.Visible = false;
        string btn = e.CommandArgs.CommandName.ToString();
        if (btn == "Edit")
        {
            string ServiceTypeID = ASPxGridView.GetRowValuesByKeyValue(e.KeyValue, "ServiceTypeID").ToString();
            Session["ServiceTypeID"] = ServiceTypeID;

            txtservicetypename.Text = ASPxGridView.GetRowValuesByKeyValue(e.KeyValue, "ServiceTypeName").ToString();
            txtDesc.Text = ASPxGridView.GetRowValuesByKeyValue(e.KeyValue, "Description").ToString();

            btn_save.Text = "Update";
            // btn_save.Visible = false;

        }
        if (btn == "Delete")
        {
            //LinkButton btn = sender as LinkButton;
            //GridViewRow row = btn.NamingContainer as GridViewRow;
            //row.BackColor = System.Drawing.Color.Red;
            lbl_msg.Text = "";

            string ServiceTypeID = ASPxGridView.GetRowValuesByKeyValue(e.KeyValue, "ServiceTypeID").ToString();
            string Query2 = "UPDATE [ServiceTypeMaster] SET Status='InActive' Where ServiceTypeID='" + ServiceTypeID + "'";
            myCommand = new SqlCommand(Query2, conAMS);
            conAMS.Open();
            myCommand.ExecuteNonQuery();
            conAMS.Close();
            ASPxGridView.DataBind();

            Clear();
        }


    }
}