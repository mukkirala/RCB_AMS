<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AddServiceType.aspx.cs" Inherits="AddServiceType" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx1" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
     <style type="text/css">
        .style2
        {
            width: 87px;
        }
        .style3
        {
            width: 200px;
        }
        .style4
        {
            width: 54px;
        }
    .style5
    {
            width: 167px;
            color: red;
    }
    .auto-style8
    {


    }
    .style6
    {
        font-size: medium;
    }
     .style7
     {
        font-size: medium;
         width: 800px;

     }
        .style9
        {
            width: 518px;
        }
        .style10
        {
            width: 800px;
            font-size: medium;
            color: #000000;
        }
 </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
 <asp:UpdatePanel ID="updpnlRefresh" runat="server" UpdateMode="Conditional">
  <ContentTemplate>
    <div class="container" style="margin-top:10px">

<h4> <strong>
    <span class="style6"><span class="dxmLite_Glass">
  Add Complaint Type <br />  </span></span></strong></h4>
        <dx:ASPxLabel ID="lbl_msg" runat="server" Text="" style="color:red" Font-Size="Large">
        </dx:ASPxLabel>
   <table class="style10" >
   <%-- <tr>
        <td  class="style7">
           ServiceTypeID<span class="style5">*</span></td>
        <td class="style6">
          <dx:ASPxTextBox ID="txtservicetypeID" runat="server" Width="170px" ></dx:ASPxTextBox>
        </td>

    </tr> 
   --%> 
      <%-- <tr>
        <td class="style8">
            &nbsp;</td>
        <td class="style6">
            &nbsp;</td>
        <td class="style7">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>   --%>
    <tr>
        <td class="style7" style="font-size:larger">Complaint Name<span class="style5">*</span></td>
        <td>
          <dx:ASPxTextBox ID="txtservicetypename" runat="server" Width="170px" ></dx:ASPxTextBox>
        </td>
    </tr>
    <tr>
        <td class="style8">
            &nbsp;</td>
        <td class="style6">
            &nbsp;</td>
        <td class="style7">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>   
    <tr>
        <td class="style7"  style="font-size:larger">Description<span class="style5">*</span></td>
        <td>
          <dx:ASPxTextBox ID="txtDesc" runat="server" Width="170px" ></dx:ASPxTextBox>
        </td>
    </tr>
    <tr>
        <td class="style8">
            &nbsp;</td>
        <td class="style6">
            &nbsp;</td>
        <td class="style7">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style8">
            &nbsp;</td>
        <td class="col-sm-4"" >
            <dx:ASPxButton ID="btn_save" runat="server" Text="Save" OnClick="btn_save_Click"  style="color:orangered"   CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css"  CssPostfix="SoftOrange"  SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css"   >
            </dx:ASPxButton>
        </td>
        <td class="style7">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
</table>
        <h4> <strong>View Services</strong></h4>
            </p>
    <dx:ASPxGridView ID="ASPxGridView" runat="server" AutoGenerateColumns="False"  OnRowCommand="ASPxGridView_RowCommand"
        KeyFieldName="ServiceTypeID"  DataSourceID="NonUserDB" Width="1090px"
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue"  >
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="0">
             
                <ClearFilterButton Visible="True">
                </ClearFilterButton>
            </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn Caption="Edit" VisibleIndex="1" CellStyle-Font-Bold="true">
                <DataItemTemplate>
                    <asp:LinkButton ID="btnlink" runat="server" Text="Edit" CommandName="Edit" ForeColor="Green">Edit</asp:LinkButton>

                </DataItemTemplate>

            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn Caption="Delete" VisibleIndex="2" CellStyle-Font-Bold="true">
                <DataItemTemplate>
                    <asp:LinkButton ID="btndelete" runat="server" Text="Delete" CommandName="Delete" ForeColor="Red">Delete</asp:LinkButton>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
              
            <dx:GridViewDataTextColumn FieldName="ServiceTypeID"  Caption="ServiceType ID" VisibleIndex="3" Visible="false">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ServiceTypeName"  Caption="ServiceType Name" VisibleIndex="4">
            </dx:GridViewDataTextColumn> 
             <dx:GridViewDataTextColumn FieldName="Description"  Caption="Description" VisibleIndex="4">
            </dx:GridViewDataTextColumn> 
           <dx:GridViewDataTextColumn FieldName="Status" Caption="Status" VisibleIndex="5" >
           </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="CreatedDate" Caption="Created Date" VisibleIndex="6" PropertiesTextEdit-DisplayFormatString="dd-MM-yyyy" >
                 
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

   <asp:SqlDataSource ID="NonUserDB" runat="server" ConnectionString="<%$ ConnectionStrings:InstemAMSConnectionString %>" 
        SelectCommand="Select * from ServiceTypeMaster where Status='Active'">
         </asp:SqlDataSource>
       
   </div>

         </ContentTemplate>
     </asp:UpdatePanel>
    <br />
    <br />

</asp:Content>


