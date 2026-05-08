<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AdminViewBuyBackAssets.aspx.cs" Inherits="AdminViewBuyBackAssets" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxMenu" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx1" %>

<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxEditors" Assembly="DevExpress.Web.ASPxEditors.v11.1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
 <div class="col-sm-12">
           <div >
        <strong><span class="">Requested Buyback Assets</span></strong>
    </div>  
    <div class="table-responsive" >

     <dx:ASPxGridView ID="BuybackAssetList" runat="server" AutoGenerateColumnsASPxGridView1="False" 
          
        DataSourceID="SqlDataSource3" KeyFieldName="BuybackRequestID" 
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
        CssPostfix="PlasticBlue" AutoGenerateColumns="False"  style="width:100%" OnRowCommand="BuybackAssetList_RowCommand">
        <Columns>
              <dx:GridViewDataTextColumn FieldName="BuybackRequestID" ReadOnly="True" VisibleIndex="0" Visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>   
            <dx:GridViewDataTextColumn FieldName="AssetID"  ReadOnly="True" VisibleIndex="1" visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>         
            <dx:GridViewDataTextColumn FieldName="AssetTypeName"  ReadOnly="True" VisibleIndex="2" caption="AssetName">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn> 
            <dx:GridViewDataTextColumn FieldName="EmployeeID" ReadOnly="True" VisibleIndex="3" Caption="Requestor ID">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Requestedby" ReadOnly="True" VisibleIndex="4"  Caption="Requestor Name">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
           
              <dx:GridViewDataTextColumn FieldName="CustodianDepartment" ReadOnly="True" VisibleIndex="5"  Caption="Department">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="CustDesignation" ReadOnly="True" VisibleIndex="5"  Caption="Designation">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Comments" VisibleIndex="5" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            
            <dx:GridViewDataDateColumn FieldName="Date" VisibleIndex="5" 
               Width="100px" >
                <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataDateColumn>        
            
            <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="6">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn FieldName="MainAssetNumber" VisibleIndex="7" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetSubNumber" VisibleIndex="8" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetClass" VisibleIndex="9" Visible="false">
                <Settings AutoFilterCondition="Contains" />

           </dx:GridViewDataTextColumn>
           
           
            <dx:GridViewDataTextColumn FieldName="" VisibleIndex="10">
                     <DataItemTemplate>
                         <asp:LinkButton ID="btn_view" Text="View" runat="server" CommandName="View">View</asp:LinkButton>
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
                    <Settings ShowFilterRow="True" ShowGroupPanel="True" ShowFooter="true" />
                     <TotalSummary >
                                <dx:ASPxSummaryItem FieldName="AssetTypeName"  SummaryType="Count"/>
                                </TotalSummary>
                    <SettingsDetail ShowDetailRow="True" />
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
                    <Templates>
                        <DetailRow>
                            <dx:ASPxGridView ID="DetailGrid1" runat="server"  Caption=""
                                AutoGenerateColumns="False" KeyFieldName="AssetID" OnBeforePerformDataSelect="DetailGrid1_BeforePerformDataSelect"
                                CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" DataSourceID="DetailDS">                                 
                                <Columns>
                                   
                                         <dx:GridViewDataTextColumn FieldName="AssetID" ReadOnly="True" VisibleIndex="1">
                                     <Settings AutoFilterCondition="Contains" />
                                  </dx:GridViewDataTextColumn> 
                                  <dx:GridViewDataTextColumn FieldName="SerialNumber" VisibleIndex="2"  Visible="false">
                                   <Settings AutoFilterCondition="Contains" />
                                   </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="MainAssetNumber" VisibleIndex="3" Caption="Main Asset Number">
                                    <Settings AutoFilterCondition="Contains" />
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn FieldName="AssetSubNumber" VisibleIndex="4" Width="200px" Caption="Asset Sub Number">
                                      <Settings AutoFilterCondition="Contains" />
                                     </dx:GridViewDataTextColumn>
                                      <dx:GridViewDataTextColumn FieldName="AssetClass" VisibleIndex="5" Caption="Asset Class">
                                      <Settings AutoFilterCondition="Contains" />
                                      </dx:GridViewDataTextColumn>
       
                                    <dx:GridViewDataTextColumn FieldName="AssetDesc" VisibleIndex="6" Caption="Asset Description">
                                      <Settings AutoFilterCondition="Contains" />
                                      </dx:GridViewDataTextColumn>
                              
                                      <dx:GridViewDataTextColumn FieldName="StatusDesc" VisibleIndex="7" Caption="Asset Status">
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
                                 <Settings ShowFilterRow="True" ShowGroupPanel="True" />
                                <Settings  ShowFooter="true" />
                                <TotalSummary >
                                <dx:ASPxSummaryItem FieldName=""  SummaryType="Count"/>
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
                        </DetailRow>
                    </Templates>
    </dx:ASPxGridView>

        
