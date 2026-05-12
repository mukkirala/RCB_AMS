<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="AddDocumnet.aspx.cs" Inherits="AddDocumnet" %>

<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"  Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v11.1" namespace="DevExpress.Web.ASPxPanel" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxMenu" tagprefix="dx1" %>
<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx2" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxLoadingPanel" Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
     <style type="text/css">
        
        .style6
        {
            width: 70%;
        }
        .style7
        {
            width: 250px;
        }
        .style9
        {
            font-size: medium;
            color: #000000;
        }
        .style10
        {
            color: #FF0000;
        }
        .details {
            border: 1px dashed;
            margin: 10px 0px;
        
        }
         .auto-style2 {
             height: 20px;
         }
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
 <script src="http://code.jquery.com/jquery-1.10.2.min.js" type="text/javascript"></script>
   <%-- <script type="text/javascript">
       function showpreview(input) {
             if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                   $('#<%=AspxImage2.ClientID%>').prop('src', e.target.result);
                                                    
                };
                reader.readAsDataURL(input.files[0]);
                }
        }       
    </script>--%>
     <script type="text/javascript">
         function SetTarget() {
             document.forms[0].target = "_blank";
         }
         function SetTarget1() {
            document.forms[0].target = "_parent";
         }
         function addDoc() {
             // alert("hii");
              var fileUpload = $("#UploadImage").get(0);
           
              var files = fileUpload.files;
              var test = new FormData();

              for (var i = 0; i < files.length; i++) {
                  test.append(files[i].name, files[i]);
              }
              $.ajax({
                  url: "FileUpload.ashx",
                  type: "POST",
                  contentType: false,
                  processData: false,
                  data: test,
                  // dataType: "json",
                  success: function (result) {
                      //alert(result);
                  },
                  error: function (err) {
                      alert(err.statusText);
                  }
              });
              lpanel.Show(); e.processOnServer = true;
         }

         function addImage() {
              //alert("hii");
              var fileUpload = $("#user_prof").get(0);          
              var files = fileUpload.files;
              var test = new FormData();

              for (var i = 0; i < files.length; i++) {
                  test.append(files[i].name, files[i]);
              }
              $.ajax({
                  url: "ImageUpload.ashx",
                  type: "POST",
                  contentType: false,
                  processData: false,
                  data: test,
                  // dataType: "json",
                  success: function (result) {
                      //alert(result);
                       document.getElementById("<%=btnUploadDoc.ClientID %>").click();     
                  },
                  error: function (err) {
                      alert(err.statusText);
                  }
              });
          }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
   <asp:ScriptManager ID="srmnr" runat="server"></asp:ScriptManager>
   <asp:UpdatePanel UpdateMode="Always" runat="server">
        <ContentTemplate>
    <div class="">
    <div class="col-sm-12">
    <dx:ASPxLabel ID="lbl_msg" runat="server" style="font-weight: 700; color: RED" ClientInstanceName="client_lblmsg" Font-Size="Large" Text="" Visible="false">
  </dx:ASPxLabel>
        </div>
    <br />
    <div class="col-sm-12">
    <strong><span class="style9">Add Asset Documents </span></strong>
    <br />
   <br />
    
     <label>    <strong> Asset Details:</strong></label>
        <hr>
          <div class="row ">
           <div class="col-sm-2">
                 <%--<dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Select Asset">
                </dx:ASPxLabel>--%>
               <label>Select Asset</label>
               &nbsp;<span class="style10"><strong>*</strong></span>
               </div>
           <div class="col-sm-4">
                   <dx:ASPxGridLookup ID="gridlkup_Asset" runat="server"  AutoGenerateColumns="False" 
                     DataSourceID="AssetDS" IncrementalFilteringMode="Contains"   TextFormatString="{1}" 
                     KeyFieldName="AssetID"   Height="25px" Width="300px"
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
<GridViewProperties>
<SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>
    <Settings ShowFilterRow="True" />
