<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AssetAMC.aspx.cs" Inherits="AssetAMC" %>
<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridLookup" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v11.1" namespace="DevExpress.Web.ASPxPanel" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type="text/css">

        body {
            font-family: Arial;
        }

        .cnt_div {
            padding: 15px;
        }

        label {
            display: inline-block;
            font-weight: bold;
        }

        form {
            display: inline;
        }

        .form-row {
            margin-bottom: 20px;
        }

        .form-label {
            padding-top: 5px;
        }

        .auto-style1 {
            margin-left: 18px;
        }

        .auto-style2 {
            margin-left: 17px;
        }

        h4 {
            font-weight: bold;
            color: #2c3e50;
            margin-bottom: 20px;
        }

        /* TEXTBOX / COMBO / DATE EDIT */

        .dxeTextBox_PlasticBlue,
        .dxeButtonEdit_PlasticBlue,
        .dxeMemo_PlasticBlue,
        .dxeEditArea_PlasticBlue {
            border-radius: 4px !important;
        }

        /* GRID */

        .dxgvControl_PlasticBlue {
            border-radius: 4px !important;
        }

        .dxgvHeader_PlasticBlue {
            font-weight: bold !important;
        }

        /* SAVE BUTTON */

        .dxbButton_SoftOrange {
            border-radius: 6px !important;
            overflow: hidden !important;
            height: 34px !important;
        }

        .dxbButton_SoftOrange table,
        .dxbButton_SoftOrange td,
        .dxbButton_SoftOrange div {
            border-radius: 6px !important;
        }

        /* LABEL SPACING */

        .field-label {
            padding-top: 6px;
            font-weight: bold;
        }

        /* ROW SPACING */

        .row {
            margin-bottom: 15px;
        }
        .dxbButton_SoftOrange {
                border-radius: 50px !important;
                overflow: hidden !important;
                height: 38px !important;
                min-width: 120px !important;
            }

            .dxbButton_SoftOrange table,
            .dxbButton_SoftOrange td,
            .dxbButton_SoftOrange div {
                border-radius: 50px !important;
            }

            .dxbButton_SoftOrange div {
                padding: 6px 20px !important;
            }
    </style>

    <script type="text/javascript">

        function calculateDueDate() {

            var calibOnDate = new Date(txt_CalibOn.GetValue());
            var span = parseInt(txtSpan.GetText());
            var unit = cmbUnit.GetValue();

            if (!isNaN(calibOnDate) && !isNaN(span)) {

                if (unit === "Days") {
                    calibOnDate.setDate(calibOnDate.getDate() + span);
                }
                else if (unit === "Months") {
                    calibOnDate.setMonth(calibOnDate.getMonth() + span);
                }
                else if (unit === "Years") {
                    calibOnDate.setFullYear(calibOnDate.getFullYear() + span);
                }

                txt_CalibDue.SetDate(calibOnDate);
            }
            else {
                alert("Please enter valid dates and span.");
            }
        }

        function onSpanChange() {
            calculateDueDate();
        }

        function attachEvents() {

            if (typeof txtSpan !== 'undefined') {
                txtSpan.AddTextChanged(onSpanChange);
            }
        }

        window.onload = attachEvents;

        function loadFile() {
            uploader.UploadFile();
        }

        function ShowLoginWindow() {
            pcLogin.Show();
        }

        function ShowPopup(message) {

            if (confirm(message)) {
                window.location = "/CalibrationHistory.aspx";
            }
        }

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div class="container-fluid cnt_div">
    	 <div class="col-sm-12">
 <div class="col-sm-10">
<h4>Equipment AMC/CMC Services</h4>
         </div>
             </div>
        <div class="col-sm-12">
     <dx:ASPxLabel ID="lbl_msg" runat="server" 
     Style="color:#FF0000" Text="">
 </dx:ASPxLabel>
            </div>
<div class="row">

<div class="col-sm-2">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Equipment Number <span style="color:red">*</span>
</div>

<div class="col-sm-3">
<dx:ASPxComboBox ID="cmb_asset" runat="server"
Width="230px"
ValueField="AssetID"
TextField="MainAssetNumber"
     CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css"
 CssPostfix="PlasticBlue"
 SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css"
DataSourceID="SqlDataSource_Equipment"
DropDownStyle="DropDownList">
</dx:ASPxComboBox>
</div>


