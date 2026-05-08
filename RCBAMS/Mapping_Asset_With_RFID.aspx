<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Mapping_Asset_With_RFID.aspx.cs" Inherits="Mapping_Asset_With_RFID" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>



<%--<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">--%> 
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" Runat="Server">
     <style type="text/css">
       
    .auto-style2 {
        width: 108px;
    }
    .style10
    {
        color: #FF0000;
    }
   .style11{
       padding-right:10px;
       padding-top:10px;
       margin-inline:10px;
      
   }
   .customtable{
       border: 2px solid rgb(199, 212, 220);
       padding-top:90px;
       width:600px;
       padding-left:20px
   }

     /*    
         .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 113px;
        }
        .auto-style3 {
            width: 115px;
        }
         .auto-style4 {
             width: 113px;
             height: 21px;
         }
         .auto-style5 {
             width: 115px;
             height: 21px;
         }
         .auto-style6 {
             height: 21px;
         }
         .auto-style7 {
             width: 113px;
             height: 34px;
         }
         .auto-style8 {
             width: 115px;
             height: 34px;
         }
         .auto-style9 {
             height: 34px;
         }*/
    </style>
</asp:Content>
<%--<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">--%>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
   <div class="container cnt_div" cssclass="container">
    <table>
       <%-- <tr>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>--%>
        <tr>
            
                <h4><strong>ASSET MAPPING WITH RFID</strong></h4>
            
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="lbl_message" runat="server" Text="" ForeColor="Red">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            
            <td style="font-size:large">Select Asset :
                <%--<dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Select Asset :">
                </dx:ASPxLabel>--%>
            </td>
            <td>
                <dx:ASPxGridLookup ID="gridlookup_Asset" runat="server" TextFormatString="{0},{2},{3}" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Height="25px" KeyFieldName="SLNO"
                    Width="200px" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue"  IncrementalFilteringMode="StartsWith" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                                        <GridViewProperties>
                   <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>
                  <Settings ShowFilterRow="True" />
                  <SettingsPager PageSize="10"></SettingsPager>
                </GridViewProperties>
                                    <Columns>
                         <dx:GridViewDataTextColumn FieldName="SLNO" ReadOnly="True" VisibleIndex="0" Visible="false">
                               <EditFormSettings Visible="True" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="AssetID" ReadOnly="True" VisibleIndex="1">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="MainAssetNumber" VisibleIndex="2" Caption="Equipment Number">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="AssetDesc" VisibleIndex="3" Caption="Asset Name">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                                     <GridViewImages SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                     <LoadingPanelOnStatusBar Url="~/App_Themes/PlasticBlue/GridView/gvLoadingOnStatusBar.gif">
                     </LoadingPanelOnStatusBar>
                     <LoadingPanel Url="~/App_Themes/PlasticBlue/GridView/Loading.gif">
                     </LoadingPanel>
                 </GridViewImages>
                 <GridViewImagesFilterControl>
                     <LoadingPanel Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                     </LoadingPanel>
                 </GridViewImagesFilterControl>
                 <GridViewStyles CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue">
                     <Header ImageSpacing="10px" SortingImageSpacing="10px">
                     </Header>
                 </GridViewStyles>
                </dx:ASPxGridLookup>
            </td>
            <td>
                &nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="gridlookup_Asset" ForeColor="Red" Width="150px" ValidationGroup="btn" runat="server" ErrorMessage=" Select Asset"></asp:RequiredFieldValidator>
            </td>
        </tr>
                <tr>
<td>
    &nbsp;</td></tr>
       
        <tr>
            
            <td style="font-size:large">Scan RFID Card :
                <%--<dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Scan RFID Card :">
                </dx:ASPxLabel>--%>
            </td>
            <td>
                <dx:ASPxTextBox ID="txt_REIDCard" runat="server" Width="200px" Height="25px" AutoPostBack="true" OnTextChanged="txt_REIDCard_TextChanged">
                </dx:ASPxTextBox>
            </td>
             <td>
                
               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txt_REIDCard" ForeColor="Red" Width="200px" ValidationGroup="btn" runat="server" ErrorMessage="   Enter RFID Number"></asp:RequiredFieldValidator>
          </td>
           
        </tr>
        <tr>
<td>
    &nbsp;</td></tr>
        <tr>
            <td></td>
           
            <td>
                <dx:ASPxButton ID="btn_mapp" runat="server" Text="Mapp RFID"  ValidationGroup="btn" OnClick="btn_mapp_Click" CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css">
                </dx:ASPxButton>
            </td>
            <td class="auto-style2"></td>
        </tr>
        <tr>
           <%-- <td class="auto-style4">&nbsp;</td>
            <td class="auto-style5">
                &nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>--%>
        </tr>
        </table>
               <tr>
