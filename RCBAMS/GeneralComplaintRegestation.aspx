<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="GeneralComplaintRegestation.aspx.cs" Inherits="GeneralComplaintRegestation" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxMenu" tagprefix="dx1" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxLoadingPanel" Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" Runat="Server">
      <style>
    .form_div{
           margin-top:10px;
           /*//margin-left:2px;*/
         }
       
         .back-bg {
            margin: 20px 30px;
            border: 2px solid rgb(199, 212, 220);
            padding: 15px 0;
     }
</style>
    <style>
        .container {
            width: 90% !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
     <div class="container cnt_div" cssclass="container">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
 <%--<asp:UpdatePanel ID="updpnlRefresh" runat="server" UpdateMode="Conditional">--%>
  <ContentTemplate> 
    <div class="col-sm-12">
      <h4><strong><span>Raise General Complaint</span></strong></h4>
    <div class="">
        <div class="row">
        <div style="">
           <div class="col-sm-12">
           <dx:ASPxLabel ID="errormsg" runat="server" Text="" Visibl="false" ForeColor="Red" Font-Size="Large"></dx:ASPxLabel>
                 </div>
            </div>
            
            <div class="col-sm-10">
                <div class="row form_div">
                <div class="col-sm-2">
                    <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Staff Number:" Font-Size="Large"></dx:ASPxLabel>                 
                </div>
                <div class="col-sm-4">
                     <dx:ASPxLabel ID="reqid" runat="server" Text="" ForeColor="Black" Font-Size="Medium"></dx:ASPxLabel>
                </div>
                <div class="col-sm-2">
                    <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="User Name:" Font-Size="Large"></dx:ASPxLabel>                 
                </div>
                <div class="col-sm-4">
                     <dx:ASPxLabel ID="lbl_requestername" runat="server" Text="" ForeColor="Black" Font-Size="Medium"></dx:ASPxLabel>
                </div>
                </div>
                  <div class="row form_div">
              
                
                <div class="col-sm-2">
                    <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="Department:" Font-Size="Large"></dx:ASPxLabel>                 
                </div>
                <div class="col-sm-4">
                    <dx:ASPxLabel ID="reqdept" runat="server" Text="" ForeColor="Black" Font-Size="Medium"></dx:ASPxLabel>
                </div>
                <div class="col-sm-2">
                    <dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="Designation:" Font-Size="Large"></dx:ASPxLabel>                                
                </div>
                <div class="col-sm-4">
                     <dx:ASPxLabel ID="reqdesign" runat="server" Text="" ForeColor="Black" Font-Size="Medium"></dx:ASPxLabel>
                </div>
                </div>
                 <div class="row form_div">
                         
                <div class="col-sm-2">
                    <dx:ASPxLabel ID="ASPxLabel13" runat="server" Text="Email:" Font-Size="Large"></dx:ASPxLabel>                 
                </div>
                <div class="col-sm-4">
                    <dx:ASPxLabel ID="lblmail" runat="server" Text="" ForeColor="Black" Font-Size="Medium"></dx:ASPxLabel>
                </div>
                <div class="col-sm-2">
                    <dx:ASPxLabel ID="ASPxLabel14" runat="server" Text="Reporting Authority:" Font-Size="Large"></dx:ASPxLabel>                                
                </div>
                <div class="col-sm-4">
                     <dx:ASPxLabel ID="lbl_auth" runat="server" Text="" ForeColor="Black" Font-Size="Medium"></dx:ASPxLabel>
                </div>
                </div>
                <div class="row form_div">
                 
                <div class="col-sm-2">
                     
                </div>
                <div class="col-sm-4">
                     
                </div>
                </div>
            </div>
           <br />
             <div class="clearfix"></div>
            <hr />
            <br />
             <%--  <div class="col-sm-10">
                 <div class="row">
                <div class="col-sm-2">
                 <dx:ASPxLabel ID="lbl_deprt" runat="server" Text="Select Asset Class"></dx:ASPxLabel>
                    </div>
                <div class="col-sm-4">
                   

                         <dx:ASPxGridLookup ID="cmb_assetclass" runat="server"
                    AutoGenerateColumns="False" DataSourceID="SqlDataSource" TextFormatString="{1}" Width="300px" Height="25px"
                    KeyFieldName="AssetClassName" IncrementalFilteringMode="Contains"  CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" AutoPostBack="true">--%>
                    <GridViewProperties>
                        <%--<SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>--%>

                         <%--  <Settings  ShowFilterRow="true" ShowFilterBar="Visible"></Settings>
                    </GridViewProperties>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="AssetClassID" VisibleIndex="3" Visible="false"    >
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="AssetClassName" VisibleIndex="1" >
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="DepartmentCode" Caption="Asset Department Code" VisibleIndex="2" >
                        </dx:GridViewDataTextColumn>  
                               <dx:GridViewDataTextColumn FieldName="DepartmentName"  VisibleIndex="3"  Caption="Asset DepartmentName">
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
                </dx:ASPxGridLookup>--%>


   <%-- <asp:SqlDataSource ID="SqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:RCBSAPConnectionString %>" 
        SelectCommand="SELECT [AssetClassMaster].[AssetClassID], [AssetClassName], [DepartmentCode],
        DepartmentName FROM [AssetClassMaster]
inner join RCBAMS..EmployeeAssetRequest on EmployeeAssetRequest.AssetClassID=AssetClassMaster.AssetClassID
inner join RCBAMS..AssetAllocation on AssetAllocation.AssetRequestID=EmployeeAssetRequest.AssetRequestID
where AssetAllocation.Status='Approved' and EmployeeAssetRequest.EmployeeID=@CustodianID order by AssetAllocation.Date desc">
        <SelectParameters>
       <asp:ControlParameter ControlID="reqid" Name="CustodianID" />
   </SelectParameters>
    </asp:SqlDataSource>--%>
       

  <%-- <asp:SqlDataSource ID="SqlDataSource" runat="server" 
        <asp:SqlDataSource ID="SqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:RCBSAPConnectionString %>" 
        SelectCommand="
SELECT distinct [AssetClassMaster].[AssetClassID], [AssetClassName], [AssetClassMaster].[DepartmentCode],
        DepartmentName FROM [AssetClassMaster]
inner join vAssetMaster on vAssetMaster.AssetClass=[AssetClassMaster].[AssetClassName]
where CustodianID=@CustodianID and vAssetMaster.Status !='NVAL'">
        <SelectParameters>
       <asp:ControlParameter ControlID="reqid" Name="CustodianID" />
   </SelectParameters>
    </asp:SqlDataSource>
                    </div>
                     </div>
            </div>--%>
       
            <br />
\
                       <div class="col-sm-10">
                 <div class="row">
                <div class="col-sm-2 ">
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Select Asset" Font-Size="Large"></dx:ASPxLabel>
                </div>
                <div class="col-sm-4">
                  <%--  <dx:ASPxComboBox ID="cmb_Assetname" runat="server" DataSourceID="SqlDataSource1" ValueField="AssetID" TextField="MainAssetNumber"></dx:ASPxComboBox>--%>
                      <dx:ASPxGridLookup ID="gridlkup_Asset" runat="server"  AutoGenerateColumns="False"
                     DataSourceID="SqlDataSource2" IncrementalFilteringMode="Contains"  TextFormatString="{1}"
                     KeyFieldName="AssetID"   Height="25px"
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" width="300px" OnInit="gridlkup_Asset_Init">
        <GridViewProperties>
       <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>
      <Settings ShowFilterRow="True" />
      <SettingsPager PageSize="15"></SettingsPager>
    </GridViewProperties>
                    <Columns>
                                            
                        <dx:gridviewdatatextcolumn FieldName="AssetID" VisibleIndex="1" visible="false">
                        </dx:gridviewdatatextcolumn>
                         <dx:gridviewdatatextcolumn FieldName="MainAssetNumber" VisibleIndex="2" Caption="Asset Number">
                        </dx:gridviewdatatextcolumn>
                        <dx:gridviewdatatextcolumn FieldName="AssetSubNumber" VisibleIndex="3" Visible="false">
                        </dx:gridviewdatatextcolumn>
                        <dx:gridviewdatatextcolumn FieldName="AssetDesc" VisibleIndex="4" Caption="AssetName">
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
                     <ValidationSettings   ValidationGroup="btn" ErrorTextPosition="Bottom">
						      <ErrorFrameStyle ImageSpacing="4px">
                                  <ErrorTextPaddings PaddingLeft="4px" />
                              </ErrorFrameStyle>
						<RequiredField ErrorText="Please Select Asset " IsRequired="True" />
					</ValidationSettings>
                </dx:ASPxGridLookup>
                </div>
                <dx:ASPxButton ID="btn_search" runat="server" BackColor="White" ValidationGroup="djhbfkjsa" 
                    
                    OnClick="btn_search_Click"        Width="20px" Height="25px">
                    <Image Url="~/Images/search1.png" Width="20px" Height="20px">
                    </Image>
                    <Border BorderColor="White" />                   
                </dx:ASPxButton>
                     </div>
            </div>
   <div class="clearfix"></div>
            <div id="AssetDetails"  runat="server" visible="false">
                 
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
               <dx:ASPxLabel ID="Label1" runat="server" Text="Asset Number:" Font-Size="Large"></dx:ASPxLabel>
              
               </div>
           <div class="col-sm-4">
                  <dx:ASPxLabel ID="lbl_AssetNo" runat="server" Font-Bold="True" ForeColor="Black" Font-Size="Medium"></dx:ASPxLabel>
            </div>
            <div class="col-sm-2">
               <dx:ASPxLabel ID="Label2" runat="server" Text="Sub Asset Number:" Font-Size="Large"></dx:ASPxLabel>
               
           </div>
            <div class="col-sm-4">
                <dx:ASPxLabel ID="lbl_SubNumber" runat="server" Font-Bold="True" ForeColor="Black" Font-Size="Medium"></dx:ASPxLabel>
             </div> 
              </div>
             
     </div>
        
              <div class="col-sm-12">
           <div class="row form_div">
            <div class="col-sm-2">
              <dx:ASPxLabel ID="Label3" runat="server" Text="Asset ID:" Font-Size="Large"></dx:ASPxLabel>
               
            </div>
            <div class="col-sm-4"> 
               <dx:ASPxLabel ID="lbl_Assetclass" runat="server" Font-Bold="True" ForeColor="Black" Font-Size="Medium"></dx:ASPxLabel>
            </div>
    
           <div class="col-sm-2">
                <dx:ASPxLabel ID="Label4" runat="server" Text="Asset Type:" Font-Size="Large"></dx:ASPxLabel>
             
           </div>
            <div class="col-sm-4">
               <dx:ASPxLabel ID="lbl_AssetType" runat="server" Font-Bold="True" ForeColor="Black" Font-Size="Medium"></dx:ASPxLabel>
            </div>   
               </div>
       </div>
     <div class="col-sm-12">
    <div class="row form_div">
         <div class="col-sm-2">
           <dx:ASPxLabel ID="Label5" runat="server" Text="Asset Location:" Font-Size="Large"></dx:ASPxLabel>
         </div>
         <div class="col-sm-4">
             <dx:ASPxLabel ID="lbl_assetlocation" runat="server"  Text="" Font-Bold="True" ForeColor="Black" Font-Size="Medium">
		     </dx:ASPxLabel>            
         </div>     
         <div class="col-sm-2">
               <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Asset Block:" Font-Size="Large"></dx:ASPxLabel>
         </div>
         <div class="col-sm-4">
                      <dx:ASPxLabel ID="lbl_block" runat="server" Font-Bold="True" ForeColor="Black" Font-Size="Medium"></dx:ASPxLabel>
         </div>
     </div>
</div>
</div>
</div>
</div>           
             <br />

                <div class="col-sm-10">
                <div class="row">
                    <div class="col-sm-2">
                <dx:ASPxLabel ID="ASPxLabel17" runat="server" Text="Complaint Type" Font-Size="Large"></dx:ASPxLabel><span style="color:red"></span>
                        </div>
                    <div class="col-sm-4">
			                <dx:ASPxComboBox ID="cmb_service" runat="server" ValueType="System.String" Height ="25px" Width="300px" Textfield="ServiceTypeName" ValueField="ServiceTypeID" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" DataSourceID="SqlDataSource5">               
					<LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                    </LoadingPanelImage>
                     <ValidationSettings   ValidationGroup="btn" ErrorTextPosition="Bottom">
						      <ErrorFrameStyle ImageSpacing="4px">
                                  <ErrorTextPaddings PaddingLeft="4px" />
                              </ErrorFrameStyle>
						<RequiredField ErrorText="Please Select the Service Type " IsRequired="True" />
					</ValidationSettings>
                </dx:ASPxComboBox>
                        </div>   
                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" SelectCommand="select ServiceTypeID,ServiceTypeName from ServiceTypeMaster where Status='Active'"></asp:SqlDataSource>
                           
            </div>
            </div>
            <br/><br/>
            <div class="col-sm-10">
                 <div class="row">
                <div class="col-sm-2">
                     <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Complaint Description" Font-Size="Large"></dx:ASPxLabel>
                    </div>
                     <div class="col-sm-4">
			              <dx:ASPxMemo ID="Memo_Desc" runat="server" Height="80px" Width="300px" 
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                                <ValidationSettings   ValidationGroup="btn" ErrorTextPosition="Bottom">
						      <ErrorFrameStyle ImageSpacing="4px">
                                  <ErrorTextPaddings PaddingLeft="4px" />
                              </ErrorFrameStyle>
						<RequiredField ErrorText="Please enter Complaint Description" IsRequired="True" />
					</ValidationSettings>
			              </dx:ASPxMemo>

                   
                </div>
                     </div>
            </div>
            <br/><br/>
            <br/><br/>
            <br/><br/>
             <div class="col-sm-10">
                 <div class="row">
                <div class="col-sm-2">
                   <dx:ASPxLabel ID="ASPxLabel18" runat="server" Text="Upload File" Font-Size="Large"></dx:ASPxLabel></div>
                     <div class="col-sm-4">
                                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" Width="100%" Visible="True" />
									<asp:RegularExpressionValidator ID="RegularExpressionValidator2"  ValidationExpression="(.*\.([Jj][Pp][Gg])|.*\.([Jj][Pp][Ee][Gg])$)"
										ControlToValidate="FileUpload1" runat="server" ForeColor="Red" ErrorMessage="Please select a valid JPG PNG File." Display="Dynamic" />                  
                </div>
                     </div>
            </div>
            <br/>
         
            <br/>
            <%--<div class="col-sm-12">
                         <div class="col-sm-6">
            
              <dx:ASPxLabel ID="ASPxLabel17" runat="server" Text="Service Type"></dx:ASPxLabel><span style="color:red">*</span>
			                <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" ValueType="System.String" Height ="25px"  Textfield="ServiceTypeName" ValueField="ServiceTypeID" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" DataSourceID="SqlDataSource1">               
					<LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                    </LoadingPanelImage>
                     <ValidationSettings   ValidationGroup="btn" ErrorTextPosition="Bottom">
						      <ErrorFrameStyle ImageSpacing="4px">
                                  <ErrorTextPaddings PaddingLeft="4px" />
                              </ErrorFrameStyle>
						<RequiredField ErrorText="Please Select the Service Type " IsRequired="True" />
					</ValidationSettings>
                </dx:ASPxComboBox>
                           
                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:MESConnectionString %>" SelectCommand="select ServiceTypeID,ServiceTypeName from ServiceTypeMaster where Status='Active'"></asp:SqlDataSource>
                           
                            </div>
                       
                  
                       </div>--%>
         
            <br/>
         
            <br/>
             <div class="col-sm-10">
                 <div class="row">
                     <div class="col-sm-2">

                     </div>
                     <div class="col-sm-6">
                    <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Submit" ValidationGroup="btn" OnClick="ASPxButton1_Click" CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css"> 
                       <%-- <ClientSideEvents Click="function(s, e) {  lpanel.Show(); e.processOnServer = true;}"></ClientSideEvents> --%>
                        </dx:ASPxButton><br />
                         
                 <dx:ASPxLoadingPanel runat="server" Modal="True" Text="Please wait" ClientInstanceName="lpanel" ID="ASPxLoadingPanel1">
                 </dx:ASPxLoadingPanel>
                   </div>
                   </div>
                 </div>
            <%-- <div class="col-sm-12">
                  <div class="col-sm-6">
             
                
									<dx:ASPxLabel ID="ASPxLabel18" runat="server" Text="Upload File">
									</dx:ASPxLabel>
                                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" Width="100%" Visible="True" />
									<%--<asp:RegularExpressionValidator ID="RegularExpressionValidator2"  ValidationExpression="(.*\.([Jj][Pp][Gg])|.*\.([Jj][Pp][Ee][Gg])$)"
										ControlToValidate="file_complaint" runat="server" ForeColor="Red" ErrorMessage="Please select a valid JPG PNG File." Display="Dynamic" />
								</div>
            </div>--%>
            <div class="clearfix"></div>
      <div class="table-responsive" style="padding:10px" >

     <dx:ASPxGridView ID="AssetList" runat="server" AutoGenerateColumnsASPxGridView1="False"  OnHtmlDataCellPrepared="AssetList_HtmlDataCellPrepared"
          style="width:100%" 
        DataSourceID="SqlDataSource3" KeyFieldName="ComplaintID" 
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
        CssPostfix="PlasticBlue" AutoGenerateColumns="False">
        <Columns>
              <%--<dx:GridViewDataTextColumn FieldName="AssetClassID" ReadOnly="True" VisibleIndex="0" Caption="Asset Class" Visible="false" >
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>   --%>
<%--            <dx:GridViewDataTextColumn FieldName="AssetClassID"  ReadOnly="True" VisibleIndex="1">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn> --%>        
             <%--<dx:GridViewDataTextColumn FieldName="QRImage" VisibleIndex="2">
                 <Settings AutoFilterCondition="Contains" />
                        <DataItemTemplate>
                            <dx:ASPxImage ID="img" runat="server" ImageUrl='<%# Eval("QRImage") %>' Height="80px" Width="150px"></dx:ASPxImage>
                        </DataItemTemplate>
            </dx:GridViewDataTextColumn> --%> 
                   <dx:GridViewDataTextColumn FieldName="EmployeeName" VisibleIndex="1" Caption="Employee Name">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn FieldName="ComplaintID" VisibleIndex="2" Caption=" Complaint ID" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="ServiceTypeName" VisibleIndex="3" Caption="Complaint Type">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>             
                        <dx:GridViewDataTextColumn FieldName="MainAssetNumber" VisibleIndex="4" Caption="Asset Number" Visible="true">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn FieldName="AssetDesc" VisibleIndex="5" Caption="Asset Description"  Visible="true">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="Complaint_Description" VisibleIndex="6" Caption="Complaint Description">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="7">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CreatedDate" VisibleIndex="8" 
               Width="100px" caption="Complaint Date">
              
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn> 
          

             <dx:GridViewDataTextColumn FieldName="complaintsequence" VisibleIndex="2" Caption="complaint Sequence" Visible="true">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
          
            
             <dx:GridViewDataTextColumn FieldName="EmployeeDepartment" VisibleIndex="11" Caption="Employee Department" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
      
            <dx:GridViewDataTextColumn FieldName="EmployeeID" VisibleIndex="3" Caption="Employee ID" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            
          <dx:GridViewDataTextColumn FieldName="EmployeeDesignation" VisibleIndex="9" Caption="Employee Designation" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
          
            
  
         
  <%--  <dx:GridViewDataTextColumn FieldName="FileDocument" VisibleIndex="11" Caption="Custodian Department" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>--%>
       
            
        </Columns>
        <SettingsPager showdefaultimages="False">
            <AllButton Text="All">
            </AllButton>
            <NextPageButton Text="Next &gt;">
            </NextPageButton>
            <PrevPageButton Text="&lt; Prev">
            </PrevPageButton>
        </SettingsPager>
          <SettingsPager PageSize="15"></SettingsPager>
        <Settings  ShowFooter="true" ShowFilterRow="true"/>
        <TotalSummary>
        <dx:ASPxSummaryItem FieldName="AssetID" SummaryType="Count" />
        </TotalSummary>
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
            <header imagespacing="10px" sortingimagespacing="10px">
            </header>
        </Styles>
        <StylesEditors>
            <CalendarHeader Spacing="11px">
            </CalendarHeader>
            <ProgressBar Height="25px">
            </ProgressBar>
        </StylesEditors>
    </dx:ASPxGridView>
        
      
   <%-- <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ConnectionStrings:RCBSAPConnectionString %>" 
        SelectCommand="Select AssetTypeID,AssetTypeName,AssetTypeCode from AssetTypeMaster inner join AssetClassMaster on AssetClassMaster.AssetClassName=AssetTypeMaster.AssetClassName where AssetClassID=@AssetClassID">
         <SelectParameters>
            <asp:ControlParameter ControlID="cmb_assetclass" Name="AssetClassID" />
        </SelectParameters>
    </asp:SqlDataSource>--%>

       <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
        SelectCommand="SELECT ComplaintRegistration.ComplaintID,EmployeeID,MainAssetNumber,AssetDesc,EmployeeName,Concat(ComplaintTransaction.USR_ID+'_','C0',ComplaintTransaction.Sequence) as complaintsequence,EmployeeDepartment,EmployeeDesignation,ServiceTypeMaster.ServiceTypeName, ComplaintRegistration.CreatedDate,ComplaintTransaction.Status,Complaint_Description FROM  [ComplaintRegistration]  
inner join RCBSAP..AssetMaster on RCBSAP..AssetMaster.AssetID=[ComplaintRegistration].AssetID
inner join RCBAMS..[ComplaintTransaction] on RCBAMS..[ComplaintTransaction].ComplaintID=RCBAMS..[ComplaintRegistration].ComplaintID
inner join ServiceTypeMaster on ServiceTypeMaster.ServiceTypeID=ComplaintRegistration.ServiceTypeID  Where EmployeeID=@EmployeeID and (ComplaintTransaction.Status='Pending' or ComplaintTransaction.Status='Re_Open') and  ComplaintRegistration.ComplaintType IS not NULL">
          <%-- SELECT EmployeeID,ApproverID,Status,CustodianMaster.CustodianName,EmployeeName, Comments,EmployeeDepartment,AssetTypeMaster.AssetTypeName,EmployeeDesignation,ServiceTypeName,Complaint_Description FROM RCBAMS..[ComplaintRegistration] 
inner join ServiceTypeMaster on ServiceTypeMaster.ServiceTypeID=ComplaintRegistration.ServiceTypeID
inner join RCBSAP..[AssetClassMaster] on AssetClassMaster.AssetClassName=ComplaintRegistration.AssetClassID
inner join RCBSAP..[AssetTypeMaster] on AssetTypeMaster.AssetTypeID=ComplaintRegistration.AssetTypeID
inner join CustodianMaster on CustodianMaster.CustodianID=ComplaintRegistration.ApproverID
Where EmployeeID=@EmployeeID and Status='Pending' or Status='Re_Open'">--%>
<%--inner join RCBSAP..AssetTypeMaster on AssetTypeMaster.AssetTypeID=EmployeeAssetRequest.AssetTypeID
 where EmployeeID=@EmployeeID order by [AssetRequestID] desc">--%>
        <SelectParameters>
        <asp:SessionParameter Name="EmployeeID" SessionField="UserID" />
        </SelectParameters>
        </asp:SqlDataSource>

 <%--<asp:SqlDataSource ID="LocationSqlDataSource1" runat="server" ConnectionString="<%$ConnectionStrings:RCBAMSConnectionString %>" SelectCommand="select * from LocationMaster">

 </asp:SqlDataSource>--%>
   </div>
      </div>
    </div> 
 </div>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ConnectionStrings:RCBSAPConnectionString %>" 
        SelectCommand="Select * From RCBSAP..vAssetMaster where vAssetMaster.AssetClass='Non-IT' and Status='AVAL'">
    <SelectParameters>
        <%--<asp:SessionParameter name="EmployeeID" SessionField="UserID"/>--%>
        
    <%--  <asp:ControlParameter ControlID="cmb_assetclass" Name="AssetClass" />--%>
    </SelectParameters>
    </asp:SqlDataSource>
      </ContentTemplate>
    <%--</asp:UpdatePanel>--%>
         </div> 
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

