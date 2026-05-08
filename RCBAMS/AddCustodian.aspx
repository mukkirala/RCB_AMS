<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AddCustodian.aspx.cs" Inherits="AddCustodian" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxMenu" tagprefix="dx1" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxLoadingPanel" Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

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
           .style5
    {
            width: 120px;
            color: red;
    }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <ContentTemplate>
      <h3><strong><span>Add Employee</span></strong></h3>
        <div style="">
           <div class="col-sm-12">
           <dx:ASPxLabel ID="errormsg" runat="server" Text="" Visibl="false" ForeColor="Red" Font-Size="Large"></dx:ASPxLabel>
                 </div>
            </div>
            <hr />
            <br /><br />
            <div class="col-sm-12">
                 <div class="row form_div">
                        <div class="col-sm-2 ">
                    <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Employee ID" Font-Bold="true" Font-Size="Large"></dx:ASPxLabel><span class="style5">*</span>
                </div>
                             <div class="col-sm-4">
                      <dx:ASPxTextBox ID="EmpID" runat="server" Height="25px" Width="300px" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                    <ValidationSettings>
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
                </dx:ASPxTextBox>
               
             </div>
                <div class="col-sm-2 ">
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Employee Name" Font-Bold="true" Font-Size="Large"></dx:ASPxLabel><span class="style5">*</span>
                </div>
                             <div class="col-sm-4">
                      <dx:ASPxTextBox ID="EmpName" runat="server" Height="25px" Width="300px" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                    <ValidationSettings>
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
                </dx:ASPxTextBox>                
             </div>
          </div>
            </div>
         <div class="col-sm-12">
<div class="row form_div">
                    <div class="col-sm-2">
         <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Phone No" Font-Bold="true" Font-Size="Large"></dx:ASPxLabel><span class="style5">*</span>
     </div>
                    <div class="col-sm-4">
         <dx:ASPxTextBox ID="PhnNo" runat="server" Height="25px" Width="300px" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" ClientInstanceName="client_txt_mobile" MaxLength="10">
       <ValidationSettings>
           <ErrorFrameStyle ImageSpacing="4px">
               <ErrorTextPaddings PaddingLeft="4px" />
           </ErrorFrameStyle>
       </ValidationSettings>
   </dx:ASPxTextBox>                
</div>
                    <div class="col-sm-2 ">
       <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Email-ID" Font-Bold="true" Font-Size="Large"></dx:ASPxLabel>
                        <%--<span class="style5">*</span>--%>
   </div>
                <div class="col-sm-4">
         <dx:ASPxTextBox ID="empmail" runat="server" Height="25px" Width="300px" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
       <ValidationSettings>
           <ErrorFrameStyle ImageSpacing="4px">
               <ErrorTextPaddings PaddingLeft="4px" />
           </ErrorFrameStyle>
       </ValidationSettings>
   </dx:ASPxTextBox>
   
</div>
    </div>
             </div>
            <div class="col-sm-12">
                  <div class="row form_div">
                <div class="col-sm-2">
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Department" Font-Bold="true" Font-Size="Large"></dx:ASPxLabel><span class="style5">*</span>
                </div>
                <div class="col-sm-4">
                     <dx:ASPxGridLookup ID="ASPxComboBox1" runat="server"
                    AutoGenerateColumns="False" DataSourceID="DeptSqlDataSource" TextFormatString="{1}" Width="300px" Height="25px" valueField="DepartmentCode" KeyFieldName="DepartmentCode"
                   IncrementalFilteringMode="Contains"  CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                           <GridViewProperties>
                        <%--<SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>--%>

                      <Settings  ShowFilterRow="true"></Settings>
                    </GridViewProperties>
                          <Columns>
                        <dx:GridViewDataTextColumn FieldName="DepartmentCode"  VisibleIndex="0" Visible="false">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="DepartmentName" VisibleIndex="1" >
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
                    <%--<div class="col-sm-2">
                    <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Reporting Authority" Font-Bold="true" Font-Size="Large"></dx:ASPxLabel><span class="style5">*</span>
                </div>
                  <div class="col-sm-4">
                     <dx:ASPxGridLookup ID="report_txt" runat="server"
                    AutoGenerateColumns="False" DataSourceID="sqldataAuthority" TextFormatString="{1}" Width="300" Height="25px" KeyFieldName="CustodianID"
                   IncrementalFilteringMode="Contains"  CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                           <GridViewProperties>
                        <%--<SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>--%>

                      <%--<Settings  ShowFilterRow="true"></Settings>
                    </GridViewProperties>
                          <Columns>
                        <dx:GridViewDataTextColumn FieldName="CustodianID"  VisibleIndex="0"  Caption="EmployeeID">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="CustodianName" VisibleIndex="1"  Caption="EmployeeName">
                        </dx:GridViewDataTextColumn>
                               <dx:GridViewDataTextColumn FieldName="Designation" VisibleIndex="2" >
                        </dx:GridViewDataTextColumn>--%>
                                           
                    <%--</Columns>
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
                </div>--%>
                                  <div class="col-sm-2 ">
       <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Designation" Font-Bold="true" Font-Size="Large"></dx:ASPxLabel>
   </div>
                <div class="col-sm-4">
         <dx:ASPxTextBox ID="txt_Designation" runat="server" Height="25px" Width="300" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
       <ValidationSettings>
           <ErrorFrameStyle ImageSpacing="4px">
               <ErrorTextPaddings PaddingLeft="4px" />
           </ErrorFrameStyle>
       </ValidationSettings>
   </dx:ASPxTextBox>
   
