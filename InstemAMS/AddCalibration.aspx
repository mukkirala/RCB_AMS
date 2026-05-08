<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.master" AutoEventWireup="true" CodeFile="AddCalibration.aspx.cs" Inherits="AddCalibration" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridLookup" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register TagPrefix="dxlp" Namespace="DevExpress.Web.ASPxLoadingPanel" Assembly="DevExpress.Web.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .auto-style7 {
            width: 227px;
        }
        .auto-style9 {
            width: 219px;
        }
    .auto-style10 {
        width: 227px;
        height: 40px;
    }
    .auto-style11 {
            width: 161px;
            height: 40px;
        }
    .auto-style12 {
            width: 219px;
            height: 40px;
        }
    .auto-style13 {
            height: 40px;
            width: 767px;
        }
    .auto-style14 {
        width: 227px;
        height: 57px;
    }
    .auto-style15 {
        width: 161px;
        height: 57px;
    }
    .auto-style16 {
        width: 219px;
        height: 57px;
    }
    .auto-style17 {
        height: 57px;
            width: 767px;
        }
    .auto-style18 {
        height: 47px;
    }
    .auto-style19 {
        width: 227px;
        height: 35px;
    }
    .auto-style20 {
        width: 161px;
        height: 35px;
    }
    .auto-style21 {
        width: 219px;
        height: 35px;
    }
    .auto-style22 {
        height: 35px;
            width: 767px;
        }
        .auto-style23 {
            width: 767px;
        }
        .auto-style24 {
            width: 161px;
        }
    .auto-style25 {
        width: 225px;
    }
    .auto-style26 {
        width: 225px;
        height: 40px;
    }
    .auto-style27 {
        width: 225px;
        height: 57px;
    }
    .auto-style28 {
        width: 225px;
        height: 35px;
    }
        .auto-style30 {
            height: 40px;
        }
        .auto-style31 {
            height: 57px;
        }
        .auto-style32 {
            height: 35px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table class="nav-justified">
        <tr>
            <td class="auto-style7">&nbsp;</td>
            <td class="auto-style24">&nbsp;</td>
            <td>&nbsp;</td>
            <td class="auto-style9">&nbsp;</td>
            <td class="auto-style25">&nbsp;</td>
            <td class="auto-style23">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="6"><strong><span style="font-size:20px; font-display:block"> Add Schedule To Perform Calibration</span></strong></td>
        </tr>
        <tr>
            <td class="auto-style7">
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Select Instrument">
                </dx:ASPxLabel><span style="color:red">*</span>
            </td>
            <td class="auto-style24">
                 <dx:ASPxGridLookup ID="gridlkup_instrument" runat="server"  AutoGenerateColumns="False"
                      IncrementalFilteringMode="Contains" AutoPostBack="True" 
                     ontextchanged="gridlkup_instrument_TextChanged"  DataSourceID="DS_Instrument" KeyFieldName="InstrumentID">
<GridViewProperties>
<SettingsBehavior AllowFocusedRow="True" AllowSelectSingleRowOnly="True"></SettingsBehavior>
    <Settings ShowFilterRow="True" />
</GridViewProperties>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="InstrumentID"  ReadOnly="True" VisibleIndex="0">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="Description" VisibleIndex="1" Caption="Instrument Name">
                        </dx:GridViewDataTextColumn>
                       
                    </Columns>
                     <ClientSideEvents RowClick="function(s, e) { lpanel.Show(); e.processOnServer = true;}" />
                </dx:ASPxGridLookup>
                 <asp:SqlDataSource ID="DS_Instrument" runat="server" ConnectionString="<%$ ConnectionStrings:INSConnectionString %>" SelectCommand="SELECT dbo.InstrumentMaster.InstrumentID, dbo.InstrumentMaster.Description FROM dbo.InstrumentMaster where Status='Available'"></asp:SqlDataSource>
             </td>
            <td>
                 &nbsp;</td>
            <td class="auto-style9">&nbsp;</td>
            <td class="auto-style25">&nbsp;</td>
            <td class="auto-style23">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="6"><strong>Instrument Details</strong></td>
        </tr>
        <tr>
            <td class="auto-style10">Instrument Name :</td>
            <td class="auto-style11">
                <strong>
                <dx:ASPxLabel ID="lbl_name" runat="server" Text="" Font-Bold="true">
                </dx:ASPxLabel>
                </strong>
            </td>
            <td class="auto-style30">
                &nbsp;</td>
            <td class="auto-style12">Manufacturer :</td>
            <td class="auto-style26"><strong>
                <dx:ASPxLabel ID="lbl_manufacturer" runat="server" Text="" Font-Bold="true">
                </dx:ASPxLabel>
                </strong></td>
            <td class="auto-style13">
                
            </td>
        </tr>
        <tr>
            <td class="auto-style10">Serial No :</td>
            <td class="auto-style11">
                <strong>
                <dx:ASPxLabel ID="lbl_serial" runat="server" Text="" Font-Bold="true">
                </dx:ASPxLabel>
                </strong>
            </td>
            <td class="auto-style30">
                &nbsp;</td>
            <td class="auto-style12">Model No :</td>
            <td class="auto-style26">
                <dx:ASPxLabel ID="lbl_modelno" runat="server" Text="" Font-Bold="true">
                </dx:ASPxLabel>
            </td>
            <td class="auto-style13">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style14">Location :</td>
            <td class="auto-style15">
                <dx:ASPxLabel ID="lbl_location" runat="server" Text="" Font-Bold="true">
                </dx:ASPxLabel>
            </td>
            <td class="auto-style31">
                &nbsp;</td>
            <td class="auto-style16">Last Calibration Date :</td>
            <td class="auto-style27">
                <dx:ASPxLabel ID="lbl_calibration" runat="server" Text="" Font-Bold="true">
                </dx:ASPxLabel>
            </td>
            <td class="auto-style17">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="6" class="auto-style18"><strong>Add Services</strong></td>
        </tr>
        <tr>
            <td class="auto-style19">Next Calibration&nbsp; :</td>
            <td class="auto-style20">
              
                   <dx:ASPxRadioButtonList ID="RadioBtnLst_calibration" runat="server" AutoPostBack="True" 
                     Border-BorderStyle="None"  
                     OnSelectedIndexChanged="RadioBtnLst_calibration_SelectedIndexChanged" Width="200px" 
                     CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" 
                     SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" 
                     Height="50px" RepeatDirection="Horizontal" CssClass="Glass">
                    
                    <Items>
                        <dx:ListEditItem Text="Days" Value="0" />
                        <dx:ListEditItem Text="Months" Value="1" />
                        <%--<dx:ListEditItem Text="Date" Value="2" />--%>
                    </Items>
                    
                </dx:ASPxRadioButtonList>
                 
            </td>
            <td class="auto-style32">
              
                   &nbsp;</td>
            <td class="auto-style21">
                
                <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Schedule Name"></dx:ASPxLabel>
             &nbsp;:</td>
            <td class="auto-style28">
                
                <strong>
                 
                <dx:ASPxTextBox ID="txt_schedulename" runat="server" Width="170px" 
                     CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                     SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" >
                    
                    <ValidationSettings>
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
                </dx:ASPxTextBox>
                                 
                 
    
                </strong>
                                 
                 
    
             </td>
            <td class="auto-style22">
                 
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7">
                
                <dx:ASPxLabel ID="lbl_days" runat="server" Text="No of Days" Visible="false">
                                    </dx:ASPxLabel>                    
               
                <br />
               
                <dx:ASPxLabel ID="lbl_months" runat="server" Text="No of Months" Visible="false"> 
                            </dx:ASPxLabel>
               
                </td>
            <td class="auto-style24">
                        
                <dx:ASPxTextBox ID="txt_days" runat="server" Width="170px"  AutoPostBack="true"
                     CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                     SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css"  Visible="false" OnTextChanged="txt_days_TextChanged">
                    
                    <ValidationSettings>
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
                </dx:ASPxTextBox>
                                 
    
                <br />
        
                <dx:ASPxTextBox ID="txt_months" runat="server" Width="170px"  AutoPostBack="true"
                     CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                     SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css"  Visible="false" OnTextChanged="txt_months_TextChanged">
                    
                    <ValidationSettings>
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
                </dx:ASPxTextBox>
            
             
            </td>
            <td>
                        
                &nbsp;</td>
            <td class="auto-style9">
                 <dx:ASPxLabel ID="lbl_next" runat="server" Text="Next Calibration date" Font-Bold="true" Visible="false">
                </dx:ASPxLabel>
               </td>
            <td class="auto-style25">
                
                <dx:ASPxLabel ID="lbl_nextcalibration" runat="server" Text="" Font-Bold="true" Visible="false">
                </dx:ASPxLabel>
                </td>
            <td class="auto-style23">
                 
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7"><dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Schedule Criteria">
                </dx:ASPxLabel>
             &nbsp;<span class="style30"><span style="color:red">*</span></span></td>
            <td class="auto-style24">
         
                <dx:ASPxRadioButtonList ID="RadioBtnLst" runat="server" AutoPostBack="True" 
                     Border-BorderStyle="None"  
                     OnSelectedIndexChanged="RadioBtnLst_SelectedIndexChanged" Width="286px" 
                     CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" 
                     SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css" 
                     Height="50px" RepeatDirection="Horizontal" CssClass="Glass">
                    
                    <Items>
                        <dx:ListEditItem Text="Meter Reading" Value="0" />
                        <dx:ListEditItem Text="Running hours" Value="1" />
                        <dx:ListEditItem Text="Date" Value="2" />
                    </Items>
                    
                </dx:ASPxRadioButtonList>
                 
                 </td>
            <td>
         
                &nbsp;</td>
            <td class="auto-style9">
                
                <dx:ASPxLabel ID="lbl_meter" runat="server" Text="MeterReading" Visible="false">
                                    </dx:ASPxLabel>                    
               <br />
                <dx:ASPxLabel ID="lbl_dueDate" runat="server" Text="Schedule Date" Visible="false"> 
                            </dx:ASPxLabel>
                <br />
                 <dx:ASPxLabel ID="lbl_hour" runat="server" Text="Schedule Hours" Visible="false"> 
                            </dx:ASPxLabel>
             </td>
            <td class="auto-style25">
                
                <strong>
                 
                <dx:ASPxTextBox ID="txt_meter" runat="server" Width="170px" Visible="false" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                    <ValidationSettings>
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
                </dx:ASPxTextBox>
                                 
                 
    
                </strong>
                                 
                 
    
                <dx:ASPxDateEdit ID="date_dueDate" runat="server" Visible="False" Width="377px" Height="16px">
                </dx:ASPxDateEdit>
                
                 
    
<dx:ASPxTimeEdit ID="time_dueHours" runat="server" EditFormatString="HH:mm:ss" Visible="False" EditFormat="Custom" Height="16px" Width="606px" >
</dx:ASPxTimeEdit>

             </td>
            <td class="auto-style23">
                 
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7"><dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Description">
                </dx:ASPxLabel>
                 
             </td>
            <td class="auto-style24">
                 
                <dx:ASPxMemo ID="memo_desc" runat="server" Height="35px" Width="170px">
                </dx:ASPxMemo>
                
             </td>
            <td>
                 
                &nbsp;</td>
            <td class="auto-style9">&nbsp;</td>
            <td class="auto-style25">&nbsp;</td>
            <td class="auto-style23">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7">&nbsp;</td>
            <td class="auto-style24">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="auto-style9">&nbsp;</td>
            <td class="auto-style25">&nbsp;</td>
            <td class="auto-style23">
                &nbsp;</td>
        </tr>
    </table>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
             <ContentTemplate>
                 <dx:ASPxLabel ID="lbl_taskerror" runat="server" 
                     style="color: #FF0000; font-weight: 700">
                 </dx:ASPxLabel>
                 <br />
                 <span class="auto-style35"><strong>Add Task</strong></span>
                 <table border="1" class="auto-style1" style="width:720px">
                     <tr style="border:medium;text-align:center">
                         <td bgcolor="#A8CCD7" class="auto-style57">
                             <span style="color:black; text-align:center">Task Name</span></td>
                         <td bgcolor="#A8CCD7" class="auto-style58">
                             <span style="color:black;text-align:center">Remarks</span></td>
                         <td bgcolor="#A8CCD7" class="auto-style35">
                             <span style="color:black; text-align:center">Add</span></td>
                     </tr>
                     <tr>
                         <td class="auto-style51">
                             <dx:ASPxComboBox ID="cmb_taskID" runat="server" 
                              DataSourceID="cmbtaskidDB" Height="25px" 
                              width="220px"
                                 TextField="TaskName" TextFormatString="{1}" ValueField="TaskID" 
                                 ValueType="System.Int32" >
                                 <Columns>
                                     <dx:ListBoxColumn Caption="ServiceID" FieldName="TaskID" />
                                     <dx:ListBoxColumn Caption="ServiceName" FieldName="TaskName" />
                                 </Columns>
                                 <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                                 </LoadingPanelImage>
                                 <ValidationSettings>
                                     <ErrorFrameStyle ImageSpacing="4px">
                                         <ErrorTextPaddings PaddingLeft="4px" />
                                     </ErrorFrameStyle>
                                 </ValidationSettings>
                             </dx:ASPxComboBox>
                         </td>
                         <td class="auto-style50">
                             <dx:ASPxMemo ID="Memo_Remark" runat="server" 
                                 CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                                 Height="25px" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" 
                                 Width="350px">
                                 <ValidationSettings>
                                     <ErrorFrameStyle ImageSpacing="4px">
                                         <ErrorTextPaddings PaddingLeft="4px" />
                                     </ErrorFrameStyle>
                                 </ValidationSettings>
                             </dx:ASPxMemo>
                         </td>
                         <td>
                             <dx:ASPxButton ID="btn_addtask" runat="server" 
                                 CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                                 Height="25px" OnClick="btn_addtask_Click" 
                                 SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Text="ADD" 
                                 Width="135px">
                             </dx:ASPxButton></td>
                     </tr>
                 </table>
                 <br />
                 <dx:ASPxGridView ID="grid_task" runat="server" AutoGenerateColumns="False" Caption="TASK  LIST" 
                     CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" 
                     KeyFieldName="TaskID" OnRowCommand="grid_task_RowCommand" Width="761px">
                     <Columns>
                         <dx:GridViewDataTextColumn FieldName="Delete" VisibleIndex="0">
                             <DataItemTemplate>
                                 <asp:LinkButton ID="Delete0" runat="server" CommandName="Delete" Text="Edit">Delete
                                 </asp:LinkButton>
                             </DataItemTemplate>
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="TaskID" Visible="false" VisibleIndex="1">
                         </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="TaskName" VisibleIndex="2">
                         </dx:GridViewDataTextColumn>
                         <%-- <dx:GridViewDataTextColumn FieldName="TaskDesc" VisibleIndex="3" Caption="Description">
            </dx:GridViewDataTextColumn>--%>
                         <dx:GridViewDataTextColumn FieldName="Remarks" VisibleIndex="3">
                         </dx:GridViewDataTextColumn>
                     </Columns>
                     <SettingsPager>
                         <AllButton Text="All">
                         </AllButton>
                         <NextPageButton Text="Next &gt;">
                         </NextPageButton>
                         <PrevPageButton Text="&lt; Prev">
                         </PrevPageButton>
                     </SettingsPager>
                     <Images SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
                         <LoadingPanelOnStatusBar Url="~/App_Themes/Glass/GridView/gvLoadingOnStatusBar.gif">
                         </LoadingPanelOnStatusBar>
                         <LoadingPanel Url="~/App_Themes/Glass/GridView/Loading.gif">
                         </LoadingPanel>
                     </Images>
                     <ImagesFilterControl>
                         <LoadingPanel Url="~/App_Themes/Glass/Editors/Loading.gif">
                         </LoadingPanel>
                     </ImagesFilterControl>
                     <Styles CssFilePath="~/App_Themes/Glass/{0}/styles.css" 
                         CssPostfix="Glass">
                         <Header ImageSpacing="5px" SortingImageSpacing="5px">
                         </Header>
                     </Styles>
                     <StylesEditors>
                         <CalendarHeader Spacing="1px">
                         </CalendarHeader>
                         <ProgressBar Height="25px">
                         </ProgressBar>
                     </StylesEditors>
                 </dx:ASPxGridView>
             </ContentTemplate>
     </asp:UpdatePanel>
     <br />
 
   <dx:ASPxButton ID="btn_AddSchedule" runat="server" Text="Add Schedule" 
         Width="120px" onclick="btn_AddSchedule_Click" 
         CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
         SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
     </dx:ASPxButton>
    <br />
    <dx:ASPxGridView ID="grdvew_Schedule" runat="server" Caption="Schedule List" KeyFieldName="ScheduleID"
         CssFilePath="~/App_Themes/Glass/{0}/styles.css" 
         CssPostfix="Glass"  
         onrowcommand="grdvew_Schedule_RowCommand" AutoGenerateColumns="False" Width="771px">
           <Columns>
            <dx:GridViewDataTextColumn FieldName="Delete" VisibleIndex="0">
         <DataItemTemplate>            
              <asp:LinkButton ID="Delete" runat="server" CommandName="Delete" Text="Edit">Delete
             </asp:LinkButton>
             </DataItemTemplate>
                 </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ScheduleID"  VisibleIndex="1" Visible="false">
                
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ScheduleName" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ScheduleCriteria" VisibleIndex="3">
            </dx:GridViewDataTextColumn>     
            <dx:GridViewDataTextColumn FieldName="Value" VisibleIndex="4">
            </dx:GridViewDataTextColumn>            
            <dx:GridViewDataTextColumn FieldName="Description" VisibleIndex="5">
            </dx:GridViewDataTextColumn>          
            <dx:GridViewDataTextColumn FieldName="CreatedBy" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
        </Columns>
         <SettingsPager>
             <AllButton Text="All">
             </AllButton>
             <NextPageButton Text="Next &gt;">
             </NextPageButton>
             <PrevPageButton Text="&lt; Prev">
             </PrevPageButton>
         </SettingsPager>
         <Images SpriteCssFilePath="~/App_Themes/Glass/{0}/sprite.css">
             <LoadingPanelOnStatusBar Url="~/App_Themes/Glass/GridView/gvLoadingOnStatusBar.gif">
             </LoadingPanelOnStatusBar>
             <LoadingPanel Url="~/App_Themes/Glass/GridView/Loading.gif">
             </LoadingPanel>
         </Images>
         <ImagesFilterControl>
             <LoadingPanel Url="~/App_Themes/Glass/Editors/Loading.gif">
             </LoadingPanel>
         </ImagesFilterControl>
         <Styles CssFilePath="~/App_Themes/Glass/{0}/styles.css" 
             CssPostfix="Glass">
             <Header ImageSpacing="5px" SortingImageSpacing="5px">
             </Header>
         </Styles>
         <StylesEditors>
             <CalendarHeader Spacing="1px">
             </CalendarHeader>
             <ProgressBar Height="25px">
             </ProgressBar>
         </StylesEditors>
     </dx:ASPxGridView>
    <br />
    <dx:ASPxButton ID="btn_Save" runat="server" Width="120px" Height="25px" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Text="Save" OnClick="btn_Save_Click">
                </dx:ASPxButton>
    <br />
    <asp:SqlDataSource ID="CreatedByDS" runat="server" 
        ConnectionString="<%$ ConnectionStrings:INSConnectionString %>" 
        SelectCommand="SELECT [USR_ID], [USR_NAME] FROM [tblUSER]">
    </asp:SqlDataSource>
                
    <br />
    <asp:SqlDataSource ID="gridTaskDB" runat="server" ConnectionString="<%$ ConnectionStrings:INSConnectionString %>" SelectCommand="SELECT * FROM [TaskListMaster]"></asp:SqlDataSource>
     
                
      <asp:SqlDataSource ID="cmbtaskidDB" runat="server" ConnectionString="<%$ ConnectionStrings:INSConnectionString %>" 
                    SelectCommand="SELECT [TaskID], [TaskName],TaskDescription FROM [TaskListMaster] WHERE Status='Active'"></asp:SqlDataSource>
     <dxlp:aspxloadingpanel runat="server" Modal="True" ClientInstanceName="lpanel" ID="ASPxLoadingPanel1"></dxlp:aspxloadingpanel>

</asp:Content>

