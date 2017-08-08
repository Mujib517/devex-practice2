<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeBehind="Default.aspx.cs" Inherits="DevEx._Default" %>


<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">

    <dx:ASPxCallbackPanel ID="cbPanel" runat="server" ClientInstanceName="client_cbPanel" OnCallback="OnCallback">
        <PanelCollection>
            <dx:PanelContent runat="server">
                <dx:ASPxGridView ID="gvData" runat="server" AutoGenerateColumns="True" ClientInstanceName="client_gvData" KeyFieldName="Id" Width="100%">
                    <SettingsPager PageSize="32" />
                    <Settings VerticalScrollBarMode="Visible" VerticalScrollableHeight="350" />
                    <Paddings Padding="0px" />
                    <Border BorderWidth="0px" />
                    <BorderBottom BorderWidth="1px" />
                    <Templates>
                        <EditForm>
                            <dx:ASPxCallbackPanel ID="myPanel" runat="server" ClientInstanceName="client_myPanel" OnCallback="OnCallback">
                                <PanelCollection>
                                    <dx:PanelContent runat="server">
                                        <dx:ASPxComboBox runat="server" ID="cb"></dx:ASPxComboBox>
                                        <dx:ASPxButton runat="server" ID="btn" AutoPostBack="False" Text="Popup">
                                            <ClientSideEvents Click="function(){popup.Show()}"></ClientSideEvents>
                                        </dx:ASPxButton>

                                        <dx:ASPxGridView runat="server" ID="gvEditData" AutoGenerateColumns="true">
                                        </dx:ASPxGridView>
                                    </dx:PanelContent>
                                </PanelCollection>
                            </dx:ASPxCallbackPanel>
                        </EditForm>
                    </Templates>
                </dx:ASPxGridView>

                <dx:ASPxPopupControl runat="server" ClientInstanceName="popup">
                    <ContentCollection>
                        <dx:PopupControlContentControl runat="server">
                            <dx:ASPxButton runat="server" ID="btn2" AutoPostBack="False" Text="Fill">
                                <ClientSideEvents Click="function(){client_cbPanel.PerformCallback('btn2');popup.Hide();}"></ClientSideEvents>
                            </dx:ASPxButton>
                        </dx:PopupControlContentControl>
                    </ContentCollection>
                </dx:ASPxPopupControl>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxCallbackPanel>

</asp:Content>
