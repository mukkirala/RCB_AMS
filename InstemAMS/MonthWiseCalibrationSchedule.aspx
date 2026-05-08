<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.master" AutoEventWireup="true" CodeFile="MonthWiseCalibrationSchedule.aspx.cs" Inherits="MonthWiseCalibrationSchedule" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
		.auto-style9 {
			width: 70px;
		}
		.auto-style12 {
			width: 230px;
		}
		.auto-style13 {
			width: 149px;
		}
		.auto-style14 {
			width: 215px;
		}
		.auto-style16 {
			width: 112px;
		}
		.auto-style17 {
			width: 42px;
		}
		.auto-style18 {
			width: 121px;
		}
		.auto-style20 {
            width: 218px;
        }
        .auto-style21 {
            width: 219px
        }
    	.btns {
			margin:5px;
    	}
		</style>
	 <script type="text/javascript">
         function button3_Click(s, e) {
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
             button3.SetText(text);
         }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />
	<table class="nav-justified">
		<tr>
			<td><strong>Month Wise Calibration Schedule :</strong></td>
		</tr>
		<tr>
			<td>
				<dx:ASPxLabel ID="lbl_from" runat="server" Text=""></dx:ASPxLabel>
				<dx:ASPxLabel ID="lbl_to" runat="server" Text=""></dx:ASPxLabel>
				<dx:ASPxLabel ID="lbl_msg" runat="server" Font-Bold="true" ForeColor="Red" Text=""></dx:ASPxLabel>
			</td>
		</tr>
	</table>
	<br />
	<table class="nav-justified">
		<tr>
			<td class="auto-style13">From Date<span style="color:red">*</span></td>
            <td class="auto-style20">
				<dx:ASPxDateEdit ID="dt_from" runat="server" DisplayFormatString="dd-MM-yyyy" AutoPostBack="True" Width="100%">
					<ValidationSettings>
						<RequiredField ErrorText="Please select some date" IsRequired="true" />
					</ValidationSettings>
				</dx:ASPxDateEdit>
			</td>
			<td class="auto-style16">To Date<span style="color:red">*</span></td>
			<td class="auto-style21">
				<dx:ASPxDateEdit ID="dt_to" runat="server" DisplayFormatString="dd-MM-yyyy" AutoPostBack="True" Width="92%" Height="19px">
					<ValidationSettings>
						<RequiredField ErrorText="Please select some date" IsRequired="true" />
					</ValidationSettings>
				</dx:ASPxDateEdit>
			</td>
			<td>
				<dx:ASPxButton ID="btn_search" runat="server"  Text="Search" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" OnClick="btn_search_Click"></dx:ASPxButton>
			</td>
		</tr>
	</table>
	<table class="nav-justified">
		<tr>
			<td class="auto-style12">
				&nbsp;</td>
			<td class="auto-style9">&nbsp;</td>
			<td class="auto-style14">
				&nbsp;</td>
			<td class="auto-style17">&nbsp;</td>
			<td class="auto-style18">
				&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</table>
	<br />
	 <dx:ASPxButton runat="server" ID="ASPxButton3" ClientInstanceName="button1" Text="Show Customization Window"
        UseSubmitBehavior="False" AutoPostBack="False" 
        CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css">
        <ClientSideEvents Click="button3_Click" />
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
	<dx:ASPxGridView ID="ASPxGridView1" runat="server" ClientInstanceName="grid" OnRowCommand="ASPxGridView1_RowCommand" OnCustomUnboundColumnData="ASPxGridView1_CustomUnboundColumnData" AutoGenerateColumns="False" DataSourceID="ds_instrument" KeyFieldName="InstrumentID" Width="1149px" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass">
		<GroupSummary>
			<dx:ASPxSummaryItem SummaryType="Count" FieldName="InstrumentName" />
		</GroupSummary>
		<TotalSummary>
			<dx:ASPxSummaryItem SummaryType="Count" FieldName="InstrumentName" />
		</TotalSummary>
		<Columns>
