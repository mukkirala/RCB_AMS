<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AssetStatusUpdate.aspx.cs" Inherits="AssetStatusUpdate" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxMenu" tagprefix="dx1" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<style>
    .form_div{
           margin-top:10px;
          
         }
       
         .back-bg {
            margin: 20px 30px;
            border: 2px solid rgb(199, 212, 220);
            padding: 15px 0;
     }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
 <%--<asp:UpdatePanel ID="updpnlRefresh" runat="server" UpdateMode="Conditional">
  <ContentTemplate>--%>
   <div class="col-sm-12" >
      <h4><strong><span>Asset Status Change</span></strong></h4>
    <div class="">
        <div class="row">
        <div style="">
             <div class="col-sm-12">
           <dx:ASPxLabel ID="errormsg" runat="server" Text="" Visibl="false" ForeColor="Red"></dx:ASPxLabel>
                 </div>
            </div>
       
       
                 <div class="col-sm-10">
                 <div class="row">
                <div class="col-sm-2" style="Font-Size:Medium">
                  <label>Select Asset</label>
                </div>
                <div class="col-sm-4">
                 
                      <dx:ASPxGridLookup ID="gridlkup_Asset" runat="server"  AutoGenerateColumns="False"
                     DataSourceID="SqlDataSource1" IncrementalFilteringMode="Contains"  TextFormatString="{1}"
                     KeyFieldName="AssetID"   Height="25px"
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" width="260px" >
        <GridViewProperties>
       <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>
      <Settings ShowFilterRow="True" />
      <SettingsPager PageSize="15"></SettingsPager>
    </GridViewProperties>
                    <Columns>
                                              
                        <dx:gridviewdatatextcolumn FieldName="AssetID" VisibleIndex="1" visible="false">
                        </dx:gridviewdatatextcolumn>
                        <dx:gridviewdatatextcolumn FieldName="MainAssetNumber" VisibleIndex="2" Caption="Equipment Number">
                        </dx:gridviewdatatextcolumn>
						 <dx:gridviewdatatextcolumn FieldName="AssetSubNumber" VisibleIndex="3" Caption="SubNumber" Visible="false">
                        </dx:gridviewdatatextcolumn>
						 <dx:gridviewdatatextcolumn FieldName="AssetDesc" VisibleIndex="4" Caption="Asset Name">
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
            
              <dx:ASPxButton ID="btn_search" runat="server" BackColor="White" 
                    
                   Width="20px" Height="25px" OnClick="btn_search_Click" >
                    <Image Url="~/Images/search1.png" Width="20px" Height="20px">
                    </Image>
                    <Border BorderColor="White" />    
                  
                </dx:ASPxButton>
           
              </div>
</div>

