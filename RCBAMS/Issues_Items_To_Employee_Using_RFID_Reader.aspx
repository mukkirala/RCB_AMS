<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Issues_Items_To_Employee_Using_RFID_Reader.aspx.cs" Inherits="RFID_Reader_Issues_Items_To_Employee_Using_RFID_Reader" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridLookup" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">


        .auto-style2 {
            width: 108px;
        }
        .style10
        {
            color: #FF0000;
        }
          .auto-style23 {
      width: 50px;
  }

       /* .auto-style4 {
            width: 154px;
        }
        .auto-style17 {
            font-size: medium;
            color: #000000;
        }
        .auto-style20 {
            width: 175px;
        }
        .auto-style21 {
            width: 154px;
            color: #000000;
        }
        .auto-style23 {
            width: 43px;
        }
        .auto-style25 {
            width: 145px;
        }
        .auto-style26 {
            width: 123px;
        }
        .auto-style28 {
            width: 396px;
        }
        .auto-style29 {
            width: 154px;
            color: #000000;
            text-align: center;
        }*/
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
      <div class="container cnt_div" cssclass="container">
          <asp:Label ID="Label1" runat="server" Text="" ForeColor="Red"></asp:Label>
  
    <table width="800px" style="margin-left:15px">
         <tr>
         <h4 style="margin-left:15px"><strong>Issues Items</strong></h4>
             </tr>
        <tr> <td> &nbsp;</td></tr>
        <tr>
            <td colspan="5">
                <dx:ASPxRadioButtonList ID="ASPxRadioButtonList1" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="ASPxRadioButtonList1_SelectedIndexChanged">
                    <Items>
                        <dx:ListEditItem Text="Returnable" Value="Yes" Selected="true" />
                        <dx:ListEditItem Text="Not Returnable" Value="No" />
                    </Items>
                </dx:ASPxRadioButtonList>
               
            </td>
        </tr>
                <tr> <td> &nbsp;</td></tr>

  
        <tr>
            <td class="auto-style25">
                Date</td>
            <td class="auto-style20">
                <dx:ASPxLabel ID="lbl_Date" runat="server" style="color: #0000FF">
                </dx:ASPxLabel>
            </td>
            <td class="auto-style23">
                &nbsp;</td>
            <td class="auto-style26">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
         <tr> <td> &nbsp;</td></tr>
        <tr>
            <td class="auto-style25">
                Vehicle Number <span style="color:red">*</span></td>
            <td class="auto-style20">               
                <dx:ASPxTextBox ID="txt_vechileno" runat="server" Width="300px" >
                </dx:ASPxTextBox>
            </td>
            <td class="auto-style23">
                &nbsp;</td>
            <td class="auto-style26">
                Driver Name <span style="color:red">*</span></td>
            <td>
                <dx:ASPxTextBox ID="txtdrivername" Width="300px " runat="server" >
                </dx:ASPxTextBox>
            </td>
        </tr>
         <tr> <td> &nbsp;</td></tr>
        <tr>
           <%-- <td class="auto-style25">
               <%-- To Whom--%>
             <%--    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Select Employee">
                </dx:ASPxLabel>   

            </td>--%>
            <td class="auto-style25">
   Select Employee<span style="color:red">*</span></td>
            <td class="auto-style20">
                <%--<dx:ASPxTextBox ID="txt_name" runat="server" Width="170px" >
                </dx:ASPxTextBox>--%>

                 <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" DataSourceID="SqlDataSource2"  Width="300px"
                     ValueField="CustodianID"  IncrementalFilteringMode="StartsWith" TextField="CustodianName" ValueType="System.String" 
                     CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue"  SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                </dx:ASPxComboBox>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" SelectCommand="SELECT [CustodianID], [CustodianName] FROM [CustodianMaster]"></asp:SqlDataSource>
           
            </td>
            <td class="auto-style23">
                &nbsp;</td>
            <td class="auto-style26">
                ContactNo <span style="color:red">*</span></td>
            <td>
                <dx:ASPxTextBox ID="txt_contactno" Width="170px" runat="server" >
                </dx:ASPxTextBox>
            </td>
        </tr>
         <tr> <td> &nbsp;</td></tr>
        <tr>
            <td class="auto-style25">
                SendBy <span style="color:red">*</span></td>
            <td class="auto-style20">
                <dx:ASPxTextBox ID="txt_sendby" Width="300px" runat="server" >
                </dx:ASPxTextBox>
            </td>
            <td class="auto-style23">
                &nbsp;</td>
            <td class="auto-style26">
                Remarks</td>
            <td rowspan="2">
                <dx:ASPxMemo ID="memo_remarks" runat="server" Height="42px" Width="300px">
                </dx:ASPxMemo>
            </td>
        </tr>
         <tr> <td> &nbsp;</td></tr>
        <tr>
            <td class="auto-style25">
           <%-- <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Select Employee">
                </dx:ASPxLabel>   --%> 
            </td>
            <td class="auto-style20">
           <%-- <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" DataSourceID="SqlDataSource2" ValueField="EmployeeID" TextField="FirstName" ValueType="System.String">
                </dx:ASPxComboBox>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PentagonLogistixPvtLtdConnectionString %>" SelectCommand="SELECT [EmployeeID], [FirstName] FROM [EmployeeMaster]"></asp:SqlDataSource>
           --%>
                 </td>
            <td class="auto-style23">
                &nbsp;</td>
            <td class="auto-style26">
                &nbsp;</td>
        </tr>
        </table>
    <span class="auto-style17"><strong style="margin-left:15px">Scan/Enter Asset Code for Dispatch</strong></span>
    <table style="margin-left:15px" class="auto-style28">
         <tr> <td> &nbsp;</td></tr>
        <tr>
            <td class="auto-style21">
                <strong>Scan RFID</strong><span style="color:red">*</span></td>
            <td class="auto-style21">
                <dx:ASPxTextBox ID="txt_scanbarcode" runat="server" Width="300px"   
                    ontextchanged="txt_scanbarcode_TextChanged" AutoPostBack="True">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style29" colspan="2">
                   OR</td>
        </tr>
         <tr> <td> &nbsp;</td></tr>
        <tr>
            <td class="auto-style21">
                 <strong>Select Items</strong> <span style="color:red">*</span>
            </td>
          <%--  <td class="auto-style4">
                <dx:ASPxGridLookup ID="GridLookup_assetbarcode" runat="server" Width="200px" AutoPostBack="true" AutoGenerateColumns="False" 
                    DataSourceID="SqlDataSource1"                    
                    KeyFieldName="Barcode" OnTextChanged="GridLookup_assetbarcode_TextChanged">
                    <GridViewProperties>
                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" HeaderFilterMaxRowCount="10"></SettingsBehavior>
                    </GridViewProperties>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="Barcode" ReadOnly="True" VisibleIndex="0">
                             <EditFormSettings Visible="True" />
                        </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="AssetDescription" VisibleIndex="1">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                     <%--<SettingsSearchPanel Visible="true" />--%>
                    
                <%--</dx:ASPxGridLookup>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RCBSAPConnectionString %>" SelectCommand="SELECT [Barcode],AssetDescription FROM [AssetMaster]"></asp:SqlDataSource>
            </td>--%>

                <td>
        <dx:ASPxGridLookup ID="GridLookup_assetbarcode" runat="server" TextFormatString="{1}" AutoGenerateColumns="False"  AutoPostBack="true" DataSourceID="SqlDataSource1" Height="25px" KeyFieldName="SLNO"
            Width="300px"  OnTextChanged="GridLookup_assetbarcode_TextChanged" IncrementalFilteringMode="StartsWith" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue"  SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
               <GridViewProperties>
   <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>
  <Settings ShowFilterRow="True" />
  <SettingsPager PageSize="8"></SettingsPager>
