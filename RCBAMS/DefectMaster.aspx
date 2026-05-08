<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="DefectMaster.aspx.cs" Inherits="DefectMaster" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .auto-style6 {
            font-size: medium;
        }
        .auto-style7 {
            color: #333300;
        }
        .auto-style9 {
            width: 236px;
        }
        .auto-style10 {
            width: 100px;
            
        }
        .style1
        {
            color: #000000;
            
        }
        .auto-style16 {
            width: 236px;
            height: 25px;
        }
        .auto-style17 {
            width: 85px;
            height: 25px;
        }
        .auto-style18 {
            height: 25px;
        }
        .auto-style19 {
            width: 93px;
        }
        .auto-style20 {
            width: 93px;
            height: 25px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <%--<div style="margin-left:60px;margin-right:60px">--%>
    <strong><span class="auto-style6">
    <span class="style1">ADD Task:-</span><span class="auto-style7"><br />
    </span></span></strong>
    <br />
    <table style="width:677px; margin-left: 55px;">
        <tr>
            <td class="auto-style19">
                Task Name : <span style="color: #FF0000" class="auto-style1">*</span></td>
            <td class="auto-style9">
                <dx:ASPxTextBox ID="TxtTaskName" runat="server" Height="25px" Width="170px" style="margin-left: 0px">
                </dx:ASPxTextBox>
            </td>
            <td class="auto-style10">
                Service Type : <span style="color: #FF0000" class="auto-style1">*</span></td>
            <td>
                <dx:ASPxComboBox ID="cmb_Dep" runat="server" Width="170px" DataSourceID="SqbDBaircraft"  Height="5px" AutoPostBack="true"
                        TextField="ServiceTypeName" ValueField="ServiceTypeName"  ValueType="System.String" IncrementalFilteringMode="Contains"
                          CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" 
                        >
                        <validationsettings errortextposition="bottom" validationgroup="btn">
                            <requiredfield errortext="please select ServiceType" isrequired="true" />
                        </validationsettings>
                        <loadingpanelimage url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                        </loadingpanelimage>
                        <validationsettings>
                            <errorframestyle imagespacing="4px">
                                <errortextpaddings paddingleft="4px" />
                            </errorframestyle>
                        </validationsettings>
                    </dx:ASPxComboBox>                   
  
                 <asp:SqlDataSource ID="SqbDBaircraft" runat="server" 
        ConnectionString="<%$ ConnectionStrings:InstemAMSConnectionString %>" 
        SelectCommand="SELECT DISTINCT [ServiceTypeName] FROM [ServiceTypeMaster]">
         </asp:SqlDataSource>

            </td>
        </tr>
        <tr>
            <td class="auto-style19">
                Description :</td>
            <td class="auto-style9">
                <dx:ASPxMemo ID="Memo_Desc" runat="server" Height="50px" Width="170px" 
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                    <ValidationSettings>
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
                </dx:ASPxMemo>
            </td>
            <td class="auto-style10">
                &nbsp;</td>
            <td>
    
    
                </td>
        </tr>
        <tr>
            <td class="auto-style20">
                </td>
            <td class="auto-style16">
                </td>
            <td class="auto-style17">
                </td>
            <td class="auto-style18">
                </td>
        </tr>
        <tr>
            <td class="auto-style19">
                &nbsp;</td>
            <td class="auto-style9">
                <dx:ASPxButton ID="btn_save" runat="server"  
                    onclick="btn_save_Click" Text="Save" Width="100px" Height="25px" 
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                </dx:ASPxButton>
                <dx:ASPxButton ID="btn_Update" runat="server" Text="Update" Width="100px" 
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" 
                    OnClick="btn_Update_Click" style="height: 25px" Height="25px" >
                </dx:ASPxButton>
            </td>
            <td class="auto-style10">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table><br />
    
    <span class="auto-style7"><strong><span class="auto-style6">VIEW Task :-<br />
</span></strong></span><br />
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="ASPxGridView1_RowCommand"
        DataSourceID="SqlDataSource1" KeyFieldName="TaskID" 
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
        Width="100%">
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="0">
                <ClearFilterButton Visible="True">
                </ClearFilterButton>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="Edit/Delete" VisibleIndex="1">
                <DataItemTemplate>
                    <asp:LinkButton ID="lnkbtn_edit" runat="server" Text="Edit" CommandName="Edit"></asp:LinkButton> 
                    <asp:LinkButton ID="Link_delete" runat="server" Text="Delete" CommandName="Delete"></asp:LinkButton>
                </DataItemTemplate>
                
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TaskID" ReadOnly="True" 
                VisibleIndex="1" Visible="false">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TaskName" VisibleIndex="2" Caption="Task Name">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TaskDescription" VisibleIndex="3" 
                Caption="Description">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TaskType" VisibleIndex="4" Caption=" Service Type">
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:InstemAMSConnectionString %>" 
        SelectCommand="SELECT * FROM [TaskListMaster] WHERE Status='Active'"></asp:SqlDataSource>
    <br />
    </strong></span>
   <%--</div>--%>
</asp:Content>

