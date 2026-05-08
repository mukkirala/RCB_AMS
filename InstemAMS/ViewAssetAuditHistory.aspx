<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ViewAssetAuditHistory.aspx.cs" Inherits="ViewAssetAuditHistory" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx1" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<style type="text/css">
        .style2
        {
            width: 120px;
        }
        
        .style9
        {
            width: 518px;
        }
        .style10
        {
            width: 988px;
            font-size: medium;
            color: #000000;
        }
 </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="col-sm-12">
      <div class="row">   <div class="col-sm-12">
          <h4><strong>Audited Assets As Per Audits</strong></h4>
        <hr/>
        </div>
    </div>
    <table width="360px">
        <tr>
            <td class="style2" style="font-size:large">
                Select Audit</td>
            <td class="style3">                
                  <dx:ASPxGridLookup ID="Audit_Gridlookup" runat="server"  
                    AutoGenerateColumns="False" DataSourceID="SqlDataSource3" TextFormatString="{2}"  Height="25px"
                    KeyFieldName="AuditID" IncrementalFilteringMode="Contains"  GridViewProperties-Settings-UseFixedTableLayout="true" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                    <GridViewProperties>
                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>

                        <Settings UseFixedTableLayout="True"></Settings>
                    </GridViewProperties>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="AuditID" ReadOnly="True" VisibleIndex="0" Visible="false">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="AuditDate" VisibleIndex="1" Visible="false">
                         <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy"></PropertiesDateEdit>
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn FieldName="AuditName" VisibleIndex="2" Width="170px">
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
                </dx:ASPxGridLookup>
            </td>
           <td>
                 <dx:ASPxButton ID="btn_search" runat="server" BackColor="White" 
                    CssClass="auto-style8" 
                    OnClick="btn_search_Click" Width="16px" Height="16px">
                    <Image Url="~/Images/search1.png" Width="20px" Height="20px">
                    </Image>
                    <Border BorderColor="White" />                   
                </dx:ASPxButton>
            </td>
        </tr>
     
        </table>
     
  <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:InstemAMSConnectionString %>" 
        SelectCommand="SELECT [AuditID], [AuditDate], [AuditName] FROM [AuditMaster] ">
    </asp:SqlDataSource>
     <table style="margin-right:20px">
        <tr>
            <td class="style10">
            <span><strong>Audit Findings</strong></span>
            </td>
            <td align="right" class="style9">
                <asp:ImageButton ID="btnexporttoxls"  ImageUrl="~/Images/XLS.png" Height="35px" runat="server" OnClick="btnexporttoxls_Click" Width="40px" />

            </td>
            &nbsp;&nbsp;&nbsp;&nbsp
            <td>
                <asp:ImageButton ID="btn_pdf"  ImageUrl="~/Images/PDF.png" runat="server" Height="35px" Width="45px" OnClick="btn_pdf_Click" style="margin-left:5px"/>
              
            </td>
         
        </tr>
    </table>
  <div class="table-responsive">
   <dx:ASPxGridView ID="ASPxGridView1"  runat="server" AutoGenerateColumns="False" 
                   KeyFieldName="AuditDetailsID"   Width="1100px"                
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" DataSourceID="AuditHistoryDS">

         <Columns>
          
            <dx:GridViewDataTextColumn FieldName="AuditHistoryID" ReadOnly="True" Visible="false"
                VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetID" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            
             <dx:GridViewDataTextColumn FieldName="MainAssetNumber" VisibleIndex="3" Caption="Equipment Number">
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="AssetSubNumber" VisibleIndex="4" Visible="false">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="AssetClass" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="AssetDesc" VisibleIndex="6" Caption="Asset Name">
            </dx:GridViewDataTextColumn>
            
            <dx:GridViewDataTextColumn FieldName="AssetStatus" VisibleIndex="7" caption="Asset Status">
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="StatusChangedTo" VisibleIndex="8" Caption="Status ChangedTo">
            </dx:GridViewDataTextColumn>
            
             <dx:GridViewDataTextColumn FieldName="AssetLocation" VisibleIndex="9" caption=" Wing">
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="LocationChangedTo" VisibleIndex="10" caption="Wing ChangedTo">
            </dx:GridViewDataTextColumn>
            
             <dx:GridViewDataTextColumn FieldName="AssetCustodian" VisibleIndex="11" caption="Asset Custodian">
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="CustodianChangedTo" VisibleIndex="12" caption="Staff Number ChangedTo">
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="AuditName" VisibleIndex="13">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AuditBy" VisibleIndex="14">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AuditorRemarks" VisibleIndex="15" caption="Auditor Remarks">
            </dx:GridViewDataTextColumn>
           
            <dx:GridViewDataDateColumn FieldName="AuditedDate" VisibleIndex="16" PropertiesDateEdit-DisplayFormatString="dd-MMM-yyyy">
            </dx:GridViewDataDateColumn>
             <dx:GridViewDataTextColumn FieldName="ApprovedBy" VisibleIndex="17" >
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="ApproverRemarks" VisibleIndex="18" Visible="false">
            </dx:GridViewDataTextColumn>
               <dx:GridViewDataDateColumn FieldName="ApprovedDate" VisibleIndex="19" PropertiesDateEdit-DisplayFormatString="dd-MMM-yyyy">
            </dx:GridViewDataDateColumn>
           <dx:GridViewDataTextColumn FieldName="AuditID" VisibleIndex="20" visible="false">
            </dx:GridViewDataTextColumn>
               <dx:GridViewDataTextColumn FieldName="AuditDetailsID" VisibleIndex="21" visible="false">
            </dx:GridViewDataTextColumn>
            
        </Columns>
        <SettingsPager ShowDefaultImages="False" >
                <AllButton Text="All">
                </AllButton>
                <NextPageButton Text="Next &gt;">
                </NextPageButton>
                <PrevPageButton Text="&lt; Prev">
                </PrevPageButton>
            </SettingsPager>
        <Settings ShowFilterRow="True" ShowGroupPanel="True" />
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
 </div>
  
    <asp:SqlDataSource ID="AuditHistoryDS" runat="server" 
        ConnectionString="<%$ ConnectionStrings:InstemAMSConnectionString %>" 
        SelectCommand="SELECT AuditHistoryID,AssetAuditHistory.AuditID,AssetAuditHistory.AssetID,AssetLocation,AssetCustodian,AssetStatus,LocationChangedTo,
        CustodianChangedTo,StatusChangedTo,AssetAuditHistory.AuditBy,AuditorRemarks,AuditedDate,ApprovedBy,ApproverRemarks,ApprovedDate,
        AssetAuditHistory.AuditDetailsID,AssetAuditHistory.Status,AssetMaster.MainAssetNumber,AssetMaster.AssetSubNumber,AssetMaster.AssetClass,
        AssetMaster.AssetDesc,AuditMaster.AuditName
        FROM InstemAMS..AssetAuditHistory
        inner join InstemSAP..AssetMaster on AssetMaster.AssetID=AssetAuditHistory.AssetID
        inner join InstemAMS..AuditMaster on AuditMaster.AuditID=AssetAuditHistory.AuditID 
        where AssetAuditHistory.AuditID=@AuditID order by AuditHistoryID desc">
      <SelectParameters>
          <asp:SessionParameter Name="AuditID" SessionField="AuditID"/>
      </SelectParameters>
    </asp:SqlDataSource>
      <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" 
                    Landscape="True" MaxColumnWidth="150" GridViewID="ASPxGridView1" 
                    LeftMargin="0" RightMargin="0" TopMargin="0" ExportEmptyDetailGrid="false" >
      </dx:ASPxGridViewExporter>
  </div>
</asp:Content>
