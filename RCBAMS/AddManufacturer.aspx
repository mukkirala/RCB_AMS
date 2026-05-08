<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AddManufacturer.aspx.cs" Inherits="AddManufacturer" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
     <style type="text/css">
       
     
        .auto-style3 {
            font-size: medium;
        }
        .auto-style7 {
            color: #333300;
        }
       
        .auto-style8 {
            font-size: medium;
            color: #000000;
        }
       
        .auto-style9 {
            color: #FF0000;
        }
        .auto-style10 {
            color: #000000;
         
        }
       .form_div{
           margin-top:10px;
       }
    </style>
     <div class="">
         <strong>Add Manufacturer</strong>
         <br/>
           <dx:ASPxLabel ID="lbl_dsplay" runat="server" ForeColor="red" visible="false">
                </dx:ASPxLabel>
         <div class="row form_div">
         <div class="col-sm-2">
             Manufacturer Name  <span class="auto-style9"><strong>*</strong> </span>
             </div>
              <div class="col-sm-10">
                      <dx:ASPxTextBox ID="txt_manufname" runat="server" Height="25px" Width="200px">
                </dx:ASPxTextBox>
                
             </div>
             </div>
          <div class="row form_div">
         <div class="col-sm-2">
           Manufacturer Code
             </div>
              <div class="col-sm-10">
                     <dx:ASPxTextBox ID="txt_manufcode" runat="server" Height="25px" Width="200px">
                </dx:ASPxTextBox>
             </div>
             </div>
          <div class="row form_div">
                <div class="col-sm-2">
                    </div>
         <div class="col-sm-3">
            
             <dx:ASPxButton ID="btn_save" runat="server"  Text="Save"  
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
                    CssPostfix="PlasticBlue" Width="100px" 
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" OnClick="btn_save_Click">
                </dx:ASPxButton>
             <span class="auto-style7">
                
                <dx:ASPxButton ID="btn_Update" runat="server" Text="Update" Width="100px" 
                    Height="25px" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" 
                    SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" 
                     OnClick="btn_Update_Click">
                </dx:ASPxButton>
            </span>
             </div>
                <div class="col-sm-3">
    
        </div>
        </div>  

      <div>
        <br />
           <strong><span class="style5"><span class="auto-style10">Manufacturer Details</span> 
          
           <br />
          
           </span></strong>
           <br />
          <div class="table-responsive">
           <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" 
               style="width:100%"
               DataSourceID="SqlDataSource1" KeyFieldName="ManufacturerID"  OnRowCommand="ASPxGridView1_RowCommand"
               CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" CssClass="auto-style10">
               <Columns>
                <dx:GridViewDataTextColumn FieldName="Edit/Delete" VisibleIndex="0">
                <DataItemTemplate>
                    <asp:LinkButton ID="lnkbtn_edit" runat="server" Text="Edit" CommandName="Edit"></asp:LinkButton>
                    
                    <asp:LinkButton ID="Link_delete" runat="server" Text="Delete" CommandName="Delete"></asp:LinkButton>
                </DataItemTemplate>
                
            </dx:GridViewDataTextColumn>                   
                   <dx:GridViewDataTextColumn FieldName="ManufacturerID" ReadOnly="True" VisibleIndex="1">
                       <EditFormSettings Visible="False" />
                   </dx:GridViewDataTextColumn>
                   <dx:GridViewDataTextColumn FieldName="ManufacturerName" VisibleIndex="2">
                   </dx:GridViewDataTextColumn>
                   <dx:GridViewDataTextColumn FieldName="ManufacturerCode" VisibleIndex="3">
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
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:InstemAMSConnectionString %>"
                SelectCommand="SELECT [ManufacturerID], [ManufacturerName], [ManufacturerCode] FROM [ManufacturerMaster] WHERE Status='Active'"
                UpdateCommand="UPDATE ManufacturerMaster SET ManufacturerName=@ManufacturerName,ManufacturerCode=@ManufacturerCode WHERE ManufacturerID=@ManufacturerID  "></asp:SqlDataSource>
           <br />
              </div>
    </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
</asp:Content>

