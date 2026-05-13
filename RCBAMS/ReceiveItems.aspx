<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ReceiveItems.aspx.cs" Inherits="ReceiveItems" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxLoadingPanel" tagprefix="dxlp" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPanel" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v11.1" namespace="DevExpress.Web.ASPxPanel" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    
    <style type="text/css">
        .style105
        {
            font-size: medium;
            color: #000000;
        }
        .style107
        {
            font-size: medium;
            color: #000000;
            width: 845px;
        }
        .style108
        {
            font-size: small;
            width: 124px;
        }
        .style109
        {
            font-size: small;
            width: 219px;
        }
        .style110
        {
            width: 250px;
        }
        .style111
        {
            width: 1673px;
        }
        .style112
        {
            width: 81px;
        }
        .style113
        {
            width: 172px;
        }
        .style114
        {
            width: 58px;
        }
        .style115
        {
            color: #FF0000;
        }
        .style116
        {
    }
        .style117
        {
            font-size: medium;
            color: #000000;
            }
        .style119
        {
            width: 412px;
        }
        .style126
        {
            color: #FF0000;
            width: 210px;
        }
        .style128
        {
            width: 209px;
        }
        .style133
        {
            font-size: small;
            width: 264px;
        }
        .auto-style8
        {}
        .style136
        {
            width: 263px;
        }
        .style137
        {
            font-size: medium;
            color: #000000;
            width: 41px;
        }
        .style140
        {
            width: 156px;
        }
        .style146
        {
            width: 260px;
        }
        .style147
        {
            font-size: medium;
            color: #000000;
            width: 262px;
        }
        .style148
        {
            width: 137px;
        }
        .style149
        {
            color: #FF0000;
            width: 134px;
        }
        .style150
        {
            width: 154px;
        }
        .style13
{
    font-size: small;
    width: 100px;
}
             .dxbButton {
    background: transparent !important;
    border: none !important;
}
        .auto-style9 {
            width: 166px;
        }
        .auto-style10 {
        font-size: medium;
        color: #000000;
        width: 183px;
    }
    .auto-style11 {
        width: 140px;
    }
    .auto-style12 {
        width: 84px;
    }
    .auto-style13 {
        width: 162px;
    }
    .auto-style14 {
        font-size: small;
        width: 121px;
    }
        </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <dx:ASPxLabel ID="lbl_error" runat="server" 
                     style="font-weight: 700; color: #FF0000 ">
                 </dx:ASPxLabel>
                 <br />
    <strong  style="margin-left:75px"><span class="style105">Received Items From Warehouse</span></strong><br />
    <table style="margin-left:75px">
        <tr>
            <td class="auto-style14">
                WareHouse</td>
            <td class="auto-style10">
                <dx:ASPxLabel ID="lbl_name" runat="server" Font-Size="Larger" Font-Bold="true" ForeColor="Red" >
                </dx:ASPxLabel>
            </td>
                                                     <td class="auto-style12">
               Unit Name
           </td>
           <td class="auto-style13">
                <dx:ASPxLabel ID="lbl_unitname" runat="server" 
    style="font-weight: 700; color: #FF3300; font-size: medium; margin-left: 0px;" >
</dx:ASPxLabel>
           </td>
           <td class="auto-style11">
               Category Name
           </td>
           <td>

                <dx:ASPxLabel ID="lbl_category" runat="server" 
    style="font-weight: 700; color: #FF3300; font-size: medium;" >
</dx:ASPxLabel>
           </td>
           
        </tr>
        </table>
        
        <table style="margin-left: 75px">
        <tr><dx:ASPxLabel ID="lbl_msg" runat="server" style="color: red" Visible="false" Text="">
      </dx:ASPxLabel>
            <td class="style133">
                Select Requisition <span class="style115"><strong>*</strong></span></td>
            <td class="style117">
                <dx:ASPxGridLookup ID="ASPxGridLookup1" runat="server" width="175px" Height="25px"
                    AutoGenerateColumns="False" DataSourceID="SqlDataSource2" 
                    KeyFieldName="OutDeliveryID" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
                    CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" 
                    IncrementalFilteringMode="Contains">
<GridViewProperties>
<SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>
    <Settings ShowFilterRow="True" ShowFilterRowMenu="True" />