</GridViewProperties>
            <Columns>
                 <dx:GridViewDataTextColumn FieldName="SLNO" ReadOnly="True" VisibleIndex="0" Visible="false">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="AssetID" ReadOnly="True" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MainAssetNumber" ReadOnly="True" VisibleIndex="2" Caption="Equipment Number">
                 </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn FieldName="AssetSubNumber" ReadOnly="True" VisibleIndex="3">
                     </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="AssetDesc" VisibleIndex="4" Caption="Asset Name">
                </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn FieldName="RFIDCardNumber" VisibleIndex="5">
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
                    <GridViewStylesEditors>
            <CalendarHeader Spacing="11px">
            </CalendarHeader>
            <ProgressBar Height="25px">
            </ProgressBar>
        </GridViewStylesEditors>
        <ValidationSettings>
            <ErrorFrameStyle ImageSpacing="4px">
                <ErrorTextPaddings PaddingLeft="4px" />
            </ErrorFrameStyle>
        </ValidationSettings>
                </dx:ASPxGridLookup>
          <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RCBSAPConnectionString %>" SelectCommand="SELECT SLNO,AssetID,MainAssetNumber,AssetSubNumber,AssetDesc,RFIDCardNumber FROM [AssetMaster] where RFIDCardNumber IS NOT NULL and Status='AVAl'"></asp:SqlDataSource>

    </td>
    <td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="GridLookup_assetbarcode" ForeColor="Red" ValidationGroup="btn" runat="server" ErrorMessage="Please select Item"></asp:RequiredFieldValidator>
    </td>
