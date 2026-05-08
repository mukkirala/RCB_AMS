<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.master" AutoEventWireup="true" CodeFile="AddInstrument.aspx.cs" Inherits="AddInstrument" %>

<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx1" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridLookup" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v11.1" namespace="DevExpress.Web.ASPxPanel" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script>
        function UserConfirmation() {
            return confirm("Do you want to delete?");
        }

    </script>
    <style type="text/css">
        .auto-style19 {
            font-size: medium;
            color: #000000;
        }

        .style1 {
            box-shadow: -4px 6px 23px -5px rgba(0,0,0,0.2);
            width: 100%;
            height: 450px;
        }

        .auto-style68 {
            width: 94%;
            margin-left: 48px;
            height: 450px;
            margin-right: 48px;
        }

        .auto-style71 {
            width: 197px;
        }

        .auto-style82 {
            width: 233px
        }

        .auto-style86 {
            width: 16px
        }

        .auto-style87 {
            width: 216px
        }

        .auto-style88 {
            width: 248px
        }

        .btns {
            margin: 5px;
        }

        .auto-style89 {
            width: 197px;
            height: 35px;
        }

        .auto-style90 {
            width: 248px;
            height: 35px;
        }

        .auto-style91 {
            width: 16px;
            height: 35px;
        }

        .auto-style92 {
            width: 216px;
            height: 35px;
        }

        .auto-style93 {
            width: 233px;
            height: 35px;
        }

        .auto-style94 {
            height: 35px;
        }
    </style>
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <br />
    <strong style="margin-left: 55px"><span class="auto-style19">Add Instruments
    
    </span></strong>

    <br />

    <div class="style1">
        <br />
        <table class="auto-style68">

            <tr>
                <td class="auto-style71">Date &amp; Time </td>
                <td class="auto-style88">
                    <dx:ASPxLabel ID="lbl_date" runat="server" Text="" Style="color: #3333FF">
                    </dx:ASPxLabel>
                </td>
                <td class="auto-style86">&nbsp;</td>
                <td class="auto-style87"><span runat="server" visible="false">Created By</span></td>
                <td class="auto-style82">
                    <dx:ASPxComboBox ID="cmb_createdby" Width="100%" Height="25px" runat="server"
                        ValueField="USR_ID" TextField="USR_NAME" TextFormatString="{1}"
                        DataSourceID="CreatedByDS" ValueType="System.Int32" Visible="false">
                        <Columns>
                            <dx:ListBoxColumn FieldName="USR_ID" />
                            <dx:ListBoxColumn FieldName="USR_NAME" />
                        </Columns>
                    </dx:ASPxComboBox>
                </td>
                <td class="auto-style104">&nbsp;</td>
                <td class="auto-style62" rowspan="8">
                    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" Visible="false" runat="server" Height="104px" Width="129px" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" GroupBoxCaptionOffsetY="-18px" HeaderText="Image" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                        <ContentPaddings PaddingBottom="8px" />
                        <PanelCollection>
                            <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                                <dx:ASPxImage ID="AspxImage2" runat="server" Visible="false" Height="106px" Width="147px">
                                </dx:ASPxImage>
                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxRoundPanel>
                </td>
                <td class="style25" rowspan="8">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style71">User Department<span style="color: red">*</span></td>
                <td class="auto-style88">
                    <dx:ASPxComboBox ID="cmb_department" runat="server" DataSourceID="DS_Department" Width="100%" Height="25px"
                        TextField="DepartmentName" ValueField="DepartmentID" ValueType="System.Int32" IncrementalFilteringMode="StartsWith"
                        AutoPostBack="true" OnSelectedIndexChanged="cmb_department_SelectedIndexChanged">
                        <Columns>
                            <%-- <dx:ListBoxColumn FieldName="DepartmentID" />--%>
                            <dx:ListBoxColumn FieldName="DepartmentName" />
                        </Columns>
                        <ValidationSettings ErrorTextPosition="Bottom" ValidationGroup="btn">
                            <RequiredField ErrorText="Please select the Department" IsRequired="true" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                    <%--<dx:ASPxGridLookup ID="cmb_department" runat="server" Width="100%" DataSourceID="DS_Department" TextField="DepartmentName" AutoPostBack="true"  ValueField="DepartmentID" KeyFieldName="DepartmentID" Height="16px">
					<GridViewProperties>
					<Settings ShowFilterRow="True" />
						</GridViewProperties>
					<Columns>
						<dx:GridViewDataTextColumn FieldName="DepartmentID" VisibleIndex="0">
							<Settings AutoFilterCondition="Contains" />
						</dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="DepartmentName" VisibleIndex="1">
							<Settings AutoFilterCondition="BeginsWith" />
						</dx:GridViewDataTextColumn>
                    </Columns>
							<ValidationSettings ErrorTextPosition="Bottom" ValidationGroup="btn">
							<RequiredField ErrorText="Please select the Department" IsRequired="true" />
						</ValidationSettings>
				</dx:ASPxGridLookup>--%>
                </td>
                <td class="auto-style86">&nbsp;</td>
                <td class="auto-style87">User Section<span style="color: red">*</span></td>
                <td class="auto-style82">
                    <dx:ASPxComboBox ID="cmb_section" runat="server" DataSourceID="DS_Section" Height="25px" TextField="SectionName" Width="100%"
                        ValueField="SectionID" ValueType="System.String" IncrementalFilteringMode="StartsWith" AutoPostBack="true" OnSelectedIndexChanged="cmb_section_SelectedIndexChanged">
                        <%--<Columns>
                              
                                <dx:ListBoxColumn FieldName="SectionName"  />
                            </Columns>--%>
                        <ValidationSettings ErrorTextPosition="Bottom" ValidationGroup="btn">
                            <RequiredField ErrorText="Please select the Section" IsRequired="true" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>

                    <%--<dx:ASPxGridLookup ID="cmb_section" runat="server" IncrementalFilteringMode="Contains" Width="100%" DataSourceID="DS_Section" TextField="SectionName" AutoPostBack="true"  ValueField="SectionID" KeyFieldName="SectionID">
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
							<RequiredField ErrorText="Please select the Section" IsRequired="true" />
						</ValidationSettings>
				</dx:ASPxGridLookup>--%>
                </td>
                <td class="auto-style104">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style71">
                    <%--<dx:ASPxLabel ID="lbl_instrumenttype" runat="server" Text="Instrument Type">
                        </dx:ASPxLabel>--%>
                        Instrument Type <span style="color: red">*</span>
                </td>
                <td class="auto-style88">
                    <dx:ASPxComboBox ID="cmb_assetgroup" runat="server" DataSourceID="AssetDS" Height="25px" IncrementalFilteringMode="StartsWith"
                        TextField="InstrumentTypeName" ValueField="InstrumentTypeID" ValueType="System.String" Width="100%" AutoPostBack="true" OnSelectedIndexChanged="cmb_assetgroup_SelectedIndexChanged">
                        <%-- <Columns>
                               
                                <dx:ListBoxColumn FieldName="InstrumentTypeName" />
                            </Columns>--%>
                        <ValidationSettings ErrorTextPosition="Bottom" ValidationGroup="btn">
                            <RequiredField ErrorText="Please select the Instrument Type" IsRequired="true" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                    <%--<dx:ASPxGridLookup ID="cmb_assetgroup" runat="server" IncrementalFilteringMode="Contains"  DataSourceID="AssetDS" TextField="InstrumentTypeName" AutoPostBack="true"  ValueField="InstrumentTypeID" KeyFieldName="InstrumentTypeID" Width="100%">
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
							<RequiredField ErrorText="Please select the Instrument Type" IsRequired="true" />
						</ValidationSettings>
				</dx:ASPxGridLookup>--%>
                </td>
                <td class="auto-style86">&nbsp;</td>
                <td class="auto-style87">Instrument Status<span style="color:red">*</span></td>
                <td class="auto-style82">
                    <dx:ASPxComboBox ID="cmb_status" runat="server" Width="100%">
                        <%--<Columns>
                              
                                <dx:ListBoxColumn FieldName="SectionName"  />
                            </Columns>--%>
                        <ValidationSettings ErrorTextPosition="Bottom" ValidationGroup="btn">
                            <RequiredField ErrorText="Please select the Instrument Status" IsRequired="true" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>

                    </td>
                <td class="auto-style105"></td>
            </tr>
            <tr>
                <td class="auto-style71">Brand Or Make <span style="color: red">*</span> </td>
                <td class="auto-style88">
                    <dx:ASPxTextBox ID="txt_brand" runat="server" Height="25px" Width="100%">
                        <ValidationSettings ErrorTextPosition="Bottom" ValidationGroup="btn">
                            <RequiredField ErrorText="Please Enter the Brand" IsRequired="true" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style86">&nbsp;</td>
                <td class="auto-style87">Model </td>
                <td class="auto-style82">
                    <dx:ASPxTextBox ID="txt_model" runat="server" Height="25px" Width="100%">
                        
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style106"></td>
            </tr>
            <tr>
                <td class="auto-style71">Serial Number <span style="color: red">*</span></td>
                <td class="auto-style88">
                    <dx:ASPxTextBox ID="txt_serialno" runat="server" Height="25px" Width="100%">
                        <ValidationSettings ErrorTextPosition="Bottom" ValidationGroup="btn">
                            <RequiredField ErrorText="Please Enter the Serial No." IsRequired="true" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style86">&nbsp;</td>
                <td class="auto-style87">Range<span style="color: red">*</span></td>
                <td class="auto-style82">
                    <dx:ASPxTextBox ID="txt_from" runat="server" Height="25px" Width="100%">
                        <ValidationSettings ErrorTextPosition="Bottom" ValidationGroup="btn">
                            <RequiredField ErrorText="Please Enter the Range" IsRequired="true" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style107">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style71">Date Of Commission </td>
                <td class="auto-style88">
                    <dx:ASPxDateEdit ID="ASPxDateEdit1" runat="server" DisplayFormatString="dd-MM-yyyy" Height="25px" Width="100%">
                    
                    </dx:ASPxDateEdit>
                </td>
                <td class="auto-style86">&nbsp;</td>
                <td class="auto-style87">Date of Last Calibration<span style="color: red">*</span></td>
                <td class="auto-style82">
                    <dx:ASPxDateEdit ID="ASPxDateEdit2" runat="server" DisplayFormatString="dd-MM-yyyy" Height="25px" Width="100%">
                        <ValidationSettings ErrorTextPosition="Bottom" ValidationGroup="btn">
                            <RequiredField ErrorText="Please select the Last Calibration" IsRequired="true" />
                        </ValidationSettings>
                    </dx:ASPxDateEdit>
                </td>
                <td class="auto-style107">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style71">Calibration Period(In Months) <span style="color: red">*</span></td>
                <td class="auto-style88">
                    <dx:ASPxTextBox ID="txt_calibration" runat="server" Width="100%" Text="12">
                        <ValidationSettings ErrorTextPosition="Bottom" ValidationGroup="btn">
                            <RequiredField ErrorText="Please Enter the CalibrationPeriod" IsRequired="true" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style86">&nbsp;</td>
                <td class="auto-style87">&nbsp;</td>
                <td class="auto-style82"></td>
                <td class="auto-style108"></td>
            </tr>
            <tr>
                <td class="auto-style89">Description</td>
                <td class="auto-style90">
                    <dx:ASPxMemo ID="memo_desc" runat="server" Height="25px" Width="100%">
                    </dx:ASPxMemo>
                </td>
                <td class="auto-style91"></td>
                <td class="auto-style92"></td>
                <td class="auto-style93"></td>
                <td class="auto-style94"></td>
            </tr>
            <tr>
                <td class="auto-style71">&nbsp;</td>
                <td class="auto-style88">
                    <dx:ASPxButton ID="btn_save" ValidationGroup="btn" runat="server" CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" Height="25px" OnClick="btn_save_Click1" SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Save" Width="102px">
                    </dx:ASPxButton>
                    <dx:ASPxButton ID="btn_update" runat="server" CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" OnClick="btn_update_Click1" SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Update" Visible="False" Width="102px">
                    </dx:ASPxButton>
                </td>
                <td class="auto-style86">&nbsp;</td>
                <td class="auto-style87">&nbsp;</td>
                <td class="auto-style82">
                    <dx:ASPxTextBox ID="txt_accessories" runat="server" Visible="false" Width="170px" Height="25px"
                        MaxLength="2">
                    </dx:ASPxTextBox>
                    <br />
                </td>
                <td class="auto-style104"><span runat="server" visible="false">Image Of the Instrument</span></td>
                <td class="auto-style62">
                    <asp:FileUpload Visible="false" ID="Upload_image" runat="server" class="btn btn-primary rounded-btn mr-0 mr-md-3 mb-3 mb-md-0" Font-Size="12px" onchange="this.form.submit()" ToolTip="Browse Photo" ViewStateMode="Enabled" Width="199px" />
                </td>
                <td class="style25">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style71">&nbsp;</td>
                <td class="auto-style88">&nbsp;</td>
                <td class="auto-style86">&nbsp;</td>
                <td class="auto-style87">&nbsp;</td>
                <td class="auto-style82">
                    <asp:SqlDataSource ID="DS_Department" runat="server" ConnectionString="<%$ ConnectionStrings:INSConnectionString %>" SelectCommand="SELECT [DepartmentID], [DepartmentName] FROM [DepartmentMaster] where Status='Active'"></asp:SqlDataSource>
                </td>
                <td class="auto-style104">&nbsp;</td>
                <td class="auto-style62">&nbsp;</td>
                <td class="style25">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style71">
                    <dx:ASPxImage ID="ASPxImage1" runat="server" Visible="false">
                    </dx:ASPxImage>
                </td>
                <td class="auto-style88">&nbsp;</td>
                <td class="auto-style86">&nbsp;</td>
                <td class="auto-style87">
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:INSConnectionString %>" SelectCommand="SELECT [UnitNo], [UnitCode], [UnitName] FROM [UnitMaster]"></asp:SqlDataSource>
                </td>
                <td class="auto-style82">
                    <asp:SqlDataSource ID="AssetDS" runat="server"
                        ConnectionString="<%$ ConnectionStrings:INSConnectionString %>"
                        SelectCommand="select distinct InstrumentMaster.InstrumentTypeID,InstrumentTypeName from InstrumentMaster inner Join InstrumentTypeMaster on InstrumentTypeMaster.InstrumentTypeID=InstrumentMaster.InstrumentTypeID where SectionID=@SectionID">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="cmb_section" Name="SectionID" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td class="auto-style104">&nbsp;</td>
                <td class="auto-style62">&nbsp;</td>
                <td class="style25">&nbsp;</td>
            </tr>
        </table>
    </div>
    <br />

    <span class="auto-style19"><strong>View/Edit Instruments</strong></span><br />
    <br />
    <div class="row">
        <div class="pull-right">
            <span class="pull-left btns">
                <dx:ASPxButton ID="btnXLSX" runat="server"
                    CssClass="btn btn-xs btn-default"
                    Style="float: left"
                    OnClick="btnXLSX_Click">
                    <Image Url="~/Images/Excel-icon.png" Width="20px"></Image>
                </dx:ASPxButton>
            </span>
            <span class="pull-right btns">
                <dx:ASPxButton ID="btnPDF" runat="server"
                    CssClass="btn btn-xs btn-default"
                    Style="margin-left: 0px"
                    OnClick="btnPDF_Click">
                    <Image Url="~/Images/pdficon_large.gif" Width="20px"></Image>
                </dx:ASPxButton>
            </span>
        </div>
    </div>
   
    <br />
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" OnDataBound="ASPxGridView1_DataBound1" AutoGenerateColumns="False" OnRowCommand="ASPxGridView1_RowCommand" DataSourceID="DS_Instrument" KeyFieldName="InstrumentID" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass">
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="0" Visible="false">
                <ClearFilterButton Visible="True">
                </ClearFilterButton>

            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="InstrumentID" ReadOnly="True" VisibleIndex="1" Visible="false">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Edit" VisibleIndex="1">
                <DataItemTemplate>
                    <asp:LinkButton ID="btnlink" runat="server" Text="Edit" CommandName="Edit">Edit</asp:LinkButton>

                </DataItemTemplate>

            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn Caption="Delete" VisibleIndex="2">
                <DataItemTemplate>
                    <asp:LinkButton ID="btndelete" runat="server" Text="Delete" CommandName="Delete" OnClientClick="if ( ! UserConfirmation()) return false;">Delete</asp:LinkButton>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn FieldName="InstrumentTypeID" VisibleIndex="2" Visible="false">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="InstrumentName" VisibleIndex="3">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Range" VisibleIndex="4">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="SerialNumber" VisibleIndex="5">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="BrandOrMake" VisibleIndex="6">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Model" VisibleIndex="7">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="DateOfCommission" VisibleIndex="8" PropertiesDateEdit-DisplayFormatString="dd-MM-yyyy">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="DateOfLastCalibration" VisibleIndex="9" PropertiesDateEdit-DisplayFormatString="dd-MM-yyyy">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="UserDepartment" VisibleIndex="10">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="UserSection" VisibleIndex="11">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="SectionID" VisibleIndex="12" Visible="false">
            </dx:GridViewDataTextColumn>


            <dx:GridViewDataTextColumn FieldName="CalibrationPeriod" VisibleIndex="11" Visible="false">
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataDateColumn FieldName="DateOfNextCalibration" VisibleIndex="13" Visible="false">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="QRCode" VisibleIndex="14" Visible="false">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="QRImage" VisibleIndex="15">
                <Settings AutoFilterCondition="Contains" />
                <DataItemTemplate>
                    <dx:ASPxImage ID="img" runat="server" ImageUrl='<%# Eval("QRImage") %>' Height="80px" Width="150px"></dx:ASPxImage>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CaptureImage" VisibleIndex="16" Visible="false">
                <Settings AutoFilterCondition="Contains" />
                <DataItemTemplate>
                    <dx:ASPxImage ID="img1" runat="server" ImageUrl='<%# Eval("CaptureImage") %>' Height="80px" Width="140px"></dx:ASPxImage>
                </DataItemTemplate>

            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="MasterGuageUsed" VisibleIndex="17" Visible="false">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Description" VisibleIndex="18" Visible="false">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Createdby" VisibleIndex="19" Visible="false">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="Createddate" VisibleIndex="20" Visible="false">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="InstrumentStatus" VisibleIndex="21">
                <Settings AutoFilterCondition="Contains" />
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

    <asp:SqlDataSource ID="DS_Instrument" runat="server" ConnectionString="<%$ ConnectionStrings:INSConnectionString %>" SelectCommand="SELECT * FROM [InstrumentMaster] where Status='Active' "></asp:SqlDataSource>

    <br />

    <asp:SqlDataSource ID="SqlDSGrid" runat="server" ConnectionString="<%$ ConnectionStrings:INSConnectionString %>" SelectCommand="SELECT * FROM [InstrumentMaster]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDSSAP" runat="server"
        ConnectionString="<%$ ConnectionStrings:INSConnectionString %>"
        SelectCommand="SELECT [AssetSapID], [AssetSapCode] FROM [AssetSapMaster]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:INSConnectionString %>"
        SelectCommand="SELECT [UnitNo],UnitCode, [UnitName] FROM [UnitMaster]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="CreatedByDS" runat="server"
        ConnectionString="<%$ ConnectionStrings:INSConnectionString %>"
        SelectCommand="SELECT [USR_ID], [USR_NAME] FROM [tblUSER]"></asp:SqlDataSource>
    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1"   runat="server"
        Landscape="True" MaxColumnWidth="100" GridViewID="ASPxGridView1"
        LeftMargin="0" RightMargin="0" TopMargin="0">
    </dx:ASPxGridViewExporter>
    <asp:SqlDataSource ID="DS_Section" runat="server" ConnectionString="<%$ ConnectionStrings:INSConnectionString %>" SelectCommand="SELECT [SectionID], [SectionName] FROM [SectionMaster] where DepartmentID=@DepartmentID">
        <SelectParameters>
            <asp:ControlParameter ControlID="cmb_department" Name="DepartmentID" Type="Int32" />
        </SelectParameters>

    </asp:SqlDataSource>
    <br />
  
</asp:Content>