</GridViewProperties>
                    <Columns>
                        <dx:gridviewdatatextcolumn FieldName="AssetID"  ReadOnly="True" 
                            VisibleIndex="0" Visible="false">
                        </dx:gridviewdatatextcolumn>                        
                        <dx:gridviewdatatextcolumn FieldName="MainAssetNumber" VisibleIndex="1">
                        </dx:gridviewdatatextcolumn>
                        <dx:gridviewdatatextcolumn FieldName="TechnicalAssetNumber" VisibleIndex="2" Visible="false">
                        </dx:gridviewdatatextcolumn>
                        <dx:gridviewdatatextcolumn FieldName="AssetClass" VisibleIndex="3">
                        </dx:gridviewdatatextcolumn>
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
                       <ClientSideEvents RowClick="function(s, e) {
                             SetTarget1();
                       }" />
                       <GridViewClientSideEvents SelectionChanged="function(s, e) {
                             SetTarget1();
                       }" />
                </dx:ASPxGridLookup>
                
            </div>
           <div class="col-sm-2">
              <dx:ASPxButton ID="btn_search" runat="server" BackColor="White" 
                    
                    OnClick="btn_search_Click" Width="20px" Height="25px">
                    <Image Url="~/Images/search1.png" Width="20px" Height="20px">
                    </Image>
                    <Border BorderColor="White" />                   
                </dx:ASPxButton>
           </div>
              </div>
         </div>
          <div class="clearfix"></div>
         
        
          <div id="AssetDetails"  runat="server">
                 
                  <div class="row">  
                  <div class="col-sm-12"> 
                  <div class="col-sm-12">  
                <%--  <strong>  <label>Asset Details:</label> </strong>--%>
                 
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
 <div class="col-sm-12">
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
</div>
<div class="col-sm-12">
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
</div>
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
           <label ></label>       
         </div>
         <div class="col-sm-4">
            <dx:ASPxLabel ID="ASPxLabel10" runat="server"  Text="" Font-Bold="True" ForeColor="Blue">
	        </dx:ASPxLabel>           
         </div>
     </div>
</div>
     </div> 
   </div>       

        </div>

        <div class="col-sm-12">
         <label><strong>Add Image:</strong></label>
            <hr />
        </div>

        <div class="row form_div">
           <div class="col-sm-2">
             
               <label>Upload Image</label>
&nbsp;<span class="style10"><strong></strong></span>
           </div>
            
               <div class="col-sm-6">
                
          <%--  <asp:Image ID="AspxImage2"  runat="server" Height="100px" Width="100px" />--%>
                    <dx:aspxroundpanel ID="ASPxRoundPanel1" runat="server" Height="104px" Width="129px" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" GroupBoxCaptionOffsetY="-18px" HeaderText="Image" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                            <ContentPaddings PaddingBottom="8px" />
                            <PanelCollection>
                                <dx:panelcontent runat="server" SupportsDisabledAttribute="True">
                                    <asp:Image ID="AspxImage2" runat="server" Height="100px" Width="130px" />
                                </dx:panelcontent>
                            </PanelCollection>
                        </dx:aspxroundpanel><br />
                        <asp:FileUpload ID="user_prof" runat="server" CssClass="" ClientIDMode="Static"  onchange="addImage()" ToolTip="Browse Photo" />
                    <%-- <asp:FileUpload ID="UploadImage2" CssClass="" onchange="showpreview(this);" ToolTip="Browse Photo" runat="server" /> --%> 
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ValidationExpression="([a-zA-Z0-9\s_\\.\-:()])+(.jpg|.jpeg|.png)$"
                                   ControlToValidate="user_prof" runat="server" ForeColor="Red" ErrorMessage="Please select a valid jpg or png file." Display="Dynamic" />
                     <asp:Button ID="btnUploadDoc" Text="Upload" runat="server" OnClick="UploadAssetImage" Style="display: none;" />
               </div>
            
     </div>
        <br />
         <asp:UpdatePanel ID="paneldoc" runat="server">
           <ContentTemplate>
         <div class="col-sm-12">
         <label><strong>Add Documents:</strong></label>
            <hr />
        </div>
         <div class="row form_div">
           <div class="col-sm-2">
              <%--<dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Document Type">
                </dx:ASPxLabel>--%>
               <label>Document Type</label>
&nbsp;<span class="style10"><strong>*</strong></span>
           </div>
            <div class="col-sm-4">
                <dx:ASPxComboBox ID="cmb_selectdoctype" IncrementalFilteringMode="Contains" runat="server" Width="300px" 
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" ValueField="DocumentID" TextField="DocumentName" DataSourceID="SqlDataSource1" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" ValueType="System.String">
                    <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                    </LoadingPanelImage>
                    <ValidationSettings>
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
                </dx:ASPxComboBox>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
                    SelectCommand="SELECT [DocumentID], [DocumentName] FROM [DocumentMaster]"></asp:SqlDataSource>
                        
             </div> 
               <div class="col-sm-2">
                   <%-- <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Upload Documents">
                </dx:ASPxLabel>--%>
                <label>Upload Documents</label>