</tr>
    <tr> <td> &nbsp;</td></tr>    
    </table>
    <br />
    <strong style="margin-left:15px"><span class="auto-style17">Scanned Asset List for Dispatch</span></strong><br />
           <br /> 
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" style="margin-left:15px"
    AutoGenerateColumns="False" Width="1000px" 
        KeyFieldName="AssetID" OnRowCommand="ASPxGridView1_RowCommand" 
   CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue">
        <TotalSummary>

            <dx:ASPxSummaryItem FieldName="Total" SummaryType="Sum" />
        </TotalSummary>
        <Columns>
            <dx:GridViewDataTextColumn FieldName="Delete" VisibleIndex="0">
         <DataItemTemplate>            
              <asp:LinkButton ID="Delete" runat="server" CommandName="Delete" Text="Edit">Delete
             </asp:LinkButton>
             </DataItemTemplate>
                 </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="SLNO" ReadOnly="True" 
                VisibleIndex="1" Visible="false">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="AssetID" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetDesc" VisibleIndex="3" Caption="Asset Name">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Quantity" FieldName="Quantity" 
                VisibleIndex="4">
            </dx:GridViewDataTextColumn>           
            <dx:GridViewDataTextColumn Caption="SAP No" FieldName="AssetSAPNo" 
                VisibleIndex="2">
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsPager PageSize="1000">
        </SettingsPager>
        <Settings ShowFooter="True" />
        <%--<Images SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
            <LoadingPanelOnStatusBar Url="~/App_Themes/Glass/GridView/gvLoadingOnStatusBar.gif">
            </LoadingPanelOnStatusBar>
            <LoadingPanel Url="~/App_Themes/Glass/GridView/Loading.gif">
            </LoadingPanel>
        </Images>
        <ImagesFilterControl>
            <LoadingPanel Url="~/App_Themes/Glass/Editors/Loading.gif">
            </LoadingPanel>
        </ImagesFilterControl>
        <Styles CssFilePath="~/App_Themes/Glass/{0}/styles.css" 
            CssPostfix="Glass">--%>
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
            <Header ImageSpacing="5px" SortingImageSpacing="5px">
            </Header>
        </Styles>
        <StylesEditors>
            <CalendarHeader Spacing="1px">
            </CalendarHeader>
            <ProgressBar  >
            </ProgressBar>
        </StylesEditors>
    </dx:ASPxGridView>
    <br />
    <dx:ASPxButton ID="btnprint" runat="server" style="margin-left:15px" Text="Issue & Print Gate Pass" onclick="btnprint_Click" 
    CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" priteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Width="193px">
    </dx:ASPxButton>
  </div>  
</asp:Content>

