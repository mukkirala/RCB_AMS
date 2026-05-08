<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AdminAssignedGEPendingComplaints.aspx.cs" Inherits="AdminAssignedGEPendingComplaints" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" Runat="Server">
         <style type="text/css">
    .auto-style1 {
        font-size: medium;
    }
        .auto-style2 {
            width: 141px;
        }
        .auto-style3 {
            width: 36px;
        }


        .auto-style4 {
            width: 192px;
        }
        .auto-style5 {
            width: 186px;
        }
        .auto-style59 {
            color: #333333;
            font-size: medium;
        }
        .auto-style60 {
            width: 47%;
        }
        .auto-style62 {
            width: 216px;
        }
        .style1
        {
            font-size: medium;
            color: #000000;
        }
        .style2
        {
            width: 173px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
               <div class="container">
                   <div class="col-sm-12">
             <dx:ASPxLabel ID="lbl_msg" runat="server" ForeColor="Red" Text=""></dx:ASPxLabel>
                </div>
        <div class=" row cnt_div">        
            	<div class="col-sm-12">
             <h4>  <strong>Complaint Resolution</strong></h4>
                    </div>
			            <div class="clearfix"></div><br />

			<div class="col-sm-12"> 
				<div class="col-sm-2">
				 <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Employee ID:" Font-Bold="true"></dx:ASPxLabel>
					</div>
			
				<div class="col-sm-3">
				 <dx:ASPxLabel ID="lbl_eid" runat="server" Text=""></dx:ASPxLabel>
					</div>
			

			
				<div class="col-sm-2">
				 <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Employee Name:" Font-Bold="true"></dx:ASPxLabel>
					</div>
			
				<div class="col-sm-3">
				 <dx:ASPxLabel ID="lbl_ename" runat="server" Text=""></dx:ASPxLabel>
					</div>
			</div>
            <div class="col-sm-12"> 
				<div class="col-sm-2">
				 <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="Employee Mail:" Font-Bold="true"></dx:ASPxLabel>
					</div>
			
				<div class="col-sm-3">
				 <dx:ASPxLabel ID="lbl_Emailid" runat="server" Text=""></dx:ASPxLabel>
					</div>
			

			
				<div class="col-sm-2">
				 <dx:ASPxLabel ID="ASPxLabel13" runat="server" Text="Complaint ID:" Font-Bold="true"></dx:ASPxLabel>
					</div>
			
				<div class="col-sm-3">
				 <dx:ASPxLabel ID="Com_ID" runat="server" Text=""></dx:ASPxLabel>
					</div>
			</div>
              <div class="col-sm-12"> 
					<div class="col-sm-2">
				 <dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="Asset Name:" Font-Bold="true"></dx:ASPxLabel>
					</div>
			
				<div class="col-sm-3">
				 <dx:ASPxLabel ID="asset_name" runat="server" Text=""></dx:ASPxLabel>
					</div>
			

			
				<div class="col-sm-2">
				 <dx:ASPxLabel ID="ASPxLabel15" runat="server" Text="Asset ID:" Font-Bold="true"></dx:ASPxLabel>
					</div>
			
				<div class="col-sm-3">
				 <dx:ASPxLabel ID="asset_id" runat="server" Text=""></dx:ASPxLabel>
					</div>
			</div>
            


			<div class="col-sm-12"> 
				<div class="col-sm-2">
				 <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Main Asset N0:" Font-Bold="true"></dx:ASPxLabel>
					</div>
			
				<div class="col-sm-3">
				 <dx:ASPxLabel ID="lbl_Mnum" runat="server" Text=""></dx:ASPxLabel>
					</div>
			
				<div class="col-sm-2">
				 <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Sub Asset No:" Font-Bold="true"></dx:ASPxLabel>
					</div>
			
				<div class="col-sm-3">
				 <dx:ASPxLabel ID="lbl_Snum" runat="server" Text=""></dx:ASPxLabel>
					</div>
			</div>
            	<div class="col-sm-12"> 
				<div class="col-sm-2">
				 <dx:ASPxLabel ID="ASPxLabel16" runat="server" Text="Service Type :" Font-Bold="true"></dx:ASPxLabel>
					</div>
			
				<div class="col-sm-3">
				 <dx:ASPxLabel ID="lbl_serv" runat="server" Text=""></dx:ASPxLabel>
					</div>
			
				<div class="col-sm-2">
				 <dx:ASPxLabel ID="ASPxLabel18" runat="server" Text="Status:" Font-Bold="true"></dx:ASPxLabel>
					</div>
			
				<div class="col-sm-3">
				 <dx:ASPxLabel ID="lbl_status" runat="server" Text=""></dx:ASPxLabel>
					</div>
			</div>



			<div class="col-sm-12"> 
				<div class="col-sm-2">
				 <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Created Date:" Font-Bold="true"></dx:ASPxLabel>
					</div>
			<div class="col-sm-3">
				 <dx:ASPxLabel ID="lbl_Date" runat="server" Text=""></dx:ASPxLabel></div>

                <div class="col-sm-2">
				 <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Description" Font-Bold="true"></dx:ASPxLabel>
					</div>
			<div class="col-sm-3">
				 <dx:ASPxLabel ID="lbl_Description" runat="server" Text=""></dx:ASPxLabel></div>
				
			</div>
            <div class="clearfix"></div><br />
					<%--<div class="col-sm-10">

                   <dx:ASPxGridView ID="ASPxGridView1" OnRowCommand="ASPxGridView1_RowCommand" runat="server" Width="100%" OnCustomUnboundColumnData="ASPxGridView1_CustomUnboundColumnData" AutoGenerateColumns="False" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" DataSourceID="SqlDataSource1" KeyFieldName="ComplaintID">
                       <Columns>
                           <dx:GridViewDataTextColumn FieldName="ComplaintID" VisibleIndex="0" Visible="false" ReadOnly="True" >
                               <EditFormSettings Visible="False" />
                           </dx:GridViewDataTextColumn>
                             <dx:GridViewDataTextColumn FieldName="ComplaintCode" VisibleIndex="1"></dx:GridViewDataTextColumn>
                           <dx:GridViewDataTextColumn FieldName="FilePath" VisibleIndex="1">
                                <DataItemTemplate>
                    <asp:LinkButton ID="view" runat="server" CommandName="view">View Document</asp:LinkButton>
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
			
			
			
						            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MESConnectionString %>" SelectCommand="SELECT [ComplaintID],ComplaintCode, [FilePath] FROM [ComplaintRegistration] where ComplaintID=@ComplaintID ">
                                        <SelectParameters>
                                            <asp:SessionParameter  Name="ComplaintID" SessionField="ComplaintID"/>
                                        </SelectParameters>
						            </asp:SqlDataSource>
			
			
			
						            <div class="clearfix"></div><br />


			</div>--%>
			
			 <div class="col-sm-12">
                 <div class="col-sm-2">
                     <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Comments" Font-Bold="true"></dx:ASPxLabel><span style="color:red">*</span>
                 </div>
              <div class="col-sm-4">
                    <asp:TextBox ID="Memo_remarks" runat="server"  TextMode="Multiline" rows="3" columns="35"></asp:TextBox>
                   <%-- <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Send Request" OnClick="ASPxButton1_Click"></dx:ASPxButton><br />--%>
                </div>
             </div>
            <div class="col-sm-12">
                <div class="col-sm-2">
                    <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Status" Font-Bold="true"></dx:ASPxLabel><span style="color:red">*</span>
                </div>
                <div class="col-sm-3">
                     <dx:ASPxComboBox ID="cmb_status" runat="server" ValueType="System.String" Height ="25px" Width="200px"  CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">                     
                      </dx:ASPxComboBox>


                </div>
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
                     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MESConnectionString %>" SelectCommand="Select Name,OfficeTable.OfficeID from OfficeTable 
inner join LocationMaster on LocationMaster.LocationName=OfficeTable.Location
 where OfficeType='TECH' and LocationID=@LocationID">

                         <SelectParameters>
                             <asp:SessionParameter  SessionField="LocationID" Name="LocationID"/>
                         </SelectParameters>
                     </asp:SqlDataSource>
                 </div>
             </div>
			    --%>
			
						            <div class="clearfix"></div><br />

			 <div class="col-sm-12">
                
                <div class="col-sm-2">
                     <dx:ASPxButton ID="btn_save" runat="server" Text="Submit" Width="100px" Onclick="btn_save_Click" ValidationGroup="btn"  CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                    SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css"  >
                </dx:ASPxButton>
                
                </div>
				  <%--<div class="col-sm-2">
                     <dx:ASPxButton ID="btn_reject" runat="server" Text="Reject" Width="100px" Onclick="btn_reject_Click" ValidationGroup="btn"  CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                    SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css"  >
                </dx:ASPxButton>
                
                </div>--%>
                    <div class="col-sm-2">
                     <dx:ASPxButton ID="btn_back" runat="server" Text="Go Back" Width="100px"  OnClick="btn_back_Click" ValidationGroup="btn"  CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                    SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css"  >
                </dx:ASPxButton>
                
                </div>
                 <SelectParameters>
        <asp:SessionParameter Name="ComplaintID" SessionField="ComplaintID" />
        </SelectParameters>
            </div>
			</div>
		  </div>       
         <SelectParameters>
               <asp:SessionParameter Name="EmployeeID" SessionField="UserID" />
                        </SelectParameters>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

