<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ApproveAsset.aspx.cs" Inherits="ApproveAsset" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxMenu" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx1" %>

<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>

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
                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Font-Size="large" Text="Approver ID:"></dx:ASPxLabel>                 
                </div>
                <div class="col-sm-4">
                     <dx:ASPxLabel ID="reqid" runat="server" Text="" Font-Size="Medium" ForeColor="Black"></dx:ASPxLabel>
                </div>
                <div class="col-sm-2">
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Font-Size="large" Text="Approver Name:"></dx:ASPxLabel>                 
                </div>
                <div class="col-sm-4">
                     <dx:ASPxLabel ID="lbl_requestername" runat="server" Text="" Font-Size="Medium" ForeColor="Black"></dx:ASPxLabel>
                </div>
                </div>
                  <div class="row form_div">
                
                <div class="col-sm-2">
                    <dx:ASPxLabel ID="ASPxLabel8" runat="server" Font-Size="large" Text="Department:"></dx:ASPxLabel>                 
                </div>
                <div class="col-sm-4">
                    <dx:ASPxLabel ID="reqdept" runat="server" Text="" Font-Size="Medium" ForeColor="Black"></dx:ASPxLabel>
                </div>
                 <div class="col-sm-2">
                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Font-Size="large" Text="Designation:"></dx:ASPxLabel>                                
                </div>
                <div class="col-sm-4">
                     <dx:ASPxLabel ID="reqdesign" runat="server" Text=""  Font-Size="Medium" ForeColor="Black"></dx:ASPxLabel>
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
      <div >
        <strong><span class="">New Asset Requests List</span></strong>
      </div>
       <div class="table-responsive">
      <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumnsASPxGridView1="False" OnRowCommand="ASPxGridView2_RowCommand"
          style="width:100%"
        DataSourceID="SqlDataSource3" KeyFieldName="AssetTypeID" 
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
        CssPostfix="PlasticBlue" AutoGenerateColumns="False">
        <Columns>
             
              <dx:GridViewDataTextColumn FieldName="AssetRequestID" ReadOnly="True" VisibleIndex="0" Visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>   
            <dx:GridViewDataTextColumn FieldName="AssetTypeID" Caption="AssetTypeID" ReadOnly="True" VisibleIndex="1" Visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn> 
                 <dx:GridViewDataTextColumn FieldName="AssetTypename" Caption="Asset" ReadOnly="True" VisibleIndex="2">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="EmployeeID" ReadOnly="True" VisibleIndex="3" Caption="Requestor ID">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="RequestBy" ReadOnly="True" VisibleIndex="4"  Caption="Requestor Name">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
               <dx:GridViewDataTextColumn FieldName="LocationCode" ReadOnly="True" VisibleIndex="5"  Caption="Location">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Block" ReadOnly="True" VisibleIndex="6">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="CustodianDepartment" ReadOnly="True" VisibleIndex="7"  Caption="Department">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="CustDesignation" ReadOnly="True" VisibleIndex="8"  Caption="Designation">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
               <dx:GridViewDataTextColumn FieldName="AssetClassName" VisibleIndex="2" Caption="Asset Class">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
               
              <dx:GridViewDataTextColumn FieldName="Quantity" ReadOnly="True" VisibleIndex="9" Caption="Requested Quantity">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>  
            <dx:GridViewDataTextColumn FieldName="Date" VisibleIndex="8" 
               Width="100px" >
                <%--<PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>--%>
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>        
            
            <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="9" Caption=" Status">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             
            <dx:GridViewDataTextColumn FieldName="" VisibleIndex="10">
                     <DataItemTemplate>
                         <asp:LinkButton ID="btn_view" Text="View" runat="server"  ForeColor="Green" Font-Bold="true" CommandName="View">View And Approve</asp:LinkButton>
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
                                <dx:ASPxSummaryItem FieldName="AssetTypename"  SummaryType="Count"/>
                                </TotalSummary>
                   <%-- <SettingsDetail ShowDetailRow="True" />--%>
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
                   
    </dx:ASPxGridView>

       <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
        SelectCommand="SELECT  AssetRequestID,EmployeeAssetRequest.AssetTypeID,AssetTypename,RequestBy,CustodianDepartment,CustDesignation,Concat(EmployeeAssetRequest.EmployeeID+'__',EmployeeAssetRequest.RequestSequene) as EmployeeID,Quantity,EmployeeAssetRequest.Status,Date,LocationMaster.LocationCode,LocationMaster.Block,AssetTypeMaster.AssetClassName
           from RCBAMS..EmployeeAssetRequest inner join RCBAMS..LocationMaster on LocationMaster.LocationID=EmployeeAssetRequest.LocationID
           inner join RCBSAP..AssetTypeMaster on AssetTypeMaster.AssetTypeID=EmployeeAssetRequest.AssetTypeID

           where [EmployeeAssetRequest].Status='Request Sent To Approver' and ApproverID=@ApproverID order by AssetRequestID desc">
       <SelectParameters>
           <asp:SessionParameter Name="ApproverID" SessionField="UserID" />
       </SelectParameters>
        </asp:SqlDataSource>
       
       </div>
       <br />
          <div >
        <strong><span class="">Approved Asset List Forwarded To Admin</span></strong>
    </div>
       <div class="table-responsive">
      <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumnsASPxGridView1="False" 
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
              <dx:GridViewDataTextColumn FieldName="AssetRequestID" ReadOnly="True" VisibleIndex="0" Visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>   
            <dx:GridViewDataTextColumn FieldName="AssetTypeID" Caption="AssetTypeID" ReadOnly="True" VisibleIndex="1" Visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn> 
                 <dx:GridViewDataTextColumn FieldName="AssetTypename" Caption="Asset" ReadOnly="True" VisibleIndex="2">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn> 
             <dx:GridViewDataTextColumn FieldName="AssetClassName" VisibleIndex="2" Caption="Asset Class">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="EmployeeID" ReadOnly="True" VisibleIndex="3" Caption="Requestor ID">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="RequestBy" ReadOnly="True" VisibleIndex="4"  Caption="Requestor Name">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="LocationCode" ReadOnly="True" VisibleIndex="4"  Caption="Location">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Block" ReadOnly="True" VisibleIndex="4"  Caption="Location">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="CustodianDepartment" ReadOnly="True" VisibleIndex="5"  Caption="Custodian Department" Visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="CustDesignation" ReadOnly="True" VisibleIndex="6"  Caption="Designation" Visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="RequestedQuantity" ReadOnly="True" VisibleIndex="7">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn> 
            <dx:GridViewDataTextColumn FieldName="ApproverID" ReadOnly="True" VisibleIndex="7">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ApproverName" ReadOnly="True" VisibleIndex="7">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn> 
            <dx:GridViewDataTextColumn FieldName="ApprovedQuantity" ReadOnly="True" VisibleIndex="7" Visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn> 
            <dx:GridViewDataTextColumn FieldName="ApproverRemarks" ReadOnly="True" VisibleIndex="7" Caption="Approver Remarks">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn> 
            <dx:GridViewDataTextColumn FieldName="Date" VisibleIndex="8" 
               Width="100px" >
                <%--<PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>--%>
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>        
            
            <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="9" Caption=" Status">
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
                                <dx:ASPxSummaryItem FieldName="AssetTypename"  SummaryType="Count"/>
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
             <SettingsPager PageSize="25"></SettingsPager>
                    <StylesEditors>
                        <CalendarHeader Spacing="11px">
                        </CalendarHeader>
                        <ProgressBar Height="25px">
                        </ProgressBar>
                    </StylesEditors>
                   
    </dx:ASPxGridView>

       <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
        SelectCommand="SELECT  AssetRequestID,EmployeeAssetRequest.AssetTypeID,AssetTypename,RequestBy,CustodianDepartment,CustDesignation,Concat(EmployeeAssetRequest.EmployeeID+'__',EmployeeAssetRequest.RequestSequene) as EmployeeID,Quantity as RequestedQuantity,ApproverID,ApproverName,ApprovedQuantity,ApproverComments As ApproverRemarks, EmployeeAssetRequest.Status,Date,LocationMaster.LocationCode,LocationMaster.Block,AssetTypeMaster.AssetClassName from RCBAMS..EmployeeAssetRequest inner join RCBAMS..LocationMaster on LocationMaster.LocationID=EmployeeAssetRequest.LocationID  inner join RCBSAP..AssetTypeMaster on AssetTypeMaster.AssetTypeID=EmployeeAssetRequest.AssetTypeID where [EmployeeAssetRequest].Status='Request Sent To Admin' and ApproverID=@ApproverID order by AssetRequestID desc">
        <SelectParameters>
           <asp:SessionParameter Name="ApproverID" SessionField="UserID" />
       </SelectParameters>
        </asp:SqlDataSource>
        
 
       </div>
       </div>
         </div>
</asp:Content>

