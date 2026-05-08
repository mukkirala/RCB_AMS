<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ViewLocationChangeRequests.aspx.cs" Inherits="ViewLocationChangeRequests" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxMenu" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx1" %>

<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxEditors" Assembly="DevExpress.Web.ASPxEditors.v11.1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style>
        .container {
            width: 90% !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
     <div class="container cnt_div" cssclass="container">
    <div class="col-sm-12">
   <br />
       <div class="col-sm-10">
                <div class="row form_div">
                <div class="col-sm-2">
                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Approver ID:"  Font-Size="Large"></dx:ASPxLabel>                 
                </div>
                <div class="col-sm-4">
                     <dx:ASPxLabel ID="reqid" runat="server" Text="" ForeColor="Black" Font-Size="Medium"></dx:ASPxLabel>
                </div>
                <div class="col-sm-2">
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Approver Name:"  Font-Size="Large"></dx:ASPxLabel>                 
                </div>
                <div class="col-sm-4">
                     <dx:ASPxLabel ID="lbl_requestername" runat="server" Text="" ForeColor="Black" Font-Size="Medium"></dx:ASPxLabel>
                </div>
                </div>
                  <div class="row form_div">
                
                <div class="col-sm-2">
                    <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Department:"  Font-Size="Large"></dx:ASPxLabel>                 
                </div>
                <div class="col-sm-4">
                    <dx:ASPxLabel ID="reqdept" runat="server" Text="" ForeColor="Black" Font-Size="Medium"></dx:ASPxLabel>
                </div>
                <div class="col-sm-2">
                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Designation:"  Font-Size="Large"></dx:ASPxLabel>                                
                </div>
                <div class="col-sm-4">
                     <dx:ASPxLabel ID="reqdesign" runat="server" Text="" ForeColor="Black" Font-Size="Medium"></dx:ASPxLabel>
                </div>
                </div>
                <div class="row form_div">
                
                <div class="col-sm-2">
                     
                </div>
                <div class="col-sm-4">
                     
                </div>
                </div>
            </div>
            <br />
             <div class="clearfix"></div>
            <hr />
            <br />
    <div>
        <strong><span class="">New Location Transfer Requests List</span></strong>
    </div>    
    <div class="table-responsive">
     <dx:ASPxGridView ID="AssetList" runat="server" AutoGenerateColumnsASPxGridView1="False" 
          style="width:100%" 
        DataSourceID="AssetListSqlDataSource3" KeyFieldName="LocationChangeID" 
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
        CssPostfix="PlasticBlue" AutoGenerateColumns="False" OnRowCommand="AssetList_RowCommand">
        <Columns>
              <dx:GridViewDataTextColumn FieldName="LocationChangeID" ReadOnly="True" VisibleIndex="0" Visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>   
            <dx:GridViewDataTextColumn FieldName="AssetID"  ReadOnly="True" VisibleIndex="1" visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>         
            <dx:GridViewDataTextColumn FieldName="AssetTypeName"  ReadOnly="True" VisibleIndex="2" caption="Asset Name">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn> 
            <dx:GridViewDataTextColumn FieldName="EmployeeID" VisibleIndex="3" Caption="Requestor ID">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Requestedby" VisibleIndex="4" Caption="Requestor Name">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            
            <dx:GridViewDataTextColumn FieldName="CustodianDepartment" VisibleIndex="5" Caption="Department">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CustDesignation" VisibleIndex="6" Caption="Designation">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="CLocation" VisibleIndex="7" Caption="Current Location">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="CBlock" VisibleIndex="8" Caption="Current Block">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="LocationCode" VisibleIndex="9" Caption="Requested Location">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Block" VisibleIndex="10" Caption="Requested Block">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CustodianComments" VisibleIndex="11" Caption="Requestor Comments">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Date" VisibleIndex="12" 
               Width="100px" >
                
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>        
            
            <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="13">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="ToLocation" VisibleIndex="14" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
         
            <dx:GridViewDataTextColumn FieldName="" VisibleIndex="15">
                     <DataItemTemplate>
                         <asp:LinkButton ID="btn_view" Text="View" runat="server" CommandName="View" Font-Bold="true"  ForeColor="Green">View And Approve</asp:LinkButton>
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
         <SettingsPager PageSize="25"></SettingsPager>
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
                                    <dx:GridViewDataTextColumn FieldName="MainAssetNumber" VisibleIndex="3" Caption="Asset Number">
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
</div>
 <asp:SqlDataSource ID="AssetListSqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
        SelectCommand="SELECT LocationChangeID,EmployeeLocationChange.AssetID,AssetDesc as AssetTypeName,LocationMaster.LocationCode,LocationMaster.Block,AssetMaster.Location as CLocation,AssetMaster.Block as CBlock,
     EmployeeLocationChange.ToLocation,Concat(EmployeeLocationChange.EmployeeID+'__',EmployeeLocationChange.LocationSequence) as EmployeeID ,RequestBy as Requestedby,EmployeeLocationChange.CustodianDepartment,
     CustDesignation,EmployeeLocationChange.Status,Date,CustodianComments FROM EmployeeLocationChange 
     inner join RCBSAP..AssetMaster on AssetMaster.AssetID=EmployeeLocationChange.AssetID 
     inner join RCBAMS..LocationMaster on LocationMaster.LocationID=EmployeeLocationChange.LocationID 
     where EmployeeLocationChange.Status='Request Sent To Approver' and ApproverID=@ApproverID order by LocationChangeID desc">
       <SelectParameters>
           <asp:SessionParameter Name="ApproverID" SessionField="UserID" />
       </SelectParameters>
        </asp:SqlDataSource>

<asp:SqlDataSource ID="DetailDS" runat="server" 
                ConnectionString="<%$ ConnectionStrings:RCBSAPConnectionString %>" 
    SelectCommand="select AssetMaster.AssetID,AssetMaster.SerialNumber,AssetMaster.MainAssetNumber,AssetMaster.AssetSubNumber,AssetMaster.AssetClass,AssetMaster.AssetDesc,AssetMaster.StatusDesc from RCBAMS..EmployeeLocationChange inner join RCBSAP..AssetMaster on AssetMaster.AssetID=EmployeeLocationChange.AssetID where EmployeeLocationChange.LocationChangeID=@ID">
    <SelectParameters>
    <asp:SessionParameter Name="ID" SessionField="ID" />
    </SelectParameters>
 </asp:SqlDataSource>
      <br />
  <strong><asp:Label ID="Label2" runat="server" Text="Approved Location Transfer List Forwarded To Admin"></asp:Label></strong> <br />
     <div class="table-responsive">

     <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumnsASPxGridView1="False" 
          style="width:100%" 
        DataSourceID="AssetListSqlDataSource4" KeyFieldName="LocationChangeID" 
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
        CssPostfix="PlasticBlue" AutoGenerateColumns="False">
        <Columns>
              <dx:GridViewDataTextColumn FieldName="LocationChangeID" ReadOnly="True" VisibleIndex="0" Visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>   
            <dx:GridViewDataTextColumn FieldName="AssetID"  ReadOnly="True" VisibleIndex="1" visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>         
            <dx:GridViewDataTextColumn FieldName="AssetTypeName"  ReadOnly="True" VisibleIndex="2" caption="Asset Name">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn> 
            <dx:GridViewDataTextColumn FieldName="EmployeeID" VisibleIndex="3" Caption="Requestor ID">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Requestedby" VisibleIndex="4" Caption="Requestor Name">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            
            <dx:GridViewDataTextColumn FieldName="CustodianDepartment" VisibleIndex="5" Caption="Department" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CustDesignation" VisibleIndex="6" Caption="Designation" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
<%--            <dx:GridViewDataTextColumn FieldName="Location" VisibleIndex="7" Caption="Requested Location">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>--%>
            <dx:GridViewDataTextColumn FieldName="CustodianComments" VisibleIndex="8" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ApproverID" VisibleIndex="9" Caption="Approver ID">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ApproverName" VisibleIndex="10" Caption="Approver Name">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="ApproverComments" VisibleIndex="11" Caption="Approver Remarks">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="CLocation" VisibleIndex="12" Caption="Current Location">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="CBlock" VisibleIndex="13" Caption="Current Block">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="LocationCode" VisibleIndex="14" Caption="Requested Location">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Block" VisibleIndex="15" Caption="Requested Block">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Date" VisibleIndex="16" 
               Width="100px" >
               
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>        
            
            <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="17">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="ToLocation" VisibleIndex="18" Visible="false">
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
         <SettingsPager PageSize="25" />
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
         <SettingsPager PageSize="25"></SettingsPager>
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
                                    <dx:GridViewDataTextColumn FieldName="MainAssetNumber" VisibleIndex="3" Caption="Asset Number">
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
</div>
        </div>
    <asp:SqlDataSource ID="AssetListSqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
        SelectCommand="SELECT LocationChangeID,EmployeeLocationChange.AssetID,AssetDesc as AssetTypeName,LocationMaster.LocationCode,LocationMaster.Block,AssetMaster.Location as CLocation,AssetMaster.Block as CBlock,EmployeeLocationChange.ToLocation,Concat(EmployeeLocationChange.EmployeeID+'__',EmployeeLocationChange.LocationSequence) as EmployeeID,RequestBy as Requestedby,EmployeeLocationChange.CustodianDepartment,CustDesignation,EmployeeLocationChange.Status,Date,CustodianComments,ApproverID,ApproverName,ApproverDesignation,ApproverDepartment,ApproverComments FROM EmployeeLocationChange inner join RCBSAP..AssetMaster on AssetMaster.AssetID=EmployeeLocationChange.AssetID inner join RCBAMS..LocationMaster on LocationMaster.LocationID=EmployeeLocationChange.LocationID 
        where EmployeeLocationChange.Status='Request Sent To Admin' and ApproverID=@ApproverID order by LocationChangeID desc">
       <SelectParameters>
           <asp:SessionParameter Name="ApproverID" SessionField="UserID" />
       </SelectParameters>
        </asp:SqlDataSource>

     <asp:SqlDataSource ID="DetailDS2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:RCBSAPConnectionString %>" 
    SelectCommand="select AssetMaster.AssetID,AssetMaster.SerialNumber,AssetMaster.MainAssetNumber,AssetMaster.AssetSubNumber,AssetMaster.AssetClass,AssetMaster.AssetDesc,AssetMaster.StatusDesc from RCBAMS..EmployeeLocationChange inner join RCBSAP..AssetMaster on AssetMaster.AssetID=EmployeeLocationChange.AssetID where EmployeeLocationChange.LocationChangeID=@RequestID">
    <SelectParameters>
    <asp:SessionParameter Name="RequestID" SessionField="RequestID" />
    </SelectParameters>
 </asp:SqlDataSource>
         </div>
</asp:Content>

