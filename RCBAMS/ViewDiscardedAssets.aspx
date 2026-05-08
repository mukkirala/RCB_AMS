<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ViewDiscardedAssets.aspx.cs" Inherits="ViewDiscardedAssets" %>


<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx1" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" Runat="Server">

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
      <style type="text/css">
        .auto-style1 {
            width: 96%;
        }
        .auto-style18 {
            font-size: medium;
        }
        .auto-style19 {
            font-size: medium;
            color: #000000;
        }
        .style3
        {
            width: 789px;
        }
        .style4
        {
            width: 188px;
        }
        .style5
        {
            width: 162px;
        }
        .style6
        {
            width: 52px;
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
        <script>
            function downloadPdfWithMessage() {
                setTimeout(function () {
                    alert('PDF file has been downloaded successfully.');
                }, 1000); // Delay the alert for 1 second (adjust the delay as needed)
            }
        </script>

    <div class="col-sm-12">
 
   
     <table style="margin-right:20px">
         <tr>
                <td class="style10">
            <dx:ASPxLabel ID="errormsg" runat="server" Text="" Visibl="true" ForeColor="Red"  Font-Size="Large"></dx:ASPxLabel>
                </td>
             </tr>
        <tr>
            <td class="style10">
            <span><strong>Discarded Assets </strong></span>
            </td>
     
            <td align="right" class="style9">
                <asp:ImageButton ID="btnexporttoxls"  ImageUrl="~/Images/XLS.png" Height="35px" runat="server" OnClick="btnexporttoxls_Click" Width="40px" />
                <script>
                    function downloadFileWithMessage() {
                        setTimeout(function () {
                            alert('File has been downloaded successfully.');
                        }, 1000); // Delay the alert for 1 second (adjust the delay as needed)
                    }
                </script>
            </td>
            &nbsp;&nbsp;&nbsp;&nbsp
            <td>
                <asp:ImageButton ID="btn_pdf"  ImageUrl="~/Images/PDF.png" runat="server" Height="35px" Width="45px" OnClick="btn_pdf_Click" style="margin-left:5px"/>
              
            </td>
         
        </tr>
    </table>
         
        <div class=" table-responsive">
        <dx:ASPxGridView ID="ASPxGridView1"  runat="server" AutoGenerateColumns="False" 
                    DataSourceID="SqlDSGrid" KeyFieldName="SLNO"                 
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    Width="95%">
       <Columns>
            <dx:GridViewDataTextColumn FieldName="SLNO" Visible="false" ReadOnly="True" VisibleIndex="0">
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
            
         <dx:GridViewDataTextColumn FieldName="Department" VisibleIndex="9"  Caption="Department">
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
             <dx:GridViewDataTextColumn FieldName="PONoforReference" VisibleIndex="23" Caption="PO Number" Visible="true">
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
             </Columns>            <SettingsPager ShowDefaultImages="False">
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
    <asp:SqlDataSource ID="SqlDSGrid" runat="server" ConnectionString="<%$ ConnectionStrings:InstemSAPConnectionString %>" 
        SelectCommand="Select * from InstemSAP..AssetMaster where AssetMaster.Status='DISP'"></asp:SqlDataSource>                                     
    
      </div>
        <br/>
    
    </div>

      <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" 
                    Landscape="True" MaxColumnWidth="150" GridViewID="ASPxGridView1" 
                    LeftMargin="0" RightMargin="0" TopMargin="0" ExportEmptyDetailGrid="false" >
      </dx:ASPxGridViewExporter>
   
  
    </asp:Content>
