<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AddAsset.aspx.cs" Inherits="AddAsset" %>



<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server"> 

    <div class="container-fluid cnt_div">
	<div class="col-sm-12">
        <h3><span class="style6"><span class="dxmLite_Glass">
  Exporting The Data <br />
</span></span></h3>
    <div class="">
           <dx:ASPxLabel ID="lbl_error" runat="server" 
        style="color: #FF0000; font-weight: 700">
    </dx:ASPxLabel>
        <%-- <div style="">
             <strong><span class="">Imported Assets </span></strong>
         </div>--%>
    
         <div class=" style3">
                <dx:ASPxImage ID="ASPxImage1" runat="server" Visible="false">
                </dx:ASPxImage>
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
               <asp:ImageButton ID="ImageButton1" ImageAlign="Right"  ImageUrl="~/Images/PDF.png" runat="server" Height="35px" Width="40px" OnClick="ImageButton1_Click"    />
                
                 </div>
             <div class="col-sm-1">
                <asp:ImageButton ID="ImageButton2"  ImageUrl="~/Images/XLS.png" Height="35px" runat="server" OnClick="ImageButton2_Click" Width="35px" />

             </div>
        
             </div>

        <div class="col-sm-12" >
         <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" 
                    Landscape="True" MaxColumnWidth="150" GridViewID="ASPxGridView1" 
                    LeftMargin="0" RightMargin="0"  TopMargin="0">
                </dx:ASPxGridViewExporter>
  
          
        <dx:ASPxGridView ID="ASPxGridView1"  runat="server" AutoGenerateColumns="False" ClientInstanceName="grid"
             DataSourceID="SqlDSGrid" KeyFieldName="AssetID"                 
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css"  Settings-ShowHorizontalScrollBar="true"  CssPostfix="PlasticBlue" 
                    Width="100%" OnHtmlRowPrepared="ASPxGridView1_HtmlRowPrepared" >
       <Columns>
            <dx:GridViewDataTextColumn FieldName="SLNO" Visible="false" ReadOnly="True" VisibleIndex="0">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            
            <dx:GridViewDataTextColumn FieldName="Company" VisibleIndex="1" Caption="Company" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Plant" VisibleIndex="2"  Caption="Plant" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetID" VisibleIndex="3" >
                <Settings AutoFilterCondition="Contains" />
                <CellStyle HorizontalAlign="Left" />
            </dx:GridViewDataTextColumn> 
                
            <dx:GridViewDataTextColumn FieldName="MainAssetNumber" VisibleIndex="4" Caption="Equipment Number"  >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetSubNumber" VisibleIndex="5" Caption="Sub AssetNumber "  >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="AssetDesc" VisibleIndex="6" Caption="Asset Name">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>     
            <dx:GridViewDataTextColumn FieldName="RFIDCardNumber" VisibleIndex="6" Caption="RFID Card Number">
    <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>   
            <dx:GridViewDataTextColumn FieldName="AssetOwner" VisibleIndex="7" Width="140" Caption="Asset Owner" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>   
             <dx:GridViewDataTextColumn FieldName="AssetUser" VisibleIndex="8"  Width="140" Caption="Asset User">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>  
             <dx:GridViewDataTextColumn FieldName="CustodianID" VisibleIndex="9" Caption="Staff Number">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
            <dx:GridViewDataTextColumn FieldName="SerialNumber" VisibleIndex="10" Caption="Serial Number" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="MACID" VisibleIndex="11" Width="140" Caption="Macid" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Location" VisibleIndex="12" Width="140" Caption="Wing">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>          
            
            <dx:GridViewDataTextColumn FieldName="LocationDesc" VisibleIndex="13" Width="140" Caption="LAB">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Department" VisibleIndex="13"  Caption="Department">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>

           <dx:GridViewDataTextColumn FieldName="BLOCK" VisibleIndex="14" Caption="Floor">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Model" VisibleIndex="15" Width="140" Caption="Model" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Make" VisibleIndex="15" Width="140" Caption="Make" >
    <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PONoforReference" VisibleIndex="15" Width="140" Caption="PO Number" >
    <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="GRNumber" VisibleIndex="16" Width="80px" Caption="GR Number" Visible="false">
                <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>
                <Settings AutoFilterCondition="Contains"/>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="YearofPurchase" VisibleIndex="17" Width="80px" Caption="Year of Purchase" >
              <%--  <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>--%>
                <Settings AutoFilterCondition="Contains"/>
            </dx:GridViewDataTextColumn>            
            <dx:GridViewDataTextColumn FieldName="CapitalizationDate" VisibleIndex="18" Caption="Capitalization Date" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
             <dx:GridViewDataTextColumn FieldName="AssetClass" VisibleIndex="19" Caption="Asset Class">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
             <dx:GridViewDataTextColumn FieldName="CostCenter" VisibleIndex="20" Caption="Cost Center" Width="80px" Visible="false">
             
                <Settings AutoFilterCondition="Contains"/>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="MaterialNumber" VisibleIndex="21" Caption="Material Number" Width="80px" Visible="false">
                <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>
                <Settings AutoFilterCondition="Contains"/>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="AcceptDatebyUser" VisibleIndex="22" Caption="Accept Date by User" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="PONoforReference" VisibleIndex="23" Width="140" Caption="PO No for Reference" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
             <dx:GridViewDataTextColumn FieldName="WBSNumberforReference" VisibleIndex="24" Width="140" Caption="WBS Number for Reference" Visible="false">
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
                 <SettingsPager ShowDefaultImages="False">
            <AllButton Text="All">
            </AllButton>
            <NextPageButton Text="Next &gt;">
            </NextPageButton>
            <PrevPageButton Text="&lt; Prev">
            </PrevPageButton>
        </SettingsPager>
                     <SettingsPager PageSize="15"></SettingsPager>
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
        <Styles CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
            CssPostfix="PlasticBlue">
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
    <asp:SqlDataSource ID="SqlDSGrid" runat="server" ConnectionString="<%$ ConnectionStrings:RCBSAPConnectionString %>" 
        SelectCommand="Select * from AssetMaster where Status !='InActive'"></asp:SqlDataSource>                                     
    
      </div>
        <br/>
    
     <table class="style8" style="width:460px">
        <tr>
            <td class="style9">
                <dx:ASPxButton ID="btn_printItems" runat="server" Text="Print PDf" 
                    onclick="btn_printItems_Click" Width="191px"  Visible="false"
        CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css">
                </dx:ASPxButton>
            
            </td>
          
            <td class="style10">
                <dx:ASPxButton ID="btn_Printbarcode" runat="server" Text="Generate QRCodes" 
                    onclick="btn_Printbarcode_Click" Width="191px"  Visible="false"
        CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css">
                </dx:ASPxButton>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>       
          
   
                    
    </div>
        </div>
        </div>
</asp:Content>


