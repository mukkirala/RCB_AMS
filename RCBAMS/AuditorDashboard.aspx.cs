using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;

public partial class AuditorDashboard : System.Web.UI.Page
{
    SqlConnection conSAP = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBSAPConnectionString"].ConnectionString);
    SqlConnection conAMS = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBAMSConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] != null)
        {
            string select1 = "select AuditID from AuditMaster where AuditStatus='Active'";
            SqlDataAdapter da1 = new SqlDataAdapter(select1, conAMS);
            DataTable dt1 = new DataTable();
            da1.Fill(dt1);
            int a = dt1.Rows.Count;
            lbl_createdaudits.Text =a.ToString();

            string select2 = "select distinct AuditID from AuditDetails where Status='Approved' and CustodianID='" + Session["UserID"].ToString() + "'";
            SqlDataAdapter da2 = new SqlDataAdapter(select2, conAMS);
            DataTable dt2 = new DataTable();
            da2.Fill(dt2);
            int i = dt2.Rows.Count;
            //lbl_approvedaudits.Text = i.ToString();


            //string select3 = "select distinct AuditID from AuditDetails where CustodianID='" + Session["UserID"].ToString()+ "'";
            string select3 = "select AuditID from AuditMaster where AuditStatus='Active' except select distinct AuditID from AuditDetails";

            SqlDataAdapter da3 = new SqlDataAdapter(select3, conAMS);
            DataTable dt3 = new DataTable();
            da3.Fill(dt3);
            int j = dt3.Rows.Count;
            lbl_performaudit.Text = j.ToString();
          

            int p = a - j;
            lbl_assetbyaudit.Text = p.ToString();

            updates_fa();
        }
        else
        {
            Response.Redirect("/Login.aspx");
        }
    }

    void updates_fa()
    {
        SqlDataAdapter da_fa = new SqlDataAdapter("select Count(AssetID) from AssetMaster where AssetMaster.Status='AREP'", conSAP);
        DataTable dt_fa = new DataTable();
        da_fa.Fill(dt_fa);
        if (dt_fa.Rows.Count > 0)
        {
            //lbl_cntAREP.Text = dt_fa.Rows[0].ItemArray[0].ToString();
            //if (int.Parse(lbl_cntAREP.Text) > 0)
            //{
            //    //req1.Visible = true;
            //}
        }
        else
        {
            //lbl_cntAREP.Text = "0";
            //req1.Visible = false;
        }

        SqlDataAdapter da_fa1 = new SqlDataAdapter("select Count(AssetID) from AssetMaster where AssetMaster.Status='DACT'", conSAP);
        DataTable dt_fa1 = new DataTable();
        da_fa1.Fill(dt_fa1);
        if (dt_fa1.Rows.Count > 0)
        {
            //lbl_cntDACT.Text = dt_fa1.Rows[0].ItemArray[0].ToString();
            //if (int.Parse(lbl_cntDACT.Text) > 0)
            //{
            //    //req2.Visible = true;
            //}
        }
        else
        {
            //lbl_cntDACT.Text = "0";
            //req2.Visible = false;
        }

        SqlDataAdapter da_fa2 = new SqlDataAdapter("select Count(AssetID) from AssetMaster where AssetMaster.Status='AVAL'", conSAP);
        DataTable dt_fa2 = new DataTable();
        da_fa2.Fill(dt_fa2);
        if (dt_fa2.Rows.Count > 0)
        {
            //lbl_cntAVAL.Text = dt_fa2.Rows[0].ItemArray[0].ToString();
            //if (int.Parse(lbl_cntAVAL.Text) > 0)
            //{
            //    //reqicon.Visible = true;
            //}
        }
        else
        {
            //lbl_cntAVAL.Text = "0";
            //reqicon.Visible = false;
        }

        SqlDataAdapter da_fa3 = new SqlDataAdapter("select Count(AssetID) from AssetMaster where AssetMaster.Status='DMGD'", conSAP);
        DataTable dt_fa3 = new DataTable();
        da_fa3.Fill(dt_fa3);
        if (dt_fa3.Rows.Count > 0)
        {
            //lbl_cntDMGD.Text = dt_fa3.Rows[0].ItemArray[0].ToString();
            //if (int.Parse(lbl_cntDMGD.Text) > 0)
            //{
            //   // req3.Visible = true;
            //}
        }
        else
        {
            //lbl_cntDMGD.Text = "0";
            //reqicon.Visible = false;
        }


        SqlDataAdapter da_fa4 = new SqlDataAdapter("select Count(AssetID) from AssetMaster where AssetMaster.Status='LTRF'", conSAP);
        DataTable dt_fa4 = new DataTable();
        da_fa4.Fill(dt_fa4);
        if (dt_fa4.Rows.Count > 0)
        {
            //lbl_cntLTRF.Text = dt_fa4.Rows[0].ItemArray[0].ToString();
            //if (int.Parse(lbl_cntLTRF.Text) > 0)
            //{
            //   // req4.Visible = true;
            //}
        }
        else
        {
            //lbl_cntLTRF.Text = "0";
            //req4.Visible = false;
        }
    }

    protected void lbtn_AVAL_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ViewAvailableAssets.aspx");
    }

    protected void lbtn_AREP_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/DamagedRepairableAssets.aspx");
    }

    protected void lbtn_DACT_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ViewDeactivatedAssets.aspx");
    }

    protected void lbtn_DMGD_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AssetAvailableDamaged.aspx");
    }

    protected void lbtn_LTRF_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ViewAssetsTransferred.aspx");
    }
}