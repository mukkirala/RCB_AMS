<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.master" AutoEventWireup="true" CodeFile="UploadPastCalibrationCertificate.aspx.cs" Inherits="UploadPastCalibrationCertificate" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridLookup" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
		.auto-style7 {
			width: 1079px;
		}
		.auto-style8 {
			width: 627px;
		}
		.auto-style10 {
            width: 429px;
        }
		.auto-style11 {
			width: 989px;
		}
	    .auto-style12 {
            width: 370px;
        }
        .auto-style13 {
            width: 79px;
        }
        .auto-style14 {
            width: 223px;
        }
	    .auto-style15 {
            width: 370px;
            height: 39px;
        }
        .auto-style16 {
            width: 429px;
            height: 39px;
        }
        .auto-style17 {
            width: 79px;
            height: 39px;
        }
        .auto-style18 {
            width: 223px;
            height: 39px;
        }
        .auto-style19 {
            width: 1079px;
            left: 0px;
            top: 2px;
            height: 39px;
        }
	    .auto-style20 {
            width: 451px;
            left: 0px;
            top: 2px;
        }
        .auto-style21 {
            width: 451px;
            left: 0px;
            top: 2px;
            height: 39px;
        }
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table class="auto-style11">
		<tr>
			<td class="auto-style8">&nbsp;<dx:ASPxLabel ID="lbl_msg" runat="server" Text="" ForeColor="Red"></dx:ASPxLabel>
            </td>
			
		</tr>
        <tr>
			<td class="auto-style8">
				<strong>Upload past Calibration Certificate</strong>
			</td>
			
		</tr>
		
		</table>
	<table class="nav-justified">
		<tr>
			<td class="auto-style12">Select Department :</td>
			<td class="auto-style10">
				<dx:ASPxComboBox ID="cmb_dept"  runat="server" Height="25px"  Width="100%"  ValueType="System.Int32" AutoPostBack="True" DataSourceID="SqlDataSource3" TextField="DepartmentName" IncrementalFilteringMode="Contains" ValueField="DepartmentID" OnSelectedIndexChanged="cmb_dept_SelectedIndexChanged">
					<ValidationSettings ErrorTextPosition="Bottom" ValidationGroup="btn">
						<RequiredField IsRequired="true" ErrorText="Please Select the Department" />
					</ValidationSettings>
                </dx:ASPxComboBox>
				<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:INSConnectionString %>" SelectCommand="SELECT [DepartmentID], [DepartmentName], [DepartmentCode], [Status] FROM [DepartmentMaster]"></asp:SqlDataSource></td>
			<td class="auto-style13">&nbsp;</td>
			<td class="auto-style14">Select Section :</td>
			<td class="auto-style20">
                <dx:ASPxComboBox ID="cmb_Section" IncrementalFilteringMode="Contains" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" Height="25px" TextField="SectionName" ValueField="SectionID" ValueType="System.Int32" Width="100%" OnSelectedIndexChanged="cmb_Section_SelectedIndexChanged">
                    <ValidationSettings ErrorTextPosition="Bottom" ValidationGroup="btn">
                        <RequiredField ErrorText="Please Select the Section" IsRequired="true" />
                    </ValidationSettings>
                </dx:ASPxComboBox>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:INSConnectionString %>" SelectCommand="SELECT [SectionID], [SectionName], [DepartmentID], [Created_date], [Status] FROM [SectionMaster] where DepartmentID=@DepartmentID">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cmb_dept" Name="DepartmentID" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
			<td class="auto-style7">
                &nbsp;</td>
		</tr>
		<tr>
			<td class="auto-style15">Select Insrtument Type:</td>
			<td class="auto-style16">
				<dx:ASPxComboBox ID="cmb_instrumenttype" runat="server" AutoPostBack="true" IncrementalFilteringMode="Contains" DataSourceID="Ds_InstrumentType" Height="25px" OnTextChanged="cmb_instrumenttype_TextChanged" TextField="InstrumentTypeName" ValueField="InstrumentTypeID" ValueType="System.Int32" Width="100%" OnSelectedIndexChanged="cmb_instrumenttype_SelectedIndexChanged">
                    <ValidationSettings ErrorTextPosition="Bottom" ValidationGroup="btn">
                        <RequiredField ErrorText="Please Select the InstrumentType" IsRequired="true" />
                    </ValidationSettings>
                </dx:ASPxComboBox>
            </td>
			<td class="auto-style17"></td>
			<td class="auto-style18">Select Instrument :</td>
			<td class="auto-style21">
				<dx:aspxcombobox ID="cmb_instrument1"  runat="server" Height="25px" IncrementalFilteringMode="Contains" Width="100%" ValueType="System.Int32" AutoPostBack="True" DataSourceID="SqlDataSource1" TextField="InstrumentName" ValueField="InstrumentID" >
					<Columns>
                        <dx:ListBoxColumn FieldName="InstrumentName" Width="100%" />
                        <dx:ListBoxColumn FieldName="SerialNumber" Width="100%" />
                        <dx:ListBoxColumn FieldName="Model" Width="100%" />
                        <dx:ListBoxColumn FieldName="BrandOrMake" Width="100%" />
                    </Columns>
                </dx:aspxcombobox>
				</td>
			<td class="auto-style19">&nbsp;</td>
		</tr>
		<tr>
			<td class="auto-style12">Select Date of Calibration:</td>
			<td class="auto-style10">
				<dx:ASPxDateEdit ID="date_calibration" runat="server" Width="100%" DisplayFormatString="dd-MM-yyyy" >
                </dx:ASPxDateEdit>
            </td>
			<td class="auto-style13">&nbsp;</td>
			<td class="auto-style14">&nbsp;</td>
			<td class="auto-style20">
				<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:INSConnectionString %>"
					SelectCommand="SELECT [InstrumentID], [InstrumentName], [SerialNumber], [BrandOrMake], [Model] FROM [InstrumentMaster] 
					inner join InstrumentTypeMaster on InstrumentMaster.InstrumentTypeID=InstrumentTypeMaster.InstrumentTypeID
					where InstrumentMaster.InstrumentTypeID=@InstrumentTypeID and InstrumentMaster.SectionID=@SectionID">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cmb_instrumenttype" Name="InstrumentTypeID" />
						<asp:ControlParameter ControlID="cmb_Section" Name="SectionID" />
                    </SelectParameters>
				</asp:SqlDataSource>
			</td>
			<td class="auto-style7">&nbsp;</td>
		</tr>
		<tr>
			<td class="auto-style12">Upload Calibration certificate :</td>
			<td class="auto-style10">
				<asp:FileUpload ID="FileUpload1" runat="server" />
			</td>
			<td class="auto-style13">&nbsp;</td>
			<td class="auto-style14">&nbsp;</td>
			<td class="auto-style20">&nbsp;</td>
			<td class="auto-style7">&nbsp;</td>
		</tr>
		<tr>
			<td class="auto-style12">&nbsp;</td>
			<td class="auto-style10">&nbsp;</td>
			<td class="auto-style13">&nbsp;</td>
			<td class="auto-style14">&nbsp;</td>
			<td class="auto-style20">&nbsp;</td>
			<td class="auto-style7">&nbsp;</td>
		</tr>
		<tr>
			<td class="auto-style12">&nbsp;</td>
			<td class="auto-style10">
	      <dx:ASPxButton ID="btn_save" runat="server" CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" Height="25px" OnClick="btn_save_Click" SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Save" Width="102px">
          </dx:ASPxButton>
			</td>
			<td class="auto-style13">&nbsp;</td>
			<td class="auto-style14"><asp:SqlDataSource ID="Ds_InstrumentType" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:INSConnectionString %>" 
                    SelectCommand="select distinct InstrumentMaster.InstrumentTypeID,InstrumentTypeName from InstrumentMaster inner Join InstrumentTypeMaster on InstrumentTypeMaster.InstrumentTypeID=InstrumentMaster.InstrumentTypeID where SectionID=@SectionID">
                <SelectParameters>
                    <asp:ControlParameter ControlID="cmb_Section" Name="SectionID" />
                </SelectParameters>
                </asp:SqlDataSource></td>
			<td class="auto-style20">&nbsp;</td>
			<td class="auto-style7">&nbsp;</td>
		</tr>
		<tr>
			<td class="auto-style12">&nbsp;</td>
			<td class="auto-style10">&nbsp;</td>
			<td class="auto-style13">&nbsp;</td>
			<td class="auto-style14">&nbsp;</td>
			<td class="auto-style20">&nbsp;</td>
			<td class="auto-style7">&nbsp;</td>
		</tr>
	</table>
</asp:Content>

