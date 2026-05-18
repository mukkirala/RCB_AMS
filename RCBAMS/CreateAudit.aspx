<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CreateAudit.aspx.cs" Inherits="CreateAudit" %>


<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            width:100%;
            height: 23px;
           
            
        }
        .auto-style6 {
            width: 30px;
        }
        .auto-style7 {
            width: 30px;
        }
        .auto-style8 {
            width: 78px;
        }
        .auto-style9 {
            font-size: small;
            font-weight: bold;
        }
          .form_div{
           margin-top:10px;
       }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="col-sm-12">    
        <dx:ASPxLabel ID="Lbl_Display" runat="server" Font-Bold="True" Font-Size="12px" ForeColor="Red" Visible="false">
          </dx:ASPxLabel>
         <dx:ASPxLabel ID="lbl_Error" runat="server" Text="" Font-Bold="True" Font-Size="12px" ForeColor="Red" Visible="false">
         </dx:ASPxLabel><br />
          
           <%--<div class="row">   
              <div class="col-sm-12"><strong>Custodian Details</strong>
              <hr/>
              </div>
           </div>
             <div class="row form_div">
                <div class="col-sm-2">
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="CustodianID:"></dx:ASPxLabel>                 
                </div>
                <div class="col-sm-4">
                     <dx:ASPxLabel ID="reqid" runat="server" Text="" ForeColor="Blue"></dx:ASPxLabel>
                </div>
                <div class="col-sm-2">
                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="CustodianName:"></dx:ASPxLabel>                 
                </div>
                <div class="col-sm-4">
                     <dx:ASPxLabel ID="lbl_requestername" runat="server" Text="" ForeColor="Blue"></dx:ASPxLabel>
                </div>
                </div>
                  <div class="row form_div">
                <div class="col-sm-2">
                    <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Department Code:"></dx:ASPxLabel>                 
                </div>
                <div class="col-sm-4">
                     <dx:ASPxLabel ID="reqdeptcode" runat="server" Text="" ForeColor="Blue"></dx:ASPxLabel>
                </div>
                <div class="col-sm-2">
                    <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Department:"></dx:ASPxLabel>                 
                </div>
                <div class="col-sm-4">
                    <dx:ASPxLabel ID="reqdept" runat="server" Text="" ForeColor="Blue"></dx:ASPxLabel>
                </div>
                </div>
                <div class="row form_div">
                <div class="col-sm-2">
                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Designation:"></dx:ASPxLabel>                                
                </div>
                <div class="col-sm-4">
                     <dx:ASPxLabel ID="reqdesign" runat="server" Text="" ForeColor="Blue"></dx:ASPxLabel>
                </div>
                <div class="col-sm-2">
                     
                </div>
                <div class="col-sm-4">
                     
                </div>
                </div>
          </div>--%>
          <%--  <hr />--%>
          
       
          
              <div>
                  <h4><strong>Create Audit</strong></h4>
    
           </div>
          
            <div class="row form_div">
             <div class="col-sm-2">
    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Audit Name" Font-Size="Large" Font-Bold="true">
      </dx:ASPxLabel><span style="color:red;font-size:20px;">*</span>

   </div>
              <div class="col-sm-4">
                      <dx:ASPxTextBox ID="txtAuditName" runat="server" Height="25px" Width="300px" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                    <ValidationSettings>
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
                </dx:ASPxTextBox>
                
             </div>
           <div class="col-sm-2">
   <dx:ASPxLabel ID="lbl_Location" runat="server" Text="Wing "   Font-Size="Large"  Font-Bold="true">
     </dx:ASPxLabel><span style="color:red;font-size:20px;">*</span>

  </div>
             <div class="col-sm-4">                  
                   <dx:ASPxGridLookup ID="cmb_location" runat="server"  AutoGenerateColumns="False" Width="300px"
                     DataSourceID="LocationDS" IncrementalFilteringMode="Contains"  TextFormatString="{2}"
                     KeyFieldName="LocationID"   Height="25px"
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                    <GridViewProperties>
                    <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>
                    <Settings ShowFilterRow="True" />
                    <SettingsPager PageSize="6"></SettingsPager>
                    </GridViewProperties>
                    <Columns>
                        <dx:gridviewdatatextcolumn FieldName="LocationID"  ReadOnly="True" 
                            VisibleIndex="0" Visible="false">
                            <EditFormSettings Visible="True" />
                        </dx:gridviewdatatextcolumn>   
                        <dx:gridviewdatatextcolumn FieldName="Location" VisibleIndex="1" Caption="Wing">
