<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AddAssetClass.aspx.cs" Inherits="AddAssetClass" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
 <style type="text/css">
       
        .style2
        {
            font-size: medium;
            color: #000000;
        }
        .style3
        {
            width: 150px;
        }
        .style4
        {
            width: 209px;
        }
        .style5
        {
            color: #FF0000;
        }
        .style6
        {
            width: 153px;
        }
        .style7
        {
            font-size: small;
        }
          .form_div{
           margin-top:10px;
       }
    </style>

    <div class="">
<strong style=""><span class="style2"> Add Asset Class
   
    </span></strong>
          <dx:ASPxLabel ID="lbl_msg" runat="server" style="color: red" Visible="false" Text="">
                </dx:ASPxLabel>
            <div class="row form_div">
         <div class="col-sm-2">
            Asset Class Code :<span class="style5"><strong>*</strong></span>
             </div>
              <div class="col-sm-4">
                     <dx:ASPxTextBox ID="txt_assgrpcode" runat="server" Width="300px" 
                    MaxLength="8">
                </dx:ASPxTextBox>
                
             </div>
                <div class="clearfix"></div>
                </div>
                <div class="row form_div">
               <div class="col-sm-2">
                      Asset Class Name :<span class="style5"><strong>*</strong></span>
               </div>
                <div class="col-sm-4">
                       <dx:ASPxTextBox ID="txt_assgrpdes" runat="server" Width="300px" >
                </dx:ASPxTextBox>
                
             </div>
             </div>
         <div class="row form_div">
         <div class="col-sm-2">
          
             </div>
              <div class="col-sm-4">
                     <dx:ASPxButton ID="btnsave" runat="server" Width="100px" Height="25px"
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Text="Save" 
                    OnClick="btnsave_Click">
                </dx:ASPxButton>
                <dx:ASPxButton ID="btnupdate" runat="server" Text="Update" Visible="False" 
                    Width="100px" Height="25px"
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    onclick="btnupdate_Click"
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                </dx:ASPxButton>
                
             </div>
               <div class="clearfix">
                     
               </div>
               
             </div>
      <%--   <dx:ASPxLabel ID="lbl_date" runat="server" style="color: #0000FF">
                </dx:ASPxLabel>--%>
   
 <br/>
    <span class="style7">
    <strong> Asset Class Details : </strong></span>
    <br/>
   
   
   <div class="table-responsive">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" 
        style="width:100%" 
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
        DataSourceID="SqlDSAssetGroup" KeyFieldName="AssetClassID" 
         OnRowCommand="ASPxGridView1_RowCommand">
        <Columns>
            <%--<dx:GridViewDataTextColumn FieldName="Edit/Delete" VisibleIndex="0">
                            <DataItemTemplate>
                            <asp:LinkButton ID="Edit" runat="server" CommandName="Edit" Text="Edit">Edit</asp:LinkButton>
                            <asp:LinkButton ID="Delete" runat="server" CommandName="Delete" Text="Delete">Delete</asp:LinkButton>
                            </DataItemTemplate>
                        </dx:GridViewDataTextColumn>--%>
                                     <dx:GridViewDataTextColumn FieldName="Edit" VisibleIndex="0" CellStyle-Font-Bold="true">
    <DataItemTemplate>
        <asp:LinkButton ID="lnkbtn_edit" runat="server" Text="Edit" CommandName="Edit" ForeColor="Green" width="50%"></asp:LinkButton>
        </DataItemTemplate>
    
</dx:GridViewDataTextColumn>  
              <dx:GridViewDataTextColumn FieldName="Delete" VisibleIndex="0" CellStyle-Font-Bold="true">
    <DataItemTemplate>
        <asp:LinkButton ID="Link_delete" runat="server" Text="Delete" CommandName="Delete" ForeColor="Red" width="50%"></asp:LinkButton>
    </DataItemTemplate>
          </dx:GridViewDataTextColumn>        



            <dx:GridViewDataTextColumn FieldName="AssetClassID" ReadOnly="True"  Visible="false"
                VisibleIndex="1">
                <Settings AutoFilterCondition="Contains" />
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetClassCode" VisibleIndex="2">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AssetClassName" VisibleIndex="3">
                <Settings AutoFilterCondition="Contains" />
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

    <asp:SqlDataSource ID="SqlDSAssetGroup" runat="server" 
        ConnectionString="<%$ ConnectionStrings:RCBSAPConnectionString %>" 
        SelectCommand="SELECT [AssetClassID],[AssetClassName],[AssetClassCode] FROM [AssetClassMaster] where Status='Active'">
    </asp:SqlDataSource>
    </div>
        </div>
    </asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

