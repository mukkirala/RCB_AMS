<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ViewAssetsByAudit.aspx.cs" Inherits="ViewAssetsByAudit" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<style type="text/css">
        .style2
        {
            width: 130px;
        }
        .style3
        {
            width: 180px;
        }
        .style4
        {
            width: 54px;
        }
        .style5
       {
            width: 167px;
       }
  
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
 <h4><strong>View Assets By Audit</strong>
     </h4><br /><br />
    <table width="800px">
        <tr>
            <td class="style2" style="font-size:large">
                Select Audit</td>
            <td class="style3">                
                  <dx:ASPxGridLookup ID="Audit_Gridlookup" runat="server"  
                    AutoGenerateColumns="False" DataSourceID="SqlDataSource3" TextFormatString="{2}" Width="170px" Height="25px"
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
 
     <table style="margin-right:15px">
        <tr>
            <td class="style10">
              <h4> <span><strong>Audit List</strong></span></h4>
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
            <dx:GridViewDataTextColumn FieldName="AssetID"  ReadOnly="True" VisibleIndex="1">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            
            <dx:GridViewDataTextColumn FieldName="MainAssetNumber" VisibleIndex="2" Caption=" Equipment Number">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetSubNumber" VisibleIndex="3" Width="200px" Caption="Sub Number" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            
            <dx:GridViewDataTextColumn FieldName="AssetDesc" VisibleIndex="4" Caption="Asset Name" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
          <dx:GridViewDataTextColumn FieldName="AssetClass" VisibleIndex="5">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>  
        <dx:GridViewDataTextColumn FieldName="Location" VisibleIndex="6" Caption="Wing">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>  
           <dx:GridViewDataTextColumn FieldName="Block" VisibleIndex="6" Caption="Floor">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>  
           <dx:GridViewDataTextColumn FieldName="LocationCode" VisibleIndex="6" Caption="LAB">
        <Settings AutoFilterCondition="Contains" />
    </dx:GridViewDataTextColumn>
           <dx:GridViewDataTextColumn FieldName="AuditBy" VisibleIndex="7">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>  
          <dx:GridViewDataDateColumn FieldName="AuditDate" VisibleIndex="8">
              <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy"></PropertiesDateEdit>
          </dx:GridViewDataDateColumn> 
             <dx:GridViewDataTextColumn FieldName="AuditStatus" VisibleIndex="9">
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
     
    <br />
</div>

 <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" 
                    Landscape="True" MaxColumnWidth="150" GridViewID="ASPxGridView2" 
                    LeftMargin="0" RightMargin="0" TopMargin="0">
  </dx:ASPxGridViewExporter>
  <asp:SqlDataSource ID="SqlDSGrid" runat="server" ConnectionString="<%$ ConnectionStrings:RCBSAPConnectionString %>"
      SelectCommand="select distinct AuditDetails.AuditDetailsID, AssetMaster.AssetID,AssetMaster.MainAssetNumber,AssetMaster.AssetSubNumber,
AssetMaster.AssetDesc,AssetMaster.AssetClass,LocationMaster.Location,LocationMaster.LocationCode,LocationMaster.Block ,AuditDetails.Date as AuditDate, AuditDetails.AuditStatus,
AuditDetails.AuditBy  from RCBAMS..AuditDetails 
inner join RCBAMS..AuditMaster on AuditMaster.AuditID=AuditDetails.AuditID
inner join RCBSAP..AssetMaster on AssetMaster.AssetID=AuditDetails.AssetID
inner join RCBAMS..LocationMaster on LocationMaster.LocationID=AuditMaster.LocationID
where AuditDetails.AuditID=@AuditID  order by AuditDate desc">
      <SelectParameters>
          <asp:SessionParameter SessionField="AuditID" Name="AuditID" />
      </SelectParameters>
  </asp:SqlDataSource>                                     
  <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
        SelectCommand="SELECT [AuditID], [AuditDate], [AuditName] FROM [AuditMaster]">
    </asp:SqlDataSource>

</asp:Content>


