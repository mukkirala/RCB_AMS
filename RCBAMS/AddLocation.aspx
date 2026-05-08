<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AddLocation.aspx.cs" Inherits="AddLocation" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxEditors" Assembly="DevExpress.Web.ASPxEditors.v11.1" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxGridView" Assembly="DevExpress.Web.ASPxGridView.v11.1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
<style type="text/css">
       
       le7 {
            color: #333300;
        }
        
       
        .auto-style9 {
            color: #000000;
        }
        .auto-style10 {
            color: #FF0000;
        }
        
      
         .form_div{
           margin-top:10px;
       }
    </style>
     <div class="">  
       
         <h3><strong><span class=""> Add Location
        <br />
    </span></strong></h3>
          <dx:ASPxLabel ID="lbl_msg" runat="server" 
                    style="font-weight: 700; color: RED" Font-Size="Large" ClientInstanceName="client_lblmsg" Text="" Visible="false">
              </dx:ASPxLabel>

          <div class="row form_div">
         <div class="col-sm-3" style="font-size:large">
          
              <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Wing :" Font-Bold="true" Font-Size="Large"></dx:ASPxLabel><span class="auto-style10">*</span>
             </div>
              <div class="col-sm-4">
                    <dx:ASPxTextBox ID="txt_location" runat="server" Height="25PX" Width="300px">
                </dx:ASPxTextBox>
                
             </div>
                <div class="clearfix"></div>
                </div>
          <div class="row form_div">
         <div class="col-sm-3"  style="font-size:large">
         
              <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Floor :" Font-Bold="true" Font-Size="Large"></dx:ASPxLabel><span class="auto-style10">*</span>
             </div>
              <div class="col-sm-4">
                    <dx:ASPxTextBox ID="txtblock" runat="server" Height="25PX" Width="300px">
                </dx:ASPxTextBox>
                
             </div>
                <div class="clearfix"></div>
                </div>
          <div class="row form_div">
         <div class="col-sm-3"  style="font-size:large">
        
              <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="LAB :" Font-Bold="true" Font-Size="Large"></dx:ASPxLabel><span class="auto-style10">*</span>
             </div>
              <div class="col-sm-4">
                    <dx:ASPxTextBox ID="txt_locationcode" runat="server" Height="25PX" Width="300px">
                </dx:ASPxTextBox>
                
             </div>
                <div class="clearfix"></div>
                </div>
              <div class="col-sm-4">
                  <dx:ASPxButton ID="btn_save" runat="server"  Text="Save"  Height="25PX"
                   onclick="btn_save_Click" CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" 
                    CssPostfix="SoftOrange" Width="100px" 
                    SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css">
                </dx:ASPxButton>
    <span class="auto-style7">
                
                <dx:ASPxButton ID="btn_Update" runat="server" Text="Update" Width="100px" 
                    Height="25px" CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                    SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" 
                  OnClick="btn_Update_Click" Visible="false">
                </dx:ASPxButton>
        </span>
                
             </div>
                <div class="clearfix"></div>
                </div>
  
        
        <br />
        <span> 
            <h4><strong> Location Details : </strong>
                </h4></span>
           <br />
         <div class="table-responsive">
         <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" 
             style="width:85%"
             DataSourceID="SqlDataSource2" KeyFieldName="LocationID" OnRowCommand="ASPxGridView1_RowCommand"
             CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue">
             <Columns>
               <%-- <dx:GridViewDataTextColumn FieldName="Edit/Delete" VisibleIndex="0">
                <DataItemTemplate>
                    <asp:LinkButton ID="lnkbtn_edit" runat="server" Text="Edit" CommandName="Edit"></asp:LinkButton>
                    
                    <asp:LinkButton ID="Link_delete" runat="server" Text="Delete" CommandName="Delete"></asp:LinkButton>
                </DataItemTemplate>
                
            </dx:GridViewDataTextColumn> --%> 
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
                 <dx:GridViewDataTextColumn FieldName="LocationID" ReadOnly="True" VisibleIndex="1" Visible="false">
                     <EditFormSettings Visible="False" />
                 </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn FieldName="Location" VisibleIndex="2" Caption="Wing">
                 </dx:GridViewDataTextColumn>
                  <dx:GridViewDataTextColumn FieldName="Block" VisibleIndex="3" Caption="Floor">
                 </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn FieldName="LocationCode" VisibleIndex="4" Caption="LAB">
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

         <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" SelectCommand="SELECT [LocationID], [Location],[Block],[LocationCode] FROM [LocationMaster] WHERE  Status='Active'"
             UpdateCommand="UPDATE  LocationMaster SET  [Location]=@Location,[Block]=@Block, [LocationCode]=@LocationCode WHERE [LocationID]=@LocationID"></asp:SqlDataSource>
             </div>
   </div>

    </asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

</asp:Content>

