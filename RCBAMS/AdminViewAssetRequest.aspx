<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AdminViewAssetRequest.aspx.cs" Inherits="AdminViewAssetRequest" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxMenu" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx1" %>

<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
 <div class="col-sm-12">
           <div >
        <strong><span class="">Requested Assets </span></strong>
    </div>
       <div class="table-responsive">
      <dx:ASPxGridView ID="ASPxGridView2" runat="server" 
          style="width:100%"
        DataSourceID="SqlDataSource3" KeyFieldName="AssetRequestID" 
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
        CssPostfix="PlasticBlue" AutoGenerateColumns="False" OnRowCommand="ASPxGridView2_RowCommand">
        <Columns>
               <dx:gridviewdatatextcolumn FieldName="Edit" VisibleIndex="0" Visible="false">
                 <DataItemTemplate>
                   <asp:LinkButton ID="btnlink" runat="server" CommandName="Edit" Text="Edit"></asp:LinkButton>
                 </DataItemTemplate>
               </dx:gridviewdatatextcolumn>
              <dx:GridViewDataTextColumn FieldName="AssetRequestID" ReadOnly="True" VisibleIndex="1" visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>  
          
           <dx:GridViewDataTextColumn FieldName="AssetTypeName"  VisibleIndex="2" Caption="Asset Name">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn> 
               
           <dx:GridViewDataTextColumn FieldName="AssetClassName"  VisibleIndex="2">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn> 
        
            <dx:GridViewDataTextColumn FieldName="EmployeeID" ReadOnly="True" VisibleIndex="3" Caption="Requestor ID">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="RequestBy" ReadOnly="True" VisibleIndex="4"  Caption="Requestor Name">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Location" ReadOnly="True" VisibleIndex="5" Caption="Wing" >
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
               <dx:GridViewDataTextColumn FieldName="BLOCK" ReadOnly="True" VisibleIndex="6" Caption="Floor">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="LocationCode" ReadOnly="True" VisibleIndex="7" Caption="LAB">
  <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="RequestedQuantity"  VisibleIndex="8" >
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="CustodianDepartment" ReadOnly="True" VisibleIndex="9"  Caption="Custodian Department" Visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="CustDesignation" ReadOnly="True" VisibleIndex="10"  Caption="Designation" Visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
              
            <dx:GridViewDataTextColumn FieldName="ApproverID" VisibleIndex="11" Caption="Approver ID" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ApproverName" VisibleIndex="12" Caption="Approver Name" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ApproverDesignation" VisibleIndex="13" Caption="Designation" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             
            <dx:GridViewDataTextColumn FieldName="ApproverDepartment" VisibleIndex="14" Caption="Department" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="ApprovedQuantity" VisibleIndex="15" Visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ApproverComments" VisibleIndex="16" Caption="Approver Remarks" Visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Date" VisibleIndex="17"  Width="100px">
                <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy" />
                <%--<PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>--%>
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>        
            
            <dx:GridViewDataTextColumn FieldName="RequestStatus" VisibleIndex="18" Caption="Request Status" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="AssetTypeID" VisibleIndex="18" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="" VisibleIndex="19">
                     <DataItemTemplate>
                         <asp:LinkButton ID="btn_view" Text="View" runat="server" CommandName="View" ForeColor="Green" Font-Bold="true">View</asp:LinkButton>
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
          <SettingsPager PageSize="25"></SettingsPager>
                    <Settings ShowFilterRow="True" ShowGroupPanel="True" ShowFooter="true" />
                     <TotalSummary >
                                <dx:ASPxSummaryItem FieldName="AssetTypeName"  SummaryType="Count"/>
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

       <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:InstemAMSConnectionString %>" 
        SelectCommand="SELECT  AssetRequestID,EmployeeAssetRequest.AssetTypeID,AssetTypeName,EmployeeAssetRequest.MainAssetNumber,Concat(EmployeeAssetRequest.EmployeeID+'__',EmployeeAssetRequest.RequestSequene) as EmployeeID,RequestBy,CustodianDepartment,CustDesignation,Quantity as RequestedQuantity,AssetClassName,
           ApproverID,ApproverName,ApproverDesignation,ApproverDepartment,ApprovedQuantity,ApproverComments,EmployeeAssetRequest.Status as RequestStatus,Date,LocationMaster.Location,EmployeeAssetRequest.Location as Location,LocationMaster.BLOCK,LocationMaster.LocationCode 
           from InstemAMS..EmployeeAssetRequest inner join InstemSAP..AssetTypeMaster on AssetTypeMaster.AssetTypeID=EmployeeAssetRequest.AssetTypeID
           inner join InstemAMS.. LocationMaster on LocationMaster.LocationID=EmployeeAssetRequest.LocationID
           where [EmployeeAssetRequest].Status='Request Sent To Admin' order by AssetRequestID desc">
       
        </asp:SqlDataSource>
  
    
           </div>


    <br />


     <div >
        <strong><span class="">Approved Assets </span></strong>
    </div>
       <div class="table-responsive">
      <dx:ASPxGridView ID="ASPxGridView1" runat="server" 
          style="width:100%"
        DataSourceID="SqlDataSource1" KeyFieldName="AssetRequestID" 
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
        CssPostfix="PlasticBlue" AutoGenerateColumns="False">
        <Columns>
               <dx:gridviewdatatextcolumn FieldName="Edit" VisibleIndex="0" Visible="false">
                 <DataItemTemplate>
                   <asp:LinkButton ID="btnlink" runat="server" CommandName="Edit" Text="Edit"></asp:LinkButton>
                 </DataItemTemplate>
               </dx:gridviewdatatextcolumn>
              <dx:GridViewDataTextColumn FieldName="AssetRequestID" ReadOnly="True" VisibleIndex="1" visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>  
          
           <dx:GridViewDataTextColumn FieldName="AssetTypeName"  VisibleIndex="2" Caption="Asset Name">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn> 
             <dx:GridViewDataTextColumn FieldName="AssetClassName"  VisibleIndex="2">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn> 
        
             <dx:GridViewDataTextColumn FieldName="EmployeeID" ReadOnly="True" VisibleIndex="3" Caption="Requestor ID">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="RequestBy" ReadOnly="True" VisibleIndex="4"  Caption="Requestor Name">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="Location" ReadOnly="True" VisibleIndex="4"  Caption="Requestor Wing">
  <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="BLOCK" ReadOnly="True" VisibleIndex="5"  Caption="Requestor Floor">
  <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="LocationCode" ReadOnly="True" VisibleIndex="6"  Caption="Requestor LAB">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="CustodianDepartment" ReadOnly="True" VisibleIndex="7"  Caption="Custodian Department" Visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="CustDesignation" ReadOnly="True" VisibleIndex="8"  Caption="Designation" Visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ApproverID" VisibleIndex="4" Caption="Approver ID" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ApproverName" VisibleIndex="4" Caption="Approver Name" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ApproverDesignation" VisibleIndex="4" Caption="Designation" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            
            <dx:GridViewDataTextColumn FieldName="ApproverDepartment" VisibleIndex="4" Caption="Department" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AdminID" VisibleIndex="7" Caption="Admin ID">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AdminName" VisibleIndex="8" Caption="Admin Name">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="RequestedQuantity"  VisibleIndex="9">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="ApprovedQuantity" VisibleIndex="10">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="ApproverComments" VisibleIndex="11" Caption="Approver Remarks" Visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
               <dx:GridViewDataTextColumn FieldName="AdminComments" VisibleIndex="12" Caption="Admin Remarks">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn FieldName="Date" VisibleIndex="13" 
               Width="100px" >
                <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy" />
                <%--<PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>--%>
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>        
            
            <dx:GridViewDataTextColumn FieldName="RequestStatus" VisibleIndex="8" Caption="Request Status" Visible="false">
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
                            <dx:ASPxGridView ID="DetailGrid1" runat="server" DataSourceID="DetailDS"  Caption=""
                                AutoGenerateColumns="False" KeyFieldName="AssetID" OnBeforePerformDataSelect="DetailGrid_BeforePerformDataSelect"
                                CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue">                                 
                                <Columns>
                                      <dx:GridViewDataTextColumn FieldName="AssetID" ReadOnly="True" VisibleIndex="1">
                                     <Settings AutoFilterCondition="Contains" />
                                  </dx:GridViewDataTextColumn> 
                                  <dx:GridViewDataTextColumn FieldName="SerialNumber" VisibleIndex="2" >
                                   <Settings AutoFilterCondition="Contains" />
                                   </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="MainAssetNumber" VisibleIndex="3" Caption="Equipment Number">
                                    <Settings AutoFilterCondition="Contains" />
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn FieldName="AssetSubNumber" VisibleIndex="4" Width="200px" Caption="Asset Sub Number">
                                      <Settings AutoFilterCondition="Contains" />
                                     </dx:GridViewDataTextColumn>
                                      <dx:GridViewDataTextColumn FieldName="AssetClass" VisibleIndex="5" Caption="Asset Class">
                                      <Settings AutoFilterCondition="Contains" />
                                      </dx:GridViewDataTextColumn>
       
                                    <dx:GridViewDataTextColumn FieldName="AssetDesc" VisibleIndex="6" Caption="Asset Name">
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
                                <Settings  ShowFooter="true" />
                                <TotalSummary >
                                <dx:ASPxSummaryItem FieldName="DocumentName"  SummaryType="Count"/>
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

       <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:InstemAMSConnectionString %>" 
        SelectCommand="SELECT  AssetRequestID,AssetTypeName,EmployeeAssetRequest.MainAssetNumber,Concat(EmployeeAssetRequest.EmployeeID+'__',EmployeeAssetRequest.RequestSequene) as EmployeeID,RequestBy,CustodianDepartment,CustDesignation,Quantity as RequestedQuantity,AssetClassName,
           ApprovedQuantity,ApproverID,ApproverName,ApproverDesignation,ApproverDepartment,ApproverComments,AdminID,AdminName,AdminComments,EmployeeAssetRequest.Status as RequestStatus,Date,LocationMaster.Location,LocationMaster.LocationCode,LocationMaster.BLOCK
           from InstemAMS..EmployeeAssetRequest inner join InstemSAP..AssetTypeMaster on AssetTypeMaster.AssetTypeID=EmployeeAssetRequest.AssetTypeID
            inner join InstemAMS.. LocationMaster on LocationMaster.LocationID=EmployeeAssetRequest.LocationID
           where [EmployeeAssetRequest].Status='Approved' order by AssetRequestID desc">
       
        </asp:SqlDataSource>
  
     <asp:SqlDataSource ID="DetailGrid1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:InstemAMSConnectionString %>" 
    SelectCommand="select AllocationID,AssetAllocation.AssetID,AssetMaster.MainAssetNumber,AssetMaster.SerialNumber,AssetMaster.AssetSubNumber,AssetMaster.AssetClass,AssetMaster.AssetDesc, AssetAllocation.AssetRequestID from AssetAllocation inner join InstemSAP..AssetMaster on AssetMaster.AssetID=AssetAllocation.AssetID  where AssetRequestID=@AssetRequestID">
    <SelectParameters>
    <asp:SessionParameter Name="AssetRequestID" SessionField="AssetRequestID" />
    </SelectParameters>
    </asp:SqlDataSource>

     <asp:SqlDataSource ID="DetailDS" runat="server" 
                ConnectionString="<%$ ConnectionStrings:InstemAMSConnectionString %>" 
    SelectCommand="select AllocationID,AssetAllocation.AssetID,AssetMaster.MainAssetNumber,AssetMaster.SerialNumber,AssetMaster.AssetSubNumber,AssetMaster.AssetClass,AssetMaster.AssetDesc,AssetMaster.StatusDesc, AssetAllocation.AssetRequestID from AssetAllocation inner join InstemSAP..AssetMaster on AssetMaster.AssetID=AssetAllocation.AssetID  where AssetRequestID=@AssetRequestID">
    <SelectParameters>
    <asp:SessionParameter Name="AssetRequestID" SessionField="AssetRequestID" />
    </SelectParameters>
    </asp:SqlDataSource>
           </div>
     </div>
   
</asp:Content>

