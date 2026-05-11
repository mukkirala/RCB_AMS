<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="DepartmentMaster.aspx.cs" Inherits="DepartmentMaster" %>


<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
	
       
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
	<br />
   <h3> <strong> Add Departments</strong></h3>
    <div class="style1">
    <table class="auto-style27">
     
           <tr>
            <td colspan="2">
                <dx:ASPxLabel ID="lbl_msg" runat="server" Text="" ForeColor="Red" Font-Size="Large">
                </dx:ASPxLabel>
            </td>
            <td class="auto-style33">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        
        <tr>
            <td class="auto-style26">
                <dx:ASPxLabel ID="lbl_DepName" runat="server" Text="Department Code :" Font-Bold="true" Font-Size="Larger">
                </dx:ASPxLabel><span style="color:red">*</span>
            </td>

            <td>
            <td class="auto-style31">
                <dx:ASPxTextBox ID="txt_Deptcode" runat="server" Width="300px" Height="25px" CssClass="auto-style32">
                    <ValidationSettings ValidationGroup="btn" ErrorTextPosition="Bottom" >
                        <RequiredField IsRequired="true" ErrorText="Department Code Is Required" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
                </td>
            <td class="auto-style33">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style26">
                <dx:ASPxLabel ID="lbl_Desc" runat="server" Text="Department Name :"  Font-Bold="true" Font-Size="Larger">
                </dx:ASPxLabel><span style="color:red">*</span>
            </td>
            <td>
            <td class="auto-style31">
               <dx:ASPxTextBox ID="txtDeptName" runat="server" Width="300px" Height="25px" CssClass="auto-style32">
                    <ValidationSettings ValidationGroup="btn" ErrorTextPosition="Bottom" >
                        <RequiredField IsRequired="true" ErrorText="Department Name Is Required" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
                </td>
            <td class="auto-style33">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style26">
                
            </td>
            <td class="auto-style31">&nbsp;</td>
            <td class="auto-style33">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <%--<td class="auto-style26">
                &nbsp;</td>--%>
            <td class="auto-style31">
                <dx:ASPxButton ID="btn_Save" ValidationGroup="btn" runat="server" Height="25px" Text="Save" Theme="SoftOrange" Width="100px" OnClick="btn_Save_Click" CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css">
                </dx:ASPxButton>
            </td>
            <td class="auto-style33">
                &nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
       
    </table>
        </div>
    <br />

    <br />
   <h4> <strong> View Departments</strong></h4>
    <br />
    <dx:ASPxGridView ID="Grid_Departments" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"      KeyFieldName="DepartmentCode"  OnRowCommand="Grid_Departments_RowCommand1"  CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css"   CssPostfix="PlasticBlue" Width="80%">
        <Columns>
            <dx:GridViewDataColumn  VisibleIndex="0">
                <DataItemTemplate>
                    <asp:LinkButton ID="Btn_Edit" CommandName="Edit" runat="server" ForeColor="Green" Text="Edit" Font-Bold="true"  >Edit</asp:LinkButton>
                     </DataItemTemplate>
                    </dx:GridViewDataColumn>
                     <dx:GridViewDataColumn  VisibleIndex="0">
                           <DataItemTemplate>
                    <asp:LinkButton ID="btn_delete" CommandName="Delete" runat="server" ForeColor="Red" Text="Delete" Font-Bold="true"  >Delete</asp:LinkButton>
                </DataItemTemplate>
            </dx:GridViewDataColumn>
             <dx:GridViewDataTextColumn FieldName="DepartmentCode" VisibleIndex="0"  >
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="DepartmentName" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            
        </Columns>
        <SettingsPager PageSize="25">
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
            <CalendarHeader Spacing="1px">
            </CalendarHeader>
            <ProgressBar Height="25px">
            </ProgressBar>
        </StylesEditors>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RCBAMSConnectionString %>" SelectCommand="SELECT [DepartmentCode], [DepartmentName] FROM [DepartmentMaster] 
        Where DepartmentStatus='Active'"></asp:SqlDataSource>
    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server">
    </dx:ASPxGridViewExporter>
    <br />

</asp:Content>

