<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ViewAssetTypes.aspx.cs" Inherits="ViewAssetTypes" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" Runat="Server">
<style type="text/css">
        .style2
        {
            width: 130px;
        }
        .style3
        {
            width: 180px;
        }
        .style4
        {
            width: 54px;
        }
    .style5
    {
            width: 167px;
        }
    .auto-style8
    {}
    .style6
    {
       
    }
        .style9
        {
            width: 518px;
        }
        .style10
        {
            width: 988px;
           
            color: #000000;
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
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
           
<div class="col-sm-12">

   
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
 <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
  <ContentTemplate>--%>
    <strong><span class="style9"> Assets By AssetType</span></strong><br /><br />
     <div class="row">
      <div class="col-sm-2">
             
                 <label>Select Asset Name</label>
           </div>
                <div class="col-sm-2" style="padding-left:0px">
                    <dx:ASPxComboBox ID="cmb_Dep" runat="server" Width="90%" DataSourceID="SqbDBaircraft"  Height="5px" AutoPostBack="true"
                        TextField="AssetDesc" ValueField="AssetDesc"  ValueType="System.String" IncrementalFilteringMode="Contains"
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
        ConnectionString="<%$ ConnectionStrings:InstemSAPConnectionString %>" 
        SelectCommand="SELECT DISTINCT [AssetDesc] FROM [AssetMaster]">
         </asp:SqlDataSource>

                
             </div>
         </div>
           <div class="col-sm-12">
		<div class="col-sm-3">
            <dx:ASPxButton ID="ASPxButton1" runat="server" ClientInstanceName="button1" Text="Show Customization Window"
                UseSubmitBehavior="False" AutoPostBack="False" CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css">
                <ClientSideEvents  Click= "button1_Click"/>
            </dx:ASPxButton>
            </div>
          </div>
   
     
                  
    <br />
           <div class="col-sm-12">
           
             <div class="col-sm-10"></div>
             <div class="col-sm-1">
               <asp:ImageButton ID="ImageButton1" ImageAlign="Right"  ImageUrl="~/Images/PDF.png" runat="server" Height="35px" Width="40px" OnClick="ImageButton1_Click1" />
                
                 </div>
             <div class="col-sm-1">
                <asp:ImageButton ID="ImageButton2"  ImageUrl="~/Images/XLS.png" Height="35px" runat="server" OnClick="ImageButton2_Click1" Width="35px" />

             </div>
        
             </div>

                      <label><strong>Allocated Assets</strong></label>

        <%--<div class="col-sm-12" margin-left=-2px"">--%>

          <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server"  Landscape="True" MaxColumnWidth="150" GridViewID="ASPxGridView1" 
                    LeftMargin="0" RightMargin="0"  TopMargin="0"></dx:ASPxGridViewExporter>
 
        <dx:ASPxGridView ID="ASPxGridView1"  runat="server" AutoGenerateColumns="False"   ClientInstanceName="grid" 
                    DataSourceID="SqlDataSource1" KeyFieldName="AssetID"                 
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    Width="100%" Settings-ShowHorizontalScrollBar="true">
       <Columns>
            <dx:GridViewDataTextColumn FieldName="SLNO" Visible="true" ReadOnly="True" VisibleIndex="0">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            
            <dx:GridViewDataTextColumn FieldName="Company" VisibleIndex="1" Caption="Company">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Plant" VisibleIndex="2"  Caption="Plant">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetID" VisibleIndex="3">
                <Settings AutoFilterCondition="Contains" />
                <CellStyle HorizontalAlign="Left" />
            </dx:GridViewDataTextColumn> 
                
            <dx:GridViewDataTextColumn FieldName="MainAssetNumber" VisibleIndex="4" Caption="Equipment Number"  >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetSubNumber" VisibleIndex="5" Caption="Sub Asset Number "  >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="AssetDesc" VisibleIndex="6" Caption="Asset Name">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>             
            <dx:GridViewDataTextColumn FieldName="AssetOwner" VisibleIndex="7" Caption="Asset Owner" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>   
             <dx:GridViewDataTextColumn FieldName="AssetUser" VisibleIndex="8"  Caption="Asset User">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>  
             <dx:GridViewDataTextColumn FieldName="CustodianID" VisibleIndex="9" Caption="Staff Number">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
            <dx:GridViewDataTextColumn FieldName="SerialNumber" VisibleIndex="10" Caption="Serial Number" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="MACID" VisibleIndex="11" Caption="Macid" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Location" VisibleIndex="12" Caption="Wing">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>          
            
            <dx:GridViewDataTextColumn FieldName="LocationDesc" VisibleIndex="13" Caption="LAB">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
            <dx:GridViewDataTextColumn FieldName="Department" VisibleIndex="13"  Caption="Department">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>

           <dx:GridViewDataTextColumn FieldName="BLOCK" VisibleIndex="14" Caption="Floor">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Model" VisibleIndex="15" Caption="Model" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Make" VisibleIndex="15" Caption="Make" >
    <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="GRNumber" VisibleIndex="16" Width="80px" Caption="GR Number" Visible="false">
                <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>
                <Settings AutoFilterCondition="Contains"/>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="YearofPurchase" VisibleIndex="17" Width="80px" Caption="Year of Purchase" >
                <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>
                <Settings AutoFilterCondition="Contains"/>
            </dx:GridViewDataDateColumn>            
            <dx:GridViewDataTextColumn FieldName="CapitalizationDate" VisibleIndex="18" Caption="Capitalization Date" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
             <dx:GridViewDataTextColumn FieldName="AssetClass" VisibleIndex="19" Caption="Asset Class">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
             <dx:GridViewDataTextColumn FieldName="CostCenter" VisibleIndex="20" Caption="Cost Center" Width="80px" Visible="false">
               
                <Settings AutoFilterCondition="Contains"/>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="MaterialNumber" VisibleIndex="21" Caption="Material Number" Width="80px" Visible="false">
               
                <Settings AutoFilterCondition="Contains"/>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AcceptDatebyUser" VisibleIndex="22" Caption="Accept Date by User" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="PONoforReference" VisibleIndex="23" Caption="PO Number">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
             <dx:GridViewDataTextColumn FieldName="WBSNumberforReference" VisibleIndex="24" Caption="WBS Number for Reference" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>   
            <dx:GridViewDataTextColumn FieldName="InstallationDateforReference" VisibleIndex="25" Width="180px" Visible="false" Caption="Installation Date for Reference">
                 <Settings AutoFilterCondition="Contains" />
                       <%-- <DataItemTemplate>
                            <dx:ASPxImage ID="img" runat="server" ImageUrl='<%# Eval("QRImage") %>' 
                                Height="80px" Width="150px"></dx:ASPxImage>
                        </DataItemTemplate>--%>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="CreationDate" VisibleIndex="26" Caption="Creation Date" Visible="false" Width="80px">
                <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>
                <Settings AutoFilterCondition="Contains"/>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Remarks" VisibleIndex="27" Caption="Remark" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
             </Columns>
           <SettingsPager ShowDefaultImages="False" Mode="ShowAllRecords">
                <AllButton Text="All">
                </AllButton>
                <NextPageButton Text="Next &gt;">
                </NextPageButton>
                <PrevPageButton Text="&lt; Prev">
                </PrevPageButton>
            </SettingsPager>
            <SettingsPager PageSize="25"></SettingsPager>
             <Settings  ShowFooter="true" ShowFilterRow="true"/>
        <TotalSummary>
        <dx:ASPxSummaryItem FieldName="AssetID" SummaryType="Count" />
        </TotalSummary>
        <Settings ShowGroupPanel="True" ShowFilterRow="True" ShowFilterBar="Visible" ShowGroupFooter="VisibleAlways" 
            ShowFilterRowMenu="True" ShowFooter="true" 
            ShowHeaderFilterButton="True" />
            <SettingsCustomizationWindow Enabled="True" Height="250px" 
            PopupHorizontalOffset="200" PopupVerticalOffset="100" Width="250px" 
            PopupVerticalAlign="TopSides" />
              <SettingsLoadingPanel Mode="ShowOnStatusBar" />
             <ClientSideEvents CustomizationWindowCloseUp="grid_CustomizationWindowCloseUp" />
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
            <%--</div>--%>
     <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ConnectionStrings:InstemSAPConnectionString %>" 
        SelectCommand="Select AssetAllocation.AllocationID,AssetAllocation.AssetID,AssetAllocation.MainAssetNumber,AssetAllocation.AssetRequestID,AssetAllocation.Date as AllocatedDate,AssetAllocation.Status as AllocatedStatus,
EmployeeAssetRequest.RequestBy,EmployeeAssetRequest.EmployeeID,EmployeeAssetRequest.Date as RequestedDate,EmployeeAssetRequest.CustodianDepartment,EmployeeAssetRequest.CustDesignation,
AssetMaster.AssetSubNumber,AssetMaster.AssetDesc,AssetMaster.AssetClass,AssetMaster.Location,AssetMaster.LocationDesc,AssetMaster.Status as AssetStatus
From InstemAMS..AssetAllocation
inner join InstemAMS..EmployeeAssetRequest on EmployeeAssetRequest.AssetRequestID=AssetAllocation.AssetRequestID
inner join InstemSAP..AssetMaster on AssetMaster.AssetID=AssetAllocation.AssetID
where AssetAllocation.Status='Approved' and EmployeeAssetRequest.EmployeeID=@CustodianID order by AssetAllocation.Date desc">
   <SelectParameters>
      <asp:SessionParameter Name="CustodianID" SessionField="CustodianID" />
   </SelectParameters>
    </asp:SqlDataSource> --%>  

       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:InstemSAPConnectionString %>" 
        SelectCommand="Select * from AssetMaster
      where AssetDesc=@AssetDesc ">
       
        <SelectParameters>
    <asp:ControlParameter Name="AssetDesc" ControlID="cmb_Dep"/>
</SelectParameters>
    </asp:SqlDataSource>   
           
    
    
    <%--</ContentTemplate>

     </asp:UpdatePanel>--%>
    
     </div>
    
</asp:Content>