</GridViewProperties>
                    <Columns>
                   
                    <dx:GridViewDataTextColumn FieldName="OutDeliveryID" ReadOnly="True" VisibleIndex="0">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ReqID" ReadOnly="True" VisibleIndex="0">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="Date" VisibleIndex="1" Visible="false">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn FieldName="Description" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="sendby" VisibleIndex="3" Visible="false">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="4" Visible="false">
                        </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="GodownName" Caption="Godown Name" VisibleIndex="1">
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
            </td>
            <td class="style137">
               <dx:ASPxButton ID="btn_search" runat="server" BackColor="White" 
                    CssClass="auto-style8" Image-Url="~/Images/search1.png" 
                    onclick="btn_search_Click" Width="16px">
                    <Image Height="20px" Url="~/Images/search1.png" Width="20px">
                    </Image>
                    <Border BorderColor="White" />
                     <ClientSideEvents Click="function(s, e) {  lpanel.Show(); e.processOnServer = true;}" />
                </dx:ASPxButton>
            </td>
            <td class="style116">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style133">
                Reason For Sending Less items</td>
            <td class="style117" colspan="2">
                <dx:ASPxLabel ID="lbl_reason" runat="server" style="font-weight: 700" >
                </dx:ASPxLabel>
            </td>
            <td class="style116">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
         </table>
        <%-- <table style="margin-left: 75px">
        <tr>
        <td class="style136">
            Received By <span class="style115"><strong>*</strong></span></td>
        <td class="style119">
            <dx:ASPxRadioButtonList ID="ASPxRadioButtonList1" runat="server" 
                RepeatDirection="Horizontal" CssClass="Glass" 
                CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" 
                onselectedindexchanged="ASPxRadioButtonList1_SelectedIndexChanged" 
                SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" AutoPostBack="True">
                <Items>
                    <dx:ListEditItem Text="By Courier" Value="1" />
                    <dx:ListEditItem Text="By Truck" Value="2" />
                </Items>
                <Border BorderWidth="0px" />
            </dx:ASPxRadioButtonList>
        </td>
        </tr>
         </table>--%>
                            <table style="margin-left: 75px">
                            <tr>
                                <td class="style133">
                                    Vehicle Type 
                                </td>
                                 <td class="style117">
                                                                          <dx:ASPxLabel ID="vehicletypeid" Visible="false" runat="server" style="font-weight: 700" >
</dx:ASPxLabel>
                                      <dx:ASPxLabel ID="cmbVehicleType" runat="server" style="font-weight: 700" >
 </dx:ASPxLabel>
                               <%--       <dx:ASPxComboBox ID="cmbVehicleType" runat="server" Width="175px"
     ValueField="VehicleTypeID" TextField="VehicleType"
     DataSourceID="SqlDataSource6"
     AutoPostBack="true"
     OnSelectedIndexChanged="cmbVehicleType_SelectedIndexChanged"
     CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css"
     CssPostfix="PlasticBlue"
     SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css"
     Height="25px">
</dx:ASPxComboBox>--%>

<asp:SqlDataSource ID="SqlDataSource6" runat="server"
     ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>"
     SelectCommand="SELECT VehicleTypeID, VehicleType FROM VehicleTypeMaster WHERE Status='Active'">
</asp:SqlDataSource>
                                     </td>
                                <td class="style13"></td>
                                <td class="auto-style9">
                                     Vehicle Name </td>
                              
                                 <td class="style119">

                                                                                                               <dx:ASPxLabel ID="vehid" Visible="false" runat="server" style="font-weight: 700" >
</dx:ASPxLabel>
                                                                          <dx:ASPxLabel ID="comb_VehNumb" runat="server" style="font-weight: 700" >
</dx:ASPxLabel>
                                    <%--  <dx:ASPxGridLookup ID="comb_VehNumb" runat="server"   width="175px"
     DataSourceID="SqlDataSource_Vehicles"
     KeyFieldName="VehicleID"
     TextFormatString="{0} | {1} | {2}"
     CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css"
     CssPostfix="PlasticBlue"
     SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css"
     Height="25px"
     AutoPostBack="true"
     
     OnValueChanged="comb_VehNumb_ValueChanged">

     <GridViewProperties>
         <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True" />
         <Settings ShowFilterRow="True" ShowFilterRowMenu="True" />
     </GridViewProperties>

     <Columns>
         <dx:GridViewDataTextColumn FieldName="RegistrationNumber" Caption="Registration No." Width="150px" />
         <dx:GridViewDataTextColumn FieldName="VehicleName" Caption="Vehicle Name" Width="150px" />
         <dx:GridViewDataTextColumn FieldName="Model" Caption="Model" Width="120px" />
         <dx:GridViewDataTextColumn FieldName="ManufacturedYear" Caption="Year" Width="100px" />
     </Columns>