<asp:SqlDataSource ID="DetailDS" runat="server" 
                ConnectionString="<%$ ConnectionStrings:RCBSAPConnectionString %>" 
    SelectCommand="select AssetMaster.AssetID,AssetMaster.SerialNumber,AssetMaster.MainAssetNumber,AssetMaster.AssetSubNumber,AssetMaster.AssetClass,AssetMaster.AssetDesc,AssetMaster.StatusDesc from RCBAMS..EmployeeAssetBuyback inner join RCBSAP..AssetMaster on AssetMaster.AssetID=EmployeeAssetBuyback.AssetID where EmployeeAssetBuyback.BuybackRequestID=@ID">
    <SelectParameters>
    <asp:SessionParameter Name="ID" SessionField="ID" />
    </SelectParameters>
 </asp:SqlDataSource>
 </div>
      <br />
    <div >
        <strong><span class="">Approved BuyBack Assets</span></strong>
    </div>  

    <div class="table-responsive" >

     <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumnsASPxGridView1="False" 
          
        DataSourceID="SqlDataSource4" KeyFieldName="BuybackRequestID" 
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
        CssPostfix="PlasticBlue" AutoGenerateColumns="False"  style="width:100%" >
        <Columns>
              <dx:GridViewDataTextColumn FieldName="BuybackRequestID" ReadOnly="True" VisibleIndex="0" Visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>   
            <dx:GridViewDataTextColumn FieldName="AssetID"  ReadOnly="True" VisibleIndex="1" visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>         
            <dx:GridViewDataTextColumn FieldName="AssetTypeName"  ReadOnly="True" VisibleIndex="2" caption="AssetName">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn> 
            <dx:GridViewDataTextColumn FieldName="EmployeeID" ReadOnly="True" VisibleIndex="3" Caption="Requestor ID">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Requestedby" ReadOnly="True" VisibleIndex="4"  Caption="Requestor Name">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
             
              <dx:GridViewDataTextColumn FieldName="CustodianDepartment" ReadOnly="True" VisibleIndex="5"  Caption="Department">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="CustDesignation" ReadOnly="True" VisibleIndex="5"  Caption="Designation">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Comments" VisibleIndex="6" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             
            <dx:GridViewDataTextColumn FieldName="AdminID" VisibleIndex="7" Caption="Admin ID">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AdminName" VisibleIndex="8" Caption="Admin Name">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AdminComments" VisibleIndex="9" Caption="Admin Remarks">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="Date" VisibleIndex="10" 
               Width="100px" >
                <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataDateColumn>        
            
            <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="11">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn FieldName="MainAssetNumber" VisibleIndex="12" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetSubNumber" VisibleIndex="13" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetClass" VisibleIndex="14" Visible="false">
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
                    <Settings ShowFilterRow="True" ShowGroupPanel="True" ShowFooter="true" />
                     <TotalSummary >
                                <dx:ASPxSummaryItem FieldName="AssetTypeName"  SummaryType="Count"/>
                                </TotalSummary>
                    <SettingsDetail ShowDetailRow="True" />
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
                    <Templates>
                        <DetailRow>
                            <dx:ASPxGridView ID="DetailGrid2" runat="server"  Caption=""
                                AutoGenerateColumns="False" KeyFieldName="AssetID" OnBeforePerformDataSelect="DetailGrid2_BeforePerformDataSelect"
                                CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" DataSourceID="DetailDS2">                                 
                                <Columns>
                                   
                                         <dx:GridViewDataTextColumn FieldName="AssetID" ReadOnly="True" VisibleIndex="1">
                                     <Settings AutoFilterCondition="Contains" />
                                  </dx:GridViewDataTextColumn> 
                                  <dx:GridViewDataTextColumn FieldName="SerialNumber" VisibleIndex="2"  Visible="false">
                                   <Settings AutoFilterCondition="Contains" />
                                   </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="MainAssetNumber" VisibleIndex="3" Caption="Main Asset Number">
                                    <Settings AutoFilterCondition="Contains" />
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn FieldName="AssetSubNumber" VisibleIndex="4" Width="200px" Caption="Asset Sub Number">
                                      <Settings AutoFilterCondition="Contains" />
                                     </dx:GridViewDataTextColumn>
                                      <dx:GridViewDataTextColumn FieldName="AssetClass" VisibleIndex="5" Caption="Asset Class">
                                      <Settings AutoFilterCondition="Contains" />
                                      </dx:GridViewDataTextColumn>
       
                                    <dx:GridViewDataTextColumn FieldName="AssetDesc" VisibleIndex="6" Caption="Asset Description">
                                      <Settings AutoFilterCondition="Contains" />
                                      </dx:GridViewDataTextColumn>
                         
                                     <dx:GridViewDataTextColumn FieldName="StatusDesc" VisibleIndex="7" Caption="Asset Status">
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
                                 <Settings ShowFilterRow="True" ShowGroupPanel="True" />
                                <Settings  ShowFooter="true" />
                                <TotalSummary >
                                <dx:ASPxSummaryItem FieldName=""  SummaryType="Count"/>
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
                        </DetailRow>
                    </Templates>

    </dx:ASPxGridView>

         <asp:SqlDataSource ID="DetailDS2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:RCBSAPConnectionString %>" 
    SelectCommand="select AssetMaster.AssetID,AssetMaster.SerialNumber,AssetMaster.MainAssetNumber,AssetMaster.AssetSubNumber,AssetMaster.AssetClass,AssetMaster.AssetDesc,AssetMaster.StatusDesc from RCBAMS..EmployeeAssetBuyback inner join RCBSAP..AssetMaster on AssetMaster.AssetID=EmployeeAssetBuyback.AssetID where EmployeeAssetBuyback.BuybackRequestID=@RequestID">
    <SelectParameters>
    <asp:SessionParameter Name="RequestID" SessionField="RequestID" />
    </SelectParameters>
 </asp:SqlDataSource>

 </div>



