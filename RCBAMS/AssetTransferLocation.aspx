<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="AssetTransferLocation.aspx.cs" Inherits="AssetTransferLocation" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxMenu" tagprefix="dx1" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
   <style>
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

      <div class="col-sm-12">  <h4><strong><span >Asset Transfer By Location</span></strong></h4></div>
   
     <div class="">        
      <div style="">
           <div class="col-sm-12">
                <dx:ASPxLabel ID="errmsg" runat="server" Text="Select Asset Name" Visible="false" ForeColor="Red"></dx:ASPxLabel>
            </div>
     </div>
    <div class="col-sm-12">
      <strong> Asset Details: </strong>
        <hr>
        <div class="row form_div">
         <div class="col-sm-2">
              <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Select Asset CLass"></dx:ASPxLabel>
          </div>
        <div class="col-sm-4">
           <dx:ASPxGridLookup ID="AssetGrpGridLookup1" runat="server"  AutoGenerateColumns="False"
                     DataSourceID="AssetGrpSqlDataSource" IncrementalFilteringMode="Contains" TextFormatString="{2}"
                     KeyFieldName="AssetClassCode"   Height="25px"
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" OnTextChanged="AssetGrpGridLookup1_TextChanged" AutoPostBack="true">
        <GridViewProperties>
       <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>
      <Settings ShowFilterRow="True" />
    </GridViewProperties>
                    <Columns>
                        <dx:gridviewdatatextcolumn FieldName="AssetClassID"  ReadOnly="True" 
                            VisibleIndex="0">
                            <EditFormSettings Visible="True" />
                        </dx:gridviewdatatextcolumn>                        
                        <dx:gridviewdatatextcolumn FieldName="AssetClassName" VisibleIndex="1" Visible="false">
                        </dx:gridviewdatatextcolumn>
                         <dx:gridviewdatatextcolumn FieldName="AssetClassCode" VisibleIndex="2">
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
         
         <div class="col-sm-2">
             <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Select Asset "></dx:ASPxLabel>
         </div>
         <div class="col-sm-4">
            <%-- <dx:ASPxComboBox ID="cmb_Assetname" runat="server" DataSourceID="SqlDataSource" ValueField="AssetID" TextField="AssetName" ></dx:ASPxComboBox><br />--%>
              <dx:ASPxGridLookup ID="gridlkup_Asset" runat="server"  AutoGenerateColumns="False"
                     DataSourceID="SqlDataSource" IncrementalFilteringMode="Contains" AutoPostBack="true" TextFormatString="{3}"
                     KeyFieldName="AssetID"   Height="25px"
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" OnTextChanged="gridlkup_Asset_TextChanged">
        <GridViewProperties>
       <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>
      <Settings ShowFilterRow="True" />
    </GridViewProperties>
                    <Columns>
                         <dx:gridviewdatatextcolumn FieldName="AssetID"  ReadOnly="True" 
                            VisibleIndex="0">
                            <EditFormSettings Visible="True" />
                        </dx:gridviewdatatextcolumn> 
                        <dx:gridviewdatatextcolumn FieldName="MainAssetNumber"  ReadOnly="True" 
                            VisibleIndex="1">
                            <EditFormSettings Visible="True" />
                        </dx:gridviewdatatextcolumn>  
                        <dx:gridviewdatatextcolumn FieldName="AssetSubNumber"  ReadOnly="True" 
                            VisibleIndex="2">
                            <EditFormSettings Visible="True" />
                        </dx:gridviewdatatextcolumn>                          
                        <dx:gridviewdatatextcolumn FieldName="AssetDesc" VisibleIndex="3">
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
    </div>
         <div class="clearfix"></div>
    
        
          <div id="AssetDetails"  runat="server">
               <div class="row">  
                  <div class="col-sm-12">  
                      <div class="col-sm-12">  
            <strong> Asset Details:</strong>
                 
                      </div>
                      </div>
              </div>
              <div class="row back-bg">
             

         <div class="">
           <div class="col-sm-2">
                 <label>Main Asset Number:</label>
               </div>
           <div class="col-sm-4">
                  <dx:ASPxLabel ID="lbl_AssetNo" runat="server" Font-Bold="true"  Text="">
			        </dx:ASPxLabel>
            </div>
            <div class="col-sm-2">
                <label>Asset Sub Number:</label>
           </div> 
            <div class="col-sm-4"> 
                    <dx:ASPxLabel ID="lbl_subnumber" runat="server"  Text="" Font-Bold="True">
			        </dx:ASPxLabel>
            </div> 
               
        </div>
        <div class="clearfix"></div>
      <div class="">
           <div class="col-sm-2">
                 <span>Asset Class:</span>
           </div>
            <div class="col-sm-4">
                  <dx:ASPxLabel ID="lbl_Assetclass" runat="server" Font-Bold="true"  Text="">
			    </dx:ASPxLabel>
             </div> 
            <div class="col-sm-2">
                <span>Asset Type:</span>
            </div>
            <div class="col-sm-4"> 
                 <dx:ASPxLabel ID="lbl_AssetType" runat="server"  Text="" Font-Bold="True">
			     </dx:ASPxLabel>
            </div>
      </div>
      <div class="clearfix"></div>
      <div class="">
          <div class="col-sm-2">
              <span>Current Location:</span>
          </div>
            <div class="col-sm-4">
                  <dx:ASPxLabel ID="lbl_currentlocation" runat="server" Font-Bold="true"  Text="">
			    </dx:ASPxLabel>
             </div> 
         <div class="col-sm-2">
             <span>Current Custodian:</span>
         </div>
          <div class="col-sm-4">
                 <dx:ASPxLabel ID="lbl_currentcustodian" runat="server" Font-Bold="true"  Text="">
			    </dx:ASPxLabel>
          </div>
      </div>
      </div>
              </div>
         
     <div class="col-sm-12">
       <strong>Transfer Details:</strong>
         <hr />
        
            <div class="row form_div">
         
         <div class="col-sm-2">
             <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="To Location "></dx:ASPxLabel>
         </div>
         <div class="col-sm-4">
               <dx:ASPxGridLookup ID="ASPxGridLookup_Tolocation" runat="server"  AutoGenerateColumns="False"
                     DataSourceID="SqlDataSource2" IncrementalFilteringMode="Contains" TextFormatString="{2}"
                     KeyFieldName="LocationCode"   Height="25px"
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" OnTextChanged="AssetGrpGridLookup1_TextChanged" AutoPostBack="true">
        <GridViewProperties>
       <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>
      <Settings ShowFilterRow="True" />
    </GridViewProperties>
                    <Columns>
                        <dx:gridviewdatatextcolumn FieldName="LocationID"  ReadOnly="True" 
                            VisibleIndex="0" Visible="false">
                            <EditFormSettings Visible="True" />
                        </dx:gridviewdatatextcolumn>                        
                        <dx:gridviewdatatextcolumn FieldName="LocationCode" VisibleIndex="1">
                        </dx:gridviewdatatextcolumn>
                         <dx:gridviewdatatextcolumn FieldName="Location" VisibleIndex="2">
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
      
     </div>
           <div class="col-sm-12">
                 <div class="row form_div">
           <div class="col-sm-2">
                 
           </div>
            <div class="col-sm-4">
                <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Transfer" OnClick="ASPxButton1_Click"></dx:ASPxButton>
			
            </div> 
                     </div>
       </div>
          
 

         </div>
    <br />
    <div class="col-sm-12">
         <table  style="width:100%">
        <tr>
            <td class="style8">
    <strong ><span class="style9">ASSET LIST</span></strong></td>
            <td align="right" class="style7">
                <dx:ASPxButton ID="btnXLS" runat="server" Text="Export to XLS" width="124px" OnClick="btnXLS_Click"
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" 
                    style="margin-left: 450px">
                </dx:ASPxButton>
            </td>
            
            <td align="left">
                <dx:ASPxButton ID="btnPDF" runat="server" Text="Export to Pdf"  width="120px" OnClick="btnPDF_Click"
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                 
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                </dx:ASPxButton>
            </td>
        </tr>
        </table>
    <br/>
    <div class="table-responsive">
   <dx:ASPxGridView ID="AssetList" runat="server" AutoGenerateColumnsASPxGridView1="False" 
         style="width:100%" 
        DataSourceID="SqlDataSource3" KeyFieldName="AssetTransferId" 
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
        CssPostfix="PlasticBlue" AutoGenerateColumns="False">
        <Columns>
              <dx:GridViewDataTextColumn FieldName="AssetTransferId" ReadOnly="True" VisibleIndex="0" Visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>   
            <dx:GridViewDataTextColumn FieldName="AssetID" ReadOnly="True" VisibleIndex="1" Visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="MainAssetNumber" ReadOnly="True" VisibleIndex="2">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetDesc" Caption="Asset Name" ReadOnly="True" VisibleIndex="2">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="ToLocation" ReadOnly="True" VisibleIndex="3">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>  
            <dx:GridViewDataDateColumn FieldName="Date" VisibleIndex="4" 
               Width="100px" >
                <PropertiesDateEdit DisplayFormatString="dd-MM-yyyy">
                </PropertiesDateEdit>
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataDateColumn>        
            
            <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="5">
                <Settings AutoFilterCondition="Contains" />
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
        <Settings  ShowFooter="true" />
        <TotalSummary>
        <dx:ASPxSummaryItem FieldName="AssetTransferId" SummaryType="Count" />
        </TotalSummary>
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
        <Styles CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
            CssPostfix="PlasticBlue">
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
   <%-- <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ConnectionStrings:ASSETManagementConnectionString %>" SelectCommand="select AssetRequestID,AssetID,AssetName from EmployeeAssetRequest where Status='Approved'">
   
    </asp:SqlDataSource>--%>
    <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ConnectionStrings:InstemAMSConnectionString %>" SelectCommand="select * from InstemSAP..AssetMaster where AssetMaster.AssetClass=@AssetClassCode and AssetMaster.Status='LTRF'">
    <SelectParameters>
        <asp:SessionParameter Name="AssetClassCode" SessionField="AssetClassCode"/>
      <%--  <asp:SessionParameter Name="EmployeeID" SessionField="EmployeeID" />--%>
    </SelectParameters>
    </asp:SqlDataSource>
   
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ConnectionStrings:InstemAMSConnectionString %>" SelectCommand="select *  from LocationMaster">

    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:InstemAMSConnectionString %>" 
        SelectCommand="Select AssetTransfer.AssetID,AssetMaster.MainAssetNumber,AssetMaster.AssetDesc,AssetTransfer.ToLocation,AssetTransfer.Date,AssetTransfer.Status from InstemAMS..AssetTransfer inner join InstemSAP..AssetMaster on AssetMaster.AssetID=AssetTransfer.AssetID inner join LocationMaster on LocationMaster.LocationCode=AssetTransfer.ToLocation where AssetTransfer.Status='Transferred' order by AssetTransferId desc">    
     </asp:SqlDataSource>

     <asp:SqlDataSource ID="AssetGrpSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:InstemSAPConnectionString %>" 
        SelectCommand="SELECT * FROM [AssetClassMaster]">
      
        </asp:SqlDataSource>
    </div>
 
     <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" 
        Landscape="True">
</dx:ASPxGridViewExporter>
</asp:Content>