</dx:ASPxGridLookup>--%>

<asp:SqlDataSource ID="SqlDataSource_Vehicles" runat="server"
     ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>"
     SelectCommand="SELECT VehicleID, RegistrationNumber, VehicleName, Model, ManufacturedYear
                    FROM Vehicle_master
                    WHERE Status='Active' AND VehicleTypeID = @VehicleTypeID">
     <SelectParameters>
         <asp:ControlParameter Name="VehicleTypeID" ControlID="cmbVehicleType" PropertyName="Value" Type="Int32" />
     </SelectParameters>
</asp:SqlDataSource>
                                     </td>
                            </tr>
                        </table>
         <br />
        <%-- <dx:ASPxPanel ID="ASPxPanel1" runat="server" style="margin-left:75px" 
        Visible="false">
        <PanelCollection>
<dx:PanelContent ID="PanelContent1" runat="server" SupportsDisabledAttribute="True" >
    <table>
        <tr>
            <td class="style147">
                <dx:ASPxLabel ID="lbl_crname" runat="server" Text="Courier Name " 
                    style="color: #666666">
                </dx:ASPxLabel>
                <span class="auto-style1" style="color: #FF0000">
                <dx:ASPxLabel ID="lblstar1" runat="server" style="font-weight: 700" Text="*">
                </dx:ASPxLabel>
                </span>
            </td>
            <td class="style126">
                <dx:ASPxComboBox ID="cmb_couriername" runat="server" Width="200px"
                    DataSourceID="SqlDataSource3" TextField="CourierName" ValueField="CourierID" 
                    ValueType="System.Int32" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
                    CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                    <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                    </LoadingPanelImage>
                    <ValidationSettings>
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
                </dx:ASPxComboBox>
            </td>
            <td class="style149">
                &nbsp;</td>
            <td class="style150">
                <dx:ASPxLabel ID="lbl_ccontactno" runat="server" Text="Courier ContactNo">
                </dx:ASPxLabel>
            </td>
            <td class="style4">
                <dx:ASPxTextBox ID="txt_couriermobile" runat="server" Height="20px" 
                    Width="200px">
                </dx:ASPxTextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style147">
                <dx:ASPxLabel ID="lbl_awbno" runat="server" Text="AWB Number" 
                    style="color: #666666">
                </dx:ASPxLabel>
                <span class="auto-style1" style="color: #FF0000">&nbsp;<dx:ASPxLabel ID="lblstar2" 
                    runat="server" style="font-weight: 700" Text="*">
                </dx:ASPxLabel>
                &nbsp;</span></td>
            <td class="style126">
                <dx:ASPxTextBox ID="txt_awbno" runat="server" Height="20px" Width="200px">
                </dx:ASPxTextBox>
            </td>
            <td class="style149">
                &nbsp;</td>
            <td class="style150">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
            </dx:PanelContent>
</PanelCollection>
    </dx:ASPxPanel>
    <dx:ASPxPanel ID="ASPxPanel2" runat="server" style="margin-left:75px" Visible="false">
        <PanelCollection>
