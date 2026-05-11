<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Return_Asset_From_Employee_Using_RFID.aspx.cs" Inherits="RFID_Reader_Return_Asset_From_Employee_Using_RFID" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridLookup" TagPrefix="dx" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxGridView" Assembly="DevExpress.Web.ASPxGridView.v11.1" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxEditors" Assembly="DevExpress.Web.ASPxEditors.v11.1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
          .auto-style2 {
              width: 108px;
          }
          .style10
          {
              color: #FF0000;
          }
        /*.auto-style17 {
            font-size: medium;
            color: #000000;
        }

        .auto-style20 {
            width: 100%;
        }

        .auto-style22 {
            width: 168px;
        }

        .auto-style23 {
            width: 168px;
            height: 21px;
        }

        .auto-style24 {
            height: 21px;
        }

        .auto-style25 {
            margin-left: 8px;
        }*/
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
        <div class="container cnt_div" cssclass="container">
<%--    <strong style="margin-left: 10px"><span class="auto-style17">Item Received<br /><br /></span></strong>--%>
        <table class="auto-style20">
        <tr>
            <h4><strong>Item Received</strong></h4>
            </tr>
             <tr> <td> &nbsp;</td></tr>  
            <tr>
     <td>
         <dx:ASPxLabel ID="lbl_message" runat="server" Text="" Font-Size="medium" ForeColor="Red">
         </dx:ASPxLabel>
     </td>
 </tr>
            <tr>
                <td class="auto-style22" style="font-size:medium">
                    Select GatePass No:<span style="color:red">*</span>
                </td>
                <td>

                    <dx:ASPxGridLookup ID="ASPxGridLookup1" Width="300px" runat="server" TextFormatString="{0}" AutoPostBack="true" AutoGenerateColumns="False" KeyFieldName="AssetOutBoundID" DataSourceID="SqlDataSource2" OnTextChanged="ASPxGridLookup1_TextChanged" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue"  SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                           <GridViewProperties>
   <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>
  <Settings ShowFilterRow="True" />
  <SettingsPager PageSize="15"></SettingsPager>
</GridViewProperties>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="AssetOutBoundID" ReadOnly="True" VisibleIndex="0">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn FieldName="Date" VisibleIndex="1" Caption=" OutBoundDate">
                            </dx:GridViewDataDateColumn>
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
               
                 <ValidationSettings>
                     <ErrorFrameStyle ImageSpacing="4px">
                         <ErrorTextPaddings PaddingLeft="4px" />
                     </ErrorFrameStyle>
                 </ValidationSettings>
                    </dx:ASPxGridLookup>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
              </table><br />
            <table style="border:2px solid rgb(199, 212, 220); width:500px">
            <tr>
                <td class="auto-style22">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style22">
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="AssetToWhom :" Font-Size="Medium">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <strong>
                        <dx:ASPxLabel ID="lbl_AssetToWhom" runat="server" Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
                        </dx:ASPxLabel>
                    </strong>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style22">
                    <strong>
                        <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Date :" Font-Size="Medium">
                        </dx:ASPxLabel>
                    </strong>
                </td>
                <td>
                    <strong>
                        <dx:ASPxLabel ID="lbl_date" runat="server" Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
                        </dx:ASPxLabel>
                    </strong>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style22">
                    <strong>
                        <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Sendby :" Font-Size="Medium">
                        </dx:ASPxLabel>
                    </strong>
                </td>
                <td>
                    <strong>
                        <dx:ASPxLabel ID="lbl_Sendby" runat="server" Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
                        </dx:ASPxLabel>
                    </strong>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style22">
                    <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="DriverName :" Font-Size="Medium">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <strong>
                        <dx:ASPxLabel ID="lbl_DriverName" runat="server" Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
                        </dx:ASPxLabel>
                    </strong>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style22">
                    <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="VehicleNo :" Font-Size="Medium">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <strong>
                        <dx:ASPxLabel ID="lbl_Vehicle" runat="server" Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
                        </dx:ASPxLabel>
                    </strong>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table><br />

    <dx:ASPxGridView ID="aspxgridview1" runat="server" AutoGenerateColumns="false" Width="1000px" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
        DataSourceID="db_returnData" KeyFieldName="AssetOutBoundDetailID">
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="0">
                <ClearFilterButton Visible="True">
                </ClearFilterButton>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="AssetOutBoundDetailID" ReadOnly="True" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetOutBoundID" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetID" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetDesc" VisibleIndex="4" Caption="Asset Name">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Quantity" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Select" VisibleIndex="7">
                <HeaderTemplate>
                    <dx:ASPxCheckBox ID="chkHeader" runat="server" AutoPostBack="true" OnCheckedChanged="chkHeader_CheckedChanged"></dx:ASPxCheckBox>
                </HeaderTemplate>
                <DataItemTemplate>
                    <dx:ASPxCheckBox ID="Check" runat="server">
                    </dx:ASPxCheckBox>
                </DataItemTemplate>
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
    <br />
    <br />
    <dx:ASPxButton ID="btnprint" runat="server" Text="Receive &amp; Print " OnClick="btnprint_Click" CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css"
         CssPostfix="SoftOrange" SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Width="141px" CssClass="auto-style25">
    </dx:ASPxButton>
    <asp:SqlDataSource ID="db_returnData" runat="server" ConnectionString="<%$ ConnectionStrings:RCBSAPConnectionString %>" SelectCommand="SELECT [AssetOutBoundDetailID], AssetOutBoundDetails.AssetOutBoundID, AssetOutBoundDetails.AssetID, AssetOutBoundDetails.Quantity, AssetOutBoundDetails.Status,AssetDesc  FROM AssetOutBoundDetails INNER JOIN AssetMaster ON AssetMaster.AssetID=AssetOutBoundDetails.AssetID INNER JOIN AssetOutBoundMaster ON AssetOutBoundMaster.AssetOutBoundID=AssetOutBoundDetails.[AssetOutBoundID] WHERE (AssetOutBoundDetails.AssetOutBoundID = @AssetOutBoundID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ASPxGridLookup1" Name="AssetOutBoundID" PropertyName="Value" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RCBSAPConnectionString %>" SelectCommand="SELECT [AssetOutBoundID], [Date] FROM [AssetOutBoundMaster] WHERE ReturnableStatus='YES'"></asp:SqlDataSource>
</asp:Content>