<div class="clearfix"></div>
         
        
          <div id="AssetDetails"  runat="server" visible="false">
                 
                  <div class="row">  
                  <div class="col-sm-12"> 
                  <div class="col-sm-12">  
                 <h4> <label> <strong>Asset Details: </strong></label></h4>
                 
               </div>      
             </div>       
        
   </div>
         <div class="row">  
          
               <div class="row back-bg">
             

         <div class="col-sm-12">
          <div class="row form_div">
           <div class="col-sm-2" style="Font-Size:Medium">
               <%--<dx:ASPxLabel ID="Label1" runat="server" Text="Main Asset Number:"></dx:ASPxLabel>--%>
               <label>Asset Number:</label>
               </div>
           <div class="col-sm-4">
                  <dx:ASPxLabel ID="lbl_AssetNo" runat="server" Font-Bold="True" ForeColor="Black" Font-Size="Medium"> </dx:ASPxLabel>
            </div>
            <div class="col-sm-2" style="Font-Size:Medium">
              <%-- <dx:ASPxLabel ID="Label2" runat="server" Text="Serial Number:"></dx:ASPxLabel>--%>
                <label>Asset SubNumber:</label>
           </div>
            <div class="col-sm-4">
                <dx:ASPxLabel ID="lbl_SubNumber" runat="server" Font-Bold="True" ForeColor="Black" Font-Size="Medium"></dx:ASPxLabel>
             </div> 
              </div>
             
     </div>
        
              <div class="col-sm-12">
           <div class="row form_div">
            <div class="col-sm-2" style="Font-Size:Medium">
              <%--<dx:ASPxLabel ID="Label3" runat="server" Text="Asset Class Name:"></dx:ASPxLabel>--%>
                <label>Asset Class:</label>
            </div>
            <div class="col-sm-4"> 
               <dx:ASPxLabel ID="lbl_Assetclass" runat="server" Font-Bold="True" ForeColor="Black" Font-Size="Medium"></dx:ASPxLabel>
            </div>
    
           <div class="col-sm-2" style="Font-Size:Medium">
                <%--<dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Asset Type:"></dx:ASPxLabel>--%>
               <label>Asset Description:</label>
           </div>
            <div class="col-sm-4">
               <dx:ASPxLabel ID="lbl_AssetType" runat="server" Font-Bold="True" ForeColor="Black" Font-Size="Medium"></dx:ASPxLabel>
            </div>   
               </div>
       </div>
     <div class="col-sm-12">
    <div class="row form_div">
         <div class="col-sm-2" style="Font-Size:Medium">
            <label>Current Location:</label>
         </div>
         <div class="col-sm-4">
             <dx:ASPxLabel ID="lbl_assetlocation" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
		     </dx:ASPxLabel>            
         </div>     
         <div class="col-sm-2" style="Font-Size:Medium">
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
         <div class="col-sm-2" style="Font-Size:Medium">
            <label>Available Quantity:</label>
         </div>
         <div class="col-sm-4">
             <dx:ASPxLabel ID="lbl_quantity" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
		     </dx:ASPxLabel>            
         </div>     
         <div class="col-sm-2" style="Font-Size:Medium">
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
         <div class="col-sm-2" style="Font-Size:Medium">
            <label>Capitalization Date:</label>
         </div>
         <div class="col-sm-4">
             <dx:ASPxLabel ID="lbl_capitalizationdate" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium" >
		     </dx:ASPxLabel>            
         </div>     
         <div class="col-sm-2" style="Font-Size:Medium">
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
         <div class="col-sm-2" style="Font-Size:Medium">
            <label>DeacDate:</label>
         </div>
         <div class="col-sm-4">
             <dx:ASPxLabel ID="lbl_deacdate" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
		     </dx:ASPxLabel>            
         </div>     
         <div class="col-sm-2" style="Font-Size:Medium">
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
         <div class="col-sm-2" style="Font-Size:Medium">
            <label>Inventory Date:</label>
         </div>
         <div class="col-sm-4">
             <dx:ASPxLabel ID="lbl_inventorydate" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
		     </dx:ASPxLabel>            
         </div>     
         <div class="col-sm-2">
              
         </div>
         <div class="col-sm-4">
            
         </div>
     </div>
</div>
</div>
</div>
     </div> 

   <div class="col-sm-10">
                <div class="row form_div">
                <div class="col-sm-2"style="Font-Size:Medium">
                  <label>Asset Status</label>
                </div>
                <div class="col-sm-3">
                  <dx:ASPxComboBox ID="cmb_Status" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css"  Height="25px" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" ValueType="System.String" DataSourceID="StatusDS"
                    ValueField="StatusCode" TextField="StatusName"  DropDownStyle="DropDown" IncrementalFilteringMode="Contains" Width="260px">
                    <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                    </LoadingPanelImage>
                    <ValidationSettings>
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
                </dx:ASPxComboBox>
</div>
</div>
</div>
<div class="col-sm-10">
                 <div class="row form_div">
                     <div class="col-sm-2">

                     </div>
                     <div class="col-sm-4">
                    <dx:ASPxButton ID="StatusUpdate" runat="server" Text="Change Status" OnClick="StatusUpdate_Click" CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange"  ></dx:ASPxButton><br />
                   </div>
                   </div>
  </div>

<div class="col-sm-12">
                 <div class="col-sm-10"></div>
<div class="col-sm-1">
  <asp:ImageButton ID="ImageButton1" ImageAlign="Right"  ImageUrl="~/Images/PDF.png" runat="server" Height="35px" Width="40px" OnClick="ImageButton1_Click"    />
   
    </div>
<div class="col-sm-1">
   <asp:ImageButton ID="ImageButton2"  ImageUrl="~/Images/XLS.png" Height="35px" runat="server" OnClick="ImageButton2_Click" Width="35px" />

