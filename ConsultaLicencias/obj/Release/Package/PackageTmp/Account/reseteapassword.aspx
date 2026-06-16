<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="reseteapassword.aspx.cs" Inherits="SIGARH.Account.reseteapassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">.
     <table>
        <tr>
            <td></td><td>
                <asp:TextBox ID="txtLogin" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td></td><td>
                <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td></td><td>
                <asp:Button ID="Button1" runat="server" Text="Cambiar"  OnClick ="Button1_Click"/></td>
        </tr>
        <tr>
            <td></td><td></td>
        </tr>
    </table>
</asp:Content>
