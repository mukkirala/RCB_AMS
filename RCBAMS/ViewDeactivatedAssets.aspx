<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ViewDeactivatedAssets.aspx.cs" Inherits="ViewDeactivatedAssets" %>
<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx1" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style9
        {
            width: 518px;
        }
        .style10
        {
            width: 988px;
           
            color: #000000;
        }
         .auto-style19 {
            font-size: medium;
            color: #000000;
        }
       
       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
   <div class="col-sm-12" >
   
     <table style="margin-right:20px">
        <tr>
            <td class="style10">
           <span><strong>Assets Deactivated</strong></span>
            </td>
            <td align="right" class="style9">
                <asp:ImageButton ID="btnexporttoxls"  ImageUrl="~/Images/XLS.png" Height="35px" runat="server" OnClick="btnexporttoxls_Click" Width="40px" />

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
                    Width="950px">
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
             <dx:GridViewDataDateColumn FieldName="CostCenter" VisibleIndex="20" Caption="Cost Center" Width="80px" Visible="false">
                <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>
                <Settings AutoFilterCondition="Contains"/>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="MaterialNumber" VisibleIndex="21" Caption="Material Number" Width="80px" Visible="false">
                <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>
                <Settings AutoFilterCondition="Contains"/>
            </dx:GridViewDataDateColumn>
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
            <SettingsPager ShowDefaultImages="False">
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
    <asp:SqlDataSource ID="SqlDSGrid" runat="server" ConnectionString="<%$ ConnectionStrings:RCBSAPConnectionString %>" SelectCommand="Select * from RCBSAP..AssetMaster where AssetMaster.Status='DACT'"></asp:SqlDataSource>                                     
    
      </div>
        <br/>
    

           <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" 
                    Landscape="True" MaxColumnWidth="150" GridViewID="ASPxGridView1" 
                    LeftMargin="0" RightMargin="0" TopMargin="0" ExportEmptyDetailGrid="false" >
      </dx:ASPxGridViewExporter>
  </div>
  </div>
    </asp:Content>


