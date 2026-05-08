using DevExpress.Web.ASPxGridView;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class ViewAssetParking : System.Web.UI.Page
{
    SqlConnection conCommon = new SqlConnection(WebConfigurationManager.ConnectionStrings["ASSETManagementConnectionString"].ConnectionString);
    SqlConnection conAMS = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBAMSConnectionString"].ConnectionString);
   
    int id = 1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Redirect("ErrorPage.aspx");
            return;
        }

        GetAllRequests();
    }

    protected void GetAllRequests()
    {
      //  string CustodianName, CustodianDepartmentCode, DepartmentName, Designation;
        string select1 = " SELECT CustodianID FROM AssetParking where Status='Active' GROUP BY CustodianID";
        SqlCommand cmd1 = new SqlCommand(select1, conAMS);
        SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
        DataTable datatable1 = new DataTable();
       
        datatable1.Columns.Add("CustodianName", typeof(String));
        datatable1.Columns.Add("CustodianDepartmentCode", typeof(String));
        datatable1.Columns.Add("DepartmentName", typeof(String));
        datatable1.Columns.Add("Designation", typeof(String));
        datatable1.Columns.Add("ID", typeof(System.Int32));
        datatable1.Columns.Add("RequestType", typeof(String));
        //datatable1.AcceptChanges();
        da1.Fill(datatable1);
        for (int i = 0; i < datatable1.Rows.Count; i++)
        {
            datatable1.Rows[i]["ID"] = id;
            id = id + 1;
            string CustodianID=datatable1.Rows[i]["CustodianID"].ToString();
            string select2 = "SELECT CustodianName,CustodianDepartmentCode,DepartmentName,Designation FROM vEmpDtlsAssetApp inner join vDepartmentAssetApp on vDepartmentAssetApp.DepartmentCode = vEmpDtlsAssetApp.CustodianDepartmentCode where CustodianID='" + CustodianID + "'";
            SqlCommand cmd2 = new SqlCommand(select2, conCommon);
            SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
            DataTable datatable2 = new DataTable();
            da2.Fill(datatable2);
            if (datatable2.Rows.Count > 0)
            {
                datatable1.Rows[i]["RequestType"] = "Asset Parking";
                datatable1.Rows[i]["CustodianName"] = datatable2.Rows[0].ItemArray[0].ToString();
                datatable1.Rows[i]["CustodianDepartmentCode"] = datatable2.Rows[0].ItemArray[1].ToString();
                datatable1.Rows[i]["DepartmentName"] = datatable2.Rows[0].ItemArray[2].ToString();
                datatable1.Rows[i]["Designation"] = datatable2.Rows[0].ItemArray[3].ToString();
                
            }
           

        }
        ASPxGridView1.DataSource = datatable1;
        ASPxGridView1.DataBind();

    }

    protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        Session["CustodianID"] = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "CustodianID").ToString();
        Session["CustodianName"] = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "CustodianName").ToString();
        Session["CustodianDepartmentCode"] = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "CustodianDepartmentCode").ToString();
        Session["DepartmentName"] = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "DepartmentName").ToString();
        Session["Designation"] = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "Designation").ToString();
        Response.Redirect("ApproveAssetParking.aspx");
    }

    protected void DetailGrid1_BeforePerformDataSelect(object sender, EventArgs e)
    {
        Session["CustodianID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
    }
}