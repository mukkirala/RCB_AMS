<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ViewAssetsWithRFID.aspx.cs" Inherits="ViewAssetsWithRFID" %>

<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .titleRight { text-align: right; }
        .style2 { width: 100px; }
    </style>

    <script type="text/javascript">
        // customization button script (same behaviour as in your AddAsset.aspx)
        function button1_Click(s, e) {
            if (grid.IsCustomizationWindowVisible())
                grid.HideCustomizationWindow();
            else
                grid.ShowCustomizationWindow();
            UpdateButtonText();
        }
        function grid_CustomizationWindowCloseUp(s, e) {
            UpdateButtonText();
        }
        function UpdateButtonText() {
            var text = grid.IsCustomizationWindowVisible() ? "Hide" : "Show";
            text += "Column Chooser";
            if (typeof button1 !== "undefined" && button1 != null && button1.SetText)
                button1.SetText(text);
        }
        function pageLoad() {
            try { UpdateButtonText(); } catch (ex) { }
        }
        if (window.addEventListener) window.addEventListener("load", pageLoad, false);
        else if (window.attachEvent) window.attachEvent("onload", pageLoad);
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="col-sm-12">
        <table style="width:100%">
            <tr>
                <td style="font-size:16px; font-weight:bold">
                    Assets with RFID Mapping
                    <div class="col-sm-12" style="margin-top:6px;">
                        <div class="col-sm-3">
                            <dx:ASPxButton ID="ASPxButton1" runat="server" ClientInstanceName="button1" Text="Column Chooser"
                                UseSubmitBehavior="False" AutoPostBack="False"
                                CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange"
                                SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css">
                                <ClientSideEvents Click="button1_Click" />
                            </dx:ASPxButton>
                        </div>
                    </div>
                </td>
                <td class="titleRight">
                    &nbsp;&nbsp;
                    <asp:ImageButton ID="btnexporttoxls" ImageUrl="~/Images/XLS.png" Height="35px" runat="server" OnClick="btnexporttoxls_Click" Width="40px" />
                    &nbsp;
                    <asp:ImageButton ID="btn_pdf" ImageUrl="~/Images/PDF.png" runat="server" Height="35px" Width="45px" OnClick="btn_pdf_Click" style="margin-left:5px" />
                </td>
            </tr>
        </table>

        <div class="table-responsive" style="margin-top:10px">
            
            <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server"
                Landscape="True" MaxColumnWidth="150" GridViewID="ASPxGridView1" LeftMargin="0" RightMargin="0" TopMargin="0"
                ExportEmptyDetailGrid="false" />

          
            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlAssetsWithRFID" KeyFieldName="SLNO"
                CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" Width="100%"
                ClientInstanceName="grid">
                <Columns>
                    
                    <dx:GridViewDataTextColumn FieldName="SLNO"  ReadOnly="True" VisibleIndex="0">
                        <Settings AutoFilterCondition="Contains" />
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn FieldName="AssetID" VisibleIndex="1" Caption="Asset ID" Width="120px">
                        <Settings AutoFilterCondition="Contains" />
                        <CellStyle HorizontalAlign="Left" />
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn FieldName="MainAssetNumber" VisibleIndex="2" Caption="Asset Number" Width="150px">
                        <Settings AutoFilterCondition="Contains" />
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn FieldName="AssetSubNumber" VisibleIndex="3" Caption="Sub Asset Number" Width="140px">
                        <Settings AutoFilterCondition="Contains" />
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn FieldName="CustodianDepartment" VisibleIndex="4" Caption="Custodian Dept" Width="150px">
                        <Settings AutoFilterCondition="Contains" />
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn FieldName="CustodianID" VisibleIndex="5" Caption="Staff Number" Width="120px">
                        <Settings AutoFilterCondition="Contains" />
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn FieldName="LocationID" VisibleIndex="6" Caption="Location ID" Width="120px">
                        <Settings AutoFilterCondition="Contains" />
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn FieldName="Location" VisibleIndex="7" Visible="false" Caption="Location" Width="120px">
                        <Settings AutoFilterCondition="Contains" />
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn FieldName="LocationDesc" VisibleIndex="8" Caption="Location Description" Width="180px">
                        <Settings AutoFilterCondition="Contains" />
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn FieldName="BLOCK" VisibleIndex="9" Caption="Block" Width="100px">
                        <Settings AutoFilterCondition="Contains" />
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataDateColumn FieldName="CreationDate" VisibleIndex="10" Caption="Creation Date" Width="130px">
                        <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy" />
                        <Settings AutoFilterCondition="Contains" />
                    </dx:GridViewDataDateColumn>

                    <dx:GridViewDataDateColumn FieldName="CapitalizationDate" VisibleIndex="11" Caption="Capitalization Date" Width="130px" Visible="false">
                        <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy" />
                        <Settings AutoFilterCondition="Contains" />
                    </dx:GridViewDataDateColumn>

                    <dx:GridViewDataTextColumn FieldName="RFIDCardNumber" VisibleIndex="12" Caption="RFID Card Number" Width="160px">
                        <Settings AutoFilterCondition="Contains" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="FirstAcquisitionDate" VisibleIndex="12" Caption="FirstAcquisitionDate" Width="160px">
                        <Settings AutoFilterCondition="Contains" />
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataDateColumn FieldName="RFIDMAPDATE" VisibleIndex="13" Caption="RFID Map Date" Width="130px">
                        <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy" />
                        <Settings AutoFilterCondition="Contains" />
                    </dx:GridViewDataDateColumn>

                    <dx:GridViewDataDateColumn FieldName="ExpiryDate" VisibleIndex="14" Visible="false" Caption="Expiry Date" Width="120px">
                        <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy" />
                        <Settings AutoFilterCondition="Contains" />
                    </dx:GridViewDataDateColumn>

                    
                    <dx:GridViewDataTextColumn FieldName="RFIDMappinghistoryID" VisibleIndex="15" Caption="RFID Map ID" Visible="false">
                        <Settings AutoFilterCondition="Contains" />
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn FieldName="RFID_SRNO" VisibleIndex="16" Caption="RFID SRNO" Width="100px" Visible="false">
                        <Settings AutoFilterCondition="Contains" />
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataDateColumn FieldName="RFIDHistoryDate" VisibleIndex="17" Caption="RFID History Date" Width="130px">
                        <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy" />
                        <Settings AutoFilterCondition="Contains" />
                    </dx:GridViewDataDateColumn>

                    <dx:GridViewDataTextColumn FieldName="RFIDStatus" VisibleIndex="18" Caption="RFID Status" Width="100px">
                        <Settings AutoFilterCondition="Contains" />
                    </dx:GridViewDataTextColumn>
                </Columns>

                <SettingsPager PageSize="15">
                </SettingsPager>

                <Settings ShowFilterRow="True" ShowGroupPanel="True" ShowFilterRowMenu="True" ShowGroupFooter="VisibleAlways" ShowFooter="true" ShowHeaderFilterButton="True" />
                <SettingsCustomizationWindow Enabled="True" Height="250px" PopupHorizontalOffset="200" PopupVerticalOffset="100" Width="250px" PopupVerticalAlign="TopSides" />
                <SettingsLoadingPanel Mode="ShowOnStatusBar" />
                <ClientSideEvents CustomizationWindowCloseUp="grid_CustomizationWindowCloseUp" />

                <Images SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                    <LoadingPanelOnStatusBar Url="~/App_Themes/PlasticBlue/GridView/gvLoadingOnStatusBar.gif" />
                    <LoadingPanel Url="~/App_Themes/PlasticBlue/GridView/Loading.gif" />
                </Images>
                <ImagesFilterControl>
                    <LoadingPanel Url="~/App_Themes/PlasticBlue/Editors/Loading.gif" />
                </ImagesFilterControl>

                <Styles CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue">
                    <Header ImageSpacing="10px" SortingImageSpacing="10px" />
                </Styles>
                <StylesEditors>
                    <CalendarHeader Spacing="11px" />
                    <ProgressBar Height="25px" />
                </StylesEditors>
            </dx:ASPxGridView>

           
            <asp:SqlDataSource ID="SqlAssetsWithRFID" runat="server" ConnectionString="<%$ ConnectionStrings:RCBSAPConnectionString %>"
                SelectCommand=" SELECT AM.SLNO, AM.AssetID, AM.MainAssetNumber,AM.FirstAcquisitionDate, 
 AM.AssetSubNumber, AM.CustodianDepartment, AM.CustodianID, AM.Location,
 AM.LocationDesc, AM.BLOCK, AM.CreationDate, AM.LocationID, AM.CapitalizationDate,
 AM.RFIDCardNumber, AM.RFIDMAPDATE, RM.RFIDMappinghistoryID, RM.RFIDCardNumber AS
 RM_RFIDCardNumber, RM.SRNO AS RFID_SRNO, RM.RFIDHistoryDate, RM.RFIDStatus FROM RCBSAP..AssetMaster AM
 INNER JOIN RCBSAP..RFIDMappingHistory RM
 ON AM.SLNO = RM.SRNO ORDER BY CASE WHEN RM.RFIDStatus = 'Active' THEN 0 ELSE 1 END, RM.RFIDHistoryDate DESC">
            </asp:SqlDataSource>

        </div>
        <br />
    </div>
</asp:Content>
