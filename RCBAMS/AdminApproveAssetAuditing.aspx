<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AdminApproveAssetAuditing.aspx.cs" Inherits="AdminApproveAssetAuditing" %>

<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx1" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <script language="javascript" type="text/javascript">
        var _selectNumber = 0;
        var _all = false;
        var _handle = true;

        function OnAllCheckedChanged(s, e) {
            if (s.GetChecked())
                grid.SelectRows();
            else
                grid.UnselectRows();
        }

        function OnGridSelectionChanged(s, e) {
            cbAll.SetChecked(s.GetSelectedRowCount() == s.cpVisibleRowCount);

            if (e.isChangedOnServer == false) {
                if (e.isAllRecordsOnPage && e.isSelected)
                    _selectNumber = s.GetVisibleRowsOnPage();
                else if (e.isAllRecordsOnPage && !e.isSelected)
                    _selectNumber = 0;
                else if (!e.isAllRecordsOnPage && e.isSelected)
                    _selectNumber++;
                else if (!e.isAllRecordsOnPage && !e.isSelected)
                    _selectNumber--;

                if (_handle) {
                    cbPage.SetChecked(_selectNumber == s.GetVisibleRowsOnPage());
                    _handle = false;
                }
                _handle = true;
            }
            else {
                cbPage.SetChecked(cbAll.GetChecked());
            }
        }

        function OnPageCheckedChanged(s, e) {
            _handle = false;
            if (s.GetChecked())
                grid.SelectAllRowsOnPage();
            else
                grid.UnselectAllRowsOnPage();
        }

        function OnGridEndCallback(s, e) {
            _selectNumber = s.cpSelectedRowsOnPage;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
 <asp:UpdatePanel ID="updpnlRefresh" runat="server" UpdateMode="Conditional">
  <ContentTemplate>

     <dx:ASPxLabel ID="err_msg" runat="server" Text="" Visible="false" ForeColor="Red"></dx:ASPxLabel><br />

 <div class="clearfix"></div>
    <div class="row">   <div class="col-sm-12">
        <h4><strong>Approve Audited Assets</strong></h4>
        <hr/>
        </div>
    </div>
      <table width="350px">
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
      <br />
      <br />
  <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
        SelectCommand="SELECT [AuditID], [AuditDate], [AuditName] FROM [AuditMaster] where AuditStatus='Active'">
    </asp:SqlDataSource>
     <div class="row form_div">
      <div class="col-sm-12">
          <div class="table-responsive">
          <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid"  OnCustomJSProperties="grid_CustomJSProperties"
      
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
        DataSourceID="SqlDS_AuditedAssetList" KeyFieldName="AuditDetailsID" Width="95%">
        <Columns>
             <dx:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0">
                    <HeaderTemplate>
                        <dx:ASPxCheckBox ID="cbAll" runat="server" ClientInstanceName="cbAll" ToolTip="Select all rows"
                            BackColor="White" OnInit="cbAll_Init">
                            <ClientSideEvents CheckedChanged="OnAllCheckedChanged" />
                        </dx:ASPxCheckBox>
                        <dx:ASPxCheckBox ID="cbPage" runat="server" ClientInstanceName="cbPage" ToolTip="Select all rows within the page"
                            OnInit="cbPage_Init">
                            <ClientSideEvents CheckedChanged="OnPageCheckedChanged" />
                        </dx:ASPxCheckBox>
                    </HeaderTemplate>
                </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="AuditDetailsID" ReadOnly="True" Visible="false"
                VisibleIndex="1">
             
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
             <dx:GridViewDataTextColumn FieldName="AuditStatus" VisibleIndex="11" caption="Status ChangedTo">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="StatusName" VisibleIndex="10" caption="Asset Status">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Location" VisibleIndex="13" caption="Wing ChangedTo">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="BLOCK" VisibleIndex="12" caption="Floor">
</dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="LocationDesc" VisibleIndex="12" caption="LAB">
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="AssetCustodian" VisibleIndex="15" caption="Asset Custodian">
 </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="CustodianID" VisibleIndex="16" caption="CustodianID ChangedTo">
            </dx:GridViewDataTextColumn>
           
             <dx:GridViewDataTextColumn FieldName="AuditID" VisibleIndex="16" Visible="false">
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
    <div class="row form_div">
         <div class="col-sm-2">
             <dx:ASPxButton ID="AddAssets" runat="server" Text="Add" Width="20" OnClick="AddAssets_Click"   CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css"   CssPostfix="SoftOrange"   SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css"></dx:ASPxButton><br />
         </div>
     </div>
    <div class="table-responsive">
   <dx:ASPxGridView ID="ASPxGridView1"  runat="server" AutoGenerateColumns="False" 
                   KeyFieldName="AuditDetailsID"   Width="95%"                
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" OnRowCommand="ASPxGridView1_RowCommand">

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
             <dx:GridViewDataTextColumn FieldName="AuditStatus" VisibleIndex="11" Caption="Audited Status">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="StatusName" VisibleIndex="10" caption="Asset Status">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Location" VisibleIndex="13" caption="Wing ChangedTo">
            </dx:GridViewDataTextColumn>
         <dx:GridViewDataTextColumn FieldName="BLOCK" VisibleIndex="12" caption="Floor">
</dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="LocationDesc" VisibleIndex="12" caption="LAB">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="CustodianID" VisibleIndex="15" caption="CustodianID ChangedTo">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="AssetCustodian" VisibleIndex="14" caption="Asset Custodian">
            </dx:GridViewDataTextColumn>
           <dx:GridViewDataTextColumn FieldName="AuditID" VisibleIndex="16" visible="false">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Delete" VisibleIndex="17">
                <DataItemTemplate>
                    <asp:LinkButton ID="delete" CommandName="Delete" runat="server">Delete</asp:LinkButton>
                </DataItemTemplate>
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
          <div class="clearfix"></div>
    <div class="row"> 
        <div class="col-sm-12">
        <hr/>
            </div>


    </div>
     <div class="row form_div">
         <div class="col-sm-1">
          <span class="auto-style7" style="font-size:large">Remarks:</span>
        
         </div>
          <div class="col-sm-4">
             <asp:TextBox ID="txt_cmt" runat="server" TextMode="MultiLine" Rows="2" Columns="35"></asp:TextBox>
             
         </div>
        </div>
     <br />
       <div class="row form_div">
                 <div class="col-sm-1">
                     
                         
                    </div>
                <div class="col-sm-1">
                    <dx:ASPxButton ID="Approve" runat="server" Text="Approve" OnClick="Approve_Click"  CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css"   CssPostfix="SoftOrange"   SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css"></dx:ASPxButton>
                     
                </div>
              <div class="col-sm-2">
                  <dx:ASPxButton ID="Reject" runat="server" Text="Reject" OnClick="Reject_Click"  CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css"   CssPostfix="SoftOrange"   SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css"></dx:ASPxButton>
              </div>
       </div>
                
    
    <asp:SqlDataSource ID="SqlDS_AuditedAssetList" runat="server" 
        ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
        SelectCommand="SELECT AuditDetailsID,AuditDetails.AssetID,AssetMaster.MainAssetNumber,AssetMaster.AssetSubNumber,
        AssetMaster.AssetClass,AssetMaster.AssetDesc, AuditDetails.AuditStatus,Comments,AuditDetails.AuditID,AuditDetails.Date as AuditedDate,
        AuditName,AuditDetails.AuditBy as AuditBy,StatusDesc as StatusName,AuditDetails.CustodianID,AuditDetails.Location,AssetMaster.LocationDesc,AssetMaster.CustodianID as AssetCustodian
        FROM RCBAMS..[AuditDetails] 
        inner join RCBSAP..AssetMaster on AssetMaster.AssetID=AuditDetails.AssetID
        inner join RCBAMS..AuditMaster on AuditMaster.AuditID=AuditDetails.AuditID
       
        where AuditDetails.Status='Audited' and AuditDetails.AuditID=@AuditID Order by AuditDetailsID Desc">
      <SelectParameters>
         <%-- <asp:SessionParameter SessionField="AuditID" Name="AuditID" />--%>
          <asp:ControlParameter ControlID="Audit_Gridlookup" Name="AuditID" />
      </SelectParameters>
    </asp:SqlDataSource>
    <br />
  
             </div>

 </ContentTemplate>
</asp:UpdatePanel>

</asp:Content>