</div>
                     </div>
            </div>
                            
      <br /><br />
        <div class="col-sm-12">
                  <div class="row form_div">
                         <div class="col-sm-2 ">
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Login ID" Font-Bold="true" Font-Size="Large"></dx:ASPxLabel><span class="style5">*</span>
                </div>
                             <div class="col-sm-4">
                      <dx:ASPxTextBox ID="txt_LDAP" runat="server" Height="25px" Width="300" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                    <ValidationSettings>
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
                </dx:ASPxTextBox>
                
             </div>
                             <%--<div class="col-sm-2 ">
                    <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Internal Number" Font-Bold="true" Font-Size="Large"></dx:ASPxLabel><span class="style5">*</span>
                </div>
                             <div class="col-sm-4">
                      <dx:ASPxTextBox ID="txt_INT" runat="server" Height="25px" Width="300px" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                    <ValidationSettings>
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
                </dx:ASPxTextBox>
                
             </div>--%>
                                  <div class="col-sm-2 ">
       <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Password"  Font-Bold="true" Font-Size="Large"></dx:ASPxLabel><span class="style5">*</span>
   </div>
                <div class="col-sm-4">
         <dx:ASPxTextBox ID="txt_pwd" runat="server"  Height="25px" Width="300" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
       <ValidationSettings>
           <ErrorFrameStyle ImageSpacing="4px">
               <ErrorTextPaddings PaddingLeft="4px" />
           </ErrorFrameStyle>
       </ValidationSettings>
   </dx:ASPxTextBox>
   
</div>
                     </div>
            </div>
      <br /><br />
  <div class="col-sm-12">
            <div class="row form_div">                   
                       <div class="col-sm-2 ">
              <dx:ASPxLabel ID="txt_conpwd1" runat="server" Text="Confirm Password" Font-Bold="true" Font-Size="Large"></dx:ASPxLabel><span class="style5">*</span>
          </div>
                       <div class="col-sm-4">
                <dx:ASPxTextBox ID="txt_conpwd" runat="server" Height="25px" Width="300px" CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
              <ValidationSettings>
                  <ErrorFrameStyle ImageSpacing="4px">
                      <ErrorTextPaddings PaddingLeft="4px" />
                  </ErrorFrameStyle>
              </ValidationSettings>
          </dx:ASPxTextBox>
          
       </div>
                         <div class="col-sm-2">
         <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Address" Font-Bold="true" Font-Size="Large"></dx:ASPxLabel><span class="style5">*</span>
     </div>
                    <div class="col-sm-4">
