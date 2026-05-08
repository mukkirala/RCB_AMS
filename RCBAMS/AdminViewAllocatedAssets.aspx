<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AdminViewAllocatedAssets.aspx.cs" Inherits="AdminViewAllocatedAssets" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxMenu" tagprefix="dx1" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="col-sm-12">
           <div >
        <h4><strong><span class="">Allocated Assets Parking Approved</span></strong></h4>
    </div> 

<div class="table-responsive" >

     <dx:ASPxGridView ID="AssetList" runat="server" AutoGenerateColumnsASPxGridView1="False" 
          style="width:100%" 
        DataSourceID="SqlDataSource1" KeyFieldName="AllocationID" 
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
        CssPostfix="PlasticBlue" >
        <Columns>
              <dx:GridViewDataTextColumn FieldName="AllocationID" ReadOnly="True" VisibleIndex="0" Visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>   
            <dx:GridViewDataTextColumn FieldName="AssetID"  ReadOnly="True" VisibleIndex="1" >
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn> 
            <dx:GridViewDataTextColumn FieldName="MainAssetNumber"  ReadOnly="True" VisibleIndex="2" Caption="Equipment Number">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>         
            <dx:GridViewDataTextColumn FieldName="AssetClass"  ReadOnly="True" VisibleIndex="3">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>         
             <dx:GridViewDataTextColumn FieldName="AssetDesc"  ReadOnly="True" VisibleIndex="4" Caption="Asset Name">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn> 
            <dx:GridViewDataTextColumn FieldName="AssetRequestID"  ReadOnly="True" VisibleIndex="5"  Visible="false">
                <Settings AutoFilterCondition="Contains" />
             </dx:GridViewDataTextColumn>
          
           <dx:GridViewDataTextColumn FieldName="RequestedBy" VisibleIndex="6">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="EmployeeID" VisibleIndex="7" Caption="Requestor ID">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>

             
            <dx:GridViewDataTextColumn FieldName="RequestedDate" VisibleIndex="8" 
               Width="100px" >
              <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy" />
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>  
              <dx:GridViewDataTextColumn FieldName="AllocatedDate" VisibleIndex="9" 
               Width="100px" >
                <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy" />
            </dx:GridViewDataTextColumn>    
              <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="10">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>

        </Columns>
        <SettingsPager ShowDefaultImages="False" PageSize="10">
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
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ConnectionStrings:RCBAMSConnectionString %>" 
        SelectCommand="select AllocationID,AssetAllocation.AssetID,AssetAllocation.MainAssetNumber,AssetMaster.AssetClass,AssetMaster.AssetDesc, AssetAllocation.AssetRequestID,AssetAllocation.Date as AllocatedDate,AssetAllocation.Status, 
  Requestby as RequestedBy,EmployeeAssetRequest.EmployeeID,EmployeeAssetRequest.Date as RequestedDate
  from RCBAMS..AssetAllocation 
  inner join RCBAMS..EmployeeAssetRequest on EmployeeAssetRequest.AssetRequestID=AssetAllocation.AssetRequestID
  inner join RCBSAP..AssetMaster on AssetMaster.AssetID=AssetAllocation.AssetID
   where AssetAllocation.Status='Approved' order by AllocationID desc">
  </asp:SqlDataSource> 
</div>
</div>
</asp:Content>

