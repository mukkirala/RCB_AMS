<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AdminViewCustodianChangeRequests.aspx.cs" Inherits="AdminViewCustodianChangeRequests" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
  <strong> <asp:Label ID="Label1" runat="server" Text="View Custodian Change Requests"></asp:Label></strong> <br />
   <div class="table-responsive">
            <dx:ASPxGridView ID="AssetList" runat="server" AutoGenerateColumnsASPxGridView1="False" 
          style="width:100%" 
        DataSourceID="SqlDataSource3" KeyFieldName="CustodianChangeID" 
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
        CssPostfix="PlasticBlue" AutoGenerateColumns="False" OnRowCommand="AssetList_RowCommand">
        <Columns>
              <dx:GridViewDataTextColumn FieldName="CustodianChangeID" ReadOnly="True" VisibleIndex="0" Visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>   
            <dx:GridViewDataTextColumn FieldName="AssetID"  ReadOnly="True" VisibleIndex="1" visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>         
            <dx:GridViewDataTextColumn FieldName="AssetTypeName"  ReadOnly="True" VisibleIndex="2" caption="AssetName">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn> 
            <dx:GridViewDataTextColumn FieldName="EmployeeID" VisibleIndex="3" Caption="Requestor ID">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Requestedby" VisibleIndex="3" Caption="Requestor Name">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            
            <dx:GridViewDataTextColumn FieldName="CustodianDepartment" VisibleIndex="3" Caption="CustodianDepartment" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CustDesignation" VisibleIndex="3" Caption="Designation" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="RequestedChangeCustodian" VisibleIndex="3" Caption="Transfer To" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TransferTo" VisibleIndex="3" Caption="Employee Name"  Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="TransferToEmployee" VisibleIndex="3" Caption="TransferTo">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="TDept" VisibleIndex="3" Caption="Employee Department" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CustodianComments" VisibleIndex="4" Visible="false">
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
            <dx:GridViewDataTextColumn FieldName="CustodianComments" VisibleIndex="4" Visible="True" Caption="Employee Remarks">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="ApproverComments" VisibleIndex="4" Caption="Approver Remarks" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Date" VisibleIndex="5" 
               Width="100px" >
        <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy" />
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>        
            
            <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="6">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="ApproverComments" VisibleIndex="7" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="ToCustodian" VisibleIndex="8" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
           <dx:GridViewDataTextColumn FieldName="" VisibleIndex="10">
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
                                    <dx:GridViewDataTextColumn FieldName="MainAssetNumber" VisibleIndex="3" Caption=" Asset Number">
                                    <Settings AutoFilterCondition="Contains" />
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn FieldName="AssetSubNumber" VisibleIndex="4" Width="200px" Caption="Asset Sub Number" Visible="false">
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
    SelectCommand="select AssetMaster.AssetID,AssetMaster.SerialNumber,AssetMaster.MainAssetNumber,AssetMaster.AssetSubNumber,AssetMaster.AssetClass,AssetMaster.AssetDesc,AssetMaster.StatusDesc from RCBAMS..CustodianChangeRequest inner join RCBSAP..AssetMaster on AssetMaster.AssetID=CustodianChangeRequest.AssetID where CustodianChangeRequest.CustodianChangeID=@ID">
    <SelectParameters>
    <asp:SessionParameter Name="ID" SessionField="ID" />
    </SelectParameters>
 </asp:SqlDataSource>
 
    
