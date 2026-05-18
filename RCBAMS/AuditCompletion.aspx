<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AuditCompletion.aspx.cs" Inherits="AuditCompletion" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx1" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxGridView" Assembly="DevExpress.Web.ASPxGridView.v11.1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<style>
    .form_div{
           margin-top:10px;
           /*margin-left:2px;*/
         }
       
         .back-bg {
            margin: 20px 30px;
            border: 2px solid rgb(199, 212, 220);
            padding: 15px 0;
     }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="col-sm-12">
   
    <dx:ASPxLabel ID="lbl_msg" runat="server" Text="" 
                    style="color: #3333FF; font-weight: 700;" Visible="false">
                </dx:ASPxLabel>
       <br />
     <strong>Audit Completion</strong>
        <hr/>
       
  
   <div class="row form_div">
           <div class="col-sm-2">
           
                Select Audit
            </div>
           <div class="col-sm-4">
                        
                  <dx:ASPxGridLookup ID="Audit_Gridlookup" runat="server" 
                    AutoGenerateColumns="False" DataSourceID="SqlDataSource3" TextFormatString="{2}"  Height="25px" Width ="300px"
                    KeyFieldName="AuditID" IncrementalFilteringMode="Contains"  GridViewProperties-Settings-UseFixedTableLayout="true" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                    <GridViewProperties>
                        <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>

                        <Settings UseFixedTableLayout="True"></Settings>
                    </GridViewProperties>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="AuditID" ReadOnly="True" VisibleIndex="0" Visible="false">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="AuditDate" VisibleIndex="1" Visible="false">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn FieldName="AuditName" VisibleIndex="2" Width="170px">
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
          
           </div>
      <div class="col-sm-1" style="padding-left:20px;">
              <dx:ASPxButton ID="btn_search" runat="server" BackColor="White" 
                     Width="20px" Height="25px"  OnClick="btn_search_Click">
                    <Image Url="~/Images/search1.png" Width="20px" Height="20px">
                    </Image>
                    <Border BorderColor="White" />                   
                </dx:ASPxButton>
        </div>
    </div>

     
       
 <div class="clearfix"></div>
         
        
          <div id="AuditDetails"  runat="server">
                 
                  <div class="row">  
                  <div class="col-sm-12"> 
                  <div class="col-sm-12">  
               
               </div>      
             </div>       
        
   </div>
         <div class="row">  
          
               <div class="row back-bg">
             

         <div class="col-sm-12">
          <div class="row form_div">
           <div class="col-sm-2">
              
               <label>Audit Name:</label>
               </div>
           <div class="col-sm-4">
                  <dx:ASPxLabel ID="lbl_Auditname" runat="server" Font-Bold="True" ForeColor="Blue"></dx:ASPxLabel>
            </div>
            <div class="col-sm-2">
            
                <label>Audit Description:</label>
           </div>
            <div class="col-sm-4">
                <dx:ASPxLabel ID="lbl_Auditdesc" runat="server" Font-Bold="True" ForeColor="Blue"></dx:ASPxLabel>
             </div> 
              </div>
             
     </div>
        
              <div class="col-sm-12">
           <div class="row form_div">
            <div class="col-sm-2">
              <%--<dx:ASPxLabel ID="Label3" runat="server" Text="Asset Class Name:"></dx:ASPxLabel>--%>
                <label>Audit By:</label>
            </div>
            <div class="col-sm-4"> 
               <dx:ASPxLabel ID="lbl_Auditby" runat="server" Font-Bold="True" ForeColor="Blue"></dx:ASPxLabel>
            </div>
    
           <div class="col-sm-2">
           <label >Audit Location:</label>       
         </div>
         <div class="col-sm-4">
            <dx:ASPxLabel ID="lbl_Auditlocation" runat="server"  Text="" Font-Bold="True" ForeColor="Blue">
	        </dx:ASPxLabel>           
         </div>
       </div>
    </div>
    
    <div class="col-sm-12">
    <div class="row form_div">
         <div class="col-sm-2">
            <label>Audit Date:</label>
         </div>
         <div class="col-sm-4">
             <dx:ASPxLabel ID="lbl_Auditdate" runat="server"  Text="" Font-Bold="True" ForeColor="Blue">
		     </dx:ASPxLabel>            
         </div>     
         <div class="col-sm-2">
           <label >Audit Status:</label>       
         </div>
         <div class="col-sm-4">
            <dx:ASPxLabel ID="lbl_Auditstatus" runat="server"  Text="" Font-Bold="True" ForeColor="Blue">
	        </dx:ASPxLabel>           
         </div>
     </div>
