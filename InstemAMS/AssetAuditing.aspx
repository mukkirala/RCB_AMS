<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="AssetAuditing.aspx.cs" Inherits="AssetAuditing" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxMenu" tagprefix="dx1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <script type="text/javascript" >
//     function setFocus() {
//         txt_setfocus.Focus();
//     }
     </script>
    <style type="text/css">
        .style2
        {
            width: 146px;
        }
        .style4
        {
            font-size: medium;
        }
        .style5
        {
            width: 121px;
        }
        .style6
        {
            color: #FF0000;
        }
        .style7
        {
            font-size: medium;
            color: #000000;
        }
        .style8
        {
            width: 57px;
        }
        .style9
        {
            width: 174px;
        }
        .style10
        {
            width: 171px;
        }
        .style11
        {
            width: 89%;
            margin-left: 55px;
        }
        .style13
        {
            width: 130px;
        }
        .style14
        {
            width: 128px;
        }
        </style>    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

                <strong style="margin-left:55px"><span class="style4"> 
                <span class="dxmLite_Glass">Asset Auditing</span> </span></strong>
    <br />

    <br /><table  style="margin-left:55px" width="800px">
        <tr>
            <td class="style2">
                Audit Type</td>
            <td class="style9">
                <dx:ASPxRadioButtonList ID="rbtnlt_type" runat="server" 
                    CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                    RepeatDirection="Horizontal" 
                    SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" 
                    AutoPostBack="True" onselectedindexchanged="rbtnlt_type_SelectedIndexChanged">
                    <Items>
                        <dx:ListEditItem Text="New" Value="1"  Selected="true"/>
                        <dx:ListEditItem Text="Existing" Value="2" />
                    </Items>
                    <Border BorderWidth="0px" />
                </dx:ASPxRadioButtonList>
            </td>
            <td class="style8">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <dx:ASPxLabel ID="lbl_Auditname" runat="server" Text="Select Audit No" Visible="false">
                </dx:ASPxLabel>
            </td>
            <td class="style9">
                
                <dx:ASPxGridLookup ID="grdlp_AuditID" runat="server" Visible="false"
                    AutoGenerateColumns="False" DataSourceID="SqlDS_AuditID" KeyFieldName="AuditID">
