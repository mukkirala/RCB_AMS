<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="PIEGRAPH.aspx.cs" Inherits="PIEGRAPH" %>
<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraCharts.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraCharts" TagPrefix="cc1" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraCharts.v11.1.Web, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>
<%@ Register Assembly="DevExpress.XtraCharts.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraCharts" TagPrefix="cc1" %>
<%@ Register Assembly="DevExpress.XtraCharts.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraCharts" TagPrefix="cc2" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.XtraCharts.v11.1" namespace="DevExpress.XtraCharts" tagprefix="cc3" %>
<%@ Register assembly="DevExpress.XtraCharts.v11.1.Web" namespace="DevExpress.XtraCharts.Web" tagprefix="dxchartsui" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="namesAndColorsContainer" runat="server"></div>
   <tr>
    <td>
        <asp:Chart ID="Chart1" runat="server">
            <Titles>
                <asp:Title Text="Asset List Pi chart" TextStyle="Default"></asp:Title>
            </Titles>
           
            <Legends>
                <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="Default"
                    LegendStyle="Row" />
            </Legends>
            <Series>
                <asp:Series Name="Series1" XValueMember="AssetDesc" YValueMembers="NOOFASSETS" 
                    IsVisibleInLegend="true" IsValueShownAsLabel="true" YValuesPerPoint="4" ChartType="Pie">
                    <%-- Add data points dynamically using code-behind --%>
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1" BorderWidth="0">
                </asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
         <asp:Label ID="lblTotalNames" runat="server"></asp:Label>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:InstemAMSConnectionString %>"
            SelectCommand="SELECT AssetDesc, COUNT(AssetDesc) AS NOOFASSETS FROM AssetMaster GROUP BY AssetDesc">
        </asp:SqlDataSource>
    </td>
</tr>


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

