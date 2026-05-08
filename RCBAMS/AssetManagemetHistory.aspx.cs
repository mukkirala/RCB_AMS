using DevExpress.CodeParser;
using DevExpress.Web.ASPxClasses.Design;
using EnvDTE;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AssetManagemetHistory : System.Web.UI.Page
{
    SqlConnection conAms = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemAMSConnectionString"].ConnectionString);
    SqlConnection consap = new SqlConnection(WebConfigurationManager.ConnectionStrings["InstemSAPConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void ASPxButton1_Click(object sender, EventArgs e)
    {
        if (ASPxLabel7.Value == null)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Enter Search');", true);
            return;
        }

        ASPxGridView1.DataBind();
        ASPxGridView2.DataBind();
    //    DataTable dt = new DataTable();
    //    dt.Columns.Add("AssetID");
    //    dt.Columns.Add("AssetTypeName");
    //    dt.Columns.Add("EmployeeID");
    //    dt.Columns.Add("Requestedby");       
    //    dt.Columns.Add("Location");
    //    dt.Columns.Add("Block");
    //    dt.Columns.Add("RequestedChangeCustodian");
    //    dt.Columns.Add("TransferTo");
    //    dt.Columns.Add("Date");

        //    string Query = "Select AssetId from [AssetMaster] where AssetID = '"+ Cust_gridlookup.Value +"'";
        //    SqlCommand mycommand = new SqlCommand(Query, consap);
        //    SqlDataAdapter da = new SqlDataAdapter(mycommand);
        //    da.Fill(dt);
        //    if(dt.Rows.Count  > 0)
        //    {
        //        DataTable dt1 = new DataTable();
        //        string Query1 = "Select [AssetID] from [CustodianChangeRequest] where AssetID = '"+ Cust_gridlookup.Value +"'";
        //        SqlCommand mycommand1 = new SqlCommand(Query1, conAms);
        //        SqlDataAdapter da1 = new SqlDataAdapter(mycommand1);
        //        da1.Fill(dt1);
        //        DataTable dt2 = new DataTable();
        //        string Query2 = "Select [AssetID] from [EmployeeLocationChange] where AssetID = '" + Cust_gridlookup.Value + "'";
        //        SqlCommand mycommand2 = new SqlCommand(Query2, conAms);
        //        SqlDataAdapter da2 = new SqlDataAdapter(mycommand2);
        //        da2.Fill(dt2);
        //        if (dt1.Rows.Count > 0)
        //        {
        //            //for(int i=0; i< dt1.Rows.Count; i++)
        //            //{
        //            //    DataTable dt3 = new DataTable();
        //            //    string Query3 = "Select [[ToCustodian]],[RequestBy],LocationMaster.[Block],[ToLocation] from [CustodianChangeRequest] inner join LocationMaster on LocationMaster.LocationID = EmployeeLocationChange.LocationID where AssetID = '" + Cust_gridlookup.Value + "'";
        //            //    SqlCommand mycommand3 = new SqlCommand(Query3, conAms);
        //            //    SqlDataAdapter da3 = new SqlDataAdapter(mycommand3);
        //            //    da3.Fill(dt3);
        //            //    if (dt3.Rows.Count > 0)
        //            //    {

        //            //        //int Row_Enum = Convert.ToInt32(dt3.Rows[i][0]);
        //            //        //int empid = Convert.ToInt32(dt3.Rows[0][0]);
        //            //        dt.Rows[i][2] = dt3.Rows[0]["EmployeeID"];
        //            //        dt.Rows[i][3] = dt3.Rows[0]["Requestedby"];
        //            //        dt.Rows[i][4] = dt3.Rows[0]["Requestedby"];
        //            //        dt.Rows[i][5] = dt3.Rows[0]["Requestedby"];
        //            //    }
        //            //}
        //        }
        //        else if(dt2.Rows.Count > 0)
        //        {
        //            for (int i = 0; i < dt2.Rows.Count; i++)
        //            {
        //                DataTable dt4 = new DataTable();
        //                string Query4 = "Select [EmployeeID],[RequestBy],LocationMaster.[Block],[ToLocation] from [EmployeeLocationChange] inner join LocationMaster on LocationMaster.LocationID = EmployeeLocationChange.LocationID where AssetID = '" + Cust_gridlookup.Value + "'";
        //                SqlCommand mycommand4 = new SqlCommand(Query4, conAms);
        //                SqlDataAdapter da4 = new SqlDataAdapter(mycommand4);
        //                da4.Fill(dt4);
        //                if (dt4.Rows.Count > 0)
        //                {
        //                    DataRow row = dt.NewRow();
        //                    //int Row_Enum = Convert.ToInt32(dt3.Rows[i][0]);
        //                    //int empid = Convert.ToInt32(dt3.Rows[0][0]);
        //                    dt.Rows[i][2] = dt4.Rows[0]["EmployeeID"];
        //                    dt.Rows[i][3] = dt4.Rows[0]["RequestBy"];
        //                    dt.Rows[i][4] = dt4.Rows[0]["ToLocation"];
        //                    dt.Rows[i][5] = dt4.Rows[0]["Block"];
        //                    continue;
        //                }
        //            }
        //        }

        //    }
        //    ASPxGridView1.DataSource = dt;
        //    ASPxGridView1.DataBind();

    }

    protected void ASPxGridView2_CustomUnboundColumnData(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewColumnDataEventArgs e)
    {

    }

    protected void btn_search_Click(object sender, EventArgs e)
    {
        if (Cust_gridlookup.Text == "")
        {


        }
        else
        {
            AssetDetails.Visible = true;
            string query = "SELECT AssetID,MainAssetNumber,AssetSubNumber,concat(AssetDesc+' ',AdditionalDesc)as AssetDescription,Location,Block,AssetClass,AssetUser FROM [AssetMaster] where AssetID = '" + Cust_gridlookup.Value + "'";
            SqlDataAdapter da = new SqlDataAdapter(query, consap);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {

                lbl_AssetNo.Text = dt.Rows[0]["MainAssetNumber"].ToString();
                lbl_SubNumber.Text = dt.Rows[0]["AssetSubNumber"].ToString();
                lbl_AssetType.Text = dt.Rows[0]["AssetDescription"].ToString();
                lbl_Assetclass.Text = dt.Rows[0]["AssetClass"].ToString();
                lbl_assetlocation.Text = dt.Rows[0]["Location"].ToString();
                lbl_Block.Text = dt.Rows[0]["Block"].ToString();
                lbl_User.Text = dt.Rows[0]["AssetUser"].ToString();

            }
        }
    }
}