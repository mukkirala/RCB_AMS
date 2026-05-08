<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.master" AutoEventWireup="true" CodeFile="SectionMaster.aspx.cs" Inherits="SectionMaster" %>


<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    
	<style type="text/css">
         .style1{
               box-shadow:-4px 6px 23px -5px rgba(0,0,0,0.2);
               width:100%;
               height:200px;
        }
       
        .auto-style8 {
            width: 148px;
        }
        .auto-style10 {
            width: 197px;
        }
        .auto-style11 {
            width: 165px;
        }
        .auto-style12 {
            width: 67%;
            height: 144px;
            margin-left: 36px;
        }
       
        .auto-style13 {
            box-shadow: -4px 6px 23px -5px rgba(0,0,0,0.2);
            width: 77%;
            height: 220px;
        }
       
        .auto-style14 {
            width: 230px;
        }
       
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />
    <strong>Add Section</strong>
        <br />
    <div class="auto-style13">
        <br />
        
        <table class="auto-style12">
            <tr>
                <td colspan="3">
                <dx:ASPxLabel ID="lblmsg" runat="server" ForeColor="red">
                </dx:ASPxLabel>
                </td>
                <td class="auto-style14">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">Section Name <span style="color:red">*</span></td>
                <td class="auto-style10">
                <dx:ASPxTextBox ID="txtdivision" runat="server" Width="100%" Height="25px" >
                    <ValidationSettings SetFocusOnError="True" ErrorTextPosition="Bottom">
                        <RequiredField ErrorText="Please Enter Section Name " IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
                </td>
                <td class="auto-style11">Description</td>
                <td class="auto-style14">
                <dx:ASPxMemo ID="memodescription" runat="server" Height="25px" Width="100%" >
                </dx:ASPxMemo>
                </td>
                <td class="auto-style34">
                    &nbsp;</td>
            </tr>
          
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style10">
                <dx:ASPxButton ID="btnSave" runat="server" Width="100px" Text="Save" OnClick="btnSave_Click" CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css">
                </dx:ASPxButton>
                </td>
                <td class="auto-style11">&nbsp;</td>
                <td class="auto-style14">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            </table>
 </div>
    <br />
    <br />
    <strong> View Sections</strong>
    <br />
    <dx:ASPxGridView ID="griddivision" OnRowCommand=" griddivision_RowCommand" Width="600px"   runat="server" DataSourceID="DSDept" AutoGenerateColumns="False" 
        KeyFieldName="SectionID" CssFilePath="~/App_Themes/Glass/{0}/styles.css"  CssPostfix="Glass">
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="0" Visible="false">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="SectionID" ReadOnly="True" Visible="false" ShowInCustomizationForm="True">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="SectionName" VisibleIndex="2" ShowInCustomizationForm="True" Caption="Section Name">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Description" VisibleIndex="3" ShowInCustomizationForm="True">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Edit/Delete" VisibleIndex="0">
                <DataItemTemplate>
                    <asp:LinkButton ID="btnEdit" runat="server"  CommandName="Edit" Text="Edit" />
                    <asp:LinkButton ID="btnDelete" runat="server"  CommandName="Delete" Text="Delete" />
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
        </Columns>
        <Settings ShowGroupPanel="True" />
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
        <Styles CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass">
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
           
<asp:SqlDataSource ID="DSDept" runat="server" ConnectionString="<%$ ConnectionStrings:INSConnectionString %>" 
    SelectCommand="SELECT [SectionID], [SectionName], [Description] FROM SectionMaster where Status='Active' or Status is null"></asp:SqlDataSource>

        
       
     
</asp:Content>

