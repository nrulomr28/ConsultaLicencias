<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ConsultaLicencias._Default" %>

<%--<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1></h1>
                <h2></h2>
            </hgroup>
            <p>
               
            </p>
        </div>
    </section>
</asp:Content>--%>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    
    <asp:LoginView ID="LoginView1" runat="server">
        <AnonymousTemplate >
            <asp:Login ID="Login1" runat="server" UserNameLabelText="Usuario:" TitleText="Acceso" LoginButtonText="Entrar" PasswordRequiredErrorMessage="Password es requerido." UserNameRequiredErrorMessage="Nombre de usuario es requerido." DisplayRememberMe="False"></asp:Login>
        </AnonymousTemplate>
        <LoggedInTemplate >
            Bienvenido
        </LoggedInTemplate>
    </asp:LoginView>
    
</asp:Content>
