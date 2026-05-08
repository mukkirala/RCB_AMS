<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AdminViewAssetAuditing.aspx.cs" Inherits="AdminViewAssetAuditing" %>

<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"  Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v11.1" namespace="DevExpress.Web.ASPxPanel" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxMenu" tagprefix="dx1" %>
<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx2" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<style>
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
<div class="col-sm-12">
     
          <div class="row">   <div class="col-sm-12">
              <h4><strong>Approved Audits</strong></h4>
        <hr/>
        </div>
    </div>
    <table width="330px">
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
        ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
        SelectCommand="SELECT [AuditID], [AuditDate], [AuditName] FROM [AuditMaster] ">
    </asp:SqlDataSource>
     <table style="margin-right:20px">
        <tr>
            <td class="style10">
           <h4> <span><strong>Admin Approved Audits</strong></span></h4>
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
          <dx:ASPxGridView ID="AuditedAssetGridView" runat="server" AutoGenerateColumns="False" 
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
        DataSourceID="SqlDS_AuditedAssetList" KeyFieldName="AuditDetailsID">
        <Columns>
          
            <dx:GridViewDataTextColumn FieldName="AuditDetailsID" ReadOnly="True" Visible="false"
                VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetID" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            
             <dx:GridViewDataTextColumn FieldName="MainAssetNumber" VisibleIndex="3" Caption="Equipment Number">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="AssetClass" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="AssetDesc" VisibleIndex="5" Caption="Asset Name">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="AuditName" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AuditBy" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Comments" VisibleIndex="8" caption="Auditor Remarks">
            </dx:GridViewDataTextColumn>
           
            <dx:GridViewDataDateColumn FieldName="AuditedDate" VisibleIndex="9" PropertiesDateEdit-DisplayFormatString="dd-MMM-yyyy">
            </dx:GridViewDataDateColumn>
             <dx:GridViewDataTextColumn FieldName="AuditStatus" VisibleIndex="10">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="StatusName" VisibleIndex="11" caption="Asset Status" Visible="false">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Location" VisibleIndex="11"  Caption="Wing">
            </dx:GridViewDataTextColumn>
             <%--<dx:GridViewDataTextColumn FieldName="BLOCK" VisibleIndex="11"  Caption="Floor">
</dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="LocationCode" VisibleIndex="11"  Caption="LAB">
</dx:GridViewDataTextColumn>--%>
              <dx:GridViewDataTextColumn FieldName="AdminRemarks" VisibleIndex="11">
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="11" >
            </dx:GridViewDataTextColumn>
           
        </Columns>
        <SettingsPager ShowDefaultImages="False" PageSize="5">
                <AllButton Text="All">
                </AllButton>
                <NextPageButton Text="Next &gt;">
                </NextPageButton>
                <PrevPageButton Text="&lt; Prev">
                </PrevPageButton>
            </SettingsPager>
        <Settings ShowFilterRow="True" ShowGroupPanel="True" />
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
         <TotalSummary>
        <dx:ASPxSummaryItem FieldName="AssetID" SummaryType="Count" />
        </TotalSummary>
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
    <br />
  <asp:SqlDataSource ID="SqlDS_AuditedAssetList" runat="server" 
        ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
        SelectCommand="SELECT AuditDetailsID,AuditDetails.AssetID,AssetMaster.MainAssetNumber,AssetMaster.AssetSubNumber,
        AssetMaster.AssetClass,AssetMaster.AssetDesc,AssetMaster.Status as AssetStatus, AuditDetails.Status,Comments,AuditDetails.AuditID,Date as AuditedDate,
        AuditName,AuditDetails.CustodianID as AuditBy,StatusMaster.StatusName,StatusMaster.StatusCode,AuditDetails.AdminRemarks,AuditDetails.AuditStatus,AuditDetails.Location
        FROM RCBAMS..[AuditDetails] 
        inner join RCBSAP..AssetMaster on AssetMaster.AssetID=AuditDetails.AssetID
        inner join RCBAMS..AuditMaster on AuditMaster.AuditID=AuditDetails.AuditID
        
        inner join RCBAMS..StatusMaster on StatusMaster.StatusCode=AssetMaster.Status
        where AuditDetails.Status='Approved' and AuditDetails.AuditID=@AuditID Order by AuditDetailsID Desc">
        <SelectParameters>
            <asp:SessionParameter name="AuditID" SessionField="AuditID"/>
        </SelectParameters>
      
    </asp:SqlDataSource>

 <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" 
                    Landscape="True" MaxColumnWidth="150" GridViewID="AuditedAssetGridView" 
                    LeftMargin="0" RightMargin="0" TopMargin="0" ExportEmptyDetailGrid="false" >
      </dx:ASPxGridViewExporter>
</div>
</div>
</asp:Content>