<td>
    &nbsp;</td></tr>
    <table runat="server" id="table1" class="customtable"  style=" border: 2px solid rgb(199, 212, 220);padding-top:90px;width:600px;padding-left:20px; height:200px">
        <tr class="style11">
            
            <td>&nbsp;&nbsp;</td>
            <td>
                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Font-Size="Large" Text="AssetID">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxLabel ID="lbl_AssetID" runat="server" Text="" Font-Size="Large">
                </dx:ASPxLabel>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;</td>
            <td>
                <dx:ASPxLabel ID="ASPxLabel7" runat="server" Font-Size="Large" Text="Asset Type: ">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxLabel ID="lbl_AssetGroupCode" runat="server" Text="" Font-Size="Large">
                </dx:ASPxLabel>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
           <td>&nbsp;&nbsp;</td>
            <td>
                <dx:ASPxLabel ID="ASPxLabel9" runat="server" Font-Size="Large" Text="AssetDesc: ">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxLabel ID="lbl_AssetDescription" runat="server" Text="" Font-Size="Large">
                </dx:ASPxLabel>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;</td>
            <td>
                <dx:ASPxLabel ID="ASPxLabel11" runat="server" Font-Size="Large" Text="CaptureDate: ">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxLabel ID="lbl_CaptureDate" runat="server" Text="" Font-Size="Large">
                </dx:ASPxLabel>
            </td>


            <td>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:InstemSAPConnectionString %>"
                     SelectCommand="SELECT SLNO, AssetID, MainAssetNumber,AssetDesc FROM AssetMaster WHERE RFIDCardNumber IS NULL"></asp:SqlDataSource>
            </td>
        </tr>
                       
    </table>
                               

               <style>
    .align-right {
        text-align: right;
    }
</style>

<div class="align-right">
    <table style="display:inline-block;">
        <tr>
            <td class="style10"></td>
            <td align="right" class="style9">
                <asp:ImageButton ID="btnexporttoxls"  ImageUrl="~/Images/XLS.png" Height="35px" runat="server" OnClick="btnexporttoxls_Click" Width="40px" />
            </td>
            <td>
                <asp:ImageButton ID="btn_pdf"  ImageUrl="~/Images/PDF.png" runat="server" Height="35px" Width="40px" OnClick="btn_pdf_Click" style="margin-left:5px"/>
            </td>
            <td></td>
        </tr>
    </table>
