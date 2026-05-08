<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ViewLocationList.aspx.cs" Inherits="ViewLocationList" %>

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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
      <div class="col-sm-12">
 
   
     <table style="margin-right:20px">
        <tr>
            <td class="style10">
           <h4> <span><strong>View  Location List </strong></span></h4>
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
        <dx:ASPxGridView ID="ViewAssetRequest"  runat="server" AutoGenerateColumns="False" 
                    DataSourceID="SqlCustodianMaster" KeyFieldName="LocationID"              
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    Width="95%">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="LocationID" ReadOnly="True" VisibleIndex="1" Visible="false" Caption="Location ID">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            
            <dx:GridViewDataTextColumn FieldName="Location" Visible="True" VisibleIndex="2" Caption="Wing">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
                  
            <dx:GridViewDataTextColumn FieldName="Block" VisibleIndex="3" Caption="Floor" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="LocationCode" VisibleIndex="4" Caption="LAB" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <%-- <dx:GridViewDataTextColumn FieldName="reporting_staff_no" VisibleIndex="4" Caption="Reporting Authority" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="email" VisibleIndex="4" Caption="Email" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>--%>
                          
        </Columns>
            <SettingsPager ShowDefaultImages="False">
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
    <asp:SqlDataSource ID="SqlCustodianMaster" runat="server" ConnectionString="<%$ ConnectionStrings:InstemAMSConnectionString %>" 
        SelectCommand="SELECT * from LocationMaster">

    </asp:SqlDataSource>                                     
    
      </div>
        <br/>
    
    </div>
     <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" 
                    Landscape="True" MaxColumnWidth="150" GridViewID="ViewAssetRequest" 
                    LeftMargin="0" RightMargin="0" TopMargin="0" ExportEmptyDetailGrid="false" >
      </dx:ASPxGridViewExporter>
</asp:Content>