</div>
    <br />
  <strong><asp:Label ID="Label2" runat="server" Text="Approved Custodian Change Requests"></asp:Label></strong> <br />
   <div class="table-responsive">
            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumnsASPxGridView1="False" 
          style="width:100%" 
        DataSourceID="SqlDataSource4" KeyFieldName="CustodianChangeID" 
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
        CssPostfix="PlasticBlue" AutoGenerateColumns="False" >
        <Columns>
              <dx:GridViewDataTextColumn FieldName="CustodianChangeID" ReadOnly="True" VisibleIndex="0" Visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>   
            <dx:GridViewDataTextColumn FieldName="AssetID"  ReadOnly="True" VisibleIndex="1" visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>         
            <dx:GridViewDataTextColumn FieldName="AssetTypeName"  ReadOnly="True" VisibleIndex="2" caption="AssetName">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn> 
            <dx:GridViewDataTextColumn FieldName="EmployeeID" VisibleIndex="3" Caption="Requestor ID">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Requestedby" VisibleIndex="3" Caption="Requestor Name">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>

           <dx:GridViewDataTextColumn FieldName="RequestedChangeCustodian" VisibleIndex="3" Caption="Transfer To" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TransferTo" VisibleIndex="3" Caption="Employee Name"  Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="TransferToEmployee" VisibleIndex="3" Caption="TransferTo">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn FieldName="CustodianDepartment" VisibleIndex="3" Caption="CustodianDepartment" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CustDesignation" VisibleIndex="3" Caption="Designation" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CustodianComments" VisibleIndex="4" Visible="false">
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
            <dx:GridViewDataTextColumn FieldName="ApproverComments" VisibleIndex="4" Caption="Approver Remarks" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AdminID" VisibleIndex="4" Caption="Admin ID">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AdminName" VisibleIndex="4" Caption="Admin Name">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AdminComments" VisibleIndex="4" Caption="Admin Remarks">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
           
            <dx:GridViewDataTextColumn FieldName="Date" VisibleIndex="5" 
               Width="100px" >
               <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy" />
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>        
            
            <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="6">
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
                                     <dx:GridViewDataTextColumn FieldName="AssetSubNumber" VisibleIndex="4" Width="200px" Caption="Asset Sub Number" Visible="false">
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

  
      <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
        SelectCommand="SELECT CustodianChangeID,CustodianChangeRequest.AssetID,AssetDesc as AssetTypeName,CustodianChangeRequest.ApproverComments,CustodianChangeRequest.ToCustodian,Concat(CustodianChangeRequest.EmployeeID+'__',CustodianChangeRequest.CustodianSequence) as EmployeeID,RequestBy as Requestedby,CustodianChangeRequest.CustodianDepartment,CustDesignation,CustodianChangeRequest.Status,Date,CustodianComments,ApproverID,ApproverName,ApproverDesignation,ApproverDeptCode,ApproverDepartment,ApproverComments,
          RequestedChangeCustodian,CustodianMaster.CustodianName as TransferTo,CONCAT(RequestedChangeCustodian , '-' , CustodianName) as TransferToEmployee,DepartmentName as TDept FROM CustodianChangeRequest inner join RCBAMS..CustodianMaster on  CustodianMaster.CustodianID=CustodianChangeRequest.RequestedChangeCustodian left join RCBAMS..DepartmentMaster on  DepartmentMaster.DepartmentCode=CustodianMaster.CustodianDepartmentCode inner join RCBSAP..AssetMaster on AssetMaster.AssetID=CustodianChangeRequest.AssetID Where CustodianChangeRequest.Status='Request Sent To Admin' order by CustodianChangeID desc">
        </asp:SqlDataSource>
  
   <%--   <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
        SelectCommand="SELECT CustodianChangeID,CustodianChangeRequest.AssetID,AssetDesc as AssetTypeName,CustodianChangeRequest.EmployeeID,RequestBy as Requestedby,CustodianChangeRequest.CustodianDepartment,CustDesignation,CustodianChangeRequest.Status,Date,CustodianComments,ApproverID,ApproverName,ApproverDesignation,ApproverDeptCode,ApproverDepartment,ApproverComments,AdminID,AdminName,AdminComments FROM CustodianChangeRequest inner join RCBSAP..AssetMaster on AssetMaster.AssetID=CustodianChangeRequest.AssetID Where CustodianChangeRequest.Status='Approved' order by CustodianChangeID desc">
        </asp:SqlDataSource>--%>
          <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
        SelectCommand=" SELECT CustodianChangeID,CustodianChangeRequest.AssetID,AssetDesc as AssetTypeName,Concat(CustodianChangeRequest.EmployeeID+'__',CustodianChangeRequest.CustodianSequence) as EmployeeID,RequestBy as Requestedby,CustodianChangeRequest.CustodianDepartment,
 CustDesignation,CustodianChangeRequest.Status,Date,CustodianComments,ApproverID,ApproverName,ApproverDesignation,ApproverDeptCode,ApproverDepartment,ApproverComments,
 AdminID,AdminName,AdminComments,RequestedChangeCustodian,CustodianMaster.CustodianName as TransferTo,
		  CONCAT(RequestedChangeCustodian , '-' , CustodianName) as TransferToEmployee FROM CustodianChangeRequest 
		   inner join RCBAMS..CustodianMaster on  CustodianMaster.CustodianID=CustodianChangeRequest.RequestedChangeCustodian
     inner join RCBSAP..AssetMaster on AssetMaster.AssetID=CustodianChangeRequest.AssetID
  Where CustodianChangeRequest.Status='Approved' order by CustodianChangeID desc">
        </asp:SqlDataSource>
       
          <asp:SqlDataSource ID="DetailDS2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:RCBSAPConnectionString %>" 
    SelectCommand="select AssetMaster.AssetID,AssetMaster.SerialNumber,AssetMaster.MainAssetNumber,AssetMaster.AssetSubNumber,AssetMaster.AssetClass,AssetMaster.AssetDesc,AssetMaster.StatusDesc from RCBAMS..CustodianChangeRequest inner join RCBSAP..AssetMaster on AssetMaster.AssetID=CustodianChangeRequest.AssetID where CustodianChangeRequest.CustodianChangeID=@RequestID">
    <SelectParameters>
    <asp:SessionParameter Name="RequestID" SessionField="RequestID" />
    </SelectParameters>
 </asp:SqlDataSource>
</div>
</asp:Content>