</div>

            <table>
              <tr>
                   <td>
       <div style="overflow-x:scroll;width:1000px">
     
    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" 
                Landscape="True" MaxColumnWidth="150" GridViewID="ASPxGridView1" 
                LeftMargin="0" RightMargin="0" TopMargin="0" ExportEmptyDetailGrid="false" >
  </dx:ASPxGridViewExporter>


                 <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False"  DataSourceID="SqlDataSource2" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" KeyFieldName="SLNO"  MaxColumnWidth="100" OnRowCommand="ASPxGridView1_RowCommand">
                     <Columns>
                          <%--<dx:GridViewDataTextColumn FieldName="Edit" VisibleIndex="0" CellStyle-Font-Bold="true">
                <DataItemTemplate>
                    <asp:LinkButton ID="lnkbtn_edit" runat="server" Text="Edit" CommandName="Edit" ForeColor="Green"></asp:LinkButton>
                    </DataItemTemplate>
                
            </dx:GridViewDataTextColumn>  
                          <dx:GridViewDataTextColumn FieldName="Delete" VisibleIndex="0" CellStyle-Font-Bold="true">
                <DataItemTemplate>
                    <asp:LinkButton ID="Link_delete" runat="server" Text="Delete" CommandName="Delete" ForeColor="Red"></asp:LinkButton>
                </DataItemTemplate>
                
            </dx:GridViewDataTextColumn>--%>  

                         <dx:GridViewDataTextColumn FieldName="SLNO" VisibleIndex="1" ReadOnly="True" Visible="false">
                             <editformsettings visible="False" />
                           
                 </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="Company" VisibleIndex="2">
                 </dx:GridViewDataTextColumn>
                         
                         <dx:GridViewDataTextColumn FieldName="Plant" VisibleIndex="3">

                         </dx:GridViewDataTextColumn>
                           <%--<dx:GridViewDataTextColumn FieldName="CompanyName" VisibleIndex="4" Caption="Supplier Name">
                              </dx:GridViewDataTextColumn>--%>
                            <%--<dx:GridViewDataTextColumn FieldName="InstituteName" VisibleIndex="5">
                              </dx:GridViewDataTextColumn>--%>
                         <%-- <dx:GridViewDataTextColumn FieldName="SupplierID" VisibleIndex="4" Visible="false">
                        </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="InstitutePKID" VisibleIndex="5" Visible="false">
                            </dx:GridViewDataTextColumn>--%>
                          
                         <dx:GridViewDataTextColumn FieldName="AssetID" VisibleIndex="6">
                           <CellStyle HorizontalAlign="Left" />
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="MainAssetNumber" VisibleIndex="7" Caption="Equipment  Number">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="AssetSubNumber" VisibleIndex="8" Caption="Asset sub Number" Visible="false">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="AssetDesc" VisibleIndex="9" Caption="Asset Name">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="AssetOwner" VisibleIndex="10" Width="150" Caption="Asset Owner">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="AssetUser" VisibleIndex="11" Width="150" Visible="true" Caption="Asset User">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="CustodianID" VisibleIndex="12" Caption="Staff Number">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="SerialNumber" VisibleIndex="13" Caption="Serial Number">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="RFIDCardNumber" VisibleIndex="13" Caption="RFID Card Number">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="RFIDMAPDATE" VisibleIndex="13" Caption="RFID Map Date">
                             <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy" />
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="MACID" VisibleIndex="14" Width="150" Caption="MAC ID">
                         </dx:GridViewDataTextColumn>
                         <%--<dx:GridViewDataTextColumn FieldName="LocationID" VisibleIndex="15">
                         </dx:GridViewDataTextColumn>--%>
                         <dx:GridViewDataTextColumn FieldName="Location" VisibleIndex="15" Caption="Wing">
                         </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Department" VisibleIndex="16">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="BLOCK" VisibleIndex="17" Caption="Floor">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="LocationDesc" VisibleIndex="18" Caption="LAB">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="Model" VisibleIndex="19" Width="150">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="GRNumber" VisibleIndex="20" Caption="GR Number">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="YearofPurchase" VisibleIndex="21" Caption="Year of Purchase">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataDateColumn FieldName="CapitalizationDate" VisibleIndex="22">
                            <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" />
                         </dx:GridViewDataDateColumn>
                         <dx:GridViewDataTextColumn FieldName="AssetClass" VisibleIndex="23">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="CostCenter" VisibleIndex="24" Caption="Cost Center">
                         </dx:GridViewDataTextColumn>
                         <%--<dx:GridViewDataTextColumn FieldName="MaterialNumber" VisibleIndex="24">
                         </dx:GridViewDataTextColumn>--%>
                         <dx:GridViewDataTextColumn FieldName="Indentor" VisibleIndex="25">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="IndentNumber" VisibleIndex="26">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="Cost" VisibleIndex="27">
                         </dx:GridViewDataTextColumn>
                          <dx:GridViewDataDateColumn FieldName="WarrantyDate" VisibleIndex="28">
                              <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" />
                          </dx:GridViewDataDateColumn>
                         <dx:GridViewDataDateColumn FieldName="AcceptDatebyUser" VisibleIndex="29">
                            <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" />
                         </dx:GridViewDataDateColumn>
                         <dx:GridViewDataTextColumn FieldName="PONoforReference" VisibleIndex="30">
                         </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="Make" VisibleIndex="31">
                        </dx:GridViewDataTextColumn>
                          <dx:GridViewDataDateColumn FieldName="PODate" VisibleIndex="32">
                              <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" />
                         </dx:GridViewDataDateColumn>
                         <dx:GridViewDataTextColumn FieldName="WBSNumberforReference" VisibleIndex="33">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataDateColumn FieldName="InstallationDateforReference" VisibleIndex="34">
                             <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" />
                         </dx:GridViewDataDateColumn>
                         <dx:GridViewDataTextColumn FieldName="Remarks" VisibleIndex="35">
                         </dx:GridViewDataTextColumn>
                          <dx:GridViewDataDateColumn FieldName="CreationDate" VisibleIndex="36">
                             <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" />
                         </dx:GridViewDataDateColumn>
                          
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
<%--                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:InstemSAPConnectionString %>" SelectCommand="SELECT * FROM [AssetMaster] where Status !='InActive' ORDER BY SLNO Desc"></asp:SqlDataSource>--%>
             <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:InstemSAPConnectionString %>" 
                     SelectCommand="SELECT * FROM AssetMaster WHERE RFIDCardNumber IS NOT NULL">

             </asp:SqlDataSource>

</div>
                </td>    
        </tr>
    </table>
       </div>
</asp:Content>

                                                                                                                                                                                                                                           