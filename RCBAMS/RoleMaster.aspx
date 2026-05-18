<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="RoleMaster.aspx.cs" Inherits="RoleMaster" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx1" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" Runat="Server">
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
    {}
    .style6
    {
        font-size: medium;
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
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="container" style="margin-top:10px">
     
      <h4>  <strong><span class="style6"><span class="dxmLite_Glass">
    Assign User <br />  </span></span></strong></h4>
        <dx:ASPxLabel ID="lbl_msg" runat="server" Text="" style="color:red" Font-Size="Large">
        </dx:ASPxLabel>
    

<table class="style10" >
    <tr>
        <td  class="style7">
           Select Role<span class="style5">*</span></td>
        <td class="style6">
            <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" Width="280px" Height="25px"
                CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
               
                SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" 
                >
                <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                </LoadingPanelImage>
                <%--<ValidationSettings>
                    <ErrorFrameStyle ImageSpacing="4px">
                        <ErrorTextPaddings PaddingLeft="4px" />
                    </ErrorFrameStyle>
                    <RequiredField ErrorText="Select Unit" IsRequired="True" />
                </ValidationSettings>--%>
            </dx:ASPxComboBox>
        </td>

        <td class="style7">
&nbsp;Select Employee<span class="style5">*</span></td>
        <td>
            <dx:ASPxGridLookup ID="Cust_gridlookup" runat="server"
                    AutoGenerateColumns="False" DataSourceID="CustSqlDataSource" TextFormatString="{0}" Width="300px" Height="25px"
                    KeyFieldName="CustodianID" IncrementalFilteringMode="Contains"  CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                    <GridViewProperties>
                        <%--<SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>--%>

                      <Settings  ShowFilterRow="true"></Settings>
                        <SettingsPager PageSize="15"></SettingsPager>
                    </GridViewProperties>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="CustodianID"  VisibleIndex="0"  Caption="ID">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="CustodianName" VisibleIndex="1"  Caption="Employee Name">
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
            <dx:ASPxButton ID="btn_save" runat="server" Text="Save"  OnClick="btn_save_Click" Width="75px" CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css">
            </dx:ASPxButton>
        </td>
        <td class="style7">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
</table>
            <%--<asp:SqlDataSource ID="" runat="server" 
                ConnectionString="" 
                SelectCommand="">
            </asp:SqlDataSource>--%>
             <p>
       <h4><strong>View  Details</strong></h4>
           </p>
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False"  OnRowCommand="ASPxGridView1_RowCommand"
        KeyFieldName="ROLE_ID"
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
        DataSourceID="Sql_Role" >
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="0">
             
                <ClearFilterButton Visible="True">
                </ClearFilterButton>
            </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn Caption="Edit" VisibleIndex="1">
                <DataItemTemplate>
                    <asp:LinkButton ID="btnlink" runat="server" Text="Edit" CommandName="Edit" ForeColor="Green">Edit</asp:LinkButton>

                </DataItemTemplate>

            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn Caption="Delete" VisibleIndex="2">
                <DataItemTemplate>
                    <asp:LinkButton ID="btndelete" runat="server" Text="Delete" CommandName="Delete" ForeColor="Red">Delete</asp:LinkButton>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn FieldName="ROLE_ID" ReadOnly="True" Caption="RoleID" VisibleIndex="3" Visible="false">
                <%--<EditFormSettings Visible="False" />--%>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ROLE_NAME"  Caption="Role Name" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="CustodianID"  Caption="EmployeeID" VisibleIndex="5" >
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CREATE_DATE" Caption="Created Date" VisibleIndex="6" PropertiesTextEdit-DisplayFormatString="dd-MMM-yyyy">
<PropertiesTextEdit DisplayFormatString="dd-MMM-yyyy"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ROLE_STATUS" Caption="Status" VisibleIndex="7">
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
  <asp:SqlDataSource ID="Sql_Role" runat="server" 
        ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
        SelectCommand="SELECT * FROM [RoleMaster] where ROLE_NAME in('Admin','Auditor') and ROLE_STATUS='Active' ">
         </asp:SqlDataSource>

        <asp:SqlDataSource ID="CustSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
        SelectCommand="SELECT [CustodianID], [CustodianName] FROM [CustodianMaster] where [CustodianStatus]='Active'">
         </asp:SqlDataSource>


<br />
    </div>

</asp:Content>


