<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AddAssetStatus.aspx.cs" Inherits="AddAssetStatus" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
<style type="text/css">
     
      
      
   
        .auto-style7 {
            color: #333300;
        }
        
       
        .auto-style9 {
            color: #000000;
        }
        .auto-style10 {
            color: #FF0000;
        }
        
       
        .auto-style12 {
            width: 120px;
        }
          .form_div{
           margin-top:10px;
       }
        
    </style>
   <div class="" >  
        <strong>Add Status :-</strong>
        <dx1:ASPxLabel ID="lbl_msg" runat="server" 
                    style="font-weight: 700; color: RED" ClientInstanceName="client_lblmsg" Text="" Visible="false">
              </dx1:ASPxLabel>
         <div class="row form_div">
         <div class="col-sm-2">
           StatusName : <span class="auto-style10"><strong>*</strong></span>
             </div>
              <div class="col-sm-4">
                     <dx:ASPxTextBox ID="txt_statusname" runat="server" Height="25PX" Width="170px">
                </dx:ASPxTextBox>
                
             </div>
                <div class="clearfix"></div>
                </div>
        <div class="row form_div">
         <div class="col-sm-2">
          StatusCode : <span class="auto-style10"><strong>*</strong></span>
             </div>
              <div class="col-sm-4">
                     <dx:ASPxTextBox ID="txt_statuscode" runat="server" Height="25PX" Width="170px">
                </dx:ASPxTextBox>
                
             </div>
                <div class="clearfix"></div>
                </div>
        <div class="row form_div">
         <div class="col-sm-2">
        
             </div>
              <div class="col-sm-10">
                    <dx:ASPxButton ID="btn_save" runat="server"  Text="Save"  Height="25PX"
                  OnClick="btn_save_Click" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
                    CssPostfix="PlasticBlue" Width="100px" 
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                </dx:ASPxButton>
    <span class="auto-style7">
                
                <dx1:ASPxButton ID="btn_Update" runat="server" Text="Update" Width="100px" 
                    Height="25px" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" 
                    SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" 
                 onclick="btn_Update_Click" Visible="false">
                </dx1:ASPxButton>
                
    </span>
                
             </div>
                <div class="clearfix"></div>
                </div>
  
           <strong><span class="auto-style9">View Status Details :</span>  </strong>
           <br/>
       <div class="table-responsive">
         <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" 
             style="width:100%"
             DataSourceID="SqlDataSource2" KeyFieldName="StatusID" OnRowCommand="ASPxGridView1_RowCommand"
             CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue">
             <Columns>
                <dx:GridViewDataTextColumn FieldName="Edit/Delete" VisibleIndex="0">
                <DataItemTemplate>
                    <asp:LinkButton ID="lnkbtn_edit" runat="server" Text="Edit" CommandName="Edit"></asp:LinkButton>
                    
                    <asp:LinkButton ID="Link_delete" runat="server" Text="Delete" CommandName="Delete"></asp:LinkButton>
                </DataItemTemplate>
                
            </dx:GridViewDataTextColumn>  
                 <dx:GridViewDataTextColumn FieldName="StatusID" ReadOnly="True" VisibleIndex="1" Visible="false"> 
                     <EditFormSettings Visible="False" />
                 </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn FieldName="StatusName" VisibleIndex="2">
                 </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn FieldName="StatusCode" VisibleIndex="3">
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

         <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:InstemAMSConnectionString %>" SelectCommand="SELECT [StatusID], [StatusName],[StatusCode] FROM [StatusMaster] WHERE  Status='Active'">

         </asp:SqlDataSource>
           </div>
   </div>
    </asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

</asp:Content>