&nbsp;<span class="style10"><strong>*</strong></span>
               </div>
                <div class="col-sm-4">
                      <asp:FileUpload ID="UploadImage" CssClass="" ClientIDMode="Static" runat="server" accept=".pdf,.doc,.docx" ViewStateMode="Enabled" />   
                       <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationExpression="([a-zA-Z0-9\s_\\.\-:()])+(.pdf|.doc|.docx)$"
                                   ControlToValidate="UploadImage" runat="server" ForeColor="Red" ErrorMessage="Please select a valid pdf or doc file." Display="Dynamic" />
                
             </div>
            
     </div>
    
          <div class="row form_div">
         <div class="col-sm-2"></div>
               <div class="col-sm-10">
        <%--<dx:ASPxButton ID="btn_save" runat="server" Text="Add" 
                    Height="25px" Width="110px" 
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" 
                    onclick="btn_save_Click" >
            <ClientSideEvents Click="function(s, e) {
                SetTarget1();
             }" />
                </dx:ASPxButton>--%>
                    <asp:Button ID="Button2" runat="server" OnClick="btn_save_Click" OnClientClick="addDoc()" Text="Add"  CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css"   CssPostfix="SoftOrange"></asp:Button>
                   </div>
              </div> 
            </ContentTemplate>
         </asp:UpdatePanel>
        <br/>
   <div class="col-sm-12">
    <asp:SqlDataSource ID="AssetDS" runat="server" 
        ConnectionString="<%$ ConnectionStrings:RCBSAPConnectionString %>" 
        SelectCommand="select * from AssetMaster">
    </asp:SqlDataSource>
    <strong><span class="dxmLite">Documents List :</span></strong><br />
        <div class="table-responsive">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="ASPxGridView1_RowCommand"
        style="width:100%"
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" Width="500px" KeyFieldName="SRNO">
        <Columns>
         <dx:GridViewDataTextColumn FieldName="SRNO" VisibleIndex="0" Visible="false" ReadOnly="True">
             <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="DocumentType" VisibleIndex="1" visible="false">
             <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Asset" VisibleIndex="2" >
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="DocumentID" VisibleIndex="3" Visible="false">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="DocumentName" VisibleIndex="4">
            </dx:GridViewDataTextColumn>          
            <dx:GridViewDataTextColumn FieldName="ImageLocation" VisibleIndex="5" >
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="View" VisibleIndex="6">
                         <DataItemTemplate>
                             <asp:LinkButton ID="LinkButton1" CommandName="View" OnClientClick="SetTarget();" runat="server" ForeColor="SpringGreen">View Document</asp:LinkButton>
                         </DataItemTemplate>  
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Delete" VisibleIndex="7">
                <DataItemTemplate>
                    <asp:LinkButton ID="delete" CommandName="Delete" runat="server" ForeColor="Red" OnClientClick="SetTarget1();">Delete</asp:LinkButton>
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
   <%-- <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ASSETManagementConnectionString %>" SelectCommand="SELECT [DocumentTypeID], [DocTypeName], [Status], [ImageLocation], [Date] FROM [DocumentMapping]"></asp:SqlDataSource>--%>
    <br />
            </div>
       
           
                <dx:ASPxButton ID="btn_saveDocument" runat="server" Text="Save" 
                    Height="25px" Width="110px" 
                   CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css"  CssPostfix="SoftOrange"
        onclick="btn_saveDocument_Click"> 
        <%-- <ClientSideEvents Click="function(s, e) {
                SetTarget1();
             }" />    --%>      
                    <ClientSideEvents Click="function(s, e) {  lpanel.Show(); e.processOnServer = true;}"></ClientSideEvents> 
                </dx:ASPxButton>
       <dx:ASPxLoadingPanel runat="server" Modal="True" Text="Please wait" ClientInstanceName="lpanel" ID="ASPxLoadingPanel1">
    </dx:ASPxLoadingPanel>
    <br />
    <br />
     </div>
</div>
</ContentTemplate>
    <%-- <Triggers>
            <asp:PostBackTrigger ControlID="btn_save" />
        </Triggers>--%>
</asp:UpdatePanel>
</asp:Content>