<dx:GridViewDataTextColumn FieldName="Number" Caption="S.No." VisibleIndex="0" UnboundType="String"></dx:GridViewDataTextColumn>
			<dx:GridViewCommandColumn VisibleIndex="0" Visible="false">
			</dx:GridViewCommandColumn>
			<dx:GridViewDataTextColumn FieldName="InstrumentID" Visible="false" ReadOnly="True" VisibleIndex="1">
				<EditFormSettings Visible="False" />
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="InstrumentName" VisibleIndex="1">
			</dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Range" VisibleIndex="2">
			</dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="SerialNumber" VisibleIndex="3">
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="BrandOrMake" VisibleIndex="4">
			</dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="UserDepartment" VisibleIndex="5">
			</dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="UserSection" VisibleIndex="6">
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="Model" VisibleIndex="4" Visible="false">
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataDateColumn FieldName="LastCalibrationDate" VisibleIndex="7" PropertiesDateEdit-DisplayFormatString="dd-MM-yyyy">
			</dx:GridViewDataDateColumn>
			<dx:GridViewDataDateColumn FieldName="NextCalibrationDate" VisibleIndex="8" Visible="true" PropertiesDateEdit-DisplayFormatString="dd-MM-yyyy">
			</dx:GridViewDataDateColumn>
           <%-- <dx:GridViewDataTextColumn FieldName="ReportPDF" VisibleIndex="10">
                    <DataItemTemplate>
                    <asp:LinkButton ID="view" runat="server" CommandName="view">View Report</asp:LinkButton>
                </DataItemTemplate>
                </dx:GridViewDataTextColumn>--%>

             <dx:GridViewDataTextColumn FieldName="Model" VisibleIndex="9" Visible="false">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DateOfCommission" VisibleIndex="9" Visible="false">
                 <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="MasterEquipmentUsed" VisibleIndex="10" Visible="false">
                 <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CalibrationPeriod" VisibleIndex="11" Visible="false">
                 <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="QRCode" VisibleIndex="12" Visible="false">
                 <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="QRImage" VisibleIndex="13" Visible="false">
                 <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="CaptureImage" VisibleIndex="14" Visible="false">
                 <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Description" VisibleIndex="15" Visible="false">
                 <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Createdby" VisibleIndex="16" Visible="false">
                 <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Createddate" VisibleIndex="17" Visible="false">
                 <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PastCalibrationCertificate" VisibleIndex="18" Visible="false">
                 <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>

		</Columns>
		<SettingsPager>
			<AllButton Text="All">
			</AllButton>
			<NextPageButton Text="Next &gt;">
			</NextPageButton>
			<PrevPageButton Text="&lt; Prev">
			</PrevPageButton>
		</SettingsPager>
		<Settings ShowGroupPanel="True" ShowFilterRow="true" ShowFooter="true" />
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

	<asp:SqlDataSource ID="ds_instrument" runat="server" ConnectionString="<%$ ConnectionStrings:INSConnectionString %>"
        SelectCommand="SELECT InstrumentMaster.InstrumentID, InstrumentMaster.InstrumentName,InstrumentMaster.Range,SerialNumber, InstrumentMaster.BrandOrMake,UserDepartment,UserSection, InstrumentMaster.Model,  CalibrationHistory.LastCalibrationDate, CalibrationHistory.NextCalibrationDate,ReportPDF,InstrumentMaster.Model,InstrumentMaster.DateOfCommission,InstrumentMaster.MasterEquipmentUsed,InstrumentMaster.CalibrationPeriod,InstrumentMaster.QRCode,InstrumentMaster.QRImage,InstrumentMaster.CaptureImage,InstrumentMaster.Description,Createdby,InstrumentMaster.Createddate,PastCalibrationCertificate  FROM InstrumentMaster  
		INNER JOIN CalibrationHistory ON CalibrationHistory.InstrumentID = InstrumentMaster.InstrumentID
		where CalibrationHistory.CalibrationHisDate between @startdate and @enddate">
		<SelectParameters>
			<asp:SessionParameter SessionField="startdate" Name="startdate" />
			<asp:SessionParameter SessionField="enddate"  Name="enddate"/>
		</SelectParameters>
	</asp:SqlDataSource>
	</div>
	  <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" Landscape="True" LeftMargin="0" MaxColumnWidth="150" RightMargin="0" BottomMargin="0">
    </dx:ASPxGridViewExporter>
<br />

    <div class="row">
    <div class="pull-right">
        <span class="pull-left btns">
     <dx:ASPxButton ID="Work_Report_Excel" runat="server" 
                   CssClass="btn btn-xs btn-default"
                    style="float:left"  
                    onclick="Work_Report_Excel_Click">
         <Image Url="~/Images/Excel-icon.png" Width="20px"></Image>
                </dx:ASPxButton>
            </span>
        <span class="pull-right btns">
      <dx:ASPxButton ID="Work_Report_PDF" runat="server" 
                   CssClass="btn btn-xs btn-default"
                    
                    style="margin-left: 0px" 
                    onclick="Work_Report_PDF_Click" Wrap="True">
                <Image Url="~/Images/pdficon_large.gif" Width="20px"></Image>
                </dx:ASPxButton>
            </span>
        </div>
        </div>
	

    <strong>
        View Work Report :
    </strong>
    <br />
    <dx:ASPxGridView ID="grid_report" runat="server" Width="100%"  AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="DailyReportID" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass">
        <Columns>
          <%--  <dx:GridViewDataTextColumn Caption="Edit" VisibleIndex="0">
                <DataItemTemplate>
                <asp:LinkButton CommandName="Edit" ID="Edit" runat="server">Edit</asp:LinkButton>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>--%>
             <dx:GridViewDataTextColumn FieldName="DailyReportID" VisibleIndex="0" Visible="false">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="DailyReportMessage" VisibleIndex="1" Caption="Job Description">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Remarks" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="Date" VisibleIndex="3" Caption="Reported Date" PropertiesDateEdit-DisplayFormatString="dd-MM-yyyy">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="USR_NAME" VisibleIndex="4" Caption="Name">
            </dx:GridViewDataTextColumn>
        </Columns>
        <Settings ShowFilterRow="True" ShowGroupPanel="True" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:INSConnectionString %>" SelectCommand="select DailyReportID,DailyReportMessage,Remarks,DailyReport.Created_date as Date,USR_NAME  from DailyReport 
inner join tblUSER on DailyReport.EmployeeID=tblUSER.USR_ID where DailyReport.Created_date between @startdate and @enddate">
        <SelectParameters>
			<asp:SessionParameter SessionField="startdate" Name="startdate" />
			<asp:SessionParameter SessionField="enddate"  Name="enddate"/>
		</SelectParameters>
    </asp:SqlDataSource>

    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter2" runat="server" GridViewID="grid_report"  >
    </dx:ASPxGridViewExporter>

    <br />
    <br />
</asp:Content>

