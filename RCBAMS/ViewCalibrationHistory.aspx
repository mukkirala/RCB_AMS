<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.master" AutoEventWireup="true" CodeFile="ViewCalibrationHistory.aspx.cs" Inherits="ViewCalibrationHistory" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
	<style type="text/css">
		.auto-style7 {
			width: 183px;
		}
		.auto-style8 {
			width: 187px;
		}
        .btns{
            margin:5px;
        }
		.auto-style9 {
			width: 82px;
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
     <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" Landscape="True" LeftMargin="0" MaxColumnWidth="150" RightMargin="0" BottomMargin="0" GridViewID="ASPxGridView1">
    </dx:ASPxGridViewExporter>
    <table class="nav-justified">
        <tr>
            <td class="auto-style7">&nbsp;</td>
            <td class="auto-style8">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="4"><strong>View Calibration History</strong></td>
        </tr>
		</table>
	<table>
		<tr>
			<td class="auto-style21">
				
				Select Department <span style="color: rgb(29, 33, 41); font-family: Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">:</span></td>
			<td class="auto-style22">
				<dx:ASPxComboBox ID="cmb_dept"  runat="server" OnSelectedIndexChanged="cmb_dept_SelectedIndexChanged"  Height="25px"  Width="100%"  ValueType="System.Int32" AutoPostBack="True" DataSourceID="SqlDataSource3" TextField="DepartmentName" ValueField="DepartmentID" IncrementalFilteringMode="StartsWith">
					<ValidationSettings ErrorTextPosition="Bottom" ValidationGroup="btn">
						<RequiredField IsRequired="true" ErrorText="Please Select the Department" />
					</ValidationSettings>
                </dx:ASPxComboBox>
				<%--<dx:ASPxGridLookup ID="cmb_dept" runat="server" IncrementalFilteringMode="Contains"  DataSourceID="SqlDataSource3" TextField="DepartmentName" AutoPostBack="true"  ValueField="DepartmentID" KeyFieldName="DepartmentID" Width="100%">
					<GridViewProperties>
					<Settings ShowFilterRow="True" />
						</GridViewProperties>
					<Columns>
						<dx:GridViewDataTextColumn FieldName="DepartmentID" VisibleIndex="0">
							<Settings AutoFilterCondition="Contains" />
						</dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="DepartmentName" VisibleIndex="1">
							<Settings AutoFilterCondition="Contains" />
						</dx:GridViewDataTextColumn>
						
                    </Columns>
					<ValidationSettings ErrorTextPosition="Bottom" ValidationGroup="btn">
						<RequiredField IsRequired="true" ErrorText="Please Select the Department" />
					</ValidationSettings>
				</dx:ASPxGridLookup>--%>
				<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:INSConnectionString %>" SelectCommand="SELECT [DepartmentID], [DepartmentName], [DepartmentCode], [Status] FROM [DepartmentMaster]"></asp:SqlDataSource>
			</td>
			<td class="auto-style9"></td>
			<td class="auto-style76">Select Section <span style="color: rgb(29, 33, 41); font-family: Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">:</span></td>
			<td class="auto-style23">
				<dx:ASPxComboBox ID="cmb_Section"  runat="server" Height="25px" Width="100%" OnSelectedIndexChanged="cmb_Section_SelectedIndexChanged" ValueType="System.Int32" AutoPostBack="True" DataSourceID="SqlDataSource2" TextField="SectionName" ValueField="SectionID" IncrementalFilteringMode="StartsWith">
					<ValidationSettings ErrorTextPosition="Bottom" ValidationGroup="btn">
						<RequiredField IsRequired="true" ErrorText="Please Select the Section" />
					</ValidationSettings>
                </dx:ASPxComboBox>
				<%--<dx:ASPxGridLookup ID="cmb_Section" runat="server" IncrementalFilteringMode="Contains"  DataSourceID="SqlDataSource2" TextField="SectionName" AutoPostBack="true"  ValueField="SectionID" KeyFieldName="SectionID" Width="100%">
					<GridViewProperties>
					<Settings ShowFilterRow="True" />
						</GridViewProperties>
					<Columns>
						<dx:GridViewDataTextColumn FieldName="SectionID" VisibleIndex="0">
							<Settings AutoFilterCondition="Contains" />
						</dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="SectionName" VisibleIndex="1">
							<Settings AutoFilterCondition="Contains" />
						</dx:GridViewDataTextColumn>
						
                    </Columns>
					<ValidationSettings ErrorTextPosition="Bottom" ValidationGroup="btn">
						<RequiredField IsRequired="true" ErrorText="Please Select the Section" />
					</ValidationSettings>
				</dx:ASPxGridLookup>--%>
				<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:INSConnectionString %>" SelectCommand="SELECT [SectionID], [SectionName], [DepartmentID], [Created_date], [Status] FROM [SectionMaster] where DepartmentID=@DepartmentID">
					<SelectParameters>
						<asp:ControlParameter ControlID="cmb_dept" Name="DepartmentID" />
					</SelectParameters>
				</asp:SqlDataSource>
			</td>
			<td class="auto-style24"></td>
		</tr>
        <tr>
			<td class="auto-style21">
				
				Select Instrument Type <span style="color: rgb(29, 33, 41); font-family: Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">:</span></td>
			<td class="auto-style22">
				<dx:ASPxComboBox ID="cmb_instrumenttype"  runat="server" Height="25px" Width="100%" OnSelectedIndexChanged="cmb_instrumenttype_SelectedIndexChanged"  DataSourceID="Ds_InstrumentType" TextField="InstrumentTypeName" ValueField="InstrumentTypeID" AutoPostBack="true" IncrementalFilteringMode="StartsWith">
                <ValidationSettings ValidationGroup="btn" ErrorTextPosition="Bottom">
					<RequiredField IsRequired="true" ErrorText="Please Select the InstrumentType" />
                </ValidationSettings>
				</dx:ASPxComboBox>
				<%--<dx:ASPxGridLookup ID="cmb_instrumenttype" runat="server" IncrementalFilteringMode="Contains"  DataSourceID="Ds_InstrumentType" TextField="InstrumentTypeName" AutoPostBack="true"  ValueField="InstrumentTypeID" KeyFieldName="InstrumentTypeID" OnTextChanged="cmb_instrumenttype_TextChanged1" Width="100%">
					<GridViewProperties>
					<Settings ShowFilterRow="True" />
						</GridViewProperties>
					<Columns>
						<dx:GridViewDataTextColumn FieldName="InstrumentTypeID" VisibleIndex="0">
							<Settings AutoFilterCondition="Contains" />
						</dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="InstrumentTypeName" VisibleIndex="1">
							<Settings AutoFilterCondition="Contains" />
						</dx:GridViewDataTextColumn>
						
                    </Columns>
					<ValidationSettings ErrorTextPosition="Bottom" ValidationGroup="btn">
						<RequiredField IsRequired="true" ErrorText="Please Select the InstrumentType" />
					</ValidationSettings>
				</dx:ASPxGridLookup>--%>
				<asp:SqlDataSource ID="Ds_InstrumentType" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:INSConnectionString %>" 
                    SelectCommand="select distinct InstrumentMaster.InstrumentTypeID,InstrumentTypeName from InstrumentMaster inner Join InstrumentTypeMaster on InstrumentTypeMaster.InstrumentTypeID=InstrumentMaster.InstrumentTypeID where SectionID=@SectionID order by InstrumentTypeName Asc">
		<SelectParameters>
			<asp:ControlParameter ControlID="cmb_Section" Name="SectionID" />
		</SelectParameters>
                </asp:SqlDataSource>
			</td>
			<td class="auto-style9"></td>
            <td class="auto-style7">Select Instrument :</td>
            <td class="auto-style8">
				<dx:ASPxComboBox ID="cmb_instrument" runat="server" Height="25px" IncrementalFilteringMode="StartsWith" DropDownWidth="550px" AutoPostBack="true"  ValueType="System.Int32" DataSourceID="SqlDataSource1" TextField="InstrumentName" ValueField="InstrumentID" >
                    
					<Columns>
						<dx:ListBoxColumn FieldName="InstrumentName" Width="100%" />
                        <dx:ListBoxColumn FieldName="BrandOrMake" Width="100%" />
                        <dx:ListBoxColumn FieldName="SerialNumber" Width="100%" />
                        <dx:ListBoxColumn FieldName="Model" Width="100%" />
                    </Columns>
                </dx:ASPxComboBox>
				<%--<dx:ASPxGridLookup ID="cmb_instrument" runat="server" IncrementalFilteringMode="Contains"  DataSourceID="SqlDataSource1" TextField="InstrumentName" AutoPostBack="true"  ValueField="InstrumentID" KeyFieldName="InstrumentID">
					<GridViewProperties>
					<Settings ShowFilterRow="True" />
						</GridViewProperties>
					<Columns>
						<dx:GridViewDataTextColumn FieldName="InstrumentName" VisibleIndex="0">
							<Settings AutoFilterCondition="Contains" />
						</dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="BrandOrMake" VisibleIndex="1">
							<Settings AutoFilterCondition="Contains" />
						</dx:GridViewDataTextColumn>
						<dx:GridViewDataTextColumn FieldName="SerialNumber" VisibleIndex="2">
							<Settings AutoFilterCondition="Contains" />
						</dx:GridViewDataTextColumn>
						<dx:GridViewDataTextColumn FieldName="Model" VisibleIndex="3">
							<Settings AutoFilterCondition="Contains" />
						</dx:GridViewDataTextColumn>
                    </Columns>
				</dx:ASPxGridLookup>--%>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:INSConnectionString %>"
	SelectCommand="select InstrumentID,InstrumentName,BrandOrMake,SerialNumber,UserSection,UserDepartment,DateOfLastCalibration,Model From InstrumentMaster
inner join InstrumentTypeMaster on InstrumentTypeMaster.InstrumentTypeID=InstrumentMaster.InstrumentTypeID
 where (InstrumentMaster.InstrumentTypeID=@InstrumentTypeID) and InstrumentMaster.SectionID=@SectionID ">
					<SelectParameters>
					<asp:ControlParameter ControlID="cmb_instrumenttype" Name="InstrumentTypeID" />
					<asp:ControlParameter ControlID="cmb_Section" Name="SectionID" />
					<%--<asp:SessionParameter SessionField="todaydate" Name="todaydate" />--%>
                </SelectParameters>
                </asp:SqlDataSource>
            </td>
			<td class="auto-style24"></td>
           <%-- <td>
				
			</td>
            <td>&nbsp;</td>--%>
        </tr>
        
    </table>
    <br />
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
   
    <br/>
    <%--<dx:ASPxGridView ID="grid_instrument" runat="server" AutoGenerateColumns="False" OnRowCommand="grid_instrument_RowCommand" DataSourceID="DS_instrument" KeyFieldName="InstrumentID" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass">
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="0">
                <ClearFilterButton Visible="True">
                </ClearFilterButton>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="InstrumentID" ReadOnly="True" VisibleIndex="1" Visible="false">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="InstrumentName" VisibleIndex="1">
                 <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="SerialNumber" VisibleIndex="3">
                 <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Model" VisibleIndex="4" Visible="false">
                 <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="BrandOrMake" VisibleIndex="4">
                 <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="UserSection" VisibleIndex="6">
                 <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="UserDepartment" VisibleIndex="5">
                 <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Range" VisibleIndex="2" Visible="true">
                 <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="MasterEquipmentUsed" VisibleIndex="9" Visible="false">
                 <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn FieldName="DateOfLastCalibration" VisibleIndex="7">
                 <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="NextCalibrationDate" VisibleIndex="9">
                 <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>

			<dx:GridViewDataTextColumn FieldName="InstrumentStatus" VisibleIndex="10">
                 <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CertificateNo" VisibleIndex="8">
                 <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
                  <dx:GridViewDataTextColumn FieldName="ReportPDF" VisibleIndex="12" Visible="true">
                 <DataItemTemplate>
                    <asp:LinkButton ID="view" runat="server" CommandName="view">View Report</asp:LinkButton>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
        </Columns>
        <Settings ShowFilterRow="True" ShowGroupPanel="True" />
        <SettingsDetail ShowDetailRow="true" />
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
        <Templates><DetailRow>
         <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="DS_INS3" OnBeforePerformDataSelect="ASPxGridView1_BeforePerformDataSelect" KeyFieldName="InstrumentID">
        <Columns>
           <dx:GridViewDataDateColumn FieldName="BodyCondition" VisibleIndex="1">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="MissingParts" VisibleIndex="2">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="InsInspected" VisibleIndex="3" Visible="true">
            </dx:GridViewDataTextColumn>
			  <dx:GridViewDataDateColumn FieldName="InsDismantled" VisibleIndex="4">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="Lubricated" VisibleIndex="5">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="InsCaliRange" VisibleIndex="6" Visible="true">
            </dx:GridViewDataTextColumn>
			 <dx:GridViewDataTextColumn FieldName="CalibrationHisDate" VisibleIndex="7" Visible="true">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="LastCalibrationDate" VisibleIndex="8">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="NextCalibrationDate" VisibleIndex="9">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="InstrumentStatus" VisibleIndex="10" Visible="false">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataDateColumn FieldName="CertificateNo" VisibleIndex="11">
            </dx:GridViewDataDateColumn>
     
        </Columns>
    </dx:ASPxGridView>
            </DetailRow>
            </Templates>
    </dx:ASPxGridView>--%>

	<dx:ASPxGridView ID="ASPxGridView1" ClientInstanceName="grid" runat="server" OnRowCommand="ASPxGridView1_RowCommand" OnCustomUnboundColumnData="ASPxGridView1_CustomUnboundColumnData" AutoGenerateColumns="False" DataSourceID="ds_instrument" KeyFieldName="InstrumentID" Width="1149px" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass">
		<TotalSummary>
            <dx:ASPxSummaryItem FieldName="InstrumentName" SummaryType="Count" />
		</TotalSummary>
        <GroupSummary>
             <dx:ASPxSummaryItem FieldName="InstrumentName" SummaryType="Count" />
        </GroupSummary>
        <Columns>
			<%--<dx:GridViewCommandColumn VisibleIndex="0">
				<ClearFilterButton Visible="True">
				</ClearFilterButton>
			</dx:GridViewCommandColumn>--%>
			<dx:GridViewDataTextColumn FieldName="Number" Caption="S.No." VisibleIndex="0" UnboundType="String"></dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="CalibrateHistoryID" Visible="false" ReadOnly="True" VisibleIndex="1">
				<EditFormSettings Visible="False" />
			</dx:GridViewDataTextColumn>
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
			<dx:GridViewDataDateColumn FieldName="LastCalibrationDate" VisibleIndex="7">
			</dx:GridViewDataDateColumn>
			<dx:GridViewDataDateColumn FieldName="NextCalibrationDate" VisibleIndex="8" Visible="true">
			</dx:GridViewDataDateColumn>

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

            <dx:GridViewDataTextColumn FieldName="ReportPDF" VisibleIndex="10">
                    <DataItemTemplate>
                    <asp:LinkButton ID="view" runat="server" CommandName="view">View Report</asp:LinkButton>
                </DataItemTemplate>
                </dx:GridViewDataTextColumn>
		</Columns>
        <Settings ShowFilterRow="true" ShowFooter="true" ShowGroupPanel="true" />
		<SettingsPager>
			<AllButton Text="All">
			</AllButton>
			<NextPageButton Text="Next &gt;">
			</NextPageButton>
			<PrevPageButton Text="&lt; Prev">
			</PrevPageButton>
		</SettingsPager>
		<Settings ShowGroupPanel="True" ShowFilterRow="True" />
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

    <asp:SqlDataSource ID="ds_instrument" runat="server" ConnectionString="<%$ ConnectionStrings:INSConnectionString %>" SelectCommand="Select  CalibrateHistoryID,InstrumentMaster.InstrumentID,InstrumentName,SerialNumber,Model,BrandOrMake,UserSection,UserDepartment,Range,EquipmentName as MasterEquipmentUsed,InstrumentStatus,CertificateNo,ReportPDF,CalibrationHistory.LastCalibrationDate,NextCalibrationDate,InstrumentMaster.Model,InstrumentMaster.DateOfCommission,InstrumentMaster.MasterEquipmentUsed,InstrumentMaster.CalibrationPeriod,InstrumentMaster.QRCode,InstrumentMaster.QRImage,InstrumentMaster.CaptureImage,InstrumentMaster.Description,Createdby,InstrumentMaster.Createddate,PastCalibrationCertificate  from CalibrationHistory
 left join InstrumentMaster on CalibrationHistory.InstrumentID=InstrumentMaster.InstrumentID
 left join InstrumentTypeMaster on InstrumentTypeMaster.InstrumentTypeID=InstrumentMaster.InstrumentTypeID
 left join MasterEquipment on MasterEquipment.EquipmentID=InstrumentMaster.MasterEquipmentUsed
 where InstrumentMaster.InstrumentID=@InstrumentID">
		<SelectParameters>
			<asp:ControlParameter ControlID="cmb_instrument" Name="InstrumentID" />
		</SelectParameters>
    </asp:SqlDataSource>
     <asp:SqlDataSource ID="DS_INS3" runat="server" ConnectionString="<%$ ConnectionStrings:INSConnectionString %>" SelectCommand="Select distinct BodyCondition,MissingParts,InsInspected,InsDismantled,Lubricated,InsCaliRange,CalibrationHisDate, CalibrationHistory.LastCalibrationDate,CalibrationHistory.NextCalibrationDate,InstrumentStatus,CertificateNo from CalibrationHistory
 inner join InstrumentMaster on CalibrationHistory.InstrumentID=InstrumentMaster.InstrumentID
 inner join InstrumentTypeMaster on InstrumentTypeMaster.InstrumentTypeID=InstrumentMaster.InstrumentTypeID
 where CalibrationHistory.InstrumentID=@InstrumentID 
 group by InstrumentStatus, CalibrationHistory.LastCalibrationDate,CalibrationHistory.NextCalibrationDate,BodyCondition,MissingParts,InsInspected,InsDismantled,Lubricated,InsCaliRange,CalibrationHisDate,CertificateNo">
         <SelectParameters>
             <asp:SessionParameter SessionField="InstrumentID" Name="InstrumentID" />
         </SelectParameters>
     </asp:SqlDataSource>
    <br />

</asp:Content>