<GridViewProperties>
<SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>
</GridViewProperties>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="AuditID" ReadOnly="True" VisibleIndex="0">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="AuditName" VisibleIndex="1">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="AuditDiscription" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:ASPxGridLookup>
                
            </td>
            <td class="style8">
                <dx:ASPxButton ID="btn_Audit" runat="server" BackColor="White" Visible="false"
                    CssClass="auto-style8" Width="16px" Height="16px" 
                    onclick="btn_Audit_Click">
                    <Image Url="~/Images/search1.png" Width="20px" Height="20px">
                    </Image>
                    <Border BorderColor="White" />                   
                </dx:ASPxButton>
            </td>
            <td class="style5">
                </td>
            <td class="style10">
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Date">
                </dx:ASPxLabel>
                </td>
            <td class="style9">
                <dx:ASPxDateEdit ID="txt_scanneddate" EditFormatString="yyyy-MM-dd" DisplayFormatString="dd-MM-yyyy"  runat="server">
                </dx:ASPxDateEdit>
            </td>
            <td class="style8">
                &nbsp;</td>
            <td class="style5">
                <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Select Plant">
                </dx:ASPxLabel>
                &nbsp;<span class="style6"><strong>*</strong></span></td>
            <td class="style10">
                <dx:ASPxComboBox ID="cmb_Unit" runat="server" ValueField="UnitCode" TextField="UnitName" TextFormatString="{1}"
                    DataSourceID="SqlDS_UnitCode" ValueType="System.String">
                    <Columns>
                    <dx:ListBoxColumn FieldName="UnitCode" />
                    <dx:ListBoxColumn FieldName="UnitName" />
                    </Columns>
                </dx:ASPxComboBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                Select AssetGroup</td>
            <td class="style9">
                <dx:ASPxComboBox ID="cmb_Assetgroup" runat="server" ValueField="AssetGroupCode" TextField="AssetGroupDescription" TextFormatString="{1}"
                    DataSourceID="SqlDS_GroupCode" ValueType="System.String">
                    <Columns>
                    <dx:ListBoxColumn FieldName="AssetGroupCode" />
                    <dx:ListBoxColumn FieldName="AssetGroupDescription" />
                    </Columns>
                </dx:ASPxComboBox>
            </td>
            <td class="style8">
                <dx:ASPxButton ID="btnsearch" runat="server" BackColor="White" 
                    CssClass="auto-style8" 
                    OnClick="btnsearch_Click" Width="16px" Height="16px">
                    <Image Url="~/Images/search1.png" Width="20px" Height="20px">
                    </Image>
                    <Border BorderColor="White" />                   
                </dx:ASPxButton>
            </td>
            <td class="style5">
                Audit Name <span class="style6"><strong>*</strong></span></td>
            <td class="style10">
                <dx:ASPxTextBox ID="txt_auditname" runat="server" 
                    Width="170px"   >
                </dx:ASPxTextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                AuditedBy</td>
            <td class="style9">
                <dx:ASPxComboBox ID="cmb_auditedby"   runat="server" 
                    ValueField="USR_ID"  TextField="USR_NAME" TextFormatString="{1}"
                    DataSourceID="AuditedByDS" ValueType="System.Int32">
                    <Columns>
                        <dx:ListBoxColumn FieldName="USR_ID" />
                        <dx:ListBoxColumn FieldName="USR_NAME" />
                    </Columns>
                </dx:ASPxComboBox>
            </td>
            <td class="style8">
                &nbsp;</td>
            <td class="style5">
                Remarks</td>
            <td class="style10">
                <dx:ASPxMemo ID="txt_discription" runat="server" Height="21px" Width="170px">
                </dx:ASPxMemo>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style9">
                <dx:ASPxButton ID="btn_AuditSave" runat="server" Text="Create Audit" 
                     CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" 
                    CssPostfix="SoftOrange" onclick="btn_AuditSave_Click" 
                    SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Width="105px">
                </dx:ASPxButton>
            </td>
            <td class="style8">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        </table>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <dx:ASPxLabel ID="lbl_error" runat="server" 
                            style="color: #FF0000; font-weight: 700">
                        </dx:ASPxLabel>
                    <br />
                        <table style="margin-left:55px" width="800px">
                            <tr>
                                <td class="style2">
                                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Scan Barcode ">
                                    </dx:ASPxLabel>
                                    &nbsp;<span class="style6"><strong>*</strong></span></td>
                                <td class="style9">
                                    <dx:ASPxTextBox ID="txt_ScanBarcode0" runat="server" AutoPostBack="true" 
                                        Height="16px" ontextchanged="txt_ScanBarcode_TextChanged" Width="170px">
                                    </dx:ASPxTextBox>
                                </td>
                                <td class="style8">
                                    &nbsp;</td>
                                <td class="style5">
                                    <span class="style6"><strong>
                                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" 
                                        style="font-weight: 700; color: #000000" Text="Total Stock">
                                    </dx:ASPxLabel>
                                    &nbsp;*</strong></span></td>
                                <td>
                                    <dx:ASPxLabel ID="lbl_totalstock" runat="server" 
                                        style="font-weight: 700; color: #339966" Text="">
                                    </dx:ASPxLabel>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    <span class="style6"><strong>
                                    &nbsp;</strong></span></td>
                                <td class="style9">
                                    &nbsp;</td>
                                <td class="style8">
                                    &nbsp;</td>
                                <td class="style5">
                                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" 
                                        style="font-weight: 700; color: #000000" Text="No of Scan's">
                                    </dx:ASPxLabel>
                                    &nbsp;<span class="style6"><strong>*</strong></span></td>
                                <td>
                                    <dx:ASPxLabel ID="lbl_Scancount" runat="server" 
                                        style="font-weight: 700; color: #339966" Text="">
                                    </dx:ASPxLabel>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    <span class="style6"><strong>&nbsp;</strong></span></td>
                                <td class="style9">
                                    &nbsp;</td>
                                <td class="style8">
                                    &nbsp;</td>
                                <td class="style5">
                                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" 
                                        style="font-weight: 700; color: #000000" Text="Balance Left">
                                    </dx:ASPxLabel>
                                    &nbsp;<span class="style6"><strong>*</strong></span></td>
                                <td>
                                    <dx:ASPxLabel ID="lbl_Balleft" runat="server" 
                                        style="font-weight: 700; color: #FF0000" Text="">
                                    </dx:ASPxLabel>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <span class="style7"><strong style="margin-left:55px">Asset Auditing List
                        </strong></span>
                        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" 
                            CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" 
                            DataSourceID="SqlDS_AuditDetail" KeyFieldName="Barcode" 
                            style="margin-left:55px" width="800px">
                            <TotalSummary>
                                <dx:ASPxSummaryItem FieldName="BarCode" ShowInColumn="BarCode" 
                                    SummaryType="Sum" />
                            </TotalSummary>
                            <Columns>
                                <dx:GridViewDataBinaryImageColumn Caption="BarCode Image" 
                                    FieldName="ImageLocation" VisibleIndex="0">
                                    <DataItemTemplate>
                                        <dx:ASPxImage ID="Img" runat="server" Height="50px" 
                                            ImageUrl='<%# Eval("ImageLocation") %>' Width="150px">
                                        </dx:ASPxImage>
                                    </DataItemTemplate>
                                </dx:GridViewDataBinaryImageColumn>
                                <dx:GridViewDataTextColumn Caption="BarCode" FieldName="Barcode" 
                                    ReadOnly="True" VisibleIndex="1">
                                    <Settings AutoFilterCondition="Contains" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="SAP No" FieldName="AssetSapNo" 
                                    ReadOnly="True" VisibleIndex="2">
                                    <Settings AutoFilterCondition="Contains" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="AssetDescription" VisibleIndex="3">
                                    <Settings AutoFilterCondition="Contains" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="SerialNo" VisibleIndex="4">
                                    <Settings AutoFilterCondition="Contains" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataDateColumn Caption="Capt. Date" FieldName="CaptureDate" 
                                    VisibleIndex="5">
                                    <Settings AutoFilterCondition="Contains" />
                                </dx:GridViewDataDateColumn>
                                <dx:GridViewDataTextColumn Caption="Acquis.Val" FieldName="AquisitionValue" 
                                    VisibleIndex="6">
                                    <Settings AutoFilterCondition="Contains" />
                                </dx:GridViewDataTextColumn>
                                <%-- <dx:GridViewDataTextColumn FieldName="Location" VisibleIndex="6" Caption="Location">
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>--%>
                                <dx:GridViewDataTextColumn Caption="Status" FieldName="Status" VisibleIndex="7">
                                    <Settings AutoFilterCondition="Contains" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Remarks" FieldName="Comments" 
                                    VisibleIndex="8">
                                    <Settings AutoFilterCondition="Contains" />
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <SettingsPager PageSize="50">
                            </SettingsPager>
                            <Settings ShowFilterBar="Visible" ShowFilterRow="True" ShowGroupPanel="True" />
                            <Images SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                                <LoadingPanelOnStatusBar Url="~/App_Themes/Glass/GridView/gvLoadingOnStatusBar.gif">
                                </LoadingPanelOnStatusBar>
                                <LoadingPanel Url="~/App_Themes/Glass/GridView/Loading.gif">
                                </LoadingPanel>
                            </Images>
                            <ImagesFilterControl>
                                <LoadingPanel Url="~/App_Themes/Glass/Editors/Loading.gif">
                                </LoadingPanel>
                            </ImagesFilterControl>
                            <Styles CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass">
                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                </Header>
                            </Styles>
                            <StylesEditors>
                                <CalendarHeader Spacing="1px">
                                </CalendarHeader>
                                <ProgressBar>
                                </ProgressBar>
                            </StylesEditors>
                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="SqlDS_AuditDetail" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ASSETManagementConnectionString %>" 
                            SelectCommand="Select ImageLocation,AuditDetails.Barcode,AssetSapNo,AssetDescription,SerialNo,CaptureDate,AquisitionValue,AuditDetails.[Status],Comments from AssetMaster INNER JOIN AuditDetails On AuditDetails.Barcode=AssetMaster.Barcode Where AuditDetails.AuditID=@AuditID">
                            <SelectParameters>
                                <asp:SessionParameter Name="AuditID" SessionField="AuditID" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </ContentTemplate>
                </asp:UpdatePanel>
        <br />
                
    <br />
                <table class="style11">
                    <tr>
                        <td class="style14">
                            <dx:ASPxButton ID="btn_AuditClose" runat="server" Text="Close Audit" 
                                CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                                SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Width="134px" 
                                onclick="btn_AuditClose_Click">
                            </dx:ASPxButton>
                        </td>
                        <td class="style14">
                            <dx:ASPxButton ID="btn_Complete" runat="server" Text="Complete Audit" 
                                CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                                onclick="btn_Complete_Click" 
                                SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Width="134px">
                            </dx:ASPxButton>
                        </td>
                        <td class="style13">
    <dx:ASPxButton ID="btn_print" runat="server"  Width="130px" style="margin-left:0px; " Visible="false"
        CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" 
        Text="Print Report" onclick="btn_print_Click">
    </dx:ASPxButton>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style14">
                            &nbsp;</td>
                        <td class="style14">
                            &nbsp;</td>
                        <td class="style13">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
    <br />
                
    <asp:SqlDataSource ID="PlantDS" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ASSETManagementConnectionString %>" 
        SelectCommand="SELECT UnitCode,[UnitName] FROM [UnitMaster]">
    </asp:SqlDataSource>
                
    <asp:SqlDataSource ID="AuditedByDS" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ASSETManagementConnectionString %>" 
        SelectCommand="SELECT [USR_ID], [USR_NAME] FROM [tblUSER]">
    </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ASSETManagementConnectionString %>" 
                    SelectCommand="SELECT [UnitNo],[UnitCode],[UnitName] FROM [UnitMaster]">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDS_GroupCode" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ASSETManagementConnectionString %>" 
                    
                    SelectCommand="SELECT [AssetGroupID], [AssetGroupCode], [AssetGroupDescription] FROM [AssetGroupMaster]" >
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDS_UnitCode" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ASSETManagementConnectionString %>" 
                    SelectCommand="SELECT [UnitNo], [UnitCode], [UnitName] FROM [UnitMaster]">
                </asp:SqlDataSource>
                
                <asp:SqlDataSource ID="SqlDS_AuditID" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ASSETManagementConnectionString %>" 
                    SelectCommand="SELECT [AuditID], [AuditName], [AuditDiscription] FROM [AuditMaster] WHERE ([AuditStatus] ='AuditInProgress')">
                </asp:SqlDataSource>
                
            </asp:Content>

