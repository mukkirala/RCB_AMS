<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ViewApprovedAssetReturn.aspx.cs" Inherits="ViewApprovedAssetReturn" %>

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
        <strong><span class="">Approved Asset Return Requests</span></strong>
    </div>  
    

    <div class="table-responsive" >

     <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumnsASPxGridView1="False" 
          
        DataSourceID="SqlDataSource1" KeyFieldName="AssetReturnID" 
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
        CssPostfix="PlasticBlue" AutoGenerateColumns="False"  style="width:100%">
        <Columns>
              <dx:GridViewDataTextColumn FieldName="AssetReturnID" ReadOnly="True" VisibleIndex="0" Visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>   
            <dx:GridViewDataTextColumn FieldName="AssetID"  ReadOnly="True" VisibleIndex="1" visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>         
            <dx:GridViewDataTextColumn FieldName="AssetTypeName"  VisibleIndex="2" caption="Asset Name">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>             
            <dx:GridViewDataTextColumn FieldName="EmployeeID" ReadOnly="True" VisibleIndex="3" Caption="Requestor ID">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Requestedby" ReadOnly="True" VisibleIndex="4"  Caption="Requestor Name">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="CustDepartmentCode" ReadOnly="True" VisibleIndex="5"  Caption="DepartmentCode" Visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="CustodianDepartment" ReadOnly="True" VisibleIndex="5"  Caption="Department" Visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="CustDesignation" ReadOnly="True" VisibleIndex="5"  Caption="Designation" Visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CustodianComments" VisibleIndex="5" Visible="false">
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
             <dx:GridViewDataTextColumn FieldName="ApproverDeptCode" VisibleIndex="4" Caption="DepartmentCode" Visible="false">
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
            <dx:GridViewDataTextColumn FieldName="Date" VisibleIndex="9" 
               Width="100px" >
              <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy" />
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>        
            
            <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="10">
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
                            <dx:ASPxGridView ID="DetailGrid1" runat="server"  Caption=""
                                AutoGenerateColumns="False" KeyFieldName="AssetID" OnBeforePerformDataSelect="DetailGrid1_BeforePerformDataSelect"
                                CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" DataSourceID="DetailDS1">                                 
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

 </div>

      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
        SelectCommand="SELECT AssetReturnID,EmployeeAssetReturn.AssetID,AssetDesc as AssetTypeName,
             EmployeeAssetReturn.EmployeeID,RequestBy as Requestedby,EmployeeAssetReturn.CustodianDepartment,CustDepartmentCode,CustDesignation,
            ApproverID,ApproverName,ApproverDesignation,ApproverDeptCode,ApproverDepartment,AdminID,AdminName,EmployeeAssetReturn.Status,Date,CustodianComments,AdminComments,
            ApproverComments FROM EmployeeAssetReturn 
            inner join RCBSAP..AssetMaster on AssetMaster.AssetID=EmployeeAssetReturn.AssetID 
            where EmployeeAssetReturn.Status='Approved' order by AssetReturnID desc">       
        </asp:SqlDataSource>
    <asp:SqlDataSource ID="DetailDS1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:RCBSAPConnectionString %>" 
    SelectCommand="select AssetMaster.AssetID,AssetMaster.SerialNumber,AssetMaster.MainAssetNumber,AssetMaster.AssetSubNumber,AssetMaster.AssetClass,AssetMaster.AssetDesc,AssetMaster.StatusDesc from RCBAMS..EmployeeAssetReturn inner join RCBSAP..AssetMaster on AssetMaster.AssetID=EmployeeAssetReturn.AssetID where EmployeeAssetReturn.AssetReturnID=@RequestID">
    <SelectParameters>
    <asp:SessionParameter Name="RequestID" SessionField="RequestID" />
    </SelectParameters>
 </asp:SqlDataSource>

<br />

    <div >
        <strong><span class="">Rejected Asset Return Requests</span></strong>
    </div>  
    

    <div class="table-responsive" >

     <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumnsASPxGridView1="False" 
          
        DataSourceID="SqlDataSource2" KeyFieldName="AssetReturnID" 
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
        CssPostfix="PlasticBlue" AutoGenerateColumns="False"  style="width:100%">
        <Columns>
              <dx:GridViewDataTextColumn FieldName="AssetReturnID" ReadOnly="True" VisibleIndex="0" Visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>   
            <dx:GridViewDataTextColumn FieldName="AssetID"  ReadOnly="True" VisibleIndex="1" visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>         
            <dx:GridViewDataTextColumn FieldName="AssetTypeName"  VisibleIndex="2" caption="Asset Name">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>             
            <dx:GridViewDataTextColumn FieldName="EmployeeID" ReadOnly="True" VisibleIndex="3" Caption="Requestor ID">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Requestedby" ReadOnly="True" VisibleIndex="4"  Caption="Requestor Name">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="CustDepartmentCode" ReadOnly="True" VisibleIndex="5"  Caption="DepartmentCode" Visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="CustodianDepartment" ReadOnly="True" VisibleIndex="5"  Caption="Department" Visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="CustDesignation" ReadOnly="True" VisibleIndex="5"  Caption="Designation" Visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CustodianComments" VisibleIndex="5" Visible="false">
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
             <dx:GridViewDataTextColumn FieldName="ApproverDeptCode" VisibleIndex="4" Caption="DepartmentCode" Visible="false">
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
            <dx:GridViewDataTextColumn FieldName="Date" VisibleIndex="9" 
               Width="100px" >
                <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy" />
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>        
            
            <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="10">
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

 </div>

      <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
        SelectCommand="SELECT AssetReturnID,EmployeeAssetReturn.AssetID,AssetDesc as AssetTypeName,
             EmployeeAssetReturn.EmployeeID,RequestBy as Requestedby,EmployeeAssetReturn.CustodianDepartment,CustDepartmentCode,CustDesignation,
            ApproverID,ApproverName,ApproverDesignation,ApproverDeptCode,ApproverDepartment,AdminID,AdminName,EmployeeAssetReturn.Status,Date,CustodianComments,AdminComments,
            ApproverComments FROM EmployeeAssetReturn 
            inner join RCBSAP..AssetMaster on AssetMaster.AssetID=EmployeeAssetReturn.AssetID 
            where EmployeeAssetReturn.Status='Rejected' order by AssetReturnID desc">       
        </asp:SqlDataSource>
    <asp:SqlDataSource ID="DetailDS2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:RCBSAPConnectionString %>" 
    SelectCommand="select AssetMaster.AssetID,AssetMaster.SerialNumber,AssetMaster.MainAssetNumber,AssetMaster.AssetSubNumber,AssetMaster.AssetClass,AssetMaster.AssetDesc,AssetMaster.StatusDesc from RCBAMS..EmployeeAssetReturn inner join RCBSAP..AssetMaster on AssetMaster.AssetID=EmployeeAssetReturn.AssetID where EmployeeAssetReturn.AssetReturnID=@RequestID">
    <SelectParameters>
    <asp:SessionParameter Name="RequestID" SessionField="ID" />
    </SelectParameters>
 </asp:SqlDataSource>
 </div>
</asp:Content>
