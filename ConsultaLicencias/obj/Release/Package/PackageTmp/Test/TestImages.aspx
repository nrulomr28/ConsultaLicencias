<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TestImages.aspx.cs" Inherits="ConsultaLicencias.Test.TestImages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="up" runat="server">
        <ContentTemplate>
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <br />
            <asp:Label ID="Label2" runat="server"></asp:Label>
            <br />
            <asp:Repeater ID="repImages" runat="server">
                <ItemTemplate>
                    <br />
                    TEXTO:<br />
                    <asp:Label ID="lblTexto" runat="server" Text='<%# Eval("Dato") %>'></asp:Label>
                    <br />
                    IMAGEN:<br />
                    <asp:Image ID="Image" runat="server" ImageUrl='<%# Eval("Imagen") %>' />
                </ItemTemplate>
            </asp:Repeater>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
