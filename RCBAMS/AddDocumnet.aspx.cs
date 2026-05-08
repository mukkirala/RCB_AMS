using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxUploadControl;
using System.IO;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;
using DevExpress.Web.ASPxEditors;
using System.Drawing;
using System.Drawing.Drawing2D;



public partial class AddDocumnet : System.Web.UI.Page
{
    SqlConnection myConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBAMSConnectionString"].ConnectionString);
    SqlConnection myConnection2 = new SqlConnection(WebConfigurationManager.ConnectionStrings["RCBSAPConnectionString"].ConnectionString);
    SqlCommand myCommand, myCommand1;
    static DataTable dt;
    static int srno = 0;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        AssetDetails.Visible = false;
        if (Session["UserID"] == null)
        {
            Response.Redirect("ErrorPage.aspx");
            return;
        }

        if(IsPostBack){
            AssetData();
            AssetImageExist();
        }
         
    }
    protected void btn_save_Click(object sender, EventArgs e)
    {    
        lbl_msg.Visible = false;
        if (gridlkup_Asset.Text == string.Empty)
        {
            lbl_msg.Text = "Select Asset";
            lbl_msg.Visible = true;
            return;
        }
        if (cmb_selectdoctype.Text == "")
        {
            lbl_msg.Text = "Select Document Type";
            lbl_msg.Visible = true;
            return;
        }

        if (UploadImage.HasFile)
        {
            string Panfilename = UploadImage.PostedFile.FileName;
            string Panfilenamepath = Server.MapPath(@"~/AssetDocuments/" + Panfilename);
            UploadImage.SaveAs(Panfilenamepath); //DOB file

            string fileExt = System.IO.Path.GetExtension(UploadImage.FileName);
            string ImageUrl = "AssetDocuments/" + Panfilename + "";
            string DocTypeName = cmb_selectdoctype.Text.ToString();
            string Doc = cmb_selectdoctype.Value.ToString();
            if (fileExt == ".pdf" || fileExt == ".doc" || fileExt == ".docx")
            {
                string documenttype = "Newdocument";
                //do what you want with this image
                //AddData(srno, gridlkup_Asset.Value.ToString(), Doc, cmb_selectdoctype.Text, ImageUrl, Session["Images"].ToString(), ViewState["Base64Image"].ToString());
                AddData(srno, documenttype, gridlkup_Asset.Value.ToString(), Doc, cmb_selectdoctype.Text, ImageUrl);
                cmb_selectdoctype.Text = "";
                Session["Images"] = "";
                Clear();
            }
            else
            {
                Messages.SetErrorMessage("0009", null, null, null, Session);
                return;
            }
        }
        else
        {
            string Doc = cmb_selectdoctype.Value.ToString();
            string ImageUrl, Panfilename;
            Panfilename = Session["filename"].ToString();
            ImageUrl = Session["filepath"].ToString();
            string documenttype = "Newdocument";
            if (Session["filename"].ToString() != "")
            {
                
                AddData(srno, documenttype, gridlkup_Asset.Value.ToString(), Doc, cmb_selectdoctype.Text, ImageUrl);
                cmb_selectdoctype.Text = "";

               
            }
            else
            {
                lbl_msg.Text = "Please Upload the document";
                lbl_msg.Visible = true;
                return;
            }
        }


    }

    public byte[] ImageToByteArray(System.Web.UI.WebControls.Image img)
    {
        try
        {
            return File.ReadAllBytes(Server.MapPath(img.ImageUrl));
        }
        catch (Exception ex)
        {
            return new byte[0];
        }
    }

    public void AssetImageExist()
    {
        string query4 = "select ImageLocation from AssetImageMapping where AssetID='" + gridlkup_Asset.Value + "'";
        SqlDataAdapter daA = new SqlDataAdapter(query4, myConnection);
        DataTable dtA = new DataTable();
        daA.Fill(dtA);
        if (dtA.Rows.Count >= 1)
        {
            AspxImage2.ImageUrl = dtA.Rows[0]["ImageLocation"].ToString(); 
        }
    }

    public void UploadAssetImage(object sender, EventArgs e)
    {
        string AssetImage;
        string Base64Image;
        lbl_msg.Visible = false;
        if (gridlkup_Asset.Text == string.Empty)
        {
            lbl_msg.Text = "Select Asset";
            lbl_msg.Visible = true;
            return;
        }
        if(Session["imgpath"].ToString() == "")
        {
            return;
        }
        if (user_prof.HasFile)
        {
            //user_prof.SaveAs(Server.MapPath("~/Images/") + user_prof.PostedFile.FileName);
          
            //string targetPath = string.Format("/Images/" + user_prof.PostedFile.FileName);
            //AssetImage = targetPath;
            //var imgbyte = ImageToByteArray(AspxImage2);
            //Base64Image = Convert.ToBase64String(imgbyte);
            //string query4 = "select * from AssetImageMapping where AssetID='" + gridlkup_Asset.Value + "'";
            //SqlDataAdapter da4 = new SqlDataAdapter(query4, myConnection);
            //DataTable dt4 = new DataTable();
            //da4.Fill(dt4);
            //if (dt4.Rows.Count >= 1)
            //{
            //    string updatequery = "update AssetImageMapping set ImageLocation=@ImageLocation,AssetBase64Image=@AssetBase64Image,Status=@Status,Date=@Date where AssetID=@AssetID";
            //    myCommand1 = new SqlCommand(updatequery, myConnection);
            //    myCommand1.Parameters.AddWithValue("@ImageLocation", AssetImage);
            //    myCommand1.Parameters.AddWithValue("@AssetBase64Image", Base64Image);
            //    myCommand1.Parameters.AddWithValue("@Status", "Active");
            //    myCommand1.Parameters.AddWithValue("@Date", DateTime.Now);
            //    myCommand1.Parameters.AddWithValue("@AssetID", gridlkup_Asset.Value);
            //    myConnection.Open();
            //    myCommand1.ExecuteNonQuery();
            //    myConnection.Close();
            //    Clear();
            //}

            //else
            //{
            //    string insertquery = "insert into AssetImageMapping(AssetID,ImageLocation,AssetBase64Image,Status,Date)values(@AssetID,@ImageLocation,@AssetBase64Image,@Status,@Date)";
            //    myCommand1 = new SqlCommand(insertquery, myConnection);
            //    myCommand1.Parameters.AddWithValue("@ImageLocation", AssetImage);
            //    myCommand1.Parameters.AddWithValue("@AssetBase64Image", Base64Image);
            //    myCommand1.Parameters.AddWithValue("@Status", "Active");
            //    myCommand1.Parameters.AddWithValue("@Date", DateTime.Now);
            //    myCommand1.Parameters.AddWithValue("@AssetID", gridlkup_Asset.Value);
            //    myConnection.Open();
            //    myCommand1.ExecuteNonQuery();
            //    myConnection.Close();
            //    Clear();
            //}

        }
        else
        {
            string targetPath = Session["imgpath"].ToString();
            AssetImage = targetPath;
            AspxImage2.ImageUrl = AssetImage;
            var imgbyte = ImageToByteArray(AspxImage2);
            Base64Image = Convert.ToBase64String(imgbyte);
            string query4 = "select * from AssetImageMapping where AssetID='" + gridlkup_Asset.Value + "'";
            SqlDataAdapter da4 = new SqlDataAdapter(query4, myConnection);
            DataTable dt4 = new DataTable();
            da4.Fill(dt4);
            if (dt4.Rows.Count >= 1)
            {
                string updatequery = "update AssetImageMapping set ImageLocation=@ImageLocation,AssetBase64Image=@AssetBase64Image,Status=@Status,Date=@Date where AssetID=@AssetID";
                myCommand1 = new SqlCommand(updatequery, myConnection);
                myCommand1.Parameters.AddWithValue("@ImageLocation", AssetImage);
                myCommand1.Parameters.AddWithValue("@AssetBase64Image", Base64Image);
                myCommand1.Parameters.AddWithValue("@Status", "Active");
                myCommand1.Parameters.AddWithValue("@Date", DateTime.Now);
                myCommand1.Parameters.AddWithValue("@AssetID", gridlkup_Asset.Value);
                myConnection.Open();
                myCommand1.ExecuteNonQuery();
                myConnection.Close();
              
            }

            else
            {
                string insertquery = "insert into AssetImageMapping(AssetID,ImageLocation,AssetBase64Image,Status,Date)values(@AssetID,@ImageLocation,@AssetBase64Image,@Status,@Date)";
                myCommand1 = new SqlCommand(insertquery, myConnection);
                myCommand1.Parameters.AddWithValue("@ImageLocation", AssetImage);
                myCommand1.Parameters.AddWithValue("@AssetBase64Image", Base64Image);
                myCommand1.Parameters.AddWithValue("@Status", "Active");
                myCommand1.Parameters.AddWithValue("@Date", DateTime.Now);
                myCommand1.Parameters.AddWithValue("@AssetID", gridlkup_Asset.Value);
                myConnection.Open();
                myCommand1.ExecuteNonQuery();
                myConnection.Close();
               
            }
            AssetImageExist();

        }

    }

    protected void Clear()
    {
        gridlkup_Asset.Value = "";
        cmb_selectdoctype.Text = "";
        lbl_Assetclass.Text = "";
        lbl_AssetNo.Text = "";
        lbl_AssetType.Text = "";
        AspxImage2.ImageUrl = null;
        AssetDetails.Visible = false;
        
    }
    protected void AddData(int srno1, string documenttype,string asset, string docid, string docname, string url)
    {
        srno = srno1 + 1;
        DataTable AddTask = new DataTable();
        AddTask = ViewState["AddTask"] as DataTable;
        if (AddTask != null)
        {
            AddTask.Rows.Add(srno, documenttype, asset, docid, docname, url);
            ViewState["AddTask"] = AddTask;
            ASPxGridView1.DataSource = AddTask;
            ASPxGridView1.DataBind();
            ViewState["AddTask"] = AddTask as DataTable;
        }
        if (AddTask == null)
        {
            dt = new DataTable();
            dt.Columns.Add("SRNO");
            dt.Columns.Add("DocumentType");
            dt.Columns.Add("Asset");
            dt.Columns.Add("DocumentID");
            dt.Columns.Add("DocumentName");
            dt.Columns.Add("ImageLocation");//          
            dt.Rows.Add(srno, documenttype, asset, docid, docname, url);
            ASPxGridView1.DataSource = dt;
            ASPxGridView1.DataBind();
            ViewState["AddTask"] = dt as DataTable;
        }
    }
    protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewRowCommandEventArgs e)
    {
        string btn = e.CommandArgs.CommandName.ToString();
        if (btn == "Delete")
        {

            int s = e.VisibleIndex;
            DataTable dt2 = (DataTable)ViewState["AddTask"];
            //dt2.Rows[s].Delete();
            string DocumentType = dt2.Rows[s]["DocumentType"].ToString();
            string Asset = dt2.Rows[s]["Asset"].ToString();
            string DocTypeName = dt2.Rows[s]["DocumentID"].ToString();
            if(DocumentType== "Newdocument")
            {
                dt2.Rows[s].Delete();
                ASPxGridView1.DataSource = dt2;
                ASPxGridView1.DataBind();
            }
 
            else
            {

                string Query3 = "update AssetDocumentMapping set Status=@Status where DocumentMapID=@DocumentMapID";
                myCommand = new SqlCommand(Query3, myConnection);
             
                myCommand.Parameters.AddWithValue("@Status", "InActive");
                myCommand.Parameters.AddWithValue("@DocumentMapID", DocumentType);
                myConnection.Open();
                myCommand.ExecuteNonQuery();
                myConnection.Close();
                dt2.Rows[s].Delete();
                ASPxGridView1.DataSource = dt2;
                ASPxGridView1.DataBind();
            }
        }
        else if (btn == "View")
        {
            string path = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "ImageLocation").ToString();
            Session["path"] = path;
            string files = Path.GetFileName(Path.GetDirectoryName(path));
            string filename = Path.GetFileName(path);
            string url = "/" + files + "/" + filename + "";
            string fullURL = "window.open('" + url + "', '_blank' );";
            ScriptManager.RegisterStartupScript(this, typeof(string), "OPEN_WINDOW", fullURL, true);
        }
    }
    protected void btn_saveDocument_Click(object sender, EventArgs e)
    {
        string date = System.DateTime.Now.Date.ToString("yyyy-MM-dd");
        try
        {
            if (ASPxGridView1.VisibleRowCount == 0)
            {
                Messages.SetErrorMessage("0078", null, null, null, Session);
                return;
            }
            for (int i = 0; i < ASPxGridView1.VisibleRowCount; i++)
            {

                string SRNO = ASPxGridView1.GetRowValues(i, "SRNO").ToString();
                string DocumentType = ASPxGridView1.GetRowValues(i, "DocumentType").ToString();
                string DocTypeName = ASPxGridView1.GetRowValues(i, "DocumentID").ToString();
                string ImageLocation = ASPxGridView1.GetRowValues(i, "ImageLocation").ToString();
                string Asset = ASPxGridView1.GetRowValues(i, "Asset").ToString();

                //string query = "select * from AssetDocumentMapping where AssetID='" + Asset + "' and DocumentID='" + DocTypeName + "'";
                //SqlDataAdapter da = new SqlDataAdapter(query, myConnection);
                //DataTable dt = new DataTable();
                //da.Fill(dt);
                //if (dt.Rows.Count >= 1)
                //{
                //    string Query3 = "update AssetDocumentMapping set Status=@Status,ImageLocation=@ImageLocation,Date=@Date where AssetID=@AssetID and DocumentID=@DocumentID";
                //    myCommand = new SqlCommand(Query3, myConnection);
                //    myCommand.Parameters.AddWithValue("@DocumentID", DocTypeName);
                //    myCommand.Parameters.AddWithValue("@Status", "Active");
                //    myCommand.Parameters.AddWithValue("@ImageLocation", ImageLocation);
                //    myCommand.Parameters.AddWithValue("@Date", date);
                //    myCommand.Parameters.AddWithValue("@AssetID", Asset);
                //    myConnection.Open();
                //    myCommand.ExecuteNonQuery();
                //    myConnection.Close();
                //    lbl_msg.Text = "Data Saved Successfully";
                //    lbl_msg.Visible = true;
                //}
                //else
                //{
                if(DocumentType== "Newdocument")
                { 
                    string Query3 = "insert into AssetDocumentMapping(DocumentID,Status,ImageLocation,Date,AssetID,MainAssetNumber)values(@DocumentID,@Status,@ImageLocation,@Date,@AssetID,@MainAssetNumber)";
                    myCommand = new SqlCommand(Query3, myConnection);
                    myCommand.Parameters.AddWithValue("@DocumentID", DocTypeName);
                    myCommand.Parameters.AddWithValue("@Status", "Active");
                    myCommand.Parameters.AddWithValue("@ImageLocation", ImageLocation);
                    myCommand.Parameters.AddWithValue("@Date", date);
                    myCommand.Parameters.AddWithValue("@AssetID", Asset);
                    myCommand.Parameters.AddWithValue("@MainAssetNumber", Asset);
                    myConnection.Open();
                    myCommand.ExecuteNonQuery();
                    myConnection.Close();
                    lbl_msg.Text = "Data Saved Successfully";
                    lbl_msg.Visible = true;
                }              
            }
            ASPxGridView1.DataSource = null;
            ASPxGridView1.DataBind();
            ViewState["AddTask"] = null;
            srno = 0;
            Clear();
        }
        catch (SqlException ex)
        {
            Messages.SetErrorMessage("0028", null, null, null, Session);
        }
        catch (Exception ex)
        {
            Messages.SetErrorMessage("0029", null, null, null, Session);
        }

    }




    protected void btn_search_Click(object sender, EventArgs e)
    {
        lbl_msg.Visible = false;
        AssetData();
        AssetImageExist();
        AssetDoc();
        
    }

    protected void AssetData()
    {
        
        if (gridlkup_Asset.Text == "")
        {

        }
        else
        {
            AssetDetails.Visible = true;
            string query = "SELECT AssetID,MainAssetNumber,AssetSubNumber,CustodianDepartment,concat(AssetDesc+' ',AdditionalDesc)as AssetDescription,concat(Quantity+' ',Unit)as Quantity,AssetCapitalizationDate,FirstAcquisitionDate,CustodianID,concat(LocationDesc+' (',Location+')')as Location,concat(StatusDesc+' (',Status+')')as Status,AssetClass,concat(ComponentDesc+' ',Component)as Component,Deacdate,Invdate,InventoryNote FROM [AssetMaster] where AssetID = '" + gridlkup_Asset.Value + "'";
            SqlDataAdapter da = new SqlDataAdapter(query, myConnection2);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {

                lbl_AssetNo.Text = dt.Rows[0]["MainAssetNumber"].ToString();
                lbl_SubNumber.Text = dt.Rows[0]["AssetSubNumber"].ToString();
                lbl_AssetType.Text = dt.Rows[0]["AssetDescription"].ToString();
                lbl_Assetclass.Text = dt.Rows[0]["AssetClass"].ToString();
                lbl_assetlocation.Text = dt.Rows[0]["Location"].ToString();
                lbl_assetstatus.Text = dt.Rows[0]["Status"].ToString();
                lbl_quantity.Text = dt.Rows[0]["Quantity"].ToString();
                lbl_component.Text = dt.Rows[0]["Component"].ToString();
                lbl_inventorynote.Text = dt.Rows[0]["InventoryNote"].ToString();
                lbl_capitalizationdate.Text = dt.Rows[0]["AssetCapitalizationDate"].ToString();
                lbl_acquisitiondate.Text = dt.Rows[0]["FirstAcquisitionDate"].ToString();
                lbl_deacdate.Text = dt.Rows[0]["Deacdate"].ToString();
                lbl_inventorydate.Text = dt.Rows[0]["Invdate"].ToString();
            }
        }
    }


    protected void AssetDoc()
    {
        ASPxGridView1.DataSource = null;
        ASPxGridView1.DataBind();
        ViewState["AddTask"] = null;
        if (gridlkup_Asset.Text == "")
        {
           
        }

        try
        {
            string sqlquery1 = "Select DocumentMapID,AssetID as Asset ,DocumentMapID as DocumentID,DocumentName as DocumentName,ImageLocation as ImageLocation  from AssetDocumentMapping inner join DocumentMaster on AssetDocumentMapping.DocumentID = DocumentMaster.DocumentID where AssetDocumentMapping.AssetID ='" + gridlkup_Asset.Value + "' and AssetDocumentMapping.Status='Active'";
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlquery1, myConnection);
            DataTable dataTable = new DataTable();
            sqlDataAdapter.Fill(dataTable);
            if (dataTable.Rows.Count > 0)
            {
                
                //ASPxGridView1.DataSource = dataTable;
                //ASPxGridView1.DataBind();
               
                for(int i=0;i< dataTable.Rows.Count;i++)
                {
                    string DocumentMapID = dataTable.Rows[i]["DocumentMapID"].ToString();
                    string Asset=dataTable.Rows[i]["Asset"].ToString();
                    string DocumentID= dataTable.Rows[i]["DocumentID"].ToString();
                    string DocumentName = dataTable.Rows[i]["DocumentName"].ToString();
                    string ImageLocation = dataTable.Rows[i]["ImageLocation"].ToString();
                    AddData(srno, DocumentMapID,Asset, DocumentID, DocumentName, ImageLocation);
                }

            }
            else
            {
                
            }

        }
        catch(Exception ex)
        {
            lbl_msg.Text = ex.Message;
        }

    }
}