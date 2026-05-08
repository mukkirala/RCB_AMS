<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="GEPendingComplaintsDetails.aspx.cs" Inherits="GEApproval" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
     
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
      <div class="container">
        <div class=" row cnt_div">
             <dx:ASPxLabel ID="lbl_msg" runat="server" ForeColor="Red" Text=""></dx:ASPxLabel>
            	<div class="col-sm-12">
             <h4>  <strong>Complaint Resolution</strong></h4>
                    </div>
			            <div class="clearfix"></div><br />

			<div class="col-sm-12"> 
				<div class="col-sm-2">
				 <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Employee ID:" Font-Size="large" Font-Bold="true"></dx:ASPxLabel>
					</div>
			
				<div class="col-sm-3">
				 <dx:ASPxLabel ID="lbl_eid" runat="server" Font-Size="Medium" Text=""></dx:ASPxLabel>
					</div>
			

			
				<div class="col-sm-2">
				 <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Employee Name:" Font-Size="large" Font-Bold="true"></dx:ASPxLabel>
					</div>
			
				<div class="col-sm-3">
				 <dx:ASPxLabel ID="lbl_ename" runat="server" Font-Size="Medium" Text=""></dx:ASPxLabel>
					</div>
			</div>
            <div class="col-sm-12"> 
				<div class="col-sm-2">
				 <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="Employee Mail:" Font-Size="large" Font-Bold="true"></dx:ASPxLabel>
					</div>
			
				<div class="col-sm-3">
				 <dx:ASPxLabel ID="lbl_Emailid" runat="server" Text="" Font-Size="Medium"></dx:ASPxLabel>
					</div>
			

			
				<div class="col-sm-2">
				 <dx:ASPxLabel ID="ASPxLabel13" runat="server" Text="Complaint ID:" Font-Size="large" Font-Bold="true"></dx:ASPxLabel>
					</div>
			
				<div class="col-sm-3">
				 <dx:ASPxLabel ID="Com_ID" runat="server" Text="" Font-Size="Medium"></dx:ASPxLabel>
					</div>
			</div>
              <div class="col-sm-12"> 
					<div class="col-sm-2">
				 <dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="Asset Name:" Font-Size="large" Font-Bold="true"></dx:ASPxLabel>
					</div>
			
				<div class="col-sm-3">
				 <dx:ASPxLabel ID="asset_name" runat="server" Text="" Font-Size="Medium"></dx:ASPxLabel>
					</div>
			

			
				<div class="col-sm-2">
				 <dx:ASPxLabel ID="ASPxLabel15" runat="server" Text="Asset ID:" Font-Bold="true" Font-Size="large"></dx:ASPxLabel>
					</div>
			
				<div class="col-sm-3">
				 <dx:ASPxLabel ID="asset_id" runat="server" Text="" Font-Size="Medium"></dx:ASPxLabel>
					</div>
			</div>
            


			<div class="col-sm-12"> 
				<div class="col-sm-2">
				 <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Main Asset N0:" Font-Size="large" Font-Bold="true"></dx:ASPxLabel>
					</div>
			
				<div class="col-sm-3">
				 <dx:ASPxLabel ID="lbl_Mnum" runat="server" Text=""  Font-Size="Medium"></dx:ASPxLabel>
					</div>
			
				<div class="col-sm-2">
				 <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Sub Asset No:" Font-Size="large" Font-Bold="true"></dx:ASPxLabel>
					</div>
			
				<div class="col-sm-3">
				 <dx:ASPxLabel ID="lbl_Snum" runat="server" Text=""  Font-Size="Medium"></dx:ASPxLabel>
					</div>
			</div>
            	<div class="col-sm-12"> 
				<div class="col-sm-2">
				 <dx:ASPxLabel ID="ASPxLabel16" runat="server" Text="Service Type :" Font-Size="large" Font-Bold="true"></dx:ASPxLabel>
					</div>
			
				<div class="col-sm-3">
				 <dx:ASPxLabel ID="lbl_serv" runat="server" Text="" Font-Size="Medium"></dx:ASPxLabel>
					</div>
			
				<div class="col-sm-2">
				 <dx:ASPxLabel ID="ASPxLabel18" runat="server" Text="Status:" Font-Size="large" Font-Bold="true"></dx:ASPxLabel>
					</div>
			
				<div class="col-sm-3">
				 <dx:ASPxLabel ID="lbl_status" runat="server" Text="" Font-Size="Medium"></dx:ASPxLabel>
					</div>
			</div>



			<div class="col-sm-12"> 
				<div class="col-sm-2">
				 <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Created Date:"  Font-Size="large" Font-Bold="true"></dx:ASPxLabel>
					</div>
			<div class="col-sm-3">
				 <dx:ASPxLabel ID="lbl_Date" runat="server" Font-Size="Medium" Text=""></dx:ASPxLabel></div>

                <div class="col-sm-2">
				 <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Description" Font-Size="large" Font-Bold="true"></dx:ASPxLabel>
					</div>
			<div class="col-sm-3">
				 <dx:ASPxLabel ID="lbl_Description" runat="server" Font-Size="Medium" Text=""></dx:ASPxLabel></div>
				
			</div>
            <div class="clearfix"></div><br />
					<div class="col-sm-10">

                   <dx:ASPxGridView ID="ASPxGridView1" OnRowCommand="ASPxGridView1_RowCommand" runat="server" Width="80%" OnCustomUnboundColumnData="ASPxGridView1_CustomUnboundColumnData" AutoGenerateColumns="False" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" DataSourceID="SqlDataSource1" KeyFieldName="ComplaintID">
                       <Columns>
                           <dx:GridViewDataTextColumn FieldName="ComplaintID" VisibleIndex="0" Visible="false" ReadOnly="True" >
                               <EditFormSettings Visible="False" />
                           </dx:GridViewDataTextColumn>
                             <dx:GridViewDataTextColumn FieldName="ComplaintTransactionID" VisibleIndex="1" Visible="false"></dx:GridViewDataTextColumn>
                           <dx:GridViewDataTextColumn FieldName="ComplaintID" VisibleIndex="2"></dx:GridViewDataTextColumn>
                           <dx:GridViewDataTextColumn FieldName="FilePath" VisibleIndex="3">
                                <DataItemTemplate>
                    <asp:LinkButton ID="view" runat="server" CommandName="view" ForeColor="Green" Font-Bold="true" >View Document</asp:LinkButton>
                            </DataItemTemplate>
                           </dx:GridViewDataTextColumn>
                           
                       </Columns>
                     
                       <settingspager showdefaultimages="False">
                           <allbutton text="All">
                           </allbutton>
                           <nextpagebutton text="Next &gt;">
                           </nextpagebutton>
                           <prevpagebutton text="&lt; Prev">
                           </prevpagebutton>
                       </settingspager>
                       <images spritecssfilepath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                           <loadingpanelonstatusbar url="~/App_Themes/PlasticBlue/GridView/gvLoadingOnStatusBar.gif">
                           </loadingpanelonstatusbar>
                           <loadingpanel url="~/App_Themes/PlasticBlue/GridView/Loading.gif">
                           </loadingpanel>
                       </images>
                       <imagesfiltercontrol>
                           <loadingpanel url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                           </loadingpanel>
                       </imagesfiltercontrol>
                       <styles cssfilepath="~/App_Themes/PlasticBlue/{0}/styles.css" csspostfix="PlasticBlue">
                           <header imagespacing="10px" sortingimagespacing="10px">
                           </header>
                       </styles>
                       <styleseditors>
                           <calendarheader spacing="11px">
                           </calendarheader>
                           <progressbar height="25px">
                           </progressbar>
                       </styleseditors>
                   </dx:ASPxGridView>
			
			
			
						            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:InstemAMSConnectionString %>" SelectCommand="SELECT ComplaintRegistration.ComplaintID,ComplaintTransaction.ComplaintTransactionID, ComplaintCode, [FilePath] FROM [ComplaintRegistration] inner join ComplaintTransaction on ComplaintTransaction.ComplaintID=ComplaintRegistration.ComplaintID where ComplaintTransactionID=@ComplaintTransactionID">
                                        <SelectParameters>
                                            <asp:SessionParameter  Name="ComplaintTransactionID" SessionField="ComplaintTransactionID"/>
                                        </SelectParameters>
						            </asp:SqlDataSource>
							
						            <div class="clearfix"></div><br />
			</div>
               <div class="col-sm-12">
                <div class="col-sm-2">
                    <dx:ASPxLabel ID="ASPxLabel9" runat="server" Font-Size="large" Text="Assign to Engineer" Font-Bold="true"></dx:ASPxLabel>
                </div>
                <div class="col-sm-3">

                                      
                   <dx:ASPxGridLookup ID="cmb_jobDefect" runat="server"  AutoGenerateColumns="False"
                     DataSourceID="SqlDataSource2" IncrementalFilteringMode="Contains"  TextFormatString="{1}"
                     KeyFieldName="CustodianID"   Height="25px" Width="300px"
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                    <GridViewProperties>
                    <SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>
                    <Settings ShowFilterRow="True" />
                    <SettingsPager PageSize="6"></SettingsPager>
                    </GridViewProperties>
                    <Columns>
                        <dx:gridviewdatatextcolumn FieldName="CustodianID" Caption="EmployeeID" ReadOnly="True" 
                            VisibleIndex="0">
                            <EditFormSettings Visible="True" />
                        </dx:gridviewdatatextcolumn>                        
                          <dx:gridviewdatatextcolumn FieldName="CustodianName" Caption="EmployeeName" VisibleIndex="1">
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
                         <Header imageSpacing="10px" sortingImageSpacing="10px">
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
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:InstemAMSConnectionString %>" 
                    SelectCommand="SELECT Distinct CustodianMaster.CustodianName,RoleMaster.CustodianID from RoleMaster inner join CustodianMaster on CustodianMaster.CustodianID=RoleMaster.CustodianID where ROLE_NAME ='Engineer'"></asp:SqlDataSource>  
            
                        <%--<dx:ASPxComboBox ID="cmb_jobDefect" runat="server"  Width="300px" Height="25px" DataSourceID="cmbJobIdDB" ValueType="System.Int32" 
                    TextField="CustodianName" ValueField="CustodianID" TextFormatString="{1}" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                  <Columns>
                      <dx:ListBoxColumn  FieldName="CustodianID" Caption="EmployeeID"/>
                      <dx:ListBoxColumn FieldName="CustodianName" Caption="EmployeeName"/>
                  </Columns>
                </dx:ASPxComboBox>--%>

                </div>
            </div>
			 <div class="clearfix"></div><br />

			 <div class="col-sm-12">
                 
                 <div class="col-sm-2">
                     <dx:ASPxLabel ID="ASPxLabel7" runat="server" Font-Size="large" Text="Comments" Font-Bold="true"></dx:ASPxLabel>
                 </div>
                 <div class="col-sm-4">
                    <asp:TextBox ID="Memo_remarks" runat="server"  TextMode="Multiline" rows="3" columns="35"></asp:TextBox><br />
                   <%-- <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Send Request" OnClick="ASPxButton1_Click"></dx:ASPxButton><br />--%>
                </div>
                   <%--<div class="col-sm-8">
                     <dx:ASPxMemo ID="Memo_remarks" runat="server" Height="35px" Width="85px">
                       
                   <ValidationSettings   ValidationGroup="btn" ErrorTextPosition="Bottom">
						      <ErrorFrameStyle ImageSpacing="4px">
                                  <ErrorTextPaddings PaddingLeft="4px" />
                              </ErrorFrameStyle>
						<RequiredField ErrorText="Please Select the Division  " IsRequired="True" />
					</ValidationSettings>
                     </dx:ASPxMemo>
                 </div>--%>
             </div>
            	<%-- <div class="col-sm-12">
                 <div class="col-sm-2">
                     <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Assign to Technician" Font-Bold="true"></dx:ASPxLabel>
                 </div>
                 <div class="col-sm-3">
                     <dx:ASPxComboBox ID="cmb_tech"  AutoPostBack="True" runat="server" TextField="Name" ValueField="OfficeID" ValueType="System.String" Height ="25px"  Width="200px"  CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" DataSourceID="SqlDataSource2" >               
					<%--<LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                    </LoadingPanelImage>
                     <ValidationSettings   ValidationGroup="btn" ErrorTextPosition="Bottom">
						      <ErrorFrameStyle ImageSpacing="4px">
                                  <ErrorTextPaddings PaddingLeft="4px" />
                              </ErrorFrameStyle>
						<RequiredField ErrorText="Please Select the Technician  " IsRequired="True" />
					</ValidationSettings>
                </dx:ASPxComboBox>
                     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:InstemAMSConnectionString %>" SelectCommand="Select Name,OfficeTable.OfficeID from OfficeTable 
inner join LocationMaster on LocationMaster.LocationName=OfficeTable.Location
 where OfficeType='TECH' and LocationID=@LocationID">

                         <SelectParameters>
                             <asp:SessionParameter  SessionField="LocationID" Name="LocationID"/>
                         </SelectParameters>
                     </asp:SqlDataSource>
                 </div>
             </div>
			    --%>
			
<%--						            <div class="clearfix"></div><br />
                <dx:ASPxGridView ID="Grid_defect" runat="server" 
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue"  
        Width="796px" KeyFieldName="ComplaintID" Caption="DEFECTS   LIST" 
        AutoGenerateColumns="False">
        <Columns>
            <dx:GridViewDataColumn VisibleIndex="0">
                <DataItemTemplate>
                    <dx:ASPxCheckBox ID="Chkbox" runat="server" Checked="true"></dx:ASPxCheckBox>
                </DataItemTemplate>
            </dx:GridViewDataColumn>
            <dx:GridViewDataTextColumn FieldName="ComplaintCode" ReadOnly="True" VisibleIndex="1" Visible="false" >
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
                      <dx:GridViewDataTextColumn FieldName="ServiceTypeID" ReadOnly="True" VisibleIndex="2"  Visible="true">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TaskID" Visible="false" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TaskName" VisibleIndex="4" Caption="Task Name">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TaskType" VisibleIndex="5" Caption="Task Type">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TaskDescription" VisibleIndex="6" >
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Assign to Employee" VisibleIndex="7" Width="170">
         <DataItemTemplate>            
              <dx:ASPxComboBox ID="cmb_jobDefect" runat="server"  Width="170px" Height="25px" DataSourceID="cmbJobIdDB" ValueType="System.Int32" 
                    TextField="CustodianName" ValueField="CustodianID" TextFormatString="{1}" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                  <Columns>
                      <dx:ListBoxColumn  FieldName="CustodianID" Caption="EmployeeID"/>
                      <dx:ListBoxColumn FieldName="CustodianName" Caption="EmployeeName"/>
                  </Columns>
                </dx:ASPxComboBox>
             
             </DataItemTemplate>
                 </dx:GridViewDataTextColumn>
            <%--<dx:GridViewDataTextColumn FieldName="Assign" VisibleIndex="6">
         <DataItemTemplate>            
              
             <asp:LinkButton ID="AssignDefect" runat="server" CommandName="AssignDefect" Text="Assign">
             </asp:LinkButton>
             </DataItemTemplate>
                 </dx:GridViewDataTextColumn>--%>
  <%--      </Columns>
        <SettingsPager ShowDefaultImages="False" PageSize="100">
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
            <div class="clearfix"></div><br />
                <strong>
    <span class="auto-style59">
                <asp:SqlDataSource ID="cmbJobIdDB" runat="server" ConnectionString="<%$ ConnectionStrings:InstemAMSConnectionString %>" 
                    SelectCommand="SELECT  CustodianID ,CustodianName FROM  CustodianMaster"></asp:SqlDataSource>
     
    
     
                </span>
</strong>--%>
             <div class="clearfix"></div><br />

			 <div class="col-sm-12">
                
                <div class="col-sm-2">
                     <dx:ASPxButton ID="btn_save" runat="server" CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange"  Text="Assign" Width="100px" Onclick="btn_save_Click" ValidationGroup="btn" 
                    SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css"  >
                </dx:ASPxButton>
                
                </div>
				  <%--<div class="col-sm-2">
                     <dx:ASPxButton ID="btn_reject" runat="server" Text="Reject" Width="100px" Onclick="btn_reject_Click" ValidationGroup="btn"  CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                    SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css"  >
                </dx:ASPxButton>
                
                </div>--%>
                  <div class="col-sm-2">
                     <dx:ASPxButton ID="btn_back" runat="server" Text="Go Back" Width="100px"  OnClick="btn_back_Click" ValidationGroup="btn"  CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange"  
                    SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css"  >
                </dx:ASPxButton>
                
                </div>
            </div>
			</div>
		  </div>
</asp:Content>

