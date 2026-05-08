<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Mobile.Master" AutoEventWireup="true" CodeFile="QRDocuments.aspx.cs" Inherits="QRDocuments" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxMenu" tagprefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"  Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.v11.1" namespace="DevExpress.Web.ASPxPanel" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
 <script type="text/javascript">
        function SetTarget() {
           
            document.forms[0].target = "_blank";
     }
       function SetTarget1() {
           
            document.forms[0].target = "_parent";
        }
    </script>
<style>
    .form_div{
           margin-top:10px;
           margin-left:2px;
         }
       
         .back-bg {
            margin: 20px 30px;
            border: 2px solid rgb(199, 212, 220);
            padding: 15px 0;
     }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <%-- <div class="col-sm-12">
        <strong><span class="style2">View Asset Documents</span></strong><br />
        <br />
     </div>
<div class="clearfix"></div>
      --%>   
        
          <div id="AssetDetails"  runat="server">
                 
                  <div class="row">  
                  <div class="col-sm-12"> 
                  <div class="col-sm-12">  
                  <label> <strong>Asset Details: </strong></label>
                 
               </div>      
             </div>       
        
   </div>
         <div class="row">  
          
               <div class="row back-bg">
             

         <div class="col-sm-12">
          <div class="row form_div">
           <div class="col-sm-2">
               <%--<dx:ASPxLabel ID="Label1" runat="server" Text="Main Asset Number:"></dx:ASPxLabel>--%>
               <label>Main Asset Number:</label>
               </div>
           <div class="col-sm-4">
                  <dx:ASPxLabel ID="lbl_AssetNo" runat="server" Font-Bold="True" ForeColor="Blue"></dx:ASPxLabel>
            </div>
            <div class="col-sm-2">
              <%-- <dx:ASPxLabel ID="Label2" runat="server" Text="Serial Number:"></dx:ASPxLabel>--%>
                <label>Asset SubNumber:</label>
           </div>
            <div class="col-sm-4">
                <dx:ASPxLabel ID="lbl_SubNumber" runat="server" Font-Bold="True" ForeColor="Blue"></dx:ASPxLabel>
             </div> 
              </div>
             
     </div>
        
              <div class="col-sm-12">
           <div class="row form_div">
            <div class="col-sm-2">
              <%--<dx:ASPxLabel ID="Label3" runat="server" Text="Asset Class Name:"></dx:ASPxLabel>--%>
                <label>Asset Class Name:</label>
            </div>
            <div class="col-sm-4"> 
               <dx:ASPxLabel ID="lbl_Assetclass" runat="server" Font-Bold="True" ForeColor="Blue"></dx:ASPxLabel>
            </div>
    
           <div class="col-sm-2">
                <%--<dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Asset Type:"></dx:ASPxLabel>--%>
               <label>Asset Type:</label>
           </div>
            <div class="col-sm-4">
               <dx:ASPxLabel ID="lbl_AssetType" runat="server" Font-Bold="True" ForeColor="Blue"></dx:ASPxLabel>
            </div>   
               </div>
       </div>
     <div class="col-sm-12">
    <div class="row form_div">
         <div class="col-sm-2">
            <label>Current Location:</label>
         </div>
         <div class="col-sm-4">
             <dx:ASPxLabel ID="lbl_assetlocation" runat="server"  Text="" Font-Bold="True" ForeColor="Blue">
		     </dx:ASPxLabel>            
         </div>     
         <div class="col-sm-2">
           <label >Asset Status:</label>       
         </div>
         <div class="col-sm-4">
            <dx:ASPxLabel ID="lbl_assetstatus" runat="server"  Text="" Font-Bold="True" ForeColor="Blue">
	        </dx:ASPxLabel>           
         </div>
     </div>
