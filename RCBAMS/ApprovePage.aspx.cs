using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Configuration;
using DevExpress.Web.ASPxGridView;
using DevExpress.SharePoint;
using DevExpress.Web.ASPxEditors;

public partial class ApprovePage : System.Web.UI.Page
{
    SqlConnection myconnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBAMSConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["ReqID"] == null)
        //{
        //    Response.Redirect("~/ErrorPage.aspx");
        //}

        if (Request.QueryString["id"] != null)
        {
            int groupId = Convert.ToInt32(Request.QueryString["id"]);
            Session["ReqID"] = groupId;
            SqlDataAdapter da = new SqlDataAdapter(@"SELECT ReqID,Date,Description,sendby,Status,Location,* FROM
[POSRequisitionParent]
where POSRequisitionParent.ReqID='" + Session["ReqID"] + "'", myconnection);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                lbl_Req_ID.Text = dt.Rows[0]["ReqID"].ToString();
                lbl_RequisitionDate.Text = dt.Rows[0]["Date"].ToString();
                //string dat = dt.Rows[0]["CreatedDate"].ToString();
                //DateTime date = Convert.ToDateTime(dat);
                //ViewState["CreatedDate"] = date;
                //lbl_Date.Text = date.ToString("dd-MM-yyyy");
                lbl_Req_Desc.Text = dt.Rows[0]["Description"].ToString();
                lbl_Req_Send_by.Text = dt.Rows[0]["sendby"].ToString();
                // lbl_Warehouse.Text = dt.Rows[0]["GodownName"].ToString();

            }
        }

        else
        {
            SqlDataAdapter da = new SqlDataAdapter(@"SELECT ReqID,Date,Description,sendby,Status,Location,* FROM
[POSRequisitionParent]
where POSRequisitionParent.ReqID='" + Session["ReqID"] + "'", myconnection);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                lbl_Req_ID.Text = dt.Rows[0]["ReqID"].ToString();
                lbl_RequisitionDate.Text = dt.Rows[0]["Date"].ToString();
                //string dat = dt.Rows[0]["CreatedDate"].ToString();
                //DateTime date = Convert.ToDateTime(dat);
                //ViewState["CreatedDate"] = date;
                //lbl_Date.Text = date.ToString("dd-MM-yyyy");
                lbl_Req_Desc.Text = dt.Rows[0]["Description"].ToString();
                lbl_Req_Send_by.Text = dt.Rows[0]["sendby"].ToString();
                //  lbl_Warehouse.Text = dt.Rows[0]["GodownName"].ToString();

            }
        }
    }



    protected void ASPxGridView2_BeforePerformDataSelect(object sender, EventArgs e)
    {
        Session["ReqID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
    }

    protected void btn_save_Click(object sender, EventArgs e)
    {
        myconnection.Open();
        SqlCommand mycommand = new SqlCommand("Update POSRequisitionParent Set Status=@Status Where ReqID='" + lbl_Req_ID.Text + "'", myconnection);
        mycommand.Parameters.AddWithValue("@ReqID", lbl_Req_ID.Text);
        mycommand.Parameters.AddWithValue("@Status", "Approved by POInc");
        mycommand.ExecuteNonQuery();
        myconnection.Close();
        //=== For Updation of Requested Quantity in Approver Access
        for (int i = 0; i < ASPxGridView2.VisibleRowCount; i++)
        {
            string ReqDetailsID = ASPxGridView2.GetRowValues(i, "ReqDetailsID").ToString();
            string Quantity = ASPxGridView2.GetRowValues(i, "Quantity").ToString();


            ASPxSpinEdit txtQty = ASPxGridView2.FindRowCellTemplateControl(i, (GridViewDataColumn)ASPxGridView2.Columns["Approver Quantity"],
       "txt_Qty") as ASPxSpinEdit;

            int approverQuantity = (txtQty != null && txtQty.Value != null)
           ? Convert.ToInt32(txtQty.Value)
           : 0;
            SqlCommand myCommand = new SqlCommand("Update POSRequisitionDetails set ApproverQuantity= @ApproverQuantity where ReqDetailsID=@ReqDetailsID ", myconnection);
            myCommand.Parameters.AddWithValue("@ReqDetailsID", ReqDetailsID);
            myCommand.Parameters.AddWithValue("@ApproverQuantity", approverQuantity);
            myconnection.Open();
            myCommand.ExecuteNonQuery();
            myconnection.Close();
        }
        //Response.Redirect("AuthorizationRequisition.aspx");
        Response.Redirect("ApproverAuthorizationRequisition.aspx");
    }



    protected void btn_Reject_Click(object sender, EventArgs e)
    {
        myconnection.Open();
        SqlCommand mycommand = new SqlCommand("Update POSRequisitionParent Set Status=@Status,Remarks=@Remarks Where ReqID=@ReqID", myconnection);
        mycommand.Parameters.AddWithValue("@ReqID", lbl_Req_ID.Text);
        mycommand.Parameters.AddWithValue("@Remarks", Memo_remarks.Text);
        mycommand.Parameters.AddWithValue("@Status", "Rejected by POInc");
        mycommand.ExecuteNonQuery();
        myconnection.Close();
        Response.Redirect("ApproverAuthorizationRequisition.aspx");

    }
}