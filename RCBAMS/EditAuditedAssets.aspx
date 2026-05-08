<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="EditAuditedAssets.aspx.cs" Inherits="EditAuditedAssets" %>
<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"  Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v11.1" namespace="DevExpress.Web.ASPxPanel" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxMenu" tagprefix="dx1" %>
<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx2" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
      
        .style5
        {
            color: #FF0000;
        }
          .form_div{
           margin-top:10px;
       }
           .back-bg {
   
            margin: 10px 2px;
            border: 2px solid rgb(199, 212, 220);
            padding: 20px 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="">
   
    <span class="style2"><h4><strong>Edit Audited Asset </strong></h4></span>
         <dx2:ASPxLabel ID="lbl_msg" runat="server" Text="" 
                    style="color: red; font-weight: 700; margin-left:70px;" >
                </dx2:ASPxLabel>
          <div class="row form_div">
           <div class="col-sm-2" style="font-size:large">
                Select Audit Plan <span class="style5"><strong>*</strong></span>
               </div>
           <div class="col-sm-4">
                                       <dx:ASPxGridLookup ID="gd_Audit" runat="server"  AutoGenerateColumns="False"
                      IncrementalFilteringMode="Contains" TextFormatString="{1}" OnInit="gd_Audit_Init"
                     KeyFieldName="AuditID"   Height="25px" OnTextChanged="gd_Audit_TextChanged"
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" DataSourceID="AuditDS" AutoPostBack="true">
<GridViewProperties>
<SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>
    <Settings ShowFilterRow="True" />
</GridViewProperties>
                    <Columns>
                        <dx:gridviewdatatextcolumn FieldName="AuditID"  ReadOnly="True" 
                            VisibleIndex="0">
                            <EditFormSettings Visible="False" />
                        </dx:gridviewdatatextcolumn>                        
                        <dx:gridviewdatatextcolumn FieldName="AuditName" VisibleIndex="1">
                        </dx:gridviewdatatextcolumn>
                        <dx:gridviewdatatextcolumn FieldName="AuditBy" Visible="false" VisibleIndex="2">
                        </dx:gridviewdatatextcolumn>
                        <dx:gridviewdatatextcolumn FieldName="LocationID" VisibleIndex="3" Visible="false">
                        </dx:gridviewdatatextcolumn>
                    </Columns>
                     <GridViewImages SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                         <LoadingPanelOnStatusBar Url="~/App_Themes/PlasticBlue/GridView/gvLoadingOnStatusBar.gif">
                         </LoadingPanelOnStatusBar>
                         <LoadingPanel Url="~/App_Themes/PlasticBlue/GridView/Loading.gif">
                         </LoadingPanel>
                     </GridViewImages>
                     <GridViewImagesFilterControl>
                         <LoadingPanel Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                         </LoadingPanel>
                     </GridViewImagesFilterControl>
                     <GridViewStyles CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue">
                         <Header ImageSpacing="10px" SortingImageSpacing="10px">
                         </Header>
                     </GridViewStyles>
                     <GridViewStylesEditors>
                         <CalendarHeader Spacing="11px">
                         </CalendarHeader>
                         <ProgressBar Height="25px">
                         </ProgressBar>
                     </GridViewStylesEditors>
                     <ValidationSettings>
                         <ErrorFrameStyle ImageSpacing="4px">
                             <ErrorTextPaddings PaddingLeft="4px" />
                         </ErrorFrameStyle>
                     </ValidationSettings>
                </dx:ASPxGridLookup>
                 <asp:SqlDataSource ID="AuditDS" runat="server" ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" SelectCommand="SELECT [AuditID], [AuditName], [AuditBy],[LocationID] FROM [AuditMaster]">
                    
                 </asp:SqlDataSource> 
             </div> 
                <div class="col-sm-2" style="font-size:large">
                  Select Asset
               </div>
           <div class="col-sm-4">
                       <dx:ASPxGridLookup ID="gridlkup_Asset" runat="server"  AutoGenerateColumns="False"
                     DataSourceID="AssetDS" IncrementalFilteringMode="Contains" TextFormatString="{2}"
                     KeyFieldName="AuditDetailsID"   Height="25px"
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" AutoPostBack="true"
                      OnTextChanged="gridlkup_Asset_TextChanged">
<GridViewProperties>
<SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>
    <Settings ShowFilterRow="True" />
</GridViewProperties>
                    <Columns>
                         <dx:gridviewdatatextcolumn FieldName="AuditDetailsID"  ReadOnly="True" 
                            VisibleIndex="0" Visible="false">
                        </dx:gridviewdatatextcolumn> 
                        <dx:gridviewdatatextcolumn FieldName="AssetID"  ReadOnly="True" 
                            VisibleIndex="1" Visible="false">
                        </dx:gridviewdatatextcolumn>                        
                        <dx:gridviewdatatextcolumn FieldName="MainAssetNumber" VisibleIndex="2" Caption="Equipment Number">
                        </dx:gridviewdatatextcolumn>
                        <dx:gridviewdatatextcolumn FieldName="AssetDesc" VisibleIndex="3" Caption="Asset Name">
                        </dx:gridviewdatatextcolumn>
                        <dx:gridviewdatatextcolumn FieldName="AssetClass" VisibleIndex="4">
                        </dx:gridviewdatatextcolumn>
                    </Columns>
                     <GridViewImages SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                         <LoadingPanelOnStatusBar Url="~/App_Themes/PlasticBlue/GridView/gvLoadingOnStatusBar.gif">
                         </LoadingPanelOnStatusBar>
                         <LoadingPanel Url="~/App_Themes/PlasticBlue/GridView/Loading.gif">
                         </LoadingPanel>
                     </GridViewImages>
                     <GridViewImagesFilterControl>
                         <LoadingPanel Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                         </LoadingPanel>
                     </GridViewImagesFilterControl>
                     <GridViewStyles CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue">
                         <Header ImageSpacing="10px" SortingImageSpacing="10px">
                         </Header>
                     </GridViewStyles>
                     <GridViewStylesEditors>
                         <CalendarHeader Spacing="11px">
                         </CalendarHeader>
                         <ProgressBar Height="25px">
                         </ProgressBar>
                     </GridViewStylesEditors>
                     <ValidationSettings>
                         <ErrorFrameStyle ImageSpacing="4px">
                             <ErrorTextPaddings PaddingLeft="4px" />
                         </ErrorFrameStyle>
                     </ValidationSettings>
                </dx:ASPxGridLookup>
             </div> 
              </div>

               <div class="clearfix"></div>
    
        
          <div id="AssetDetails"  runat="server">
               <div class="row">  
                  <div class="col-sm-12" style="font-size:large">  
                      
            <strong>  <label>Asset Details:</label> </strong>
                 
                      </div>
                    
              </div>
              <div class="row back-bg">
             

         <div class="col-sm-12">
          <div class="row form_div">
           <div class="col-sm-2"  style="font-size:large">
               <%--<dx:ASPxLabel ID="Label1" runat="server" Text="Main Asset Number:"></dx:ASPxLabel>--%>
               <label>Equipment Number:</label>
               </div>
           <div class="col-sm-4">
                  <dx:ASPxLabel ID="lbl_AssetNo" runat="server" Font-Bold="True" ForeColor="Black" Font-Size="Medium"></dx:ASPxLabel>
            </div>
            <div class="col-sm-2"  style="font-size:large">
              <%-- <dx:ASPxLabel ID="Label2" runat="server" Text="Serial Number:"></dx:ASPxLabel>--%>
                <label>Asset SubNumber:</label>
           </div>
            <div class="col-sm-4">
                <dx:ASPxLabel ID="lbl_SubNumber" runat="server" Font-Bold="True" ForeColor="Black" Font-Size="Medium" ></dx:ASPxLabel>
             </div> 
              </div>
             
     </div>
        
              <div class="col-sm-12">
           <div class="row form_div">
            <div class="col-sm-2"  style="font-size:large"> 
              <%--<dx:ASPxLabel ID="Label3" runat="server" Text="Asset Class Name:"></dx:ASPxLabel>--%>
                <label>Asset Class Name:</label>
            </div>
            <div class="col-sm-4"> 
               <dx:ASPxLabel ID="lbl_Assetclass" runat="server" Font-Bold="True" ForeColor="Black" Font-Size="Medium"  ></dx:ASPxLabel>
            </div>
    
           <div class="col-sm-2"  style="font-size:large">
                <%--<dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Asset Type:"></dx:ASPxLabel>--%>
               <label>Asset Type:</label>
           </div>
            <div class="col-sm-4">
               <dx:ASPxLabel ID="lbl_AssetType" runat="server" Font-Bold="True" ForeColor="Black" Font-Size="Medium"></dx:ASPxLabel>
            </div>   
               </div>
       </div>
     <div class="col-sm-12">
    <div class="row form_div">
         <div class="col-sm-2" style="font-size:large">
            <label>Current Location:</label>
         </div>
         <div class="col-sm-4">
             <dx:ASPxLabel ID="lbl_assetlocation" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
		     </dx:ASPxLabel>            
         </div>     
         <div class="col-sm-2" style="font-size:large">
           <label >Asset Status:</label>       
         </div>
         <div class="col-sm-4">
            <dx:ASPxLabel ID="lbl_assetstatus" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
	        </dx:ASPxLabel>           
         </div>
     </div>
</div>
 <div class="col-sm-12">
     <div class="row form_div">
         <div class="col-sm-2" style="font-size:large">
            <label>Available Quantity:</label>
         </div>
         <div class="col-sm-4">
             <dx:ASPxLabel ID="lbl_quantity" runat="server"  Text="" Font-Bold="True" ForeColor="Black" style="font-size:large">
		     </dx:ASPxLabel>            
         </div>     
         <div class="col-sm-2" style="font-size:large">
           <label >Component:</label>       
         </div>
         <div class="col-sm-4">
            <dx:ASPxLabel ID="lbl_component" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
	        </dx:ASPxLabel>           
         </div>
     </div>
 </div>
 <div class="col-sm-12">
     <div class="row form_div">
         <div class="col-sm-2" style="font-size:large">
            <label>Capitalization Date:</label>
         </div>
         <div class="col-sm-4">
             <dx:ASPxLabel ID="lbl_capitalizationdate" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium" >
		     </dx:ASPxLabel>            
         </div>     
         <div class="col-sm-2" style="font-size:large">
           <label >First Acquisition Date:</label>       
         </div>
         <div class="col-sm-4">
            <dx:ASPxLabel ID="lbl_acquisitiondate" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
	        </dx:ASPxLabel>           
         </div>
     </div>
</div>
<div class="col-sm-12">
     <div class="row form_div">
         <div class="col-sm-2" style="font-size:large">
            <label>DeacDate:</label>
         </div>
         <div class="col-sm-4">
             <dx:ASPxLabel ID="lbl_deacdate" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
		     </dx:ASPxLabel>            
         </div>     
         <div class="col-sm-2" style="font-size:large">
           <label >Inventory Note:</label>       
         </div>
         <div class="col-sm-4">
            <dx:ASPxLabel ID="lbl_inventorynote" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium"> 
	        </dx:ASPxLabel>           
         </div>
     </div>
</div>
<div class="col-sm-12">
     <div class="row form_div">
         <div class="col-sm-2" style="font-size:large">
            <label>Inventory Date:</label>
         </div>
         <div class="col-sm-4">
             <dx:ASPxLabel ID="lbl_inventorydate" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
		     </dx:ASPxLabel>            
         </div>     
         <div class="col-sm-2">
           <label ></label>       
         </div>
         <div class="col-sm-4">
            <dx:ASPxLabel ID="ASPxLabel10" runat="server"  Text="" Font-Bold="True" ForeColor="Blue">
	        </dx:ASPxLabel>           
         </div>
     </div>
</div>
     </div> 
   </div>       

      <div class="row form_div">
           <div class="col-sm-2"  style="font-size:large">
          <label>Asset Wing</label>
           </div>
            <div class="col-sm-4">
                <dx:ASPxComboBox ID="cmb_assetlocation" runat="server"  CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" ValueType="System.String" DataSourceID="LocationDS"
                    ValueField="LocationID" TextField="LocationCode" DropDownStyle="DropDown" IncrementalFilteringMode="Contains"  Height="25px"  TextFormatString="{0}">
                    
                           <Columns>
                                <dx:ListBoxColumn FieldName="Location" Width="170px" Caption="Wing" />
                                <dx:ListBoxColumn FieldName="Block" Width="170px" Caption="Floor" />
					<dx:ListBoxColumn FieldName="LocationCode" Width="170px" Caption="LAB" />
                       
                    
                    </Columns>
                    <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                    </LoadingPanelImage>
                    <ValidationSettings>
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
                </dx:ASPxComboBox>
               <asp:SqlDataSource ID="LocationDS" runat="server"  ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" SelectCommand="SELECT [LocationID],[LocationCode],Block,Location FROM [RCBAMS]..[LocationMaster]">
                   

     </asp:SqlDataSource>
            </div>
            <div class="col-sm-2" style="font-size:large">
             Select Custodian
           </div>
            <div class="col-sm-4">
                <dx:ASPxGridLookup ID="Cust_gridlookup" runat="server"
                    AutoGenerateColumns="False" DataSourceID="CustSqlDataSource" TextFormatString="{0}" Width="170px" Height="25px"
                    KeyFieldName="CustodianID"   CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                    <GridViewProperties>
                        <%--<SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>--%>

                      <Settings  ShowFilterRow="true"></Settings>
                    </GridViewProperties>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="CustodianID"  VisibleIndex="0" caption="Staff Number">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="CustodianName" VisibleIndex="1" Caption="Employee Name" >
                        </dx:GridViewDataTextColumn>
                                           
                    </Columns>
                    <GridViewImages SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                        <LoadingPanelOnStatusBar Url="~/App_Themes/PlasticBlue/GridView/gvLoadingOnStatusBar.gif">
                        </LoadingPanelOnStatusBar>
                        <LoadingPanel Url="~/App_Themes/PlasticBlue/GridView/Loading.gif">
                        </LoadingPanel>
                    </GridViewImages>
                    <GridViewImagesFilterControl>
                        <LoadingPanel Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                        </LoadingPanel>
                    </GridViewImagesFilterControl>
                    <GridViewStyles CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue">
                        <Header ImageSpacing="10px" SortingImageSpacing="10px">
                        </Header>
                    </GridViewStyles>
                    <GridViewStylesEditors>
                        <CalendarHeader Spacing="11px">
                        </CalendarHeader>
                        <ProgressBar Height="25px">
                        </ProgressBar>
                    </GridViewStylesEditors>
                    <ValidationSettings>
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
                </dx:ASPxGridLookup>
                <asp:SqlDataSource ID="CustSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
        SelectCommand="SELECT [CustodianID], [CustodianName] FROM [CustodianMaster]">
         </asp:SqlDataSource>
             </div> 
        </div>

         <div class="row form_div">
           <div class="col-sm-2"  style="font-size:large">
                Asset Status
               </div>
           <div class="col-sm-4">
                    <dx:ASPxComboBox ID="cmb_Status" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css"  Height="25px" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" ValueType="System.String" DataSourceID="StatusDS"
                    ValueField="StatusCode" TextField="StatusName"  DropDownStyle="DropDown" IncrementalFilteringMode="Contains">
                    <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                    </LoadingPanelImage>
                    <ValidationSettings>
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
                </dx:ASPxComboBox>
                <asp:SqlDataSource ID="SqlDS_AssetDetails" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ASSETManagementConnectionString %>" 
                    
                    SelectCommand="SELECT [AuditID], [AuditName], [AuditDiscription] FROM [AuditMaster]">
                </asp:SqlDataSource>
            </div>
            <div class="col-sm-2" style="font-size:large">
             Remark
           </div>
            <div class="col-sm-4">
                 <dx:ASPxTextBox ID="txt_Comments" runat="server" Width="170px" Height="25px">
                </dx:ASPxTextBox>
             </div> 
              </div>
          

         <div class="row form_div">
           <div class="col-sm-2">
              
               </div>
           <div class="col-sm-4">
                     <dx:ASPxButton ID="btn_Save" runat="server" Text="Update" 
                    CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                    onclick="btn_Save_Click" 
                    SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Width="137px">
                </dx:ASPxButton>
            </div>
            <div class="col-sm-2">
             
           </div>
            <div class="col-sm-4">

             </div> 
              </div>
    
    <br/>
    <h4><strong ><span class="style2">Audited Asset List</span></strong></h4><br />
        <div class="table-responsive">
  <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False"
      style="width:100%"
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
        DataSourceID="SqlDS_AuditedAssetList" KeyFieldName="AuditDetailsID">
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="0">
                <ClearFilterButton Visible="True">
                </ClearFilterButton>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="AuditDetailsID" ReadOnly="True" Visible="false"
                VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="AuditName" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AuditBy" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetID" VisibleIndex="3" Visible="false">
            </dx:GridViewDataTextColumn>
            
             <dx:GridViewDataTextColumn FieldName="MainAssetNumber" VisibleIndex="4" Caption="Equipment Number">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="AssetClass" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="AssetDesc" VisibleIndex="6" Caption="Asset Name">
            </dx:GridViewDataTextColumn>
           <%-- <dx:GridViewDataTextColumn FieldName="LocationCode" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Block" VisibleIndex="7">
            </dx:GridViewDataTextColumn>--%>
             <dx:GridViewDataTextColumn FieldName="CustodianID" VisibleIndex="8" Caption="Staff Number">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AuditStatus" VisibleIndex="9">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Comments" VisibleIndex="10">
            </dx:GridViewDataTextColumn>
           
            <dx:GridViewDataDateColumn FieldName="AuditedDate" VisibleIndex="11">
                <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy"></PropertiesDateEdit>
            </dx:GridViewDataDateColumn>
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
    <asp:SqlDataSource ID="SqlDS_AuditedAssetList" runat="server" 
        ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
        SelectCommand="SELECT AuditDetailsID,AuditDetails.AssetID,AssetMaster.MainAssetNumber,AssetMaster.AssetSubNumber,AssetMaster.AssetClass,AssetMaster.AssetDesc, AuditDetails.AuditStatus,Comments,AuditDetails.AuditID,Date as AuditedDate,AuditName,AuditDetails.Location,AuditDetails.CustodianID,AuditDetails.AuditBy
 FROM RCBAMS..[AuditDetails] 
 inner join RCBSAP..AssetMaster on AssetMaster.AssetID=AuditDetails.AssetID
 inner join RCBAMS..AuditMaster on AuditMaster.AuditID=AuditDetails.AuditID
 Order by AuditDetailsID Desc">
      
    </asp:SqlDataSource>
    <br />
     <asp:SqlDataSource ID="AssetDS" runat="server" 
        ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
        SelectCommand="select AuditDetailsID,AuditID,AssetMaster.AssetID,AssetMaster.MainAssetNumber,AssetClass,AssetDesc from RCBAMS..AuditDetails inner join RCBSAP..AssetMaster on AssetMaster.AssetID=AuditDetails.AssetID where AuditDetails.AuditID=@AuditID">
       <SelectParameters>
         <asp:SessionParameter Name="AuditID" SessionField="AuditID" />
       </SelectParameters>
         </asp:SqlDataSource>

    <asp:SqlDataSource ID="StatusDS" runat="server"  ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" SelectCommand="SELECT [StatusCode],[StatusName] FROM [RCBAMS]..[StatusMaster]">
     </asp:SqlDataSource>
            </div>
</div>
</asp:Content>

