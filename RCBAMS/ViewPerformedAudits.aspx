<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ViewPerformedAudits.aspx.cs" Inherits="ViewPerformedAudits" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<style type="text/css">
 
  
        .style9
        {
            width: 518px;
        }
        .style10
        {
            width: 988px;
           
            color: #000000;
        }
 </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
 <div class="col-sm-12" runat="server">
      <table style="margin-right:15px">
        <tr>
            <td class="style10">
               <%--<span><strong>Performed Audits</strong></span>--%>
               <span><strong>Admin Pending Approve Audit Details</strong></span>

            </td>
            <td align="right" class="style9">
                <asp:ImageButton ID="btnexporttoxls"  ImageUrl="~/Images/XLS.png" Height="35px" runat="server" OnClick="btnexporttoxls_Click" Width="40px" />

            </td>
            &nbsp;&nbsp;&nbsp;&nbsp
            <td>
                <asp:ImageButton ID="btn_pdf"  ImageUrl="~/Images/PDF.png" runat="server" Height="35px" Width="40px" OnClick="btn_pdf_Click" style="margin-left:5px"/>
               
            </td>
            <td>

            </td>
        </tr>
    </table>
      <div class="table-responsive" runat="server">
    <dx:ASPxGridView ID="ASPxGridView2"  runat="server" AutoGenerateColumns="False" 
                    DataSourceID="SqlDSGrid" KeyFieldName="AssetID"                   
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" >
       <Columns>
            <dx:GridViewDataTextColumn FieldName="AuditDetailsID" Visible="false" ReadOnly="True" VisibleIndex="0">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetID"   VisibleIndex="1">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            
            <dx:GridViewDataTextColumn FieldName="MainAssetNumber" VisibleIndex="2" Caption="Main Asset Number">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetSubNumber" VisibleIndex="3"  Caption="Sub Number">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            
            <dx:GridViewDataTextColumn FieldName="AssetDesc" VisibleIndex="4" Caption="Asset Description" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
          <dx:GridViewDataTextColumn FieldName="AssetClass" VisibleIndex="5">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>  
            <dx:GridViewDataTextColumn FieldName="LocationDesc" VisibleIndex="6" Caption="Asset Location">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>  
            <dx:GridViewDataTextColumn FieldName="CustodianID" VisibleIndex="7">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>  
        <dx:GridViewDataTextColumn FieldName="Location" VisibleIndex="8" Caption="AuditLocation">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="AuditName" VisibleIndex="9">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>  
           <dx:GridViewDataTextColumn FieldName="AuditBy" VisibleIndex="10">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>  
          <dx:GridViewDataDateColumn FieldName="AuditDate" VisibleIndex="11">
              <PropertiesDateEdit DisplayFormatString="dd-MM-yyyy"></PropertiesDateEdit>
          </dx:GridViewDataDateColumn> 
             <dx:GridViewDataTextColumn FieldName="AuditStatus" VisibleIndex="12">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
           <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="13">
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
    </div>
     
    <br />

 <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" 
                    Landscape="True" MaxColumnWidth="150" GridViewID="ASPxGridView2" 
                    LeftMargin="0" RightMargin="0" TopMargin="0">
  </dx:ASPxGridViewExporter>
  <asp:SqlDataSource ID="SqlDSGrid" runat="server" ConnectionString="<%$ ConnectionStrings:RCBSAPConnectionString %>"
      SelectCommand="select AuditDetails.AuditDetailsID, AssetMaster.AssetID,AssetMaster.MainAssetNumber,AssetMaster.AssetSubNumber,
AssetMaster.AssetDesc,AssetMaster.AssetClass,LocationMaster.Location ,AuditMaster.AuditDate, AuditDetails.AuditStatus,
AuditDetails.AuditBy,AuditMaster.AuditName,AssetMaster.CustodianID,AssetMaster.LocationDesc,AuditDetails.Status  from RCBAMS..AuditDetails 
inner join RCBAMS..AuditMaster on AuditMaster.AuditID=AuditDetails.AuditID
inner join RCBSAP..AssetMaster on AssetMaster.AssetID=AuditDetails.AssetID
inner join RCBAMS..LocationMaster on LocationMaster.LocationID=AuditMaster.LocationID">
     
  </asp:SqlDataSource>                                     
 
</div>
</asp:Content>