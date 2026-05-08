<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.master" AutoEventWireup="true" CodeFile="ViewCallibrationStatusInstrument.aspx.cs" Inherits="ViewCallibrationStatusInstrument" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .auto-style7 {
            height: 20px;
        }
        .auto-style8 {
            width: 282px;
        }
        .auto-style9 {
            height: 20px;
            width: 282px;
        }
        .auto-style10 {
            margin-right: 0px;
        }
        .auto-style12 {
            height: 20px;
            width: 247px;
        }
        .auto-style13 {
            width: 247px
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table class="nav-justified">
        <tr>
            <td class="auto-style8">&nbsp;</td>
            <td class="auto-style13">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="4"><strong>View Calibration Status Of Instruments</strong></td>
        </tr>
        <tr>
            <td class="auto-style9"></td>
            <td class="auto-style12"></td>
            <td class="auto-style7"></td>
            <td class="auto-style7"></td>
        </tr>
        <tr>
            <td class="auto-style8"><%--Select Instrument Type--%></td>
            <td class="auto-style13">
                <%--<dx:ASPxComboBox ID="cmb_instrumenttype" Height="25px" Width="100%" runat="server" DataSourceID="DS_instrument" TextField="InstrumentTypeName" ValueField="InstrumentTypeID" AutoPostBack="true" ValueType="System.String">
                </dx:ASPxComboBox>
                <asp:SqlDataSource ID="DS_instrument" runat="server" ConnectionString="<%$ ConnectionStrings:INSConnectionString %>" SelectCommand="SELECT [InstrumentTypeID], [InstrumentTypeName] FROM [InstrumentTypeMaster] where InstrumentTypeName!='Master Instrument'"></asp:SqlDataSource>--%>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <br />
    <dx:ASPxGridView ID="grid_view" runat="server" AutoGenerateColumns="False" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" DataSourceID="DS_Satis" KeyFieldName="InstrumentID">
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="0" Visible="false">
                <ClearFilterButton Visible="True">
                </ClearFilterButton>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="InstrumentID" ReadOnly="True" VisibleIndex="1" Visible="false">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="InstrumentName" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="SerialNumber" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Model" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="BrandOrMake" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="LastCalibrationDate" VisibleIndex="6">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="NextCalibrationDate" VisibleIndex="7">
            </dx:GridViewDataDateColumn>
             <dx:GridViewDataTextColumn FieldName="EquipmentName" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CalibrationStatus" VisibleIndex="9">
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
    <asp:SqlDataSource ID="DS_Satis" runat="server" ConnectionString="<%$ ConnectionStrings:INSConnectionString %>" SelectCommand=" Select InstrumentMaster.InstrumentID,InstrumentName,SerialNumber,Model,BrandOrMake,CalibrationHistory.LastCalibrationDate,CalibrationHistory.NextCalibrationDate,EquipmentName,CalibrationStatus from InstrumentMaster 
 inner join CalibrationHistory on CalibrationHistory.InstrumentID=InstrumentMaster.InstrumentID
 left join MasterEquipment on MasterEquipment.EquipmentID=InstrumentMaster.MasterEquipmentUsed
 group by CalibrationStatus, InstrumentName,SerialNumber,Model,BrandOrMake,CalibrationHistory.LastCalibrationDate,CalibrationHistory.NextCalibrationDate,InstrumentMaster.InstrumentID,EquipmentName">
      <%--  <SelectParameters>
           <asp:ControlParameter ControlID="cmb_instrumenttype" Name="InstrumentTypeID" />
        </SelectParameters>--%>
    </asp:SqlDataSource>
</asp:Content>

