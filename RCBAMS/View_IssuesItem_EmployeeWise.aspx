<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="View_IssuesItem_EmployeeWise.aspx.cs" Inherits="RFID_Reader_View_IssuesItem_EmployeeWise" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
       /* .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 135px;*/
        .auto-style2 {
     width: 108px;
 }
 .style10
 {
     color: #FF0000;
 }
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
   <div class="container cnt_div" cssclass="container">

    <table>
              <tr>
      <h4><strong>View Issue Items</strong></h4>
      </tr>
         
          <tr> <td> &nbsp;</td></tr>  
          
        <tr>
<%--            <td>
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Select Employee :">
                </dx:ASPxLabel>
            </td>--%>
                     <td class="auto-style25">
Select Employee :</td>
            <td>
                <%--<dx:ASPxComboBox ID="cmb_employee" runat="server" AutoPostBack="true" TextField="FirstName" ValueField="EmployeeID" DataSourceID="SqlDataSource1" Height="18px" ValueType="System.String" Width="200px">
                </dx:ASPxComboBox>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PentagonLogistixPvtLtdConnectionString %>" 
                    SelectCommand="SELECT [EmployeeID], [FirstName] FROM [EmployeeMaster]"></asp:SqlDataSource>--%>
                 <%-- <dx:ASPxComboBox ID="cmb_employee" runat="server" AutoPostBack="true" DataSourceID="SqlDataSource1" Width="200px"  ValueField="CustodianID" TextField="CustodianName" ValueType="System.String" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue"  SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
 </dx:ASPxComboBox>--%>

             <dx:ASPxComboBox ID="cmb_employee" runat="server" AutoPostBack="true" DataSourceID="SqlDataSource1" Width="200px"  
    ValueField="CustodianID" TextField="CustodianName" ValueType="System.String" 
    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue"  
    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" EnableFiltering="true" 
    EnableCallbackMode="true" IncrementalFilteringMode="StartsWith">
</dx:ASPxComboBox>

 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" SelectCommand="SELECT [CustodianID], [CustodianName] FROM [CustodianMaster]"></asp:SqlDataSource>
           
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr> <td> &nbsp;</td></tr>  
        <tr> <td> &nbsp;</td></tr>  
        </table>
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" DataSourceID="SqlDataSource2" KeyFieldName="AssetOutBoundDetailID">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="AssetOutBoundDetailID" ReadOnly="True" VisibleIndex="0">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetOutBoundID" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetID" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Quantity" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetDesc" VisibleIndex="5" Caption="Asset Name">
            </dx:GridViewDataTextColumn>
        </Columns>
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
            <Header ImageSpacing="5px" SortingImageSpacing="5px">
            </Header>
        </Styles>
        <StylesEditors>
            <CalendarHeader Spacing="1px">
            </CalendarHeader>
            <ProgressBar Height="25px">
            </ProgressBar>
        </StylesEditors>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RCBSAPConnectionString %>" SelectCommand="SELECT [AssetOutBoundDetailID], AssetOutBoundDetails.AssetOutBoundID, AssetOutBoundDetails.AssetID, AssetOutBoundDetails.Quantity, AssetOutBoundDetails.Status,AssetDesc  FROM AssetOutBoundDetails INNER JOIN AssetMaster ON AssetMaster.AssetID=AssetOutBoundDetails.AssetID INNER JOIN AssetOutBoundMaster ON AssetOutBoundMaster.AssetOutBoundID=AssetOutBoundDetails.[AssetOutBoundID]  WHERE itemStatus='Assign' AND EmployeeID=@cmb_employee">
       <SelectParameters>
           <asp:ControlParameter Name="cmb_employee" ControlID="cmb_employee" />
       </SelectParameters>
    </asp:SqlDataSource>
    <br />
    </div>
</asp:Content>