</div>
 
      <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
        SelectCommand="SELECT BuybackRequestID,EmployeeAssetBuyback.AssetID,AssetDesc as AssetTypeName,AssetMaster.MainAssetNumber,
AssetMaster.AssetSubNumber,AssetMaster.AssetClass,EmployeeAssetBuyback.EmployeeID,RequestBy as Requestedby,EmployeeAssetBuyback.CustodianDepartment,CustDesignation,EmployeeAssetBuyback.Status,Date,Comments,AdminID,AdminName FROM EmployeeAssetBuyback inner join RCBSAP..AssetMaster on AssetMaster.AssetID=EmployeeAssetBuyback.AssetID
 where EmployeeAssetBuyback.Status='Request Sent To Admin' order by BuybackRequestID desc">
        </asp:SqlDataSource>

      <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
        SelectCommand=" SELECT BuybackRequestID,EmployeeAssetBuyback.AssetID,AssetDesc as AssetTypeName,AssetMaster.MainAssetNumber,
 AssetMaster.AssetSubNumber,AssetMaster.AssetClass,EmployeeAssetBuyback.EmployeeID,RequestBy as Requestedby,EmployeeAssetBuyback.CustodianDepartment,CustDesignation,
 EmployeeAssetBuyback.Status,Date,Comments,AdminID,AdminName,AdminComments FROM EmployeeAssetBuyback 
 inner join RCBSAP..AssetMaster on AssetMaster.AssetID=EmployeeAssetBuyback.AssetID 
 where EmployeeAssetBuyback.Status='Approved' order by BuybackRequestID desc">
        </asp:SqlDataSource>
</asp:Content>