<div class="col-sm-2">
Maintenance Contract <span style="color:red">*</span>
</div>

<div class="col-sm-3">
<dx:ASPxComboBox ID="cmb_MaintenanceContract" runat="server"
     CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css"
 CssPostfix="PlasticBlue"
 SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css"
Width="230px">
</dx:ASPxComboBox>
</div>

</div>

<br />

<div class="row">

<div class="col-sm-2">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Start Date <span style="color:red">*</span>
</div>

<div class="col-sm-3">
<dx:ASPxDateEdit ID="txt_CalibOn" runat="server"
Width="230px"
     CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css"
 CssPostfix="PlasticBlue"
 SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css"
DisplayFormatString="dd-MM-yyyy">
</dx:ASPxDateEdit>
</div>


<div class="col-sm-2">
End Date <span style="color:red">*</span>
</div>

<div class="col-sm-3">
<dx:ASPxDateEdit ID="txt_CalibDue" runat="server"
Width="230px"
     CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css"
 CssPostfix="PlasticBlue"
 SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css"
DisplayFormatString="dd-MM-yyyy">
</dx:ASPxDateEdit>
</div>

</div>

<br />

<div class="row">

<div class="col-sm-2">
&nbsp;&nbsp;&nbsp;&nbsp;
<dx:ASPxButton ID="btn_save" runat="server"
    Text="Save"
    CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css"
    CssPostfix="SoftOrange"
    SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css"
    OnClick="btn_save_Click">
</dx:ASPxButton>
</div>

</div>

<br />


<br />


<!-- GRID -->

&nbsp;<dx:ASPxGridView ID="grid_EquipmentAMC"
runat="server"
AutoGenerateColumns="False"
Width="100%"
DataSourceID="ds_equipmentCalibration"
KeyFieldName="CalibrationID"
CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css"
CssPostfix="PlasticBlue"
SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css"
OnRowCommand="grid_EquipmentAMC_RowCommand" CssClass="auto-style2">

<Columns>
<dx:GridViewDataColumn Caption="Actions">
    <DataItemTemplate>
        <asp:LinkButton ID="btn_edit" runat="server" Text="Edit" CommandName="Edit" ForeColor="Green"></asp:LinkButton>
        &nbsp;
        <asp:LinkButton ID="btn_delete" runat="server" Text="Delete" CommandName="Delete" ForeColor="Red"></asp:LinkButton>
    </DataItemTemplate>
</dx:GridViewDataColumn>


<dx:GridViewDataTextColumn FieldName="MainAssetNumber" Caption="Equipment Number">
     <Settings AutoFilterCondition="Contains" />
    </dx:GridViewDataTextColumn>
    <dx:GridViewDataTextColumn FieldName="MaintenanceContract" Caption="Maintenance Contract">
     <Settings AutoFilterCondition="Contains" />
    </dx:GridViewDataTextColumn>



<dx:GridViewDataDateColumn FieldName="CalibrationOn" Caption="Start Date">
<PropertiesDateEdit DisplayFormatString="dd-MM-yyyy"></PropertiesDateEdit>
</dx:GridViewDataDateColumn>

<dx:GridViewDataDateColumn FieldName="CalibrationDue" Caption="End Date">
<PropertiesDateEdit DisplayFormatString="dd-MM-yyyy"></PropertiesDateEdit>
</dx:GridViewDataDateColumn>

</Columns>

<Settings ShowFilterRow="True" ShowGroupPanel="True"/>
<SettingsPager PageSize="10"/>

</dx:ASPxGridView>


</div>


<asp:SqlDataSource ID="SqlDataSource_Equipment" runat="server"
ConnectionString="<%$ ConnectionStrings:RCBSAPConnectionString %>"
SelectCommand="SELECT AssetID,MainAssetNumber FROM AssetMaster ">
</asp:SqlDataSource>

<asp:SqlDataSource ID="ds_equipmentCalibration" runat="server"
ConnectionString="<%$ ConnectionStrings:RCBSAPConnectionString %>"
SelectCommand="SELECT CalibrationID, AssetID, MainAssetNumber, MaintenanceContract, CalibrationOn, CalibrationDue FROM AssetCalibration">
</asp:SqlDataSource>


</asp:Content>