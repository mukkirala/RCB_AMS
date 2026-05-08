<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AssetClassMapping.aspx.cs" Inherits="AssetClassMapping" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx1" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style5
    {
            width: 167px;
            color: red;
        } 
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">

     <div class="container" style="margin-top:10px">
     
        <strong><span class="style6"><span class="dxmLite_Glass">
     Add/Edit Asset Class Mapping<br />  </span></span></strong>
        <dx:ASPxLabel ID="lbl_msg" runat="server" Text="" style="color:red">
        </dx:ASPxLabel>
         
         <div class="row">
   <div class="col-sm-2">
    
         Select Role<span class="style5">*</span>
    </div>
        <div class="col-sm-4">
            <dx:ASPxComboBox ID="cmb_role" runat="server" Width="170px" Height="25px"
                CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
               
                SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" 
                >
                <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                </LoadingPanelImage>
                <ValidationSettings ErrorTextPosition="Bottom">
                    <ErrorFrameStyle ImageSpacing="4px">
                        <ErrorTextPaddings PaddingLeft="4px" />
                    </ErrorFrameStyle>
                    <RequiredField ErrorText="Select Role" IsRequired="True" />
                </ValidationSettings>
            </dx:ASPxComboBox>



            </div>
    </div>
 <br />

 <div class="row">
     <div class="col-sm-2">
            Select Asset Class<span class="style5">*</span>
    </div>
        <div class="col-sm-4">            

            <dx:ASPxGridLookup ID="cmb_assetclass" runat="server"
                    AutoGenerateColumns="False" DataSourceID="SqlDataSource1" TextFormatString="{0},{2}" Width="170px" Height="25px"
                    KeyFieldName="AssetClassID" IncrementalFilteringMode="Contains"  CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" AutoPostBack="true">
                    <GridViewProperties>
                        <%--<SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>--%>

                      <Settings  ShowFilterRow="true" ShowFilterBar="Visible"></Settings>
                    </GridViewProperties>
                    <Columns>
                        <%--<dx:GridViewDataTextColumn FieldName="AssetClassID" VisibleIndex="0" Visible="false"    >
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>--%>
                        <dx:GridViewDataTextColumn FieldName="AssetClassName" VisibleIndex="1" >
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="DepartmentCode" Caption="Department Code" VisibleIndex="2" >
                        </dx:GridViewDataTextColumn>  
                               <dx:GridViewDataTextColumn FieldName="DepartmentName"  VisibleIndex="3" >
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


            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:InstemSAPConnectionString %>" 
           SelectCommand="SELECT [AssetClassID], [AssetClassName], [DepartmentCode],DepartmentName FROM [AssetClassMaster]  where Status='Active'"></asp:SqlDataSource>
        </div>
    
       </div>
         <br />

   <div class="row">
<div class="col-sm-2">
    
&nbsp;Select Custodian<span class="style5">*</span>
    </div>
        <div class="col-sm-4">
            <dx:ASPxGridLookup ID="Cust_gridlookup" runat="server"
                    AutoGenerateColumns="False" DataSourceID="CustSqlDataSource" TextFormatString="{0}" Width="170px" Height="25px"
                    KeyFieldName="CustodianID" IncrementalFilteringMode="Contains"  CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" AutoPostBack="true">
                    <GridViewProperties>
                        <%--<SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>--%>

                      <Settings  ShowFilterRow="true" ShowFilterBar="Visible"></Settings>
                    </GridViewProperties>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="CustodianID"  VisibleIndex="0" >
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="CustodianName" VisibleIndex="1" >
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
               <asp:SqlDataSource ID="CustSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ASSETManagementConnectionString %>" 
        SelectCommand="SELECT [CustodianID], [CustodianName] FROM [vEmpDtlsAssetApp]
inner join InstemSAP..AssetClassMaster on AssetClassMaster.DepartmentCode=vEmpDtlsAssetApp.CustodianDepartmentCode
 where AssetClassID=@AssetClassID">
            <SelectParameters>
                <asp:ControlParameter Name="AssetClassID" ControlID="cmb_assetclass" />
            </SelectParameters>
         </asp:SqlDataSource>
        </div>
       </div>
         <br />
     <div class="row">
<div class="col-sm-2">
   </div>
         <div class="col-sm-4">
            <dx:ASPxButton ID="btn_save" runat="server" Text="Save"  OnClick="btn_save_Click">
            </dx:ASPxButton>
         </div>
         </div>
             <p>
        <strong>View  Details</strong></p>
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
                    <asp:LinkButton ID="btnlink" runat="server" Text="Edit" CommandName="Edit">Edit</asp:LinkButton>

                </DataItemTemplate>

            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn Caption="Delete" VisibleIndex="2">
                <DataItemTemplate>
                    <asp:LinkButton ID="btndelete" runat="server" Text="Delete" CommandName="Delete">Delete</asp:LinkButton>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn FieldName="ROLE_ID" ReadOnly="True" Caption="RoleID" VisibleIndex="3" >
                <%--<EditFormSettings Visible="False" />--%>
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn FieldName="ROLE_NAME"  Caption="Role Name" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="DepartmentName" Caption="Department Name" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetClassName" Caption="AssetClass Name" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="CustodianID"  Caption="" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CREATE_DATE" Caption="Created Date" VisibleIndex="6" PropertiesTextEdit-DisplayFormatString="dd-MMM-yyyy">
<PropertiesTextEdit DisplayFormatString="dd-MMM-yyyy"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ROLE_STATUS" Caption="Status" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            
            <dx:GridViewDataTextColumn FieldName="AssetClassID" Caption="" Visible="false" VisibleIndex="8">
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
        <br />
        <br />
        <br />
  <asp:SqlDataSource ID="Sql_Role" runat="server" 
        ConnectionString="<%$ ConnectionStrings:InstemAMSConnectionString %>" 
        SelectCommand="SELECT ROLE_ID,ROLE_NAME,CustodianID,ROLE_STATUS,CREATE_DATE,AssetClassMaster.DepartmentName,AssetClassName,RoleMaster.AssetClassID FROM [RoleMaster] 
 left join InstemSAP..AssetClassMaster on AssetClassMaster.AssetClassID=RoleMaster.AssetClassID where ROLE_NAME in('Auditor','IT-Admin','HR-Admin') and ROLE_STATUS='Active'">
         </asp:SqlDataSource>

        


<br />

    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

