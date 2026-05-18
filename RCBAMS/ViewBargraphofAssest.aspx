<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ViewBargraphofAssest.aspx.cs" Inherits="ViewBargraphofAssest" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxLoadingPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
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
      <div class="col-sm-9 ">
      
      <h4> <strong>ASSETS BY YEAR WISE </strong></h4>
      
      <br />
      <div class="col-sm-2">
    <label>SELECT YEAR</label>
</div>

<div class="col-sm-3">
    <dx:ASPxComboBox ID="cmb_Dep" runat="server"
        Width="220px"
        Height="30px"
        DataSourceID="SqbDBaircraft"
        TextField="YearofPurchase"
        ValueField="YearofPurchase"
        ValueType="System.String"
        IncrementalFilteringMode="Contains"
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css"
        CssPostfix="PlasticBlue"
        SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">

        <ValidationSettings ErrorTextPosition="Bottom" ValidationGroup="btn">
            <RequiredField ErrorText="please select Asset Type" IsRequired="true" />
        </ValidationSettings>

        <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
        </LoadingPanelImage>

        <ValidationSettings>
            <ErrorFrameStyle ImageSpacing="4px">
                <ErrorTextPaddings PaddingLeft="4px" />
            </ErrorFrameStyle>
        </ValidationSettings>

    </dx:ASPxComboBox>

    <asp:SqlDataSource ID="SqbDBaircraft" runat="server"
        ConnectionString="<%$ ConnectionStrings:RCBSAPConnectionString %>"
        SelectCommand="SELECT DISTINCT [YearofPurchase] FROM [AssetMaster]">
    </asp:SqlDataSource>
</div>

<div class="col-sm-1" style="padding-left:25px; padding-top:2px;">
    <asp:ImageButton
        OnClick="search_Click"
        ID="search"
        ImageUrl="~/Images/search1.png"
        runat="server" />
</div>

              
                  <dxchartsui:webchartcontrol ID="WebChartControl1" runat="server" 
                                         Height="450px" Width="1400px" 
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
                                        ConnectionString="<%$ ConnectionStrings:RCBSAPConnectionString %>" 
                                        SelectCommand="SELECT COUNT(AssetMaster.AssetDesc),AssetDesc as NoOfAssets  FROM AssetMaster group by AssetDesc">
                                                      <SelectParameters>
                                <asp:SessionParameter Name=" " SessionField=" " />
                                
                            </SelectParameters>
                                                </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

