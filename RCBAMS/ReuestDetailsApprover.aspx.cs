using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ReuestDetailsApprover : System.Web.UI.Page
{
    //static int RequestID;
    static string AssetName;
    SqlConnection conSAP = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemSAPConnectionString"].ConnectionString);
    SqlConnection conAMS = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemAMSConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("ErrorPage.aspx");
            return;
        }
        else
        {
            string RequestID = Session["RequestID"].ToString();
            string RequestType = Session["RequestType"].ToString();
            string status = Session["status"].ToString();
            AssetName = Session["AssetName"].ToString();
            GetAllRequestDetails(RequestID, RequestType, status);
        }


    }

    protected void GetAllRequestDetails(string RequestID, string RequestType, string status)
    {
        if (RequestType == "Asset Request")
        {
            string select1 = "SELECT  AssetRequestID,AssetTypeID,RequestBy,EmployeeID,Quantity,Status,Date,MainAssetNumber,ApprovedQuantity,Comments,AssetTypeCode,ApproverComments,AdminComments,CustodianDepartment,CustDepartmentCode,CustDesignation,ApproverID,ApproverName,ApproverDesignation,ApproverDeptCode,ApproverDepartment,AdminID,AdminName,AdminDesignation,AdminDeptCode,AdminDepartment,RequestType FROM EmployeeAssetRequest where AssetRequestID='" + RequestID + "'";
            SqlCommand cmd1 = new SqlCommand(select1, conAMS);
            SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
            DataTable datatable1 = new DataTable();
            da1.Fill(datatable1);
            if (status == "Request Sent To Approver")
            {
                Assetdetails.Visible = false;
                Approverdetails.Visible = false;
                if (datatable1.Rows.Count > 0)
                {
                    reqid.Text = datatable1.Rows[0]["EmployeeID"].ToString();
                    lbl_empname.Text = datatable1.Rows[0]["RequestBy"].ToString();
                    if (datatable1.Rows[0]["Date"].ToString() != null)
                    {
                        lbl_date.Text = Convert.ToDateTime(datatable1.Rows[0]["Date"]).ToString("dd-MMM-yyyy", CultureInfo.InvariantCulture);
                    }

                    lbl_rqAsset.Text = AssetName;
                    lbl_reqQuantity.Text = datatable1.Rows[0]["Quantity"].ToString();
                    //reqdeptcode.Text = datatable1.Rows[0]["CustDepartmentCode"].ToString();
                    reqdeptname.Text = datatable1.Rows[0]["CustodianDepartment"].ToString();
                    reqdesig.Text = datatable1.Rows[0]["CustDesignation"].ToString();
                }
            }
            if (status == "Request Sent To Admin" || status == "Rejected")
            {
                Assetdetails.Visible = false;
                Approverdetails.Visible = true;
                if (datatable1.Rows.Count > 0)
                {
                    reqid.Text = datatable1.Rows[0]["EmployeeID"].ToString();
                    lbl_empname.Text = datatable1.Rows[0]["RequestBy"].ToString();
                    if (datatable1.Rows[0]["Date"].ToString() != null)
                    {
                        lbl_date.Text = Convert.ToDateTime(datatable1.Rows[0]["Date"]).ToString("dd-MMM-yyyy", CultureInfo.InvariantCulture);
                    }

                    lbl_rqAsset.Text = AssetName;
                    lbl_reqQuantity.Text = datatable1.Rows[0]["Quantity"].ToString();
                    //reqdeptcode.Text = datatable1.Rows[0]["CustDepartmentCode"].ToString();
                    reqdeptname.Text = datatable1.Rows[0]["CustodianDepartment"].ToString();
                    reqdesig.Text = datatable1.Rows[0]["CustDesignation"].ToString();
                    apprID.Text = datatable1.Rows[0]["ApproverID"].ToString();
                    apprName.Text = datatable1.Rows[0]["ApproverName"].ToString();
                    apprDept.Text = datatable1.Rows[0]["ApproverDepartment"].ToString();
                    //apprDeptCode.Text = datatable1.Rows[0]["ApproverDeptCode"].ToString();
                    apprdesign.Text = datatable1.Rows[0]["ApproverDesignation"].ToString();
                    apprcmts.Text = datatable1.Rows[0]["ApproverComments"].ToString();
                }
            }
            if (status == "Approved")
            {
                Assetdetails.Visible = false;
                Approverdetails.Visible = true;
                allocatedassets.Visible = true;
                if (datatable1.Rows.Count > 0)
                {
                    reqid.Text = datatable1.Rows[0]["EmployeeID"].ToString();
                    lbl_empname.Text = datatable1.Rows[0]["RequestBy"].ToString();
                    if (datatable1.Rows[0]["Date"].ToString() != null)
                    {
                        lbl_date.Text = Convert.ToDateTime(datatable1.Rows[0]["Date"]).ToString("dd-MMM-yyyy", CultureInfo.InvariantCulture);
                    }

                    lbl_rqAsset.Text = AssetName;
                    lbl_reqQuantity.Text = datatable1.Rows[0]["Quantity"].ToString();
                    // reqdeptcode.Text = datatable1.Rows[0]["CustDepartmentCode"].ToString();
                    reqdeptname.Text = datatable1.Rows[0]["CustodianDepartment"].ToString();
                    reqdesig.Text = datatable1.Rows[0]["CustDesignation"].ToString();
                    apprID.Text = datatable1.Rows[0]["ApproverID"].ToString();
                    apprName.Text = datatable1.Rows[0]["ApproverName"].ToString();
                    apprDept.Text = datatable1.Rows[0]["ApproverDepartment"].ToString();
                    //apprDeptCode.Text = datatable1.Rows[0]["ApproverDeptCode"].ToString();
                    apprdesign.Text = datatable1.Rows[0]["ApproverDesignation"].ToString();
                    apprcmts.Text = datatable1.Rows[0]["ApproverComments"].ToString();
                }
            }

        }

        if (RequestType == "Buyback")
        {
            string select2 = "SELECT BuybackRequestID,AssetID,EmployeeID,RequestBy,Status,Date,Comments,AdminComments,CustodianDepartment,CustDepartmentCode,CustDesignation,AdminID,AdminName,AdminDesignation,AdminDeptCode,AdminDepartment,RequestType FROM EmployeeAssetBuyback where BuybackRequestID='" + RequestID + "'";
            SqlCommand cmd2 = new SqlCommand(select2, conAMS);
            SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
            DataTable datatable2 = new DataTable();
            da2.Fill(datatable2);
            if (status == "Request Sent To Admin" || status == "Approved" || status == "Rejected")
            {
                req.Visible = false;
                reqloc.Visible = false;
                Assetdetails.Visible = true;
                Approverdetails.Visible = false;
                if (datatable2.Rows.Count > 0)
                {
                    reqid.Text = datatable2.Rows[0]["EmployeeID"].ToString();
                    lbl_empname.Text = datatable2.Rows[0]["RequestBy"].ToString();
                    if (datatable2.Rows[0]["Date"].ToString() != null)
                    {
                        lbl_date.Text = Convert.ToDateTime(datatable2.Rows[0]["Date"]).ToString("dd-MMM-yyyy", CultureInfo.InvariantCulture);
                    }

                    //reqdeptcode.Text = datatable2.Rows[0]["CustDepartmentCode"].ToString();
                    reqdeptname.Text = datatable2.Rows[0]["CustodianDepartment"].ToString();
                    reqdesig.Text = datatable2.Rows[0]["CustDesignation"].ToString();
                    string AssetID = datatable2.Rows[0]["AssetID"].ToString();
                    GetAssetDetails(AssetID);
                }

            }
            //if (status == "Approved")
            //{
            //    req.Visible = false;
            //    reqloc.Visible = false;
            //    Assetdetails.Visible = true;
            //    Approverdetails.Visible = false;
            //    if (datatable2.Rows.Count > 0)
            //    {
            //        reqid.Text = datatable2.Rows[0]["EmployeeID"].ToString();
            //        lbl_empname.Text = datatable2.Rows[0]["RequestBy"].ToString();
            //        if (datatable2.Rows[0]["Date"].ToString() != null)
            //        {
            //            lbl_date.Text = Convert.ToDateTime(datatable2.Rows[0]["Date"]).ToString("dd/MM/yyyy", CultureInfo.InvariantCulture);
            //        }

            //        reqdeptcode.Text = datatable2.Rows[0]["CustDepartmentCode"].ToString();
            //        reqdeptname.Text = datatable2.Rows[0]["CustodianDepartment"].ToString();
            //        reqdesig.Text = datatable2.Rows[0]["CustDesignation"].ToString();
            //        string AssetID = datatable2.Rows[0]["AssetID"].ToString();
            //        GetAssetDetails(AssetID);
            //    }
            //}
        }

        if (RequestType == "Location Transfer")
        {
            string select3 = "SELECT LocationChangeID,AssetID,EmployeeID,EmployeeLocationChange.Status,Date,CustodianComments,ApproverComments,AdminComments,CustodianDepartment,CustDepartmentCode,CustDesignation,RequestBy,ApproverID,ApproverName,ApproverDesignation,ApproverDeptCode,ApproverDepartment,AdminID,AdminName,AdminDesignation,concat(ToLocation+' (',LocationMaster.Block+')')as ToLocation,AdminDeptCode,AdminDepartment,RequestType FROM EmployeeLocationChange inner join LocationMaster on LocationMaster.LocationID= EmployeeLocationChange.LocationID where LocationChangeID='" + RequestID + "'";
            SqlCommand cmd3 = new SqlCommand(select3, conAMS);
            SqlDataAdapter da3 = new SqlDataAdapter(cmd3);
            DataTable datatable3 = new DataTable();
            da3.Fill(datatable3);
            if (status == "Request Sent To Approver")
            {
                req.Visible = false;
                reqloc.Visible = true;
                Assetdetails.Visible = true;
                Approverdetails.Visible = false;
                if (datatable3.Rows.Count > 0)
                {
                    reqid.Text = datatable3.Rows[0]["EmployeeID"].ToString();
                    lbl_empname.Text = datatable3.Rows[0]["RequestBy"].ToString();
                    if (datatable3.Rows[0]["Date"].ToString() != null)
                    {
                        lbl_date.Text = Convert.ToDateTime(datatable3.Rows[0]["Date"]).ToString("dd-MMM-yyyy", CultureInfo.InvariantCulture);
                    }

                    //reqdeptcode.Text = datatable3.Rows[0]["CustDepartmentCode"].ToString();
                    reqdeptname.Text = datatable3.Rows[0]["CustodianDepartment"].ToString();
                    reqdesig.Text = datatable3.Rows[0]["CustDesignation"].ToString();
                    lbl_Requestedlocation.Text = datatable3.Rows[0]["ToLocation"].ToString();
                    string AssetID = datatable3.Rows[0]["AssetID"].ToString();
                    GetAssetDetails(AssetID);
                }
            }
            if (status == "Request Sent To Admin" || status == "Approved" || status == "Rejected")
            {
                req.Visible = false;
                reqloc.Visible = true;
                Assetdetails.Visible = true;
                Approverdetails.Visible = true;
                if (datatable3.Rows.Count > 0)
                {
                    reqid.Text = datatable3.Rows[0]["EmployeeID"].ToString();
                    lbl_empname.Text = datatable3.Rows[0]["RequestBy"].ToString();
                    if (datatable3.Rows[0]["Date"].ToString() != null)
                    {
                        lbl_date.Text = Convert.ToDateTime(datatable3.Rows[0]["Date"]).ToString("dd-MMM-yyyy", CultureInfo.InvariantCulture);
                    }

                    //reqdeptcode.Text = datatable3.Rows[0]["CustDepartmentCode"].ToString();
                    reqdeptname.Text = datatable3.Rows[0]["CustodianDepartment"].ToString();
                    reqdesig.Text = datatable3.Rows[0]["CustDesignation"].ToString();
                    lbl_Requestedlocation.Text = datatable3.Rows[0]["ToLocation"].ToString();
                    string AssetID = datatable3.Rows[0]["AssetID"].ToString();
                    GetAssetDetails(AssetID);
                    apprID.Text = datatable3.Rows[0]["ApproverID"].ToString();
                    apprName.Text = datatable3.Rows[0]["ApproverName"].ToString();
                    apprDept.Text = datatable3.Rows[0]["ApproverDepartment"].ToString();
                    //apprDeptCode.Text = datatable3.Rows[0]["ApproverDeptCode"].ToString();
                    apprdesign.Text = datatable3.Rows[0]["ApproverDesignation"].ToString();
                    apprcmts.Text = datatable3.Rows[0]["ApproverComments"].ToString();
                }
            }
            //if (status == "Approved")
            //{
            //    req.Visible = false;
            //    reqloc.Visible = true;
            //    Assetdetails.Visible = true;
            //    Approverdetails.Visible = true;
            //    if (datatable3.Rows.Count > 0)
            //    {
            //        reqid.Text = datatable3.Rows[0]["EmployeeID"].ToString();
            //        lbl_empname.Text = datatable3.Rows[0]["RequestBy"].ToString();
            //        if (datatable3.Rows[0]["Date"].ToString() != null)
            //        {
            //            lbl_date.Text = Convert.ToDateTime(datatable3.Rows[0]["Date"]).ToString("dd/MM/yyyy", CultureInfo.InvariantCulture);
            //        }

            //        reqdeptcode.Text = datatable3.Rows[0]["CustDepartmentCode"].ToString();
            //        reqdeptname.Text = datatable3.Rows[0]["CustodianDepartment"].ToString();
            //        reqdesig.Text = datatable3.Rows[0]["CustDesignation"].ToString();
            //        lbl_Requestedlocation.Text = datatable3.Rows[0]["ToLocation"].ToString();
            //        string AssetID = datatable3.Rows[0]["AssetID"].ToString();
            //        GetAssetDetails(AssetID);
            //        apprID.Text = datatable3.Rows[0]["ApproverID"].ToString();
            //        apprName.Text = datatable3.Rows[0]["ApproverName"].ToString();
            //        apprDept.Text = datatable3.Rows[0]["ApproverDepartment"].ToString();
            //        apprDeptCode.Text = datatable3.Rows[0]["ApproverDeptCode"].ToString();
            //        apprdesign.Text = datatable3.Rows[0]["ApproverDesignation"].ToString();
            //        apprcmts.Text = datatable3.Rows[0]["ApproverComments"].ToString();
            //    }
            //}
        }

        if (RequestType == "Employee Transfer")
        {
            string select4 = "SELECT CustodianChangeID,AssetID,EmployeeID,CustodianComments,ApproverComments,Date,Status,ToCustodian,AdminComments,CustodianDepartment,CustDepartmentCode,CustDesignation,RequestBy,ApproverID,ApproverName,ApproverDesignation,ApproverDeptCode,ApproverDepartment,AdminID,AdminName,AdminDesignation,AdminDeptCode,AdminDepartment,RequestType FROM CustodianChangeRequest where CustodianChangeID='" + RequestID + "'";
            SqlCommand cmd4 = new SqlCommand(select4, conAMS);
            SqlDataAdapter da4 = new SqlDataAdapter(cmd4);
            DataTable datatable4 = new DataTable();
            da4.Fill(datatable4);
            if (status == "Request Sent To Approver")
            {
                req.Visible = false;
                reqloc.Visible = false;
                Assetdetails.Visible = true;
                Approverdetails.Visible = false;
                if (datatable4.Rows.Count > 0)
                {
                    reqid.Text = datatable4.Rows[0]["EmployeeID"].ToString();
                    lbl_empname.Text = datatable4.Rows[0]["RequestBy"].ToString();
                    if (datatable4.Rows[0]["Date"].ToString() != null)
                    {
                        lbl_date.Text = Convert.ToDateTime(datatable4.Rows[0]["Date"]).ToString("dd-MMM-yyyy", CultureInfo.InvariantCulture);
                    }

                    // reqdeptcode.Text = datatable4.Rows[0]["CustDepartmentCode"].ToString();
                    reqdeptname.Text = datatable4.Rows[0]["CustodianDepartment"].ToString();
                    reqdesig.Text = datatable4.Rows[0]["CustDesignation"].ToString();
                    string AssetID = datatable4.Rows[0]["AssetID"].ToString();
                    GetAssetDetails(AssetID);
                }
            }
            if (status == "Request Sent To Admin" || status == "Approved" || status == "Rejected")
            {
                req.Visible = false;
                reqloc.Visible = false;
                Assetdetails.Visible = true;
                Approverdetails.Visible = true;
                if (datatable4.Rows.Count > 0)
                {
                    reqid.Text = datatable4.Rows[0]["EmployeeID"].ToString();
                    lbl_empname.Text = datatable4.Rows[0]["RequestBy"].ToString();
                    if (datatable4.Rows[0]["Date"].ToString() != null)
                    {
                        lbl_date.Text = Convert.ToDateTime(datatable4.Rows[0]["Date"]).ToString("dd-MMM-yyyy", CultureInfo.InvariantCulture);
                    }

                    //reqdeptcode.Text = datatable4.Rows[0]["CustDepartmentCode"].ToString();
                    reqdeptname.Text = datatable4.Rows[0]["CustodianDepartment"].ToString();
                    reqdesig.Text = datatable4.Rows[0]["CustDesignation"].ToString();
                    string AssetID = datatable4.Rows[0]["AssetID"].ToString();
                    GetAssetDetails(AssetID);
                    apprID.Text = datatable4.Rows[0]["ApproverID"].ToString();
                    apprName.Text = datatable4.Rows[0]["ApproverName"].ToString();
                    apprDept.Text = datatable4.Rows[0]["ApproverDepartment"].ToString();
                    //apprDeptCode.Text = datatable4.Rows[0]["ApproverDeptCode"].ToString();
                    apprdesign.Text = datatable4.Rows[0]["ApproverDesignation"].ToString();
                    apprcmts.Text = datatable4.Rows[0]["ApproverComments"].ToString();
                }
            }
            //if (status == "Approved")
            //{
            //    req.Visible = false;
            //    reqloc.Visible = false;
            //    Assetdetails.Visible = true;
            //    Approverdetails.Visible = true;
            //    if (datatable4.Rows.Count > 0)
            //    {
            //        reqid.Text = datatable4.Rows[0]["EmployeeID"].ToString();
            //        lbl_empname.Text = datatable4.Rows[0]["RequestBy"].ToString();
            //        if (datatable4.Rows[0]["Date"].ToString() != null)
            //        {
            //            lbl_date.Text = Convert.ToDateTime(datatable4.Rows[0]["Date"]).ToString("dd/MM/yyyy", CultureInfo.InvariantCulture);
            //        }

            //        reqdeptcode.Text = datatable4.Rows[0]["CustDepartmentCode"].ToString();
            //        reqdeptname.Text = datatable4.Rows[0]["CustodianDepartment"].ToString();
            //        reqdesig.Text = datatable4.Rows[0]["CustDesignation"].ToString();
            //        string AssetID = datatable4.Rows[0]["AssetID"].ToString();
            //        GetAssetDetails(AssetID);
            //        apprID.Text = datatable4.Rows[0]["ApproverID"].ToString();
            //        apprName.Text = datatable4.Rows[0]["ApproverName"].ToString();
            //        apprDept.Text = datatable4.Rows[0]["ApproverDepartment"].ToString();
            //        apprDeptCode.Text = datatable4.Rows[0]["ApproverDeptCode"].ToString();
            //        apprdesign.Text = datatable4.Rows[0]["ApproverDesignation"].ToString();
            //        apprcmts.Text = datatable4.Rows[0]["ApproverComments"].ToString();
            //    }
            //}
        }

        if (RequestType == "Asset Return")
        {
            string select5 = "SELECT  AssetReturnID,AssetID,EmployeeID,ToLocation,ToCustodian,CustodianComments,ApproverComments,AdminComments,Date,Status,CustodianDepartment,CustDepartmentCode,CustDesignation,RequestBy,ApproverID,ApproverName,ApproverDesignation,ApproverDeptCode,ApproverDepartment,AdminID,AdminName,AdminDesignation,AdminDeptCode,AdminDepartment,RequestType FROM EmployeeAssetReturn where AssetReturnID='" + RequestID + "'";
            SqlCommand cmd5 = new SqlCommand(select5, conAMS);
            SqlDataAdapter da5 = new SqlDataAdapter(cmd5);
            DataTable datatable5 = new DataTable();
            da5.Fill(datatable5);
            //if (status == "Request Sent To Approver")
            //{
            //    req.Visible = false;
            //    reqloc.Visible = false;
            //    Assetdetails.Visible = true;
            //    Approverdetails.Visible = false;
            //    if (datatable5.Rows.Count>0)
            //    {
            //        reqid.Text = datatable5.Rows[0]["EmployeeID"].ToString();
            //        lbl_empname.Text = datatable5.Rows[0]["RequestBy"].ToString();
            //        if (datatable5.Rows[0]["Date"].ToString() != null)
            //        {
            //            lbl_date.Text = Convert.ToDateTime(datatable5.Rows[0]["Date"]).ToString("dd-MMM-yyyy", CultureInfo.InvariantCulture);
            //        }

            //        reqdeptcode.Text = datatable5.Rows[0]["CustDepartmentCode"].ToString();
            //        reqdeptname.Text = datatable5.Rows[0]["CustodianDepartment"].ToString();
            //        reqdesig.Text = datatable5.Rows[0]["CustDesignation"].ToString();
            //        string AssetID = datatable5.Rows[0]["AssetID"].ToString();
            //        GetAssetDetails(AssetID);
            //    }
            //}
            if (status == "Request Sent To Admin" || status == "Approved" || status == "Rejected")
            {
                req.Visible = false;
                reqloc.Visible = false;
                Assetdetails.Visible = true;
                Approverdetails.Visible = false;
                if (datatable5.Rows.Count > 0)
                {
                    reqid.Text = datatable5.Rows[0]["EmployeeID"].ToString();
                    lbl_empname.Text = datatable5.Rows[0]["RequestBy"].ToString();
                    if (datatable5.Rows[0]["Date"].ToString() != null)
                    {
                        lbl_date.Text = Convert.ToDateTime(datatable5.Rows[0]["Date"]).ToString("dd-MMM-yyyy", CultureInfo.InvariantCulture);
                    }

                    // reqdeptcode.Text = datatable5.Rows[0]["CustDepartmentCode"].ToString();
                    reqdeptname.Text = datatable5.Rows[0]["CustodianDepartment"].ToString();
                    reqdesig.Text = datatable5.Rows[0]["CustDesignation"].ToString();
                    string AssetID = datatable5.Rows[0]["AssetID"].ToString();
                    GetAssetDetails(AssetID);
                    apprID.Text = datatable5.Rows[0]["ApproverID"].ToString();
                    apprName.Text = datatable5.Rows[0]["ApproverName"].ToString();
                    apprDept.Text = datatable5.Rows[0]["ApproverDepartment"].ToString();
                    //apprDeptCode.Text = datatable5.Rows[0]["ApproverDeptCode"].ToString();
                    apprdesign.Text = datatable5.Rows[0]["ApproverDesignation"].ToString();
                    apprcmts.Text = datatable5.Rows[0]["ApproverComments"].ToString();
                }
            }
            //if (status == "Approved")
            //{
            //    req.Visible = false;
            //    reqloc.Visible = false;
            //    Assetdetails.Visible = true;
            //    Approverdetails.Visible = true;
            //    if (datatable5.Rows.Count > 0)
            //    {
            //        reqid.Text = datatable5.Rows[0]["EmployeeID"].ToString();
            //        lbl_empname.Text = datatable5.Rows[0]["RequestBy"].ToString();
            //        if (datatable5.Rows[0]["Date"].ToString() != null)
            //        {
            //            lbl_date.Text = Convert.ToDateTime(datatable5.Rows[0]["Date"]).ToString("dd/MM/yyyy", CultureInfo.InvariantCulture);
            //        }

            //        reqdeptcode.Text = datatable5.Rows[0]["CustDepartmentCode"].ToString();
            //        reqdeptname.Text = datatable5.Rows[0]["CustodianDepartment"].ToString();
            //        reqdesig.Text = datatable5.Rows[0]["CustDesignation"].ToString();
            //        string AssetID = datatable5.Rows[0]["AssetID"].ToString();
            //        GetAssetDetails(AssetID);
            //        apprID.Text = datatable5.Rows[0]["ApproverID"].ToString();
            //        apprName.Text = datatable5.Rows[0]["ApproverName"].ToString();
            //        apprDept.Text = datatable5.Rows[0]["ApproverDepartment"].ToString();
            //        apprDeptCode.Text = datatable5.Rows[0]["ApproverDeptCode"].ToString();
            //        apprdesign.Text = datatable5.Rows[0]["ApproverDesignation"].ToString();
            //        apprcmts.Text = datatable5.Rows[0]["ApproverComments"].ToString();
            //    }
            //}
        }

        if (RequestType == "Asset Parking")
        {
            string select1 = "SELECT  AssetRequestID,AssetTypeID,RequestBy,EmployeeID,Quantity,Status,Date,MainAssetNumber,ApprovedQuantity,Comments,AssetTypeCode,ApproverComments,AdminComments,CustodianDepartment,CustDepartmentCode,CustDesignation,ApproverID,ApproverName,ApproverDesignation,ApproverDeptCode,ApproverDepartment,AdminID,AdminName,AdminDesignation,AdminDeptCode,AdminDepartment,RequestType FROM EmployeeAssetRequest where AssetRequestID='" + RequestID + "'";
            SqlCommand cmd1 = new SqlCommand(select1, conAMS);
            SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
            DataTable datatable1 = new DataTable();
            da1.Fill(datatable1);

            if (status == "Approved" || status == "Rejected")
            {
                Assetdetails.Visible = false;
                Approverdetails.Visible = false;
                allocatedassets.Visible = true;
                if (datatable1.Rows.Count > 0)
                {
                    reqid.Text = datatable1.Rows[0]["EmployeeID"].ToString();
                    lbl_empname.Text = datatable1.Rows[0]["RequestBy"].ToString();
                    if (datatable1.Rows[0]["Date"].ToString() != null)
                    {
                        lbl_date.Text = Convert.ToDateTime(datatable1.Rows[0]["Date"]).ToString("dd-MMM-yyyy", CultureInfo.InvariantCulture);
                    }

                    lbl_rqAsset.Text = AssetName;
                    lbl_reqQuantity.Text = datatable1.Rows[0]["Quantity"].ToString();
                    // reqdeptcode.Text = datatable1.Rows[0]["CustDepartmentCode"].ToString();
                    reqdeptname.Text = datatable1.Rows[0]["CustodianDepartment"].ToString();
                    reqdesig.Text = datatable1.Rows[0]["CustDesignation"].ToString();

                }
            }

        }

    }

    protected void GetAssetDetails(String AssetID)
    {
        string query = "SELECT AssetID,MainAssetNumber,AssetSubNumber,CustodianDepartment,concat(AssetDesc+' ',AdditionalDesc)as AssetDescription,concat(Quantity+' ',Unit)as Quantity,AssetCapitalizationDate,FirstAcquisitionDate,CustodianID,concat(Location+' (',Block+')')as Location,concat(StatusDesc+' (',Status+')')as Status,AssetClass,concat(ComponentDesc+' ',Component)as Component,Deacdate,Invdate,InventoryNote FROM [AssetMaster] where AssetID = '" + AssetID + "'";
        SqlDataAdapter da = new SqlDataAdapter(query, conSAP);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            try
            {

                lbl_mainassetnumber.Text = dt.Rows[0]["MainAssetNumber"].ToString();
                lbl_subnumber.Text = dt.Rows[0]["AssetSubNumber"].ToString();
                lbl_reqasset.Text = dt.Rows[0]["AssetDescription"].ToString();
                lbl_assetclass.Text = dt.Rows[0]["AssetClass"].ToString();
                lbl_Currentlocation.Text = dt.Rows[0]["Location"].ToString();
                lbl_assetstatus.Text = dt.Rows[0]["Status"].ToString();
                lbl_quantity.Text = dt.Rows[0]["Quantity"].ToString();
                lbl_component.Text = dt.Rows[0]["Component"].ToString();
                lbl_inventorynote.Text = dt.Rows[0]["InventoryNote"].ToString();

                if (dt.Rows[0]["AssetCapitalizationDate"].ToString() != null)
                {
                    lbl_capitalizationdate.Text = Convert.ToDateTime(dt.Rows[0]["AssetCapitalizationDate"]).ToString("dd-MMM-yyyy", CultureInfo.InvariantCulture);
                }
                if (dt.Rows[0]["FirstAcquisitionDate"].ToString() != null)
                {
                    lbl_acquisitiondate.Text = Convert.ToDateTime(dt.Rows[0]["FirstAcquisitionDate"]).ToString("dd-MMM-yyyy", CultureInfo.InvariantCulture);
                }
                if (dt.Rows[0]["Deacdate"].ToString() != null)
                {
                    lbl_deacdate.Text = Convert.ToDateTime(dt.Rows[0]["Deacdate"]).ToString("dd-MMM-yyyy", CultureInfo.InvariantCulture);
                }
                if (dt.Rows[0]["Invdate"].ToString() != null)
                {
                    lbl_inventorydate.Text = Convert.ToDateTime(dt.Rows[0]["Invdate"]).ToString("dd-MMM-yyyy", CultureInfo.InvariantCulture);
                }


            }
            catch (Exception ex)
            {

            }
        }
    }



    protected void btn_back_Click(object sender, EventArgs e)
    {
        Response.Redirect("ViewAllReuestApprover.aspx");

    }
}