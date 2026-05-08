<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ViewIssueAndReturnItems.aspx.cs" Inherits="ViewIssueAndReturnItems" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
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


    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="col-sm-12" runat="server">
<h4><strong>View Issued and Returned Assets</strong>
    </h4><br /><br />  

                        <div class="col-sm-12">           
                 <div class="col-sm-10"></div>
<div class="col-sm-1">
  <asp:ImageButton ID="ImageButton1" ImageAlign="Right"  ImageUrl="~/Images/PDF.png" runat="server" Height="35px" Width="40px" OnClick="ImageButton1_Click"    />
   
    </div>
<div class="col-sm-1">
   <asp:ImageButton ID="ImageButton2"  ImageUrl="~/Images/XLS.png" Height="35px" runat="server" OnClick="ImageButton2_Click" Width="35px" />
    
</div>
  </div>
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" 
                   Landscape="True" MaxColumnWidth="150" GridViewID="ASPxGridView1" 
                   LeftMargin="0" RightMargin="0" TopMargin="0">
 </dx:ASPxGridViewExporter>
        <div class="col-sm-12">
            <div class="col-sm-4">
                              <h4> <span><strong>Issued Assets</strong></span></h4>
                </div>
            </div>
            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" DataSourceID="SqlDataSource2" KeyFieldName="AssetOutBoundDetailID">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="AssetOutBoundDetailID" ReadOnly="True" VisibleIndex="0">
                <EditFormSettings Visible="true" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetOutBoundID" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetID" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Quantity" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <%--<dx:GridViewDataTextColumn FieldName="AssetDesc" VisibleIndex="3" Caption="Asset Name">
            </dx:GridViewDataTextColumn>--%>
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
        <div class="col-sm-12"></div>
                        <div class="col-sm-12">           
                 <div class="col-sm-10"></div>
<div class="col-sm-1">
  <asp:ImageButton ID="ImageButton3" ImageAlign="Right"  ImageUrl="~/Images/PDF.png" runat="server" Height="35px" Width="40px" OnClick="ImageButton3_Click"    />
   
    </div>
<div class="col-sm-1">
   <asp:ImageButton ID="ImageButton4"  ImageUrl="~/Images/XLS.png" Height="35px" runat="server" OnClick="ImageButton4_Click" Width="35px" />
    
</div>
  </div>
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter2" runat="server" 
                   Landscape="True" MaxColumnWidth="150" GridViewID="ASPxGridView2" 
                   LeftMargin="0" RightMargin="0" TopMargin="0">
 </dx:ASPxGridViewExporter>
        <div class="col-sm-12">
            <div class="col-sm-4">
                              <h4> <span><strong>Returned Assets</strong></span></h4>
                </div>
            </div>
        <dx:ASPxGridView ID="aspxgridview2" runat="server" AutoGenerateColumns="false" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" DataSourceID="db_returnData" KeyFieldName="AssetOutBoundDetailID">
    <Columns>
        <%--<dx:GridViewCommandColumn VisibleIndex="0">
            <ClearFilterButton Visible="false">
            </ClearFilterButton>
        </dx:GridViewCommandColumn>--%>
        <dx:GridViewDataTextColumn FieldName="AssetReceivedDetailsID" ReadOnly="True" VisibleIndex="1">
            <EditFormSettings Visible="False" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="AssetReceivedID" VisibleIndex="2">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="AssetID" VisibleIndex="3">
        </dx:GridViewDataTextColumn>
       <%-- <dx:GridViewDataTextColumn FieldName="AssetDesc" VisibleIndex="4" Caption="Asset Name">
        </dx:GridViewDataTextColumn>--%>
        <dx:GridViewDataTextColumn FieldName="Quantity" VisibleIndex="5">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="6">
        </dx:GridViewDataTextColumn>
        <%--<dx:GridViewDataTextColumn Caption="Select" VisibleIndex="7">--%>
            <%--<HeaderTemplate>
                <dx:ASPxCheckBox ID="chkHeader" runat="server" AutoPostBack="true" OnCheckedChanged="chkHeader_CheckedChanged"></dx:ASPxCheckBox>
            </HeaderTemplate>
            <DataItemTemplate>
                <dx:ASPxCheckBox ID="Check" runat="server">
                </dx:ASPxCheckBox>
            </DataItemTemplate>--%>
        <%--</dx:GridViewDataTextColumn>--%>
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

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RCBSAPConnectionString %>" SelectCommand="SELECT * FROM RCBSAP..AssetOutBoundDetails">
       <%--<SelectParameters>
           <asp:ControlParameter Name="cmb_employee" ControlID="cmb_employee" />
       </SelectParameters>--%>
    </asp:SqlDataSource>
        <asp:SqlDataSource ID="db_returnData" runat="server" ConnectionString="<%$ ConnectionStrings:RCBSAPConnectionString %>" SelectCommand="SELECT * FROM RCBSAP..AssetReceivedDetails">
    <%--<SelectParameters>
        <asp:ControlParameter ControlID="ASPxGridLookup1" Name="AssetOutBoundID" PropertyName="Value" Type="Int32" />
    </SelectParameters>--%>
</asp:SqlDataSource>
        </div>
    </asp:Content>