<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.master" AutoEventWireup="true" CodeFile="ViewCalibrationEngineerSpecificDuration.aspx.cs" Inherits="ViewCalibrationEngineerSpecificDuration" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .auto-style7 {
            width: 681px;
            margin-right: 37px;
        }
        .auto-style8 {
            width: 132px;
        }
        .auto-style9 {
            height: 20px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />
    <div>
        <strong>Calibration Engineer in a Specific Duration
    </strong>
    </div>
    <hr />
    <div>
        <asp:Label ID="lbl_error" runat="server" ForeColor="Red"></asp:Label>
    </div>
    <table class="auto-style7" width="100%">
        <tr>
            <td >
                Select Calibration Engineer
            </td>
            <td >
                <dx:ASPxComboBox ID="cmb_Engineer" runat="server" Width="170px" Height="25px" DataSourceID="SqlDataSource1" TextField="Name" ValueField="EngineerID" ValueType="System.String"></dx:ASPxComboBox>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:INSConnectionString %>" SelectCommand="SELECT EngineerID, Name FROM CalibrationEngineerMaster"></asp:SqlDataSource>
            </td>
            <td >

            </td>
            <td class="auto-style9">

            </td>
        </tr>

        <tr>
            <td>
                From Date 
            </td>
            <td >
                <dx:ASPxDateEdit ID="Start_Date" runat="server" Width="170px" Height="25px"></dx:ASPxDateEdit>
            </td>
            <td>
                To Date
            </td>
            <td>
                <dx:ASPxDateEdit ID="To_Date" runat="server" Width="170px" Height="25px"></dx:ASPxDateEdit>
            </td>
            <td>
                <dx:ASPxButton ID="btnsearch" runat="server" BackColor="White" 
                    CssClass="auto-style8" 
                   Width="20px" Height="20px" OnClick="btnsearch_Click">
                    <Image Url="~/Images/search1.png" Width="20px" Height="20px">
                    </Image>
                    <Border BorderColor="White" />                   
                </dx:ASPxButton>
            </td>
        </tr>
    </table>
    <hr />
    <div>
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" KeyFieldName="CalibrateHistoryID">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="CalibrateHistoryID" ReadOnly="True" VisibleIndex="0" Visible="false">
                    <Settings AutoFilterCondition="Contains" />
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="InstrumentID" VisibleIndex="1" >
                     <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MasterInstrumentID1" VisibleIndex="2">
                     <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CalibratedByID" VisibleIndex="3">
                     <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="BodyCondition" VisibleIndex="4">
                     <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MissingParts" VisibleIndex="5">
                     <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="InsInspected" VisibleIndex="6">
                     <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="InsDismantled" VisibleIndex="7">
                     <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Lubricated" VisibleIndex="8">
                     <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="InsCaliRange" VisibleIndex="9">
                     <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="NextCalibrationDate" VisibleIndex="10">
                     <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="LastCalibrationDate" VisibleIndex="11">
                     <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="AssessedBy" VisibleIndex="12">
                     <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CalibrationStatus" VisibleIndex="13" Visible="false">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Observation" VisibleIndex="14" Visible="false">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CertificateNo" VisibleIndex="15" Visible="false">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ReportPDF" VisibleIndex="16" Visible="false">
                </dx:GridViewDataTextColumn>
            </Columns><%--inner join CalibrationEngineerMaster on [CalibrationHistory].[CalibratedByID]=CalibrationEngineerMaster.EngineerID >=@FromDate and CalibrationHisDate<=@Todate--%>
            <Settings ShowFilterRow="True" />
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:INSConnectionString %>" SelectCommand="select CalibrateHistoryID, InstrumentID, MasterInstrumentID1, CalibratedByID,
 BodyCondition, MissingParts, InsInspected, InsDismantled, Lubricated, InsCaliRange, 
 NextCalibrationDate, LastCalibrationDate, AssessedBy, CalibrationStatus, 
 Observation, CertificateNo, ReportPDF from [dbo].[CalibrationHistory] where CalibratedByID=@EngineerID and
[NextCalibrationDate] between @FromDate and @Todate">
            <SelectParameters>
        <asp:ControlParameter ControlID="Start_Date" Name="FromDate" />
        <asp:ControlParameter ControlID="To_Date" Name="Todate" />
               <asp:ControlParameter ControlID="cmb_Engineer" Name="EngineerID" />
        </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

