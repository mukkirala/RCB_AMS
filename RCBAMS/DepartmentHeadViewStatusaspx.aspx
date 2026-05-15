<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="DepartmentHeadViewStatusaspx.aspx.cs" Inherits="DepartmentHeadViewStatusaspx" %>


<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>


<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="col-sm-12">
     <div class="row">   <div class="col-sm-12"><strong>View All Requests</strong>

        </div>
    </div>
 <div class="table-responsive">
   <dx:ASPxGridView ID="ASPxGridView1"  runat="server" AutoGenerateColumns="False" 
                   KeyFieldName="ReqID"   Width="95%"                
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" >

       <Columns>

    <dx:GridViewDataTextColumn FieldName="ReqDetailsID"
        Caption="Req Details ID" VisibleIndex="1" />

    <dx:GridViewDataTextColumn FieldName="ReqID"
        Caption="Req ID" VisibleIndex="2" />

    <dx:GridViewDataTextColumn FieldName="AssetClass"
        Caption="Asset Class" VisibleIndex="3" />

    <dx:GridViewDataTextColumn FieldName="AssetType"
        Caption="Asset Type" VisibleIndex="4" />

    <dx:GridViewDataTextColumn FieldName="Quantity"
        Caption="Requested Qty" VisibleIndex="5" />

    <dx:GridViewDataTextColumn FieldName="ApproverQuantity"
        Caption="Approved Qty" VisibleIndex="6" />

    <dx:GridViewDataTextColumn FieldName="Status"
        Caption="Current Status" VisibleIndex="7" />

</Columns>
        <SettingsPager ShowDefaultImages="False" >
                <AllButton Text="All">
                </AllButton>
                <NextPageButton Text="Next &gt;">
                </NextPageButton>
                <PrevPageButton Text="&lt; Prev">
                </PrevPageButton>
            </SettingsPager>
       <SettingsPager PageSize="25"></SettingsPager>
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
 </div>

  </div>
</asp:Content>



