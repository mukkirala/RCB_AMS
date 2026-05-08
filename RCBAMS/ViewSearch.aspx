<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ViewSearch.aspx.cs" Inherits="ViewSearch" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1" Namespace="DevExpress.Web.ASPxGridLookup" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <script type="text/javascript">
         function button1_Click(s, e) {
             if (grid.IsCustomizationWindowVisible())
                 grid.HideCustomizationWindow();
             else
                 grid.ShowCustomizationWindow();
             UpdateButtonText();
         }
         function grid_CustomizationWindowCloseUp(s, e) {
             UpdateButtonText();
         }
         function UpdateButtonText() {
             var text = grid.IsCustomizationWindowVisible() ? "Hide" : "Show";
             text += " Customization Window";
             button1.SetText(text);
         }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
     <div class="container cnt_div" style="padding-top:20px;">
      
        <br /><dx:ASPxImage ID="ASPxImage1" runat="server" Visible="false">
                </dx:ASPxImage>

           <div class="row">
             
                 <h3><strong>Search </strong> </h3>
             
         </div>

         <br />
            <div class="col-sm-12">
                <div class="col-sm-2">
              Enter Text <span style="color:red">*</span></div>
            <div class="col-sm-3">
                <dx:ASPxTextBox ID="txt_search" runat="server" Height="25px" Width="200px">
    
                    </dx:ASPxTextBox>
                                  <%--<dx:ASPxGridLookup ID="gridlkup_Equimentno" runat="server"  AutoGenerateColumns="False" 
                 DataSourceID="SqlDataSource1" IncrementalFilteringMode="Contains"  TextFormatString="{1}"
                 KeyFieldName="MainAssetNumber"   Height="25px"
                CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Width="170px">
    <GridViewProperties>
   <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>
  <Settings ShowFilterRow="True" />
  <SettingsPager PageSize="10"></SettingsPager>