<dx:PanelContent ID="PanelContent2" runat="server" SupportsDisabledAttribute="True" >
    <table>
        <tr>
            <td class="style146" >
                <dx:ASPxLabel 
                    ID="lbl_transporter" runat="server" Text="Transporter Name">
                </dx:ASPxLabel>
                </span>
            </td>
            <td class="style128" >
                <dx:ASPxTextBox ID="txt_transporter" runat="server" Width="200px">
                </dx:ASPxTextBox>
            </td>
            <td class="style148">
                &nbsp;</td>
            <td class="style140" >
                <dx:ASPxLabel ID="lbl_challno" runat="server" Text="Invioce No/Dc No">
                </dx:ASPxLabel>
                <span class="auto-style1" style="color: #FF0000">&nbsp;<dx:ASPxLabel ID="lblstar4" 
                    runat="server" style="font-weight: 700" Text="*">
                </dx:ASPxLabel>
                </span>
            </td>
            <td >
                <dx:ASPxTextBox ID="txt_challno" runat="server" Height="20px" Width="200px">
                </dx:ASPxTextBox>
            </td>
            <td>
                </td>
        </tr>
        <tr>
            <td class="style146" >
                <dx:ASPxLabel ID="lbl_vehicleno" runat="server" Text="Lr No">
                </dx:ASPxLabel>
                <span class="auto-style1" style="color: #FF0000">
                <dx:ASPxLabel ID="lblstar3" runat="server" style="font-weight: 700" Text="*">
                </dx:ASPxLabel>
                </span>
            </td>
            <td class="style128" >
                <dx:ASPxTextBox ID="txt_vechno" runat="server" Height="20px" Width="200px">
                </dx:ASPxTextBox>
            </td>
            <td class="style148">
                &nbsp;</td>
            <td class="style140" >
                <dx:ASPxLabel ID="lbl_lrdate" runat="server" Text="Lr Date">
                </dx:ASPxLabel>
                <span class="auto-style1" style="color: #FF0000"><strong>
                <dx:ASPxLabel ID="lblstar6" runat="server" Text="*">
                </dx:ASPxLabel>
                </strong></span>
            </td>
            <td >
                <dx:ASPxDateEdit ID="DateEdit_lrdate" runat="server" Width="200px"
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" 
                    DisplayFormatString="dd-MM-yyyy">
                    <ValidationSettings>
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
                </dx:ASPxDateEdit>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style146" >
                <dx:ASPxLabel ID="lbl_dname" runat="server" Text="Driver Name">
                </dx:ASPxLabel>
            </td>
            <td class="style128" >
                <dx:ASPxTextBox ID="txt_dname" runat="server" Height="20px" Width="200px">
                </dx:ASPxTextBox>
            </td>
            <td class="style148">
                &nbsp;</td>
            <td class="style140">
                <dx:ASPxLabel ID="lbl_dmobile" runat="server" Text="Driver MobileNo">
                </dx:ASPxLabel>
                <span class="auto-style1" style="color: #FF0000"><strong>&nbsp;<dx:ASPxLabel 
                    ID="lblstar5" runat="server" Text="*">
                </dx:ASPxLabel>
                </strong></span>
            </td>
            <td >
                <dx:ASPxTextBox ID="txt_dmobile" runat="server" Height="20px" Width="200px">
                </dx:ASPxTextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
            </dx:PanelContent>
