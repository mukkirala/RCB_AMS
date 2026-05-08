<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.master" AutoEventWireup="true" CodeFile="ViewCertificatesForInstrument.aspx.cs" Inherits="ViewCertificatesForInstrument" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .btns
        {
            margin:5px;
        }
    </style>
    <script type="text/javascript">
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
             text += " Customization Window";
             button1.SetText(text);
         }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
	<br />
    <div>
        <strong>View Certificates for all Instrument</strong>
    </div>
    <hr />
    <dx:ASPxButton runat="server" ID="ASPxButton1" ClientInstanceName="button1" Text="Show Customization Window"
        UseSubmitBehavior="False" AutoPostBack="False" 
        CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css">
        <ClientSideEvents Click="button1_Click" />
    </dx:ASPxButton>
    <br />
    <div class="row">
    <div class="pull-right">
        <span class="pull-left btns">
     <dx:ASPxButton ID="btnXLSX" runat="server" 
                   CssClass="btn btn-xs btn-default"
                    style="float:left"  
                    onclick="btnXLSX_Click">
         <Image Url="~/Images/Excel-icon.png" Width="20px"></Image>
                </dx:ASPxButton>
            </span>
        <span class="pull-right btns">
      <dx:ASPxButton ID="btnPDF" runat="server" 
                   CssClass="btn btn-xs btn-default"
                    
                    style="margin-left: 0px" 
                    onclick="btnPDF_Click" Wrap="True">
                <Image Url="~/Images/pdficon_large.gif" Width="20px"></Image>
                </dx:ASPxButton>
            </span>
        </div>
        </div>
    <br />
    <div class="table-responsive">
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" ClientInstanceName="grid" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="CalibrateHistoryID" OnRowCommand="ASPxGridView1_RowCommand" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass">
            <TotalSummary>
                <dx:ASPxSummaryItem SummaryType="Count" FieldName="InstrumentName" />
            </TotalSummary>
            <GroupSummary>
                 <dx:ASPxSummaryItem FieldName="InstrumentName" SummaryType="Count" />
            </GroupSummary>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="CalibrateHistoryID" ReadOnly="True" VisibleIndex="0" Visible="false">
                    <Settings AutoFilterCondition="Contains" />
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="InstrumentID" VisibleIndex="1">
                     <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="InstrumentName" VisibleIndex="2">
                     <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MasterInstrumentID1" VisibleIndex="3" Visible="false">
                     <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CalibratedByID" VisibleIndex="4" Visible="false">
                     <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="BodyCondition" VisibleIndex="5">
                     <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MissingParts" VisibleIndex="6">
                     <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="InsInspected" VisibleIndex="7">
                     <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="InsDismantled" VisibleIndex="8">
                     <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Lubricated" VisibleIndex="9">
                     <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="InsCaliRange" VisibleIndex="10">
                     <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="NextCalibrationDate" VisibleIndex="11">
                     <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="LastCalibrationDate" VisibleIndex="12">
                     <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="CalibrationHisDate" VisibleIndex="13" Visible="false">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="AssessedBy" VisibleIndex="14" Visible="false">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CalibrationStatus" VisibleIndex="15" Visible="false">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Observation" VisibleIndex="16">
                     <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CertificateNo" VisibleIndex="17" Visible="false">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ReportPDF" VisibleIndex="18">
                     <DataItemTemplate>
                    <asp:LinkButton ID="view" runat="server" CommandName="view">View Report</asp:LinkButton>
                </DataItemTemplate>
                </dx:GridViewDataTextColumn>
            </Columns>
            <Settings ShowFilterRow="True" ShowFooter="true" />
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
				<ProgressBar Height="25px">
				</ProgressBar>
			</StylesEditors>
             <Settings ShowGroupPanel="True" ShowFilterRow="True" ShowFilterBar="Visible" ShowGroupFooter="VisibleAlways" 
            ShowFilterRowMenu="True" ShowFooter="True" 
            ShowHeaderFilterButton="True" />
        <SettingsCustomizationWindow Enabled="True" Height="250px" 
            PopupHorizontalOffset="200" PopupVerticalOffset="100" Width="250px" 
            PopupVerticalAlign="TopSides" />
        <SettingsLoadingPanel Mode="ShowOnStatusBar" />
        <%--<SettingsBehavior EnableCustomizationWindow="true" />--%>
        <ClientSideEvents CustomizationWindowCloseUp="grid_CustomizationWindowCloseUp" />
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:INSConnectionString %>" SelectCommand="Select CalibrateHistoryID, CalibrationHistory.InstrumentID,[InstrumentName], MasterInstrumentID1, CalibratedByID, 
BodyCondition, MissingParts, InsInspected, InsDismantled, Lubricated, InsCaliRange, 
NextCalibrationDate, LastCalibrationDate, CalibrationHisDate, AssessedBy,CalibrationStatus, 
Observation, CertificateNo, ReportPDF from CalibrationHistory 
inner join InstrumentMaster on CalibrationHistory.InstrumentID=InstrumentMaster.InstrumentID "></asp:SqlDataSource>
    </div>
     <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" Landscape="True" LeftMargin="0" MaxColumnWidth="150" RightMargin="0" BottomMargin="0">
    </dx:ASPxGridViewExporter>
</asp:Content>

