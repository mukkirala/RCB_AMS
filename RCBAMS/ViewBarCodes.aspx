<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ViewBarCodes.aspx.cs" Inherits="ViewBarCodes" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <div class="row" style="margin-top:50px;">
            <div class="col-sm-8">
                <div class="col-sm-2">
                 <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Select Client"></dx:ASPxLabel>
                 </div>
                <div class="col-sm-5">
                     <dx:ASPxGridLookup ID="Client_gridlookup" runat="server"  AutoGenerateColumns="False"
                     DataSourceID="ClientSqlDataSource" IncrementalFilteringMode="Contains" AutoPostBack="true" TextFormatString="{1}"
                     KeyFieldName="ClientCode"   Height="25px"
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
        <GridViewProperties>
       <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>
      <Settings ShowFilterRow="True" />
    </GridViewProperties>
                    <Columns>
                        <dx:gridviewdatatextcolumn FieldName="ClientID"  ReadOnly="True" 
                            VisibleIndex="0">
                            <EditFormSettings Visible="True" />
                        </dx:gridviewdatatextcolumn>                        
                        <dx:gridviewdatatextcolumn FieldName="ClientCode" VisibleIndex="1">
                        </dx:gridviewdatatextcolumn>
                          <dx:gridviewdatatextcolumn FieldName="ClientName" VisibleIndex="2">
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
                </dx:ASPxGridLookup><br />
                </div>
             </div>
            <div class="col-sm-8">
                <div class="col-sm-2">
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Select Asset Class"></dx:ASPxLabel>
                </div>
                <div class="col-sm-5">
                      <dx:ASPxGridLookup ID="Assetclass_gridlookup" runat="server"  AutoGenerateColumns="False"
                     DataSourceID="AssetClassSqlDataSource" IncrementalFilteringMode="Contains" AutoPostBack="true" TextFormatString="{2}"
                     KeyFieldName="AssetClassCode"   Height="25px"
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
        <GridViewProperties>
       <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>
      <Settings ShowFilterRow="True" />
    </GridViewProperties>
                    <Columns>
                        <dx:gridviewdatatextcolumn FieldName="AssetClassID"  ReadOnly="True" 
                            VisibleIndex="0">
                            <EditFormSettings Visible="True" />
                        </dx:gridviewdatatextcolumn>                        
                        <dx:gridviewdatatextcolumn FieldName="AssetClassName" VisibleIndex="1">
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
                </dx:ASPxGridLookup><br />
                    <dx:ASPxButton ID="GetAssetData" runat="server" Text="Get Data" OnClick="GetAssetData_Click"></dx:ASPxButton>
                </div>

            </div>

              <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumnsASPxGridView1="False" 
        Width="800px"  style="margin-left:250px" 
        DataSourceID="AssetGridView" KeyFieldName="AssetRequestID" 
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
        CssPostfix="PlasticBlue" AutoGenerateColumns="False" Visible="false">
        <Columns>
              <dx:GridViewDataTextColumn FieldName="AssetID" ReadOnly="True" VisibleIndex="0">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>   
            <dx:GridViewDataTextColumn FieldName="Client" ReadOnly="True" VisibleIndex="1">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>         
             <dx:GridViewDataTextColumn FieldName="CompanyCode" ReadOnly="True" VisibleIndex="2">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>  
             <dx:GridViewDataTextColumn FieldName="MainAssetNumber" ReadOnly="True" VisibleIndex="3" >
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>  
               <dx:GridViewDataTextColumn FieldName="AssetSubNumber" ReadOnly="True" VisibleIndex="4">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn> 
              <dx:GridViewDataTextColumn FieldName="AssetClass" ReadOnly="True" VisibleIndex="5">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>  
            <dx:GridViewDataTextColumn FieldName="TechnicalAssetNumber" VisibleIndex="6" 
               Width="100px" >
                
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>        
            
            <dx:GridViewDataTextColumn FieldName="AssetType" VisibleIndex="7" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="AssetCreatedBy" VisibleIndex="8" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="AssetCreatedDate" VisibleIndex="9" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="AssetCatagory" VisibleIndex="10"  Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="AssetCapitalizationDate" VisibleIndex="11"  Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="AssetOrigin" VisibleIndex="12">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="AssetSupplier" VisibleIndex="13">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="AssetManufacturer" VisibleIndex="14">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="15">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
           <dx:GridViewDataTextColumn FieldName="AcquisitionYear" VisibleIndex="16">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>   
              <dx:GridViewDataTextColumn FieldName="QRID" VisibleIndex="17">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
              <dx:GridViewDataTextColumn FieldName="QRCode" VisibleIndex="18">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
              <dx:GridViewDataTextColumn FieldName="QRImage" VisibleIndex="19">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>    
            <%--<dx:GridViewDataTextColumn FieldName="" VisibleIndex="17">
                     <DataItemTemplate>
                         <asp:LinkButton ID="btn_view" Text="View" runat="server" CommandName="View">View</asp:LinkButton>
                     </DataItemTemplate>
                </dx:GridViewDataTextColumn>--%>
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
        <dx:ASPxSummaryItem FieldName="AssetID" SummaryType="Count" />
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
        </div>

    <asp:SqlDataSource ID="ClientSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:RCBSAPConnectionString %>"
        SelectCommand="select * from ClientMaster">

    </asp:SqlDataSource>
    <asp:SqlDataSource ID="AssetClassSqlDataSource" runat="server"  ConnectionString="<%$ ConnectionStrings:RCBSAPConnectionString %>"
        SelectCommand="select * from AssetClassMaster">

    </asp:SqlDataSource>

    <asp:SqlDataSource ID="AssetGridView" runat="server" ConnectionString="<%$ ConnectionStrings:RCBSAPConnectionString %>"
          SelectCommand="select *,QRCodeMaster.QRID,QRCodeMaster.QRCode,QRCodeMaster.QRImage from RCBSAP..AssetMaster
            inner join RCBAMS..QRCodeMaster
             on AssetMaster.MainAssetNumber=QRCodeMaster.MainAssetNumber where Client=@Client and AssetClass=@AssetClass">
        <SelectParameters>
            <asp:SessionParameter Name="Client" SessionField="Client"/>
            <asp:SessionParameter Name="AssetClass" SessionField="AssetClass"/>
          </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