</dx:gridviewdatatextcolumn>
                        <dx:gridviewdatatextcolumn FieldName="LocationCode" VisibleIndex="2" Caption="LAB">
                        </dx:gridviewdatatextcolumn>
                          <dx:gridviewdatatextcolumn FieldName="Block" VisibleIndex="3" Caption="Floor">
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
                </dx:ASPxGridLookup>
                    <asp:SqlDataSource ID="LocationDS" runat="server" ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" SelectCommand="SELECT [LocationID], [Location],[LocationCode],Block  FROM [LocationMaster]">                
                </asp:SqlDataSource>  
             </div   > 
             </div>        
            <div class="row form_div">
               <div class="col-sm-2">
      <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Audit Status"  Font-Size="Large"  Font-Bold="true">
    </dx:ASPxLabel><span style="color:red;font-size:20px;">*</span>

  </div>
              <div class="col-sm-4">
                   <dx:ASPxComboBox ID="cmb_status" runat="server" Height="25px" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" Width="300px"
                       CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                        <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                    </LoadingPanelImage>
                    <ValidationSettings>
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
                   </dx:ASPxComboBox>
              </div>
              <div class="col-sm-2">
    <dx:ASPxLabel ID="lbl_AuditDiscription" runat="server" Text="Audit Description"  Font-Size="Large"  Font-Bold="true"></dx:ASPxLabel><span style="color:red;font-size:20px;">*</span>

 </div>
             <div class="col-sm-4">
                <asp:TextBox ID="txt_AuditDiscription" runat="server" TextMode="MultiLine" Rows="3" Columns="38"
    Width="300px"
    Height="80px"></asp:TextBox>             
             </div>
             </div>
            <div class="row form_div">
             <div class="col-sm-2">           
             </div>
              <div class="col-sm-4">
                      <dx:ASPxButton ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" Height="25px" Width="100px"  CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css"  CssPostfix="SoftOrange"  SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css"  >
                </dx:ASPxButton>
                    <dx:ASPxButton ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" Text="Update" Height="25px" Width="100px"  CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css"  CssPostfix="SoftOrange"  SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" >
                </dx:ASPxButton>
                
             </div>             
             </div>
          
          <div class="clearfix"></div>
       
           
              <div><h4><strong>Audits</strong></div></h4>
           
          
            <br/>
           <div class="table-responsive">
             <dx:ASPxGridView ID="AuditList" runat="server" AutoGenerateColumnsASPxGridView1="False" 
     style="width:100%" 
        DataSourceID="AuditListSqlDataSource" KeyFieldName="AuditID" 
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
        CssPostfix="PlasticBlue" AutoGenerateColumns="False" OnRowCommand="AuditList_RowCommand">
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
            <dx:GridViewDataDateColumn FieldName="AuditDate" VisibleIndex="5" 
               Width="100px" caption="Created Date">
                <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy">
                </PropertiesDateEdit>
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataDateColumn>        
             <dx:GridViewDataTextColumn FieldName="Location" VisibleIndex="4"  Caption="Wing">
     <Settings AutoFilterCondition="Contains" />
 </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="LocationCode" VisibleIndex="4"  Caption="LAB">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="LocationID" Visible="false"></dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="Block" VisibleIndex="4" Caption="Floor" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
       
            <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="6" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
           
           
            <dx:GridViewDataTextColumn FieldName="AuditStatus" VisibleIndex="7">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TotalStock" VisibleIndex="8" Visible="false">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Edit" VisibleIndex="0">
                <DataItemTemplate>
                    <asp:LinkButton ID="lnkbtn_edit" runat="server" Text="Edit" CommandName="Edit" ForeColor="Green">
                    <%--<asp:LinkButton ID="Link_delete" runat="server" Text="  Delete" CommandName="Delete"></asp:LinkButton>--%>
                    </asp:LinkButton>
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
        <Settings  ShowFooter="true" ShowFilterRow="true"/>
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
           </div>
           

    <asp:SqlDataSource ID="AuditListSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>"
        SelectCommand="select * from AuditMaster inner join RCBAMS..LocationMaster on LocationMaster.LocationID=AuditMaster.LocationID
        order by AuditID desc">

    </asp:SqlDataSource>
        </div>
    
    
</asp:Content>

