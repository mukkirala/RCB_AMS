<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.master" AutoEventWireup="true" CodeFile="CalibrationStatusofInstrmentwithColor.aspx.cs" Inherits="CalibrationStatusofInstrmentithColor" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
	<style>
		.dxgv {
			color:white !important;
		}
        .btns{
            margin:5px;
        }
		</style>
    <br />
	<table class="nav-justified">
		<tr>
			<td>
                <strong>Calibration Status of Instruments with Color Coding</strong>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
        </table>
     <br />
    <table class="auto-style6">
       
        <tr>
            <td class="auto-style7"> <svg width="90" height="50">
            <rect x="30" y="10" rx="10" ry="10" width="15" height="15" style="fill:Red;opacity:10.5" />
            </svg></td>
            <td class="auto-style10">
                <dx:ASPxLabel ID="lbl_occupancy" runat="server" Text="Un-Serviceable"></dx:ASPxLabel>
            </td>
            <td class="auto-style9"> <svg width="90" height="50">
            <rect x="30" y="10" rx="10" ry="10" width="15" height="15" style="fill:orange;opacity:10.5"/>
            </svg></td>
            <td class="auto-style8"><dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Calibration Past Overdue"></dx:ASPxLabel></td>  
            <td class="auto-style11"><svg width="90" height="50">
            <rect x="30" y="10" rx="10" ry="10" width="15" height="15" style="fill:#4fe84f;opacity:10.5" />
            </svg></td>  
            <td colspan="2"><dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Calibrated"></dx:ASPxLabel></td> 
             <td class="auto-style11"><svg width="90" height="50">
            <rect x="30" y="10" rx="10" ry="10" width="15" height="15" style="fill:yellow;opacity:10.5" />
            </svg></td>  
            <td colspan="2"><dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Calibration Falling this Month "></dx:ASPxLabel></td> 
        </tr>
        </table>
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
    <table>
		<tr>
			<td>
				<dx:ASPxGridView ID="grid_view" runat="server" AutoGenerateColumns="False" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" DataSourceID="DS_Satis" KeyFieldName="InstrumentID" OnHtmlRowPrepared="grid_view_HtmlRowPrepared">
       <GroupSummary>
           <dx:ASPxSummaryItem  SummaryType="Count" FieldName="InstrumentName"/>
       </GroupSummary>
                      <TotalSummary>
           <dx:ASPxSummaryItem  SummaryType="Count" FieldName="InstrumentName"/>
       </TotalSummary>
                    <Columns>

            <dx:GridViewDataTextColumn FieldName="InstrumentID" ReadOnly="True" VisibleIndex="0" Visible="false">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="InstrumentName" VisibleIndex="1">
				 <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Range" VisibleIndex="2">
				 <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="SerialNumber" VisibleIndex="3">
				 <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Model" VisibleIndex="4">
				 <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="BrandOrMake" VisibleIndex="5">
				  <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="DateOfLastCalibration" VisibleIndex="6" PropertiesDateEdit-DisplayFormatString="dd-MM-yyyy">
				 <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="NextCalibrationDate" VisibleIndex="7" ReadOnly="True" PropertiesDateEdit-DisplayFormatString="dd-MM-yyyy">
				 <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="InstrumentStatus" VisibleIndex="8">
				 <Settings AutoFilterCondition="BeginsWith"/>
            </dx:GridViewDataTextColumn>
                     
			  <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="9">
				  <Settings AutoFilterCondition="BeginsWith" FilterMode="DisplayText" AllowAutoFilterTextInputTimer="True" />
				  <DataItemTemplate>
					 <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
				  </DataItemTemplate>
            </dx:GridViewDataTextColumn>
        </Columns>
        			<SettingsBehavior AllowFocusedRow="True" />
        			<SettingsPager PageSize="20">
					</SettingsPager>
        <Settings ShowFilterRow="True" ShowGroupPanel="True" ShowFooter="true" />
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

    </dx:ASPxGridView>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>
	<asp:SqlDataSource ID="DS_Satis" runat="server" ConnectionString="<%$ ConnectionStrings:INSConnectionString %>" 
	SelectCommand="Select distinct InstrumentMaster.InstrumentID,InstrumentName,Range,SerialNumber,Model,BrandOrMake,
 DateOfLastCalibration,coalesce( CalibrationHistory.NextCalibrationDate,InstrumentMaster.DateOfNextCalibration) as NextCalibrationDate,InstrumentStatus from InstrumentMaster 
 left join CalibrationHistory on CalibrationHistory.InstrumentID=InstrumentMaster.InstrumentID
 left join MasterEquipment on MasterEquipment.EquipmentID=InstrumentMaster.MasterEquipmentUsed">
    </asp:SqlDataSource>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</table>
        </div>
     <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" Landscape="True" LeftMargin="0" MaxColumnWidth="150" RightMargin="0" BottomMargin="0">
    </dx:ASPxGridViewExporter>
</asp:Content>

