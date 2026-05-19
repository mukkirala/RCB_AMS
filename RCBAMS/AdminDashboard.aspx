<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AdminDashboard.aspx.cs" Inherits="AdminDashboard" %>

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
<%@ Register assembly="DevExpress.Web.v11.1" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
   <script type="text/javascript">
        function ShowLoginWindow1() {
         
            pcLogin.Show();
 return false;
            }
   </script>
    <style>
    .auto-style35 {
          box-shadow: 0 0 14px -10px;
          margin-bottom: 15px;
          padding:15px;
        }
    .style19
        {
            width: 268px
        }
    .panel-pink {
  
     border-color:rgb(241, 79, 124) !important;
        border-bottom: 3px solid rgb(241, 79, 124) !important;
}
    .panel-blue {
    border-color: rgb(3, 169, 244) !important;
      border-bottom: 3px solid rgb(3, 169, 244) !important;

}
     .panel-green {
    border-color: rgb(0, 128, 0) !important;
      border-bottom: 3px solid rgb(0, 128, 0) !important;

}
      .panel-orange {
    border-color: orange !important;
      border-bottom: 3px solid orange !important;

}
      .pink-bg{
     background:rgb(241, 79, 124) !important;

      }
       .blue-bg{
     background:rgb(3, 169, 244) !important;

      }
        .green-bg{
     background:rgb(0, 128, 0) !important;

      }
         .orange-bg{
     background:orange !important;

      }
    .panel {
        width: 250px;
        height: 130px;
        color: white;
        margin:0px auto;
   
    background-color: #fff;
    border: 1px solid transparent;
    border-radius: 4px;
    -webkit-box-shadow: 0 1px 1px rgba(0,0,0,.05);
    box-shadow: 0 1px 1px rgba(0,0,0,.05);
}
    .view{
        padding: 6px;
        font-size: 16px;
        text-align:center;
    }
         .style20
        {
           
            height: 22px;
            width: 199px;
            text-align: center;
            height: 70px;
            color: #ffffff;
   
        }
         .auto-style6{
             font-size:25px;
         }
        </style>
    <style>
        .container {
            width: 90% !important
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="container cnt_div" cssclass="container">
        <h3 class="text-center"><strong>Dashboard</strong></h3>

         <!------------------------------------->

        <div id="wrapper" class="auto-style35">
            <!-- Navigation -->


            <!-- Page Heading -->
        
            <div class="row sui-editor-iframe">
                <div class="col-sm-3">
                 
                        <div class="panel panel-pink" style="">
                            <div class="panel-heading pink-bg" style="background-color:rgb(241, 79, 124)">
                                <div class="style20" style="">
                                 
                                    <span style="">Assets Master</span><br/>
                                    <asp:Label runat="server" ID="lbl_importedassets" CssClass="auto-style6"></asp:Label>
                                </div>
                            </div>
                             <a href="AddAsset.aspx"><div class="view" style="color:rgb(241, 79, 124)">View</div></a>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="panel panel-blue">
                             <div class="panel-heading blue-bg" style="background-color:rgb(3, 169, 244)">
                                <div class="style20" style="">
                                
                                    <%-- <img src="Images/Group.jpg" class="auto-style32" />--%>
                                 
                                    <span>Active Audits</span><br />
                                    <asp:Label runat="server" ID="lbl_createdaudits"  CssClass="auto-style6"></asp:Label>
                                </div>
                            </div>
                           <a href="ViewCurrentAudits.aspx"> <div class="view" style="color:rgb(3, 169, 244)">View</div></a>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="panel panel-green" style="">
                            <div class="panel-heading green-bg" style="background-color:rgb(0, 128, 0)">
                                <div class="style20" style="">                                   
                                    <%-- <img src="Images/Group.jpg" class="auto-style32" />--%>                                 
                                    <span>Parked Assets</span><br />
                                    <asp:Label runat="server" ID="lbl_parkedassets"  CssClass="auto-style6"></asp:Label>
                                </div>
                            </div>
                           <a href="ViewAssetParking.aspx"> <div class="view" style="color:rgb(0, 128, 0)">View</div></a>
                        </div>
                    </div>
                       <div class="col-sm-3">
                        <div class="panel panel-orange" style="">
                            <div class="panel-heading orange-bg" style="background-color:orange">
                                <div class="style20" style="">
                                   
                                    <%-- <img src="Images/Group.jpg" class="auto-style32" />--%>
                                  
                                    <span>Employee List</span><br />
                                    <asp:Label runat="server" ID="lbl_custodianlist" CssClass="auto-style6"></asp:Label>
                                </div>
                            </div>
                            <a href="ViewCustodianByDepartment.aspx"><div class="view" style="color:orange">View</div></a>
                        </div>
                    </div>


                </div>

          
        </div>



    <dx:ASPxPopupControl ID="pcCalibrationAlert" runat="server"
    ClientInstanceName="pcCalibrationAlert"
    HeaderText="Calibration Alerts"
    PopupHorizontalAlign="WindowCenter"
    PopupVerticalAlign="WindowCenter"
       CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css"
   CssPostfix="PlasticBlue"
   SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css"
    Modal="True"
    Width="600px"
    CloseAction="CloseButton" >

    <ContentCollection>
        <dx:PopupControlContentControl runat="server">

            <dx:ASPxGridView ID="gridPopupAlert" runat="server"
                AutoGenerateColumns="False" OnCustomUnboundColumnData="ASPxGridView1_CustomUnboundColumnData"
                DataSourceID="dbCalibrationAlert"
                   CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css"
   CssPostfix="PlasticBlue"
   SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css"
                KeyFieldName="AssetID"
                Width="100%">

                <Columns>
              


                <dx:GridViewDataTextColumn FieldName="Number" Caption="S.No." UnboundType="String" Width="50px" VisibleIndex="0" />
                    <dx:GridViewDataTextColumn FieldName="AssetID" Caption="Equipment Id" >
                          <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn FieldName="MainAssetNumber" Visible="true" Caption="Equipment Name" >
                           <Settings AutoFilterCondition="Contains" />
                         </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="MaintenanceContract" Caption="Serial No" >
                          <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                     <dx:GridViewDataDateColumn FieldName="CalibrationOn" Width="540px" Caption="Due Date">
                    <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy" />
                        </dx:GridViewDataDateColumn>

                        <dx:GridViewDataDateColumn FieldName="CalibrationDue" Width="540px" Caption="Due Date">
        <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy" />
    </dx:GridViewDataDateColumn>
                </Columns>
             
<SettingsPager ShowDefaultImages="False" PageSize="5">
    <AllButton Text="All">
    </AllButton>
    <NextPageButton Text="Next &gt;">
    </NextPageButton>
    <PrevPageButton Text="&lt; Prev">
    </PrevPageButton>
</SettingsPager>
<Settings ShowFilterRow="True" ShowGroupPanel="True" />
<Images SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
    <LoadingPanelOnStatusBar Url="~/App_Themes/PlasticBlue/GridView/gvLoadingOnStatusBar.gif">
    </LoadingPanelOnStatusBar>
    <LoadingPanel Url="~/App_Themes/PlasticBlue/GridView/Loading.gif">
    </LoadingPanel>
</Images>
<ImagesFilterControl>
    <LoadingPanel Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
    </LoadingPanel>
</ImagesFilterControl>
<Styles CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue">
    <Header ImageSpacing="10px" SortingImageSpacing="10px">
    </Header>
</Styles>
<StylesEditors>
    <CalendarHeader Spacing="11px">
    </CalendarHeader>
    <ProgressBar Height="25px">
    </ProgressBar>
</StylesEditors>

            </dx:ASPxGridView>

            <br />

           <dx:ASPxButton ID="btnOk" runat="server" Text="OK" AutoPostBack="False" CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange">
                <ClientSideEvents Click="function(s,e){ pcCalibrationAlert.Hide(); }" />
            </dx:ASPxButton>

        </dx:PopupControlContentControl>
                </ContentCollection>

</dx:ASPxPopupControl>


    <div class="">
            <div class=" col-sm-3 auto-style35">
                <h3>Updates</h3>
                <div class=" table-responsive">
                    <table class="table table-dark">
                      <thead>
 
                      </thead>
                      <tbody>
            
                           <%-- <tr>
     
                          <td> <asp:LinkButton runat="server" OnClick="lbtn_auditapprove_Click" ID="lbtn_auditapprove" Text="Audit Approve" ForeColor="Black"/> <span class="badge pink-bg"><asp:LinkButton runat="server" ID="lbl_cntAuditapprove"   OnClick="cntAuditapprove_Click"  ForeColor="White"/></span> <asp:ImageButton ID="reqicon" runat="server" Height="27px" ImageUrl="~/Images/neww.gif" Width="44px"  Visible="false"/></td>
     
                        </tr>--%>

                        <tr>
     
                          <td> <asp:LinkButton runat="server" OnClick="lbtn_assetrequest_Click" ID="lbtn_assetrequest" Text="Asset Requests" ForeColor="Black"/> <span class="badge pink-bg"><asp:LinkButton runat="server" ID="lbl_cntAssetrequest"     ForeColor="White"/></span> <asp:ImageButton ID="reqicon" runat="server" Height="27px" ImageUrl="~/Images/neww.gif" Width="44px"  Visible="false"/></td>
     
                        </tr>

                          <tr>
     
                          <td> <asp:LinkButton runat="server" OnClick="lbtn_locationtransfer_Click" ID="lbtn_locationtransfer" Text="Location Transfer Requests" ForeColor="Black"/> <span class="badge pink-bg"><asp:LinkButton runat="server" ID="lbl_cntLocationtransfer"     ForeColor="White"/></span> <asp:ImageButton ID="reqicon1" runat="server" Height="27px" ImageUrl="~/Images/neww.gif" Width="44px"  Visible="false"/></td>
     
                        </tr>

                          <tr>
     
                          <td> <asp:LinkButton runat="server" OnClick="lbtn_custodiantransfer_Click" ID="lbtn_custodiantransfer" Text="Employee Transfer Requests" ForeColor="Black"/> <span class="badge pink-bg"><asp:LinkButton runat="server" ID="lbl_cntCustodianTransfer"     ForeColor="White"/></span> <asp:ImageButton ID="reqicon2" runat="server" Height="27px" ImageUrl="~/Images/neww.gif" Width="44px"  Visible="false"/></td>
     
                        </tr>

                        <tr>
    
                          <td>
                              <%--<asp:LinkButton runat="server" OnClick="lbtn_buybackreq_Click" ID="lbtn_buybackreq" Text="Buyback Requests" ForeColor="Black"/> <span class="badge blue-bg"><asp:LinkButton runat="server"  ID="lbl_cntBuybackreq" ForeColor="White"/></span> <asp:ImageButton ID="req1" runat="server" Height="27px" ImageUrl="~/Images/neww.gif" Width="44px"  Visible="false"/>>--%>

                          </td>
     
                        </tr>
                        <tr>
                          <td><asp:LinkButton runat="server" OnClick="lbtn_assetreturnreq_Click" ID="lbtn_assetreturnreq" Text="Asset Return Requests" ForeColor="Black"/><span class="badge green-bg"><asp:LinkButton runat="server" ID="lbl_cntAssetreturnreq" ForeColor="White"/></span> <asp:ImageButton ID="req2" runat="server" Height="27px" ImageUrl="~/Images/neww.gif" Width="44px"  Visible="false"/></td>
    
                        </tr>
                         <tr>
                          <td><asp:LinkButton runat="server" OnClick="lbtn_alloc_Click" ID="LinkButton1" Text="Allocated Assets" ForeColor="Black"/><span class="badge green-bg"><asp:LinkButton runat="server"  ID="lbl_allocatedassets" ForeColor="White"/></span> <asp:ImageButton ID="ImageButton1" runat="server" Height="27px" ImageUrl="~/Images/neww.gif" Width="44px"  Visible="false"/></td>
    
                        </tr>
                      </tbody>
                    </table>
                    </div>
            </div>
        <div>
            <br />
        </div>

 <%-- <div class="col-sm-9 ">
      
      <h4> Assets By Year Wise</h4>
      
      <br />
       <div class="col-sm-2">
             
                 <label>Select Year</label>
           </div>
                <div class="col-sm-2" style="padding-left:0px">
                    <dx:ASPxComboBox ID="cmb_Dep" runat="server" Width="90%" DataSourceID="SqbDBaircraft"  Height="5px" 
                        TextField="YearofPurchase" ValueField="YearofPurchase"  ValueType="System.String" IncrementalFilteringMode="Contains"
                          CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" 
                        >
                        <validationsettings errortextposition="bottom" validationgroup="btn">
                            <requiredfield errortext="please select Asset Type" isrequired="true" />
                        </validationsettings>
                        <loadingpanelimage url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                        </loadingpanelimage>
                        <validationsettings>
                            <errorframestyle imagespacing="4px">
                                <errortextpaddings paddingleft="4px" />
                            </errorframestyle>
                        </validationsettings>
                    </dx:ASPxComboBox>                   
  
                 <asp:SqlDataSource ID="SqbDBaircraft" runat="server" 
        ConnectionString="<%$ ConnectionStrings:RCBSAPConnectionString %>" 
        SelectCommand="SELECT DISTINCT [YearofPurchase] FROM [AssetMaster]">
         </asp:SqlDataSource>

                
             </div>
       <div class="col-sm-1">
                <asp:ImageButton  OnClick="search_Click"  ID="search"  ImageUrl="~/Images/search1.png" runat="server" />
            </div>
               </div>

              
                  <dxchartsui:webchartcontrol ID="WebChartControl1" runat="server" 
                                         Height="450px" Width="1000px" 
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
    </div>--%>
        <%--  <div class=" ">
                    <div class="auto-style35">
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ds_Createdaudits" KeyFieldName="AuditID" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" Width="100%">
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0" Visible="false">
                    <ClearFilterButton Visible="True">
                    </ClearFilterButton>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="AuditID" Visible="false" ReadOnly="True" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="AuditName" Caption="Audit Name" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="AssetCount" Caption="Number of Assets" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsPager ShowDefaultImages="False">
                <AllButton Text="All">
                </AllButton>
                <NextPageButton Text="Next &gt;">
                </NextPageButton>
                <PrevPageButton Text="&lt; Prev">
                </PrevPageButton>
            </SettingsPager>
            <Images SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                <LoadingPanelOnStatusBar Url="~/App_Themes/PlasticBlue/GridView/gvLoadingOnStatusBar.gif">
                </LoadingPanelOnStatusBar>
                <LoadingPanel Url="~/App_Themes/PlasticBlue/GridView/Loading.gif">
                </LoadingPanel>
            </Images>
            <ImagesFilterControl>
                <LoadingPanel Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                </LoadingPanel>
            </ImagesFilterControl>
            <Styles CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue">
                <Header ImageSpacing="10px" SortingImageSpacing="10px">
                </Header>
            </Styles>
            <StylesEditors>
                <CalendarHeader Spacing="11px">
                </CalendarHeader>
                <ProgressBar Height="25px">
                </ProgressBar>
            </StylesEditors>
            
            <Settings ShowFilterRow="True" ShowGroupPanel="True" />
           
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="ds_Createdaudits" runat="server" ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" SelectCommand="SELECT AuditMaster.[AuditID],AuditMaster.[AuditName],count(AssetID)as AssetCount FROM [AuditMaster]
inner join AuditDetails on  AuditDetails.AuditID=AuditMaster.AuditID
where AuditMaster.AuditStatus='Active' group by AuditMaster.[AuditID],AuditMaster.[AuditName]">
           
        </asp:SqlDataSource>
       
            </div>
              --%>  
  <%--  <div class="col-sm-12">
        <br />
        <br />
    </div>
    <div class="col-sm-4">
         <div class="col-sm-6"><span style="color:red"><dx:ASPxLabel ID="lbl_msg" runat="server" Text=""></dx:ASPxLabel></span></div>
    <table class="dxflInternalEditorTable_BlackGlass">
        <tr>
            <td ><b> DATE WISE ASSET REQUEST</b>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="7">&nbsp;</td>
        </tr>
        </table>
        <div></div>
        <table>
         <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="From Date"  >
                </dx:ASPxLabel><span style="color:red">*</span>
            </td>
                <td>
                 <dx:ASPxDateEdit ID="fromDate" runat="server" Border-BorderStyle="Solid" EditFormatString="yyyy-MM-dd"  >
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
            
            <td> <dx:ASPxDateEdit ID="todate" runat="server" OnDateChanged="todate_DateChanged" AutoPostBack="true" EditFormatString="yyyy-MM-dd">
                    
                </dx:ASPxDateEdit></td>
            </tr>
            </table>
   <tr>
       <td>
       <asp:Chart ID="Chart1" runat="server" > 
               <Titles>
                   <asp:Title Text=" Asset Request Pi chart"></asp:Title>
               </Titles>
                 <Legends>  
                    <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="Default"  
                        LegendStyle="Row" />  
                    
                 
                </Legends> 
                <Series>
                    <asp:Series Name="Series1"  XValueMember="Quantity"  
                        YValueMembers="ApprovedQuantity" 
                        IsVisibleInLegend="true" Color="255, 255,128,112" IsValueShownAsLabel="true"  YValuesPerPoint="4" ChartType="Pie"></asp:Series>
                </Series>
            
              
              
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1" BorderWidth="0">
                   
                     
                    </asp:ChartArea>
                   
                </ChartAreas>
            </asp:Chart>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
                SelectCommand="SELECT COUNT(ApprovedQuantity)as ApprovedAsset,COUNT(EmployeeAssetRequest.Quantity)as NoOfAssetsFROM [EmployeeAssetRequest] WHERE (CAST([AdminDate] AS Date) >= '@fromDate') AND (CAST([AdminDate] AS Date) <= 'todate') group by [ApprovedQuantity]">
             <SelectParameters>
                       <asp:ControlParameter ControlID="fromDate" Name="fromDate" />
                         <asp:ControlParameter ControlID="todate" Name="todate" />
                     
                   </SelectParameters>
        </asp:SqlDataSource>
           </td>
 </tr>

       </div>--%>
    
   <%-- <div class="col-sm-9">
         <div class="col-sm-6"><span style="color:red"><dx:ASPxLabel ID="lbl_msg" runat="server" Text=""></dx:ASPxLabel></span></div>
    <table class="dxflInternalEditorTable_BlackGlass">
        <tr>
            <td colspan="7"><h3><b> Assets List</b></h3>&nbsp;</td>
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
  <%-- <tr>
       <td>
       <asp:Chart ID="Chart1" runat="server" > 
               <Titles>
                   <asp:Title Text=" Asset List Pi chart" TextStyle="Default"></asp:Title>
               </Titles>
                 <Legends>  
                    <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="Default"  
                        LegendStyle="Row" />  
                    
                 
                </Legends> 
                <Series>
                    <asp:Series Name="Series1"  XValueMember="AssetDesc"  
                        YValueMembers="NOOFASSETS" 
                        IsVisibleInLegend="true" Color="255, 255,128,112" IsValueShownAsLabel="true" YValuesPerPoint="4" ChartType="Pie"></asp:Series>
                </Series>
            
              
              
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1" BorderWidth="0">
                   
                     
                    </asp:ChartArea>
                   
                </ChartAreas>
            </asp:Chart>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
                SelectCommand="SELECT AssetDesc, COUNT(AssetDesc) AS NOOFASSETS FROM AssetMaster GROUP BY AssetDesc">--%>
             <%--<SelectParameters>
                       <asp:ControlParameter ControlID="fromDate" Name="fromDate" />
                         <asp:ControlParameter ControlID="todate" Name="todate" />
                     
                   </SelectParameters
        </asp:SqlDataSource>
           </td>
 </tr>

       </div>--%>



    <div>
        <div class="col-sm-9">
             
    <dx:ASPxGridView ID="ViewResolvedComplaint" runat="server"
    AutoGenerateColumns="False" DataSourceID="ComplaintResolved" Width="40%"  OnRowCommand="ViewResolvedComplaint_RowCommand"
     CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
    CssClass="auto-style9" KeyFieldName="AssetName" >
        <Columns>
            <dx:GridViewDataTextColumn FieldName="SLNO" Visible="false" ReadOnly="True" VisibleIndex="0">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            
            <dx:GridViewDataTextColumn FieldName="noofAssets"  Caption="NO OF ASSETS" VisibleIndex="2" Width="15">
                   <Settings AutoFilterCondition="Contains"  />
                   <CellStyle HorizontalAlign="Left" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetName" VisibleIndex="1" Caption="Asset Name" Width="35" >
                    <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="" VisibleIndex="6" Width="25">
                     <DataItemTemplate>
                         <asp:LinkButton ID="btn_view" Text="View" runat="server" CommandName="View" ForeColor="Green"   Font-Bold="true">View</asp:LinkButton>
                     </DataItemTemplate>
                </dx:GridViewDataTextColumn>
           
              </Columns>
        <SettingsPager ShowDefaultImages="False">
            <AllButton Text="All">
            </AllButton>
            <NextPageButton Text="Next &gt;">
            </NextPageButton>
            <PrevPageButton Text="&lt; Prev">
            </PrevPageButton>
        </SettingsPager>
        <SettingsPager PageSize="7"></SettingsPager>
        <Settings ShowFooter="true" ShowGroupFooter="VisibleIfExpanded" 
            ShowFilterRow="True" />
         <Settings ShowFilterRow="True" ShowGroupPanel="True" ShowFooter="True" />
        <Images SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
            <LoadingPanelOnStatusBar Url="~/App_Themes/PlasticBlue/GridView/gvLoadingOnStatusBar.gif">
            </LoadingPanelOnStatusBar>
            <LoadingPanel Url="~/App_Themes/PlasticBlue/GridView/Loading.gif">
            </LoadingPanel>
        </Images>
        <ImagesFilterControl>
            <LoadingPanel Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
            </LoadingPanel>
        </ImagesFilterControl>
        <GroupSummary>
            <dx:ASPxSummaryItem FieldName="AssetName" SummaryType="Count" />
        </GroupSummary>
       <TotalSummary>
           <dx:ASPxSummaryItem FieldName="AssetName" SummaryType="Count" Tag="No of Asset"/>
       </TotalSummary>
        <Images SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
            <LoadingPanelOnStatusBar Url="~/App_Themes/PlasticBlue/GridView/gvLoadingOnStatusBar.gif">
            </LoadingPanelOnStatusBar>
            <LoadingPanel Url="~/App_Themes/PlasticBlue/GridView/Loading.gif">
            </LoadingPanel>
        </Images>
        <ImagesFilterControl>
            <LoadingPanel Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
            </LoadingPanel>
        </ImagesFilterControl>
        <Styles CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue">
            <Header ImageSpacing="10px" SortingImageSpacing="10px">
            </Header>
        </Styles>
        <StylesEditors>
            <CalendarHeader Spacing="11px">
            </CalendarHeader>
            <ProgressBar Height="25px">
            </ProgressBar>
        </StylesEditors>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="ComplaintResolved" runat="server" 
    ConnectionString="<%$ ConnectionStrings:RCBSAPConnectionString %>" 
    SelectCommand="Select COUNT (AssetMaster.AssetDesc) As noofAssets,AssetDesc as AssetName From AssetMaster Where Status !='InActive' group by AssetDesc">
</asp:SqlDataSource>

                  <asp:SqlDataSource ID="dbCalibrationAlert" runat="server"
ConnectionString="<%$ ConnectionStrings:RCBSAPConnectionString %>"
SelectCommand="
select AssetID, MainAssetNumber,MaintenanceContract,CalibrationOn,CalibrationDue from AssetCalibration ">
</asp:SqlDataSource>



        </div>
                    </div>

        </div>

</div>


</asp:Content>