</div>
  </div>
<div class="col-sm-12">
    
          <div class="table-responsive">
              <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" 
       Landscape="True" MaxColumnWidth="150" GridViewID="ASPxGridView1" 
       LeftMargin="0" RightMargin="0"  TopMargin="0">
   </dx:ASPxGridViewExporter>

        <dx:ASPxGridView ID="ASPxGridView1"  runat="server" AutoGenerateColumns="False" 
                    DataSourceID="SqlDSGrid" KeyFieldName="AssetID"                 
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    Width="1200px" >
        <Columns>
            <dx:GridViewDataTextColumn FieldName="AssetID" visible="true" VisibleIndex="1">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            
            <dx:GridViewDataTextColumn FieldName="MainAssetNumber" VisibleIndex="2" Caption="Equipment Number">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetSubNumber" VisibleIndex="3" Caption="Sub Number" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             
           <dx:GridViewDataTextColumn FieldName="AssetClass" VisibleIndex="4">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
            <dx:GridViewDataTextColumn FieldName="AssetDesc" VisibleIndex="5" Caption="Asset Name" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AdditionalDesc" VisibleIndex="6" Caption="Additional Description" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Quantity" VisibleIndex="7" Caption="Quantity" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Unit" VisibleIndex="8" Caption="Unit" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="AssetCapitalizationDate" VisibleIndex="9"  Visible="false">
                <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>
                <Settings AutoFilterCondition="Contains"/>
            </dx:GridViewDataDateColumn>
              <dx:GridViewDataDateColumn FieldName="FirstAcquisitionDate" VisibleIndex="10"  Visible="false">
                <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>
                <Settings AutoFilterCondition="Contains"/>
            </dx:GridViewDataDateColumn>            
             <dx:GridViewDataTextColumn FieldName="CustodianID" VisibleIndex="11" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Location" VisibleIndex="12" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
            <dx:GridViewDataTextColumn FieldName="LocationDesc" VisibleIndex="13" Caption="Location" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>

              <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="14" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="StatusDesc" VisibleIndex="15" Caption="Asset Status">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="SerialNumber" VisibleIndex="15" Caption="Serial Number">
    <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Model" VisibleIndex="15" Caption="Model">
    <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Make" VisibleIndex="15" Caption="Make">
    <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PONoforReference" VisibleIndex="15" Caption="PO Number">
    <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Component" VisibleIndex="16" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
             <dx:GridViewDataTextColumn FieldName="ComponentDesc" VisibleIndex="17" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
             <dx:GridViewDataDateColumn FieldName="Deacdate" VisibleIndex="18" Caption="Deactivation Date"  Visible="false">
                <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>
                <Settings AutoFilterCondition="Contains"/>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="Invdate" VisibleIndex="19" Caption="Inventory Date"  Visible="false">
                <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>
                <Settings AutoFilterCondition="Contains"/>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="InventoryNote" VisibleIndex="20" Caption="Inventory Note" Visible="false">
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
            <SettingsPager PageSize="25"></SettingsPager>
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
    <asp:SqlDataSource ID="SqlDSGrid" runat="server" ConnectionString="<%$ ConnectionStrings:InstemSAPConnectionString %>" SelectCommand="Select * from InstemSAP..AssetMaster where Status !='InActive' and StatusDesc !='Asset Deleted' "></asp:SqlDataSource>                                     
    
      </div>
        <br/>
 </div> 
</div>
</div>
</div>
  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ConnectionStrings:InstemSAPConnectionString %>" SelectCommand="SELECT [AssetID],[MainAssetNumber],[AssetSubNumber],[AssetDesc] FROM [AssetMaster] where Status !='InActive' and StatusDesc !='Asset Deleted'">
  </asp:SqlDataSource>
 <asp:SqlDataSource ID="StatusDS" runat="server"  ConnectionString="<%$ ConnectionStrings:InstemAMSConnectionString %>" 
     SelectCommand="SELECT [StatusCode],[StatusName] FROM [InstemAMS]..[StatusMaster] ">
     </asp:SqlDataSource>
<%--</ContentTemplate>
</asp:UpdatePanel>--%>
</asp:Content>
