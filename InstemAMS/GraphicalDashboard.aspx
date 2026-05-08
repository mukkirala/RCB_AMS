<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="GraphicalDashboard.aspx.cs" Inherits="GraphicalDashboard" %>
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
    <div class="col-sm-9">
        <div class="col-sm-12">
               
                <div class="col-sm-2">
              Enter year<span style="color:red">*</span></div>
            <div class="col-sm-3">
               <dx:ASPxTextBox ID="txt_search" runat="server" Height="25px" Width="180px">
                   
                </dx:ASPxTextBox>
            </div>  
                  <div class="col-sm-1">
                <asp:ImageButton  OnClick="search_Click" ID="search"  ImageUrl="~/Images/search1.png" runat="server" />
            </div>
        </div>

              
                  <dxchartsui:webchartcontrol ID="WebChartControl1" runat="server" 
                                         Height="290px" Width="750px" 
                                        SeriesDataMember="noofAssets" >
                                        <borderoptions visible="False" />
<BorderOptions Visible="False"></BorderOptions>
                                        <diagramserializable>
                                            <cc2:XYDiagram>
                                                <axisx visibleinpanesserializable="-1">
                                                    <range sidemarginsenabled="True" />
<Range SideMarginsEnabled="True"></Range>
                                                </axisx>
                                                <axisy visibleinpanesserializable="-1">
                                                    <range sidemarginsenabled="True" />
<Range SideMarginsEnabled="True"></Range>
                                                </axisy>
                                            </cc2:XYDiagram>
                                        </diagramserializable>
<FillStyle><OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</FillStyle>

<SeriesTemplate argumentdatamember="AssetDesc" valuedatamembersserializable="noofAssets" showinlegend="False"><ViewSerializable>
<cc1:SideBySideBarSeriesView></cc1:SideBySideBarSeriesView>
</ViewSerializable>
<LabelSerializable>
<cc1:SideBySideBarSeriesLabel LineVisible="True">
<FillStyle><OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</FillStyle>
</cc1:SideBySideBarSeriesLabel>
</LabelSerializable>
<PointOptionsSerializable>
<cc1:PointOptions></cc1:PointOptions>
</PointOptionsSerializable>
<LegendPointOptionsSerializable>
<cc1:PointOptions></cc1:PointOptions>
</LegendPointOptionsSerializable>
</SeriesTemplate>
                                        <titles>
                                            <cc2:ChartTitle Font="Tahoma, 12pt" Text="Assest Wise list" />
                                        </titles>
                                        <palettewrappers>
                                            <dxchartsui:PaletteWrapper Name="Palette 1" ScaleMode="Repeat">
                                                <palette>
                                                    <cc2:PaletteEntry Color="Silver" Color2="Silver" />
                                                </palette>
                                            </dxchartsui:PaletteWrapper>
                                        </palettewrappers>
                                    </dxchartsui:webchartcontrol>
          
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:InstemSAPConnectionString %>" 
                                        SelectCommand="SELECT COUNT(AssetMaster.AssetDesc),AssetDesc as NoOfAssets  FROM AssetMaster group by AssetDesc">
                                                      <SelectParameters>
                                <asp:SessionParameter Name=" " SessionField=" " />
                                
                            </SelectParameters>
                                                </asp:SqlDataSource>
    </div>
       
         
    <div>
      <br />
    </div>

   <div class="col-sm-12" ></div>
    <div class="col-sm-4">
         <div class="col-sm-6"><span style="color:red"><dx:ASPxLabel ID="lbl_msg" runat="server" Text=""></dx:ASPxLabel></span></div>
    <table class="dxflInternalEditorTable_BlackGlass">
        <tr>
            <td colspan="7"><b> Assets List</b>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="7">&nbsp;</td>
        </tr>
        </table>
        <div></div>
       <%-- <table>
         <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="From Date"  >
                </dx:ASPxLabel><span style="color:red">*</span>
            </td>
                <td>
                 <dx:ASPxDateEdit ID="fromDate" runat="server" EditFormatString="yyyy-MM-dd"  >
                </dx:ASPxDateEdit>
           </td>
             </tr>
            <tr>
                <td></td>
            </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="lbltoDate" runat="server" Text="To Date"  >
                </dx:ASPxLabel><span style="color:red">*</span>
            </td>
            
            <td> <dx:ASPxDateEdit ID="todate" runat="server" OnDateChanged="todate_DateChanged1" AutoPostBack="true" EditFormatString="yyyy-MM-dd">
                    
                </dx:ASPxDateEdit></td>
            </tr>
            </table>--%>
 >
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:InstemAMSConnectionString %>"
            SelectCommand="SELECT AssetDesc, COUNT(AssetDesc) AS NOOFASSETS FROM AssetMaster GROUP BY AssetDesc">
        </asp:SqlDataSource>
    </td>
</tr>

       </div>
</asp:Content>


<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