</GridViewProperties>
                <Columns>
                  
                    <dx:GridViewDataTextColumn FieldName="AssetID" ReadOnly="True" VisibleIndex="0" Visible="false">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="MainAssetNumber" VisibleIndex="1" Width="100%" Caption="Equipment Number">
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
            </dx:ASPxGridLookup>--%>
               
            </div>  
                  <div class="col-sm-1">
                <asp:ImageButton OnClick="search_Click" ID="search"  ImageUrl="~/Images/search1.png" runat="server" />
            </div>
        </div>
           <div class="col-sm-12">
		<div class="col-sm-3">
            <dx:ASPxButton ID="ASPxButton1" runat="server" ClientInstanceName="button1" Text="Show Customization Window"
                UseSubmitBehavior="False" AutoPostBack="False" CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css">
                <ClientSideEvents  Click= "button1_Click"/>
            </dx:ASPxButton>
            </div>
            </div>

        
      
        <div class="row">
          
      <%--      <div class="col-sm-3">
               
                 <dx:ASPxTextBox ID="txt_search" runat="server" Height="25px" Width="200px">
                   
                </dx:ASPxTextBox>
            </div>--%>
          <%--  <div class="col-sm-1">
                <asp:ImageButton OnClick="search_Click" ID="search"  ImageUrl="~/Images/search1.png" runat="server" />
            </div>--%>

        </div>
                 <div class="col-sm-12">
         <div class="col-sm-10"></div>
                
        <div class="col-sm-1">
                   <asp:ImageButton ID="ExporttoPDF" runat="server"  OnClick="ExporttoPDF_Click" ImageUrl="~/Images/PDF.png"   Height="35px" Width="45px" ImageAlign="Right"/>
            </div>
                      <div class="col-sm-1"></div>
                     
            <div class="col-sm-1">
                <asp:ImageButton ID="ExporttoExport" runat="server"  OnClick="ExporttoExport_Click" ImageUrl="~/Images/XLS.png" Height="35px" Width="45px"/>
        </div>
                           </div>

         <br />
               <dx:aspxgridviewexporter ID="gridexport" GridViewId="Grid" runat="server"></dx:aspxgridviewexporter>
         
               <div>
        
            
         <dx:ASPxGridView ID="Grid" runat="server" AutoGenerateColumns="False"    OnCustomUnboundColumnData="grid_CustomUnboundColumnData" ClientInstanceName="grid" 
              CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" KeyFieldName="AssetID" Width="95%" Settings-ShowHorizontalScrollBar="true" >
          
          
               <Columns>
            <dx:GridViewDataTextColumn FieldName="SLNO" Visible="false" ReadOnly="True" VisibleIndex="0">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            
            <dx:GridViewDataTextColumn FieldName="Company" VisibleIndex="1" Caption="Company">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Plant" VisibleIndex="2"  Caption="Plant">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetID" VisibleIndex="3">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
                
            <dx:GridViewDataTextColumn FieldName="MainAssetNumber" VisibleIndex="4" Caption="Equipment Number"  >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetSubNumber" VisibleIndex="5" Caption="Sub AssetNumber "  >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="AssetDesc" VisibleIndex="6" Caption="Asset Name">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>             
            <dx:GridViewDataTextColumn FieldName="AssetOwner" VisibleIndex="7" Caption="Asset Owner" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>   
             <dx:GridViewDataTextColumn FieldName="AssetUser" VisibleIndex="8"  Caption="Asset User">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>  
             <dx:GridViewDataTextColumn FieldName="CustodianID" VisibleIndex="9" Caption="Staff Number">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
            <dx:GridViewDataTextColumn FieldName="SerialNumber" VisibleIndex="10" Caption="Serial Number" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="MACID" VisibleIndex="11" Caption="Macid" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Location" VisibleIndex="12" Caption="Wing">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>          
            
            <dx:GridViewDataTextColumn FieldName="LocationDesc" VisibleIndex="13" Caption="LAB">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
                     <dx:GridViewDataTextColumn FieldName="Department" VisibleIndex="9"  Caption="Department">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
           <dx:GridViewDataTextColumn FieldName="BLOCK" VisibleIndex="14" Caption="Floor">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Model" VisibleIndex="15" Caption="Model" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Make" VisibleIndex="15" Caption="Make" >
    <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="PONoforReference" VisibleIndex="15" Caption="PO Number" >
    <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="GRNumber" VisibleIndex="16" Width="80px" Caption="GR Number" Visible="false">
                <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>
                <Settings AutoFilterCondition="Contains"/>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="YearofPurchase" VisibleIndex="17" Width="80px" Caption="Year of Purchase" >
                <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>
                <Settings AutoFilterCondition="Contains"/>
            </dx:GridViewDataDateColumn>            
            <dx:GridViewDataTextColumn FieldName="CapitalizationDate" VisibleIndex="18" Caption="Capitalization Date" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
             <dx:GridViewDataTextColumn FieldName="AssetClass" VisibleIndex="19" Caption="Asset Class">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
             <dx:GridViewDataDateColumn FieldName="CostCenter" VisibleIndex="20" Caption="Cost Center" Width="80px" Visible="false">
                <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>
                <Settings AutoFilterCondition="Contains"/>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="MaterialNumber" VisibleIndex="21" Caption="Material Number" Width="80px" Visible="false">
                <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>
                <Settings AutoFilterCondition="Contains"/>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="AcceptDatebyUser" VisibleIndex="22" Caption="Accept Date by User" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="PONoforReference" VisibleIndex="23" Caption="PO No for Reference" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
             <dx:GridViewDataTextColumn FieldName="WBSNumberforReference" VisibleIndex="24" Caption="WBS Number for Reference" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>   
            <dx:GridViewDataTextColumn FieldName="InstallationDateforReference" VisibleIndex="25" Width="180px" Visible="false" Caption="Installation Date for Reference">
                 <Settings AutoFilterCondition="Contains" />
                       <%-- <DataItemTemplate>
                            <dx:ASPxImage ID="img" runat="server" ImageUrl='<%# Eval("QRImage") %>' 
                                Height="80px" Width="150px"></dx:ASPxImage>
                        </DataItemTemplate>--%>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="CreationDate" VisibleIndex="26" Caption="Creation Date" Visible="false" Width="80px">
                <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>
                <Settings AutoFilterCondition="Contains"/>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Remarks" VisibleIndex="27" Caption="Remark" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
             </Columns>
      
       <SettingsPager ShowDefaultImages="False"  Mode="ShowAllRecords">
                <AllButton Text="All">
                </AllButton>
                <NextPageButton Text="Next &gt;">
                </NextPageButton>
                <PrevPageButton Text="&lt; Prev">
                </PrevPageButton>
            </SettingsPager>
                <Settings  ShowFooter="true" ShowFilterRow="true"/>
        <TotalSummary>
        <dx:ASPxSummaryItem FieldName="AssetID" SummaryType="Count" />
        </TotalSummary>

       <Settings ShowGroupPanel="True" ShowFilterRow="True" ShowFilterBar="Visible" ShowGroupFooter="VisibleAlways" 
            ShowFilterRowMenu="True" ShowFooter="true" 
            ShowHeaderFilterButton="True" />
            <SettingsCustomizationWindow Enabled="True" Height="250px" 
            PopupHorizontalOffset="200" PopupVerticalOffset="100" Width="250px" 
            PopupVerticalAlign="TopSides" />
              <SettingsLoadingPanel Mode="ShowOnStatusBar" />
             <ClientSideEvents CustomizationWindowCloseUp="grid_CustomizationWindowCloseUp" />
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
      <asp:SqlDataSource ID="SqlDSGrid" runat="server" ConnectionString="<%$ ConnectionStrings:RCBSAPConnectionString %>" 
        SelectCommand="Select * from  AssetMaster 
        "></asp:SqlDataSource> 
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ConnectionStrings:RCBSAPConnectionString %>" SelectCommand="select AssetID,MainAssetNumber from AssetMaster">

    </asp:SqlDataSource>

          </div>
       
       
     </div>
  
</asp:Content>

