<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="BuyBackMailAssign.aspx.cs" Inherits="BuyBackMailAssign" %>


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

 <strong><span class="style6"><span class="dxmLite_Glass">
    Assign HR/Finance Authority<br />  </span></span></strong>
        <dx:ASPxLabel ID="lbl_msg" runat="server" Text="" style="color: #3333FF">
        </dx:ASPxLabel>

        <table class="style10" >
    <tr>
        <td  class="style7">
           Select Department<span class="style5">*</span></td>
        <td class="style6">
            <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" Width="170px" Height="25px"  AutoPostBack="true" 
                CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
               
                SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css"  ValueType="System.String">
               
                <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                </LoadingPanelImage>
             
            </dx:ASPxComboBox>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
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
        <td class="style7">
  Select EmployeeID<span class="style5">*</span></td>
        <td>
            <dx:ASPxGridLookup ID="Cust_gridlookup" runat="server"
                    AutoGenerateColumns="False" DataSourceID="CustSqlDataSource" TextFormatString="{0},{1}" Width="170px" Height="25px"
                    KeyFieldName="CustodianID" IncrementalFilteringMode="Contains"  CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" >
                    <GridViewProperties>
                        <%--<SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>--%>
         <SettingsPager ShowDefaultImages="False">
            <AllButton Text="All">
            </AllButton>
            <NextPageButton Text="Next &gt;">
            </NextPageButton>
            <PrevPageButton Text="&lt; Prev">
            </PrevPageButton>
               </SettingsPager>
                      <Settings  ShowFilterRow="true" ></Settings>
                    </GridViewProperties>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="CustodianID"  VisibleIndex="0" Caption="Employee ID" >
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="CustodianName" VisibleIndex="1" Caption="Employee Name">
                        </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="Designation" VisibleIndex="2" >
                        </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="DepartmentName" VisibleIndex="3" Caption="Department">
                        </dx:GridViewDataTextColumn> 
                         <dx:GridViewDataTextColumn FieldName="email" VisibleIndex="3" Caption="Email">                              
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
            <dx:ASPxButton ID="btn_save" runat="server" Text="Save" OnClick="btn_save_Click" >
            </dx:ASPxButton>
        </td>
        <td class="style7">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
</table>

 <strong>View  Details</strong></p>
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False"  OnRowCommand="ASPxGridView1_RowCommand"
        KeyFieldName="ROLE_ID"  DataSourceID="Sql_Role" Width="1090px"
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" OnHtmlRowPrepared="ASPxGridView1_HtmlRowPrepared"  >
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="0">
             
                <ClearFilterButton Visible="True">
                </ClearFilterButton>
            </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn Caption="Edit" VisibleIndex="1">
                <DataItemTemplate>
                    <asp:LinkButton ID="btnlink" runat="server" Text="Edit" CommandName="Edit">Edit</asp:LinkButton>

                </DataItemTemplate>

            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn Caption="Delete" VisibleIndex="2">
                <DataItemTemplate>
                    <asp:LinkButton ID="btndelete" runat="server" Text="Delete" CommandName="Delete">Delete</asp:LinkButton>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="ROLE_ID" ReadOnly="True" Caption="RoleID" VisibleIndex="3" Visible="false">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="CustodianDepartment"  Caption="Department" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="CustodianID"  Caption="Employee ID" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CustodianName"  Caption="Name" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Designation" Caption="Designation" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
           <dx:GridViewDataTextColumn FieldName="email" Caption="Email" VisibleIndex="8" >
           </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ROLE_STATUS" Caption="Status" VisibleIndex="9" Visible="false" >
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

   <asp:SqlDataSource ID="Sql_Role" runat="server" ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
        SelectCommand="Select distinct RoleMaster.ROLE_ID,RoleMaster.ROLE_NAME as CustodianDepartment, RoleMaster.CustodianID ,
 CustodianName,Designation,email,RoleMaster.ROLE_STATUS from RoleMaster
inner join CustodianMaster  ON  CustodianMaster.CustodianID=RoleMaster.CustodianID
  where RoleMaster.ROLE_NAME in('Human Resources','Finance') and RoleMaster.ROLE_STATUS='Active'">
         </asp:SqlDataSource>
       

        <asp:SqlDataSource ID="CustSqlDataSource" runat="server"  ConnectionString="<%$ ConnectionStrings:ASSETManagementConnectionString %>" 
                   SelectCommand="Select CustodianID, CustodianName,Designation,email,DepartmentName from vEmpDtlsAssetApp inner JOIN vDepartmentAssetApp ON vEmpDtlsAssetApp.CustodianDepartmentCode=vDepartmentAssetApp.DepartmentCode">
      
      <%--<SelectParameters>
          <asp:ControlParameter ControlID="ASPxComboBox1" Name="DepartmentName" />
      </SelectParameters>--%>
         </asp:SqlDataSource>

   </div>

      </ContentTemplate>
     </asp:UpdatePanel>
    <br />
    <br />
</asp:Content>