<asp:TextBox ID="Adress" runat="server" CssClass="textarea" TextMode="MultiLine" Rows="2" Columns="40" ></asp:TextBox>      

     <ValidationSettings>
     <ErrorFrameStyle ImageSpacing="4px">
         <ErrorTextPaddings PaddingLeft="4px" />
     </ErrorFrameStyle>
 </ValidationSettings>
 </div>     
               </div>
      </div>
              <br /><br />
              <div class="col-sm-12"><br /><br /></div>
              
             <div class="col-sm-12">
                 <div class="row">
                     <div class="col-sm-4">
                    <dx:ASPxButton ID="ASPxButton1" runat="server" Text="ADD" OnClick="ASPxButton1_Click" Width="150px" CssPostfix="SoftOrange" CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css"> 
                        </dx:ASPxButton><br />
                   </div>
                   </div>
                 </div>
         <div class="col-sm-12">
                 <div class="row">
                     <div class="col-sm-2">
      <dx:ASPxButton ID="btn_Update" runat="server" Text="Update" Width="100px" 
                    Height="25px" CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css"
                  OnClick="btn_Update_Click" Visible="false">
                </dx:ASPxButton>
                         </div>
                      <div class="col-sm-2">
      <dx:ASPxButton ID="ASPxButton2" runat="server" Text="Cancel" Width="100px" 
                    Height="25px" CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css"
                  OnClick="btn_Cancel_Click" Visible="false">
                </dx:ASPxButton>
                         </div>
                   </div>
                 </div>
            <div class="clearfix"></div>

      <div class="table-responsive" style="padding:10px" ></div>

     <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumnsASPxGridView1="False" OnRowCommand="ASPxGridView1_RowCommand"
          style="width:100%" 
        DataSourceID="SqlDataSource3" KeyFieldName="CustodianID" 
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
        CssPostfix="PlasticBlue" AutoGenerateColumns="False">
         <Columns>
               <dx:GridViewDataTextColumn FieldName="Edit" VisibleIndex="0" Width="5%" >
                <DataItemTemplate>
                    <asp:LinkButton ID="lnkbtn_edit" runat="server" Text="Edit" CommandName="Edit" ForeColor="Green"></asp:LinkButton>
                    </DataItemTemplate>
                
            </dx:GridViewDataTextColumn>  
                          <dx:GridViewDataTextColumn FieldName="Delete" VisibleIndex="0" Width="5%">
                <DataItemTemplate>
                    <asp:LinkButton ID="Link_delete" runat="server" Text="Delete" CommandName="Delete" ForeColor="Red"></asp:LinkButton>
                </DataItemTemplate>
                
            </dx:GridViewDataTextColumn>  
            <dx:GridViewDataTextColumn FieldName="CustodianID" ReadOnly="True" VisibleIndex="1" Caption="Employee ID" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            
            <dx:GridViewDataTextColumn FieldName="DepartmentName"  VisibleIndex="5" Caption=" Department">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
                  
            <dx:GridViewDataTextColumn FieldName="CustodianName" VisibleIndex="2" Caption="Employee Name" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn FieldName="PhoneNo" VisibleIndex="3" Caption="PhoneNo" >
    <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Designation" VisibleIndex="6" Caption="Designation" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <%--<dx:GridViewDataTextColumn FieldName="reporting_staff_no" VisibleIndex="5" Caption="Reporting Authority id" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>--%>
            <dx:GridViewDataTextColumn FieldName="email" VisibleIndex="4" Caption="Email ID" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
               <dx:GridViewDataTextColumn FieldName="LDAP_USERID" VisibleIndex="7" Caption="LDAP-USERNAME" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="LDAP_PWD" VisibleIndex="8" Caption="Password" Visible ="False">
    <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Address" VisibleIndex="9" Caption="Address" >
    <Settings AutoFilterCondition="Contains" />
</dx:GridViewDataTextColumn>
               <%--<dx:GridViewDataTextColumn FieldName="InternalNumber" VisibleIndex="6" Caption="Internal Number" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>--%>
             <dx:GridViewDataTextColumn FieldName="CustodianStatus" VisibleIndex="10" Caption="Status" >
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="CreateDate" VisibleIndex="11" Caption="Created Date" PropertiesTextEdit-DisplayFormatString="dd-MM-yyyy">
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
         <SettingsPager PageSize="25"></SettingsPager>
        <Settings  ShowFooter="true" ShowFilterRow="true"/>
        <TotalSummary>
        <dx:ASPxSummaryItem FieldName="CustodianID" SummaryType="Count" />
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
            <div class="clearfix"></div>
          <asp:SqlDataSource ID="DeptSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ASSETManagementConnectionString %>" 
        SelectCommand="SELECT [DepartmentCode], [DepartmentName] FROM [vDepartmentAssetApp]">
    </asp:SqlDataSource>
          <asp:SqlDataSource ID="sqldataDesignation" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ASSETManagementConnectionString %>" 
        SelectCommand="SELECT [DepartmentCode], [DepartmentName] FROM [vDepartmentAssetApp]">
    </asp:SqlDataSource>
         <%-- <asp:SqlDataSource ID="sqldataAuthority" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ASSETManagementConnectionString %>" 
        SelectCommand="SELECT [CustodianID], [Designation], [reporting_staff_no] FROM [vEmpDtlsAssetApp]">
    </asp:SqlDataSource>--%>

       <asp:SqlDataSource ID="sqldataAuthority" runat="server" 
        ConnectionString="<%$ ConnectionStrings:InstemAMSConnectionString %>" 
        SelectCommand="SELECT [CustodianID],CustodianName, [Designation] FROM CustodianMaster">
    </asp:SqlDataSource>
      <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:InstemAMSConnectionString %>" 
        SelectCommand="SELECT *,DepartmentMaster.DepartmentName from CustodianMaster
inner join DepartmentMaster on DepartmentMaster.DepartmentCode=CustodianMaster.CustodianDepartmentCode
 Where CustodianStatus='Active' ">
           </asp:SqlDataSource>
      </ContentTemplate>
</asp:Content>