</PanelCollection>
    </dx:ASPxPanel>--%>

    <table style="margin-left:75px;">
        <tr>
            <td class="style146">
                Remarks</td>
            <td>
                <asp:TextBox ID="ASPxMemo1" runat="server" Width="175px" TextMode="MultiLine" Rows="2" Columns="18">
                </asp:TextBox>
            </td>
        </tr>
        </table>

    <br />
    <span class="style105"><strong  style="margin-left:75px">List Of Send Items</strong></span><dx:ASPxGridView 
        ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" KeyFieldName="DeliveryItemId" 
        style="margin-left: 75px" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
        CssPostfix="PlasticBlue" Width="969px">
        <TotalSummary>
            <dx:ASPxSummaryItem FieldName="Quantity" SummaryType="Sum" />
            <dx:ASPxSummaryItem FieldName="ItemCode" SummaryType="Count" />
        </TotalSummary>
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="0">
                <ClearFilterButton Visible="True">
                </ClearFilterButton>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="DeliveryItemId" ReadOnly="True" Visible="false" 
                VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ReqID" VisibleIndex="2" Visible="false">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ItemID" VisibleIndex="3" Visible="false">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="ItemCode" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ItemName" VisibleIndex="4" Width="300px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Size" VisibleIndex="5" Visible="false">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Colour" VisibleIndex="6" Visible="false">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Brand" VisibleIndex="7" Visible="false">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Style" VisibleIndex="8" Visible="false">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Quantity" VisibleIndex="9" Caption="SendQuantity">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Quantity" Caption="Received Qty" VisibleIndex="10">
  <DataItemTemplate>
                 <dx:ASPxSpinEdit ID="txt_qty" runat="server" 
                         CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue"
                     Height="21px" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" 
                     Text='<%# Eval("Quantity") %>'>
                 </dx:ASPxSpinEdit>
             </DataItemTemplate>
 </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsPager PageSize="1000" ShowDefaultImages="False">
            <allbutton text="All">
            </allbutton>
            <nextpagebutton text="Next &gt;">
            </nextpagebutton>
            <prevpagebutton text="&lt; Prev">
            </prevpagebutton>
        </SettingsPager>
        <Settings ShowGroupPanel="True" ShowFilterRow="True" ShowFooter="True" />
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
   
       <asp:UpdatePanel ID="UpdatePanel1" runat="server" Visible="false">
                    <ContentTemplate>
                        <dx:ASPxLabel ID="lbl_innererror" runat="server" 
                            style="color: #FF0000; font-weight: 700" >
                        </dx:ASPxLabel>
                    <br />
                     <strong style="margin-left: 75px" ><span class="style105">Scan Items</span></strong><br />
    <table style="margin-left: 75px" >
        <tr>
            <td class="style108">
                Items</td>
            <td class="style110">
             
                        <dx:ASPxTextBox ID="txt_ScanItem" runat="server" AutoPostBack="True" 
                            ontextchanged="txt_ScanItem_TextChanged" Width="200px">
                        </dx:ASPxTextBox>                   
            </td>
        </tr>
    </table>
    <br />
   
    <table
        style="margin-left: 75px; width: 970px;">
        <tr>
            <td class="style111">
                 <strong ><span class="style105">List Of Scanned/Received Items</span></strong>
    </td>
            <td class="style112">
                 ScannnedQty </td>
            <td class="style113">
                 <dx:ASPxLabel ID="lbl_scanItem" runat="server" 
                     style="font-weight: 700; color: #FF0000">
                 </dx:ASPxLabel>
            </td>
            <td class="style114">
                 TotalQty</td>
            <td>
                <dx:ASPxLabel ID="lbl_TotalItem" runat="server" 
                    style="font-weight: 700; color: #3333FF">
                </dx:ASPxLabel>
            </td>
        </tr>
        </table>
  
    <dx:ASPxGridView 
        ID="ASPxGridView2" runat="server" style="margin-left: 75px" Width="983px" 
        AutoGenerateColumns="False" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
        CssPostfix="PlasticBlue">
        <TotalSummary>
            <dx:ASPxSummaryItem FieldName="ItemCode" SummaryType="Count" />
        </TotalSummary>
        <Columns>
            <dx:GridViewDataTextColumn FieldName="ItemID" VisibleIndex="0">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ItemCode" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ItemName" VisibleIndex="2" Width="300px">
            </dx:GridViewDataTextColumn>            
            <dx:GridViewDataTextColumn FieldName="Size" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Color" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Brand" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Style" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="SQuantity" VisibleIndex="6" Caption="SendQuantity">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Quantity" VisibleIndex="7">
             <DataItemTemplate>
                            <dx:ASPxSpinEdit ID="txt_qty" runat="server" 
                                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                                Height="21px" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css"  
                                Text='<%# Eval("Quantity") %>'>
                            </dx:ASPxSpinEdit>
                        </DataItemTemplate>
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Date" VisibleIndex="6" Visible="false">
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsPager PageSize="1000" ShowDefaultImages="False">
            <allbutton text="All">
            </allbutton>
            <nextpagebutton text="Next &gt;">
            </nextpagebutton>
            <prevpagebutton text="&lt; Prev">
            </prevpagebutton>
        </SettingsPager>
        <Settings ShowGroupPanel="True" ShowFooter="True" />
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
     </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="txt_ScanItem" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
    <br />
    <dx:ASPxButton ID="btn_Save" runat="server" Text="Received & Print" 
        Width="180px" onclick="btn_Save_Click" style="margin-left: 74px" 
        CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css">

    </dx:ASPxButton>
    <br />

   <dxlp:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server" ClientInstanceName="lpanel" Modal="True" >
                        </dxlp:ASPxLoadingPanel>
    
<%--    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:PentagonLogistixPvtLtdConnectionString %>" 
        SelectCommand="Select POStblOutDelivery.OutDeliveryID,POStblOutDelivery.ReqID,[Date],[Description],sendby,
        POStblOutDelivery.[Status],GodownMaster.GodownName,* from POStblOutDelivery 
        INNER JOIN POSRequisitionParent ON POSRequisitionParent.ReqID=POStblOutDelivery.ReqID 
        INNER JOIN GodownMaster ON POSRequisitionParent.ReqReceivedBy=GodownMaster.GodownId 
        Where ReqSendBy=@GodownID AND POStblOutDelivery.[Status]='transfered' or POStblOutDelivery.[Status]='PartiallyReceived' 
        or POStblOutDelivery.[Status]='Received' Order by POStblOutDelivery.OutDeliveryID DESC">
        <SelectParameters>
        <asp:SessionParameter SessionField="GodownID" Name="GodownID"  />
        </SelectParameters>
    </asp:SqlDataSource>--%>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
        SelectCommand="SELECT POStblOutDelivery.OutDeliveryID,POStblOutDelivery.ReqID,[Date], [Description],