</div>
</div>
</div>
</div>
  
   <div class="row form_div">
           <div class="col-sm-2">
           
                Select Date
            </div>
           <div class="col-sm-3">             
                <dx:ASPxDateEdit ID="cmb_completiondate" runat="server" Height="25px"
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" width="300px"
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" DisplayFormatString="dd-MM-yyyy" >
                    <ValidationSettings>
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
                </dx:ASPxDateEdit>
         </div>
    </div>
    <div class="row form_div">
        <div class="col-sm-2">
             Remarks
        </div>
        <div class="col-sm-3">
            <asp:TextBox ID="txt_cmt" runat="server" TextMode="MultiLine" Rows="2"  Columns="40"></asp:TextBox>
        </div>
    </div>
      <div class="clearfix"></div>
     
     <div class="row form_div">
         <div class="col-sm-2">
            
              
         </div>
         <div class="col-sm-3">
              <dx:ASPxButton ID="AuditComplete" runat="server" Text="Mark Audit Complete" OnClick="AuditComplete_Click" Width="191px" 
        CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css"></dx:ASPxButton>
         </div>
        </div>

  <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" 
        SelectCommand="SELECT [AuditID], [AuditDate], [AuditName] FROM [AuditMaster] where AuditStatus='Active'">
    </asp:SqlDataSource>
    <br />
    <br />
   <div class="table-responsive">
      <dx:ASPxGridView ID="AuditList" runat="server" AutoGenerateColumnsASPxGridView1="False" 
        DataSourceID="AuditListSqlDataSource" KeyFieldName="AuditID" 
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
        CssPostfix="PlasticBlue" AutoGenerateColumns="False" width="95%">
        <Columns>
            
              <dx:GridViewDataTextColumn FieldName="AuditID" ReadOnly="True" VisibleIndex="0" Visible="false">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>   
            <dx:GridViewDataTextColumn FieldName="AuditName" ReadOnly="True" VisibleIndex="1">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>         
             <dx:GridViewDataTextColumn FieldName="AuditDescription" ReadOnly="True" VisibleIndex="2">
                <Settings AutoFilterCondition="Contains" />
              </dx:GridViewDataTextColumn>  
              <dx:GridViewDataTextColumn FieldName="AuditBy" VisibleIndex="3" Caption="AuditBy">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Location" VisibleIndex="4" Caption="Wing">
    <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Block" VisibleIndex="4" Caption="Floor">
    <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="LocationCode" VisibleIndex="4" Caption="LAB">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             
            <dx:GridViewDataDateColumn FieldName="AuditDate" VisibleIndex="5" 
               Width="100px" caption="Audit CreationDate">
                <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>
               <Settings AutoFilterCondition="Contains"/>
            </dx:GridViewDataDateColumn>        
            
           
            <dx:GridViewDataTextColumn FieldName="Status" Visible="false" VisibleIndex="7">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
           <dx:GridViewDataTextColumn FieldName="AdminRemarks" VisibleIndex="8">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataDateColumn FieldName="CompletionDate" VisibleIndex="5" 
               Width="100px" >
                <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>
               <Settings AutoFilterCondition="Contains"/>
            </dx:GridViewDataDateColumn>  
            <dx:GridViewDataTextColumn FieldName="AuditStatus" VisibleIndex="8">
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
        <Settings  ShowFooter="true" ShowFilterRow="true" ShowGroupPanel="True"/>
        <TotalSummary>
        <dx:ASPxSummaryItem FieldName="AuditName" SummaryType="Count" />
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

    <asp:SqlDataSource ID="AuditListSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>"
        SelectCommand="select * from RCBAMS..AuditMaster left join RCBAMS..LocationMaster on LocationMaster.LocationID=AuditMaster.LocationID  where AuditStatus='InActive' order by AuditID desc">
    </asp:SqlDataSource>
</div>

</asp:Content>