</div>
 <%--<div class="col-sm-12">
     <div class="row form_div">
         <div class="col-sm-2">
            <label>Available Quantity:</label>
         </div>
         <div class="col-sm-4">
             <dx:ASPxLabel ID="lbl_quantity" runat="server"  Text="" Font-Bold="True" ForeColor="Blue">
		     </dx:ASPxLabel>            
         </div>     
         <div class="col-sm-2">
           <label >Component:</label>       
         </div>
         <div class="col-sm-4">
            <dx:ASPxLabel ID="lbl_component" runat="server"  Text="" Font-Bold="True" ForeColor="Blue">
	        </dx:ASPxLabel>           
         </div>
     </div>
 </div>
 <div class="col-sm-12">
     <div class="row form_div">
         <div class="col-sm-2">
            <label>Capitalization Date:</label>
         </div>
         <div class="col-sm-4">
             <dx:ASPxLabel ID="lbl_capitalizationdate" runat="server"  Text="" Font-Bold="True" ForeColor="Blue">
		     </dx:ASPxLabel>            
         </div>     
         <div class="col-sm-2">
           <label >First Acquisition Date:</label>       
         </div>
         <div class="col-sm-4">
            <dx:ASPxLabel ID="lbl_acquisitiondate" runat="server"  Text="" Font-Bold="True" ForeColor="Blue">
	        </dx:ASPxLabel>           
         </div>
     </div>
</div>--%>
<%--<div class="col-sm-12">
     <div class="row form_div">
         <div class="col-sm-2">
            <label>DeacDate:</label>
         </div>
         <div class="col-sm-4">
             <dx:ASPxLabel ID="lbl_deacdate" runat="server"  Text="" Font-Bold="True" ForeColor="Blue">
		     </dx:ASPxLabel>            
         </div>     
         <div class="col-sm-2">
           <label >Inventory Note:</label>       
         </div>
         <div class="col-sm-4">
            <dx:ASPxLabel ID="lbl_inventorynote" runat="server"  Text="" Font-Bold="True" ForeColor="Blue">
	        </dx:ASPxLabel>           
         </div>
     </div>
</div>--%>
<div class="col-sm-12">
     <div class="row form_div">
         <div class="col-sm-2">
            <label>Inventory Date:</label>
         </div>
         <div class="col-sm-4">
             <dx:ASPxLabel ID="lbl_inventorydate" runat="server"  Text="" Font-Bold="True" ForeColor="Blue">
		     </dx:ASPxLabel>            
         </div>     
         <div class="col-sm-2">
           <label >Asset Image:</label>       
         </div>
         <div class="col-sm-4">
           <dx:aspxroundpanel ID="ASPxRoundPanel1" runat="server" Height="104px" Width="129px" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" GroupBoxCaptionOffsetY="-18px" HeaderText="Image" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                            <ContentPaddings PaddingBottom="8px" />
                            <PanelCollection>
                                <dx:panelcontent runat="server" SupportsDisabledAttribute="True">
                                    <asp:Image ID="AspxImage2"  runat="server" Height="100px" Width="130px"/>
                                    <%--<dx:ASPxImage ID="AspxImage2" runat="server" Height="106px" Width="147px">
                                    </dx:ASPxImage>--%>
                                </dx:panelcontent>
                            </PanelCollection>
                        </dx:aspxroundpanel>
	                
         </div>
     </div>
</div>
     </div> 
      
  <div class="col-sm-12"> 
    <div class="col-sm-12"> 
  <dx:ASPxGridView ID="grid_documets" runat="server"  KeyFieldName="DocumentMapID" OnRowCommand="ASPxGridView1_RowCommand" AutoGenerateColumns="False" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" Width="100%">
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="DocumentMapID" Visible="false" VisibleIndex="0"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="DocumentName" Caption="Document Name" VisibleIndex="0">
                    </dx:GridViewDataTextColumn>
<%--                    <dx:GridViewDataTextColumn FieldName="DocumentFileName" VisibleIndex="1" ></dx:GridViewDataTextColumn>--%>
                    <dx:GridViewDataTextColumn FieldName="ImageLocation" VisibleIndex="1" Caption="View Documents">
                        <DataItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" Text="View" CommandName="View" OnClientClick="SetTarget();">View Document</asp:LinkButton>
                            <%--                              <asp:ImageButton ID="ImageButton1" runat="server"  ImageUrl='<%# Eval("documentFileLocation")%>' Width="150px" Height="80px" Style="cursor: pointer" OnClientClick="return LoadDiv(this.src);"  />--%>
                        </DataItemTemplate>
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
                <Settings ShowFilterRow="False" ShowGroupPanel="False" />
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
            <br />

        </div>
</div>
</div>
</div>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ConnectionStrings:RCBSAPConnectionString %>" SelectCommand="SELECT [AssetID],[MainAssetNumber],[AssetSubNumber],[AssetDesc] FROM [AssetMaster]">
              </asp:SqlDataSource>
          
</asp:Content>