sendby,POStblOutDelivery.[Status],GodownMaster.GodownName,* FROM POStblOutDelivery
INNER JOIN POSRequisitionParent ON POSRequisitionParent.ReqID = POStblOutDelivery.ReqID
INNER JOIN GodownMaster ON POSRequisitionParent.ReqReceivedBy = GodownMaster.GodownId
WHERE ReqSendBy = @GodownID AND (POStblOutDelivery.[Status] IN ('transfered', 'PartiallyReceived'))
ORDER BY POStblOutDelivery.OutDeliveryID DESC">
        <SelectParameters>
        <asp:SessionParameter SessionField="GodownID" Name="GodownID"  />
        </SelectParameters>
    </asp:SqlDataSource>
    <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:PentagonLogistixPvtLtdConnectionString %>"
        SelectCommand="SELECT        dbo.POStblOutDeliveryDetails .ItemCode, dbo.ItemMaster.ItemName, dbo.SizeMaster.Code AS Size, dbo.ItemMaster.Colour, dbo.ItemMaster.Brand, dbo.POStblOutDeliveryDetails .Quantity, 
                         dbo.POStblOutDeliveryDetails .DeliveryItemId, dbo.POStblOutDelivery.ReqID, dbo.ItemMaster.Style,dbo.POStblOutDeliveryDetails .ItemID
FROM            dbo.POStblOutDelivery INNER JOIN
                         dbo.POStblOutDeliveryDetails  ON dbo.POStblOutDeliveryDetails .OutDeliveryID = dbo.POStblOutDelivery.OutDeliveryID INNER JOIN
                         dbo.ItemMaster ON dbo.POStblOutDeliveryDetails .ItemID = dbo.ItemMaster.ItemID INNER JOIN
                         dbo.SizeMaster ON dbo.ItemMaster.Size = dbo.SizeMaster.SizeID
WHERE        (dbo.POStblOutDelivery.ReqID = @ReqId) AND (POStblOutDelivery.OutDeliveryID=@OutID) AND (dbo.POStblOutDeliveryDetails .Status = 'Transfered')">
        <SelectParameters>
        <asp:SessionParameter Name="ReqId" SessionField="RequestID" />
        <asp:SessionParameter Name="OutID" SessionField="OutID" />
        </SelectParameters>
    </asp:SqlDataSource>--%>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>"
        SelectCommand="SELECT        dbo.POStblOutDeliveryDetails .ItemCode, dbo.ItemMaster.ItemName,  dbo.ItemMaster.Colour, dbo.ItemMaster.Brand, dbo.POStblOutDeliveryDetails .Quantity, 
                         dbo.POStblOutDeliveryDetails .DeliveryItemId, dbo.POStblOutDelivery.ReqID, dbo.ItemMaster.Style,dbo.POStblOutDeliveryDetails .ItemID
FROM            dbo.POStblOutDelivery INNER JOIN
                         dbo.POStblOutDeliveryDetails  ON dbo.POStblOutDeliveryDetails .OutDeliveryID = dbo.POStblOutDelivery.OutDeliveryID INNER JOIN
                         dbo.ItemMaster ON dbo.POStblOutDeliveryDetails .ItemID = dbo.ItemMaster.ItemID 
                       
WHERE        (dbo.POStblOutDelivery.ReqID = @ReqId) AND (POStblOutDelivery.OutDeliveryID=@OutID) AND (dbo.POStblOutDeliveryDetails .Status = 'Transfered')">
        <SelectParameters>
        <asp:SessionParameter Name="ReqId" SessionField="RequestID" />
        <asp:SessionParameter Name="OutID" SessionField="OutID" />
        </SelectParameters>
    </asp:SqlDataSource>
        
    
        
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
                    SelectCommand="SELECT [CourierID], [CourierName] FROM [CourierMaster]">
                </asp:SqlDataSource>
                        
    </big>
                        
</asp:Content>