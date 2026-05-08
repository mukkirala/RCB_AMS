<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ApproveAssetParking.aspx.cs" Inherits="ApproveAssetParking" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx1" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxEditors" Assembly="DevExpress.Web.ASPxEditors.v11.1" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxGridView" Assembly="DevExpress.Web.ASPxGridView.v11.1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<style>
        
		input {
			color:#333 !important;
		}
		.dxgvControl_PlasticBlue a {
			color:#333 !important;
		}
        .auto-style53 {
            width: 116px;
        }
         .form_div{
           margin-top:10px;
       }
          .back-bg {
   
            margin: 10px 15px;
            border: 2px solid rgb(199, 212, 220);
            padding: 20px 0;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
 <asp:UpdatePanel ID="updpnlRefresh" runat="server" UpdateMode="Conditional">
  <ContentTemplate>
 <div class="col-sm-12">
    <div >
        <strong><span class="">Approve Parked Asset</span></strong>
    </div>
     <dx:ASPxLabel ID="err_msg" runat="server" Text="" Visible="false" ForeColor="Red"></dx:ASPxLabel><br />
  <h3>  <strong>Employee Details</strong></h3>
              <dx:ASPxLabel ID="lbl_msg" ForeColor="Red" runat="server" Text="">
                </dx:ASPxLabel><hr />
        <div class="row form_div">
            <div class="col-sm-2"  style="font-size:large">
                <label>Employee ID:</label>
            </div>
            <div class="col-sm-4">
                <dx:ASPxLabel ID="reqid" runat="server" Font-Bold="true" ForeColor="Black" Text="" Font-Size="Medium">
						 </dx:ASPxLabel>
            
            </div>    
            <div class="col-sm-2" style="font-size:large">
                <label>Employee Name:</label>
            </div>
            <div class="col-sm-4">
                 <dx:ASPxLabel ID="lbl_empname" runat="server" Font-Bold="true" ForeColor="Black" Text="" Font-Size="Medium">
						 </dx:ASPxLabel>           
            </div>
        </div>
        <div class="row form_div">
               
            <div class="col-sm-2" style="font-size:large">
                <label>Department:</label>
            </div>
            <div class="col-sm-4">
                <dx1:ASPxLabel ID="reqdeptname" runat="server"  Text="" ForeColor="Black" Font-Bold="True" Font-Size="Medium">
						 </dx1:ASPxLabel>           
            </div>
        <div class="col-sm-2" style="font-size:larger">
                <label>Designation:</label>
            </div>
            <div class="col-sm-4">
                <dx:ASPxLabel ID="reqdesig" runat="server" Font-Bold="true" ForeColor="Black" Text="" Font-Size="Medium">
						 </dx:ASPxLabel>
            
            </div> 
        </div>
        <div class="row form_div">
               
            <div class="col-sm-2">
               
            </div>
            <div class="col-sm-4">
                        
            </div>
        </div>
    <br />
      <div class="row form_div">
         <div class="col-sm-2" style="font-size:larger">
         <label">Allocate Quantity:</label>
         </div>
         <div class="col-sm-4">
            <dx:ASPxTextBox ID="req_qnty" runat="server" Width="170px" Text="" ForeColor="Blue" ReadOnly="true" Height="25px"></dx:ASPxTextBox>            
         </div>
     
         <div class="col-sm-2" style="font-size:larger">
          <span class="auto-style7">Remarks:</span>       
         </div>
         <div class="col-sm-4">
             <asp:TextBox ID="txt_cmt" runat="server" TextMode="MultiLine" Rows="2" ForeColor="Blue" Columns="22"></asp:TextBox>                     
         </div>
    </div>
   <div class="clearfix"></div>

      <div class="row">   <div class="col-sm-12"><h4><strong>Asset Parking Details</strong></h4>
        <hr/>
        </div>
    </div>

 <div class="row form_div">
      <div class="col-sm-12">
             <dx:ASPxGridView ID="AssetTypesGridView"  runat="server" AutoGenerateColumns="False" 
                   KeyFieldName="AssetParkingID"                   
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    Width="1100px" DataSourceID="AssetTypesGridViewDS" OnRowCommand="AssetTypesGridView_RowCommand">
        <Columns>
             <dx:GridViewCommandColumn VisibleIndex="0" ShowSelectCheckbox="True">
                <ClearFilterButton Visible="True">
                </ClearFilterButton>
            </dx:GridViewCommandColumn>
             <dx:GridViewDataTextColumn FieldName="AssetParkingID" ReadOnly="True" VisibleIndex="1" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="AssetID" ReadOnly="True" VisibleIndex="2">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="MainAssetNumber" ReadOnly="True" VisibleIndex="3" Caption="Asset Numder">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
           
            <dx:GridViewDataTextColumn FieldName="AssetSubNumber" VisibleIndex="4" Caption="AssetSubNumber" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetClass" VisibleIndex="5"  Caption="AssetClass">
                <Settings AutoFilterCondition="Contains" />
                      
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetDesc" VisibleIndex="6" Caption="AssetType">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="LocationCode" VisibleIndex="7" Visible="true" Caption="LAB">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="Location" VisibleIndex="8" Caption="Wing">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="LocationID" VisibleIndex="8" Caption="LocationID">
    <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="Block" VisibleIndex="8" Caption="Floor">
    <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="AssetStatus" VisibleIndex="9">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetTypeID" VisibleIndex="10">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="RequestDate" VisibleIndex="11" Caption="RequestDate" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="12" Caption="Status" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Delete" VisibleIndex="13">
                <DataItemTemplate>
                    <asp:LinkButton ID="delete" CommandName="Delete" runat="server" ForeColor="Red" Font-Bold="true">Delete</asp:LinkButton>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
               
  </Columns> 
   <SettingsPager ShowDefaultImages="False" PageSize="5">
                <AllButton Text="All">
                </AllButton>
                <NextPageButton Text="Next &gt;">
                </NextPageButton>
                <PrevPageButton Text="&lt; Prev">
                </PrevPageButton>
            </SettingsPager>
        <Settings ShowFilterRow="True" ShowGroupPanel="True" />
        <Images SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
            <LoadingPanelOnStatusBar Url="~/App_Themes/PlasticBlue/GridView/gvLoadingOnStatusBar.gif">
            </LoadingPanelOnStatusBar>
            <LoadingPanel Url="~/App_Themes/PlasticBlue/GridView/Loading.gif">
            </LoadingPanel>
        </Images>
        <ImagesFilterControl>
            <LoadingPanel Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
            </LoadingPanel>
        </ImagesFilterControl>
        <Styles CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue">
            <Header ImageSpacing="10px" SortingImageSpacing="10px">
            </Header>
        </Styles>
        <StylesEditors>
            <CalendarHeader Spacing="11px">
            </CalendarHeader>
            <ProgressBar Height="25px">
            </ProgressBar>
        </StylesEditors>
    </dx:ASPxGridView>
</div>
</div>
  
 <div class="row form_div">
         <div class="col-sm-2">
             <dx:ASPxButton ID="ASPxButton2" runat="server" Text="Add" Width="20" OnClick="AddAssets_Click" CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css"      CssPostfix="SoftOrange"    SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sp" ></dx:ASPxButton><br />
         </div>
     </div>

 <dx:ASPxGridView ID="ASPxGridView1"  runat="server" AutoGenerateColumns="False" 
                   KeyFieldName="AssetParkingID"                   
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    Width="1100px" OnRowCommand="ASPxGridView1_RowCommand" >
        <Columns>
            <dx:GridViewDataTextColumn FieldName="AssetParkingID" ReadOnly="True" VisibleIndex="0" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetID" ReadOnly="True" VisibleIndex="1">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="MainAssetNumber" ReadOnly="True" VisibleIndex="2" Caption="Asset Number">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="SerialNumber" VisibleIndex="3" Caption="SerialNumber" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="AssetSubNumber" VisibleIndex="4" Caption="AssetSubNumber" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetClass" VisibleIndex="5"  Caption="AssetClass">
                <Settings AutoFilterCondition="Contains" />
                      
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetType" VisibleIndex="6" Caption="AssetType">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="LocationCode" VisibleIndex="7" Visible="true" Caption="LAB">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="Location" VisibleIndex="8" Caption="Wing">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="LocationID" VisibleIndex="8" Caption="LocationID">
    <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="Block" VisibleIndex="8" Caption="Floor">
    <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetStatus" VisibleIndex="9">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetTypeID" VisibleIndex="10">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="RequestDate" VisibleIndex="11" Caption="RequestDate" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Delete" VisibleIndex="12">
                <DataItemTemplate>
                    <asp:LinkButton ID="delete" CommandName="Delete" runat="server" ForeColor="Black" Font-Bold="true">Delete</asp:LinkButton>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
  </Columns> 
   <SettingsPager ShowDefaultImages="False">
                <AllButton Text="All">
                </AllButton>
                <NextPageButton Text="Next &gt;">
                </NextPageButton>
                <PrevPageButton Text="&lt; Prev">
                </PrevPageButton>
            </SettingsPager>
        <Settings ShowFilterRow="True" ShowGroupPanel="True" />
        <Images SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
            <LoadingPanelOnStatusBar Url="~/App_Themes/PlasticBlue/GridView/gvLoadingOnStatusBar.gif">
            </LoadingPanelOnStatusBar>
            <LoadingPanel Url="~/App_Themes/PlasticBlue/GridView/Loading.gif">
            </LoadingPanel>
        </Images>
        <ImagesFilterControl>
            <LoadingPanel Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
            </LoadingPanel>
        </ImagesFilterControl>
        <Styles CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue">
            <Header ImageSpacing="10px" SortingImageSpacing="10px">
            </Header>
        </Styles>
        <StylesEditors>
            <CalendarHeader Spacing="11px">
            </CalendarHeader>
            <ProgressBar Height="25px">
            </ProgressBar>
        </StylesEditors>
    </dx:ASPxGridView>
    <div class="clearfix"></div>
    <div class="row"> 
        <div class="col-sm-12">
        <hr/>
            </div>


    </div>
     
    <div class="clearfix"></div>
     
     <div class="row form_div">
         <div class="col-sm-1">
             <dx:ASPxButton ID="AddAssets" runat="server" Text="Approve" Width="20" OnClick="Assets_Click"  CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css"       CssPostfix="SoftOrange"      SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sp"></dx:ASPxButton>
              
         </div>
         <div class="col-sm-4">
         
         </div>
     </div>

</div>
<asp:SqlDataSource ID="AssetTypesGridViewDS" runat="server"  ConnectionString="<%$ConnectionStrings:RCBAMSConnectionString %>" SelectCommand="	select AssetParking.AssetParkingID, AssetParking.AssetID,AssetParking.MainAssetNumber,AssetMaster.AssetSubNumber,AssetMaster.AssetClass,AssetMaster.AssetDesc,AssetMaster.StatusDesc as AssetStatus,AssetParking.CustodianID,AssetParking.CustodianDepartment,AssetParking.CustDesignation,AssetParking.Date as RequestDate,AssetParking.Status,AssetParking.AssetTypeID,AssetParking.LocationCode,AssetParking.Location,AssetParking.LocationID,AssetParking.Block from AssetParking inner join RCBSAP..AssetMaster on  AssetParking.AssetID=AssetMaster.AssetID  where AssetParking.CustodianID=@CustodianID and AssetParking.Status='Active'">
         <SelectParameters>
             <asp:SessionParameter Name="CustodianID" SessionField="CustodianID" />
         </SelectParameters>
     </asp:SqlDataSource>
</ContentTemplate>
</asp:UpdatePanel>
</asp:Content>


