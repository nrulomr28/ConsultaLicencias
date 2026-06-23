<%@ Page Title="Inicio"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Launcher.aspx.cs"
    Inherits="ConsultaLicencias.Launcher" %>

<asp:Content
    ID="BodyContent"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <div class="launcher-container">

        <div class="launcher-card">

            <div class="launcher-icon">
                🔎
            </div>

            <h2 class="launcher-title">
                Consulta histórica
            </h2>

            <p class="launcher-description">

                Consulta expedientes históricos,
                visualiza información del ciudadano
                y descarga evidencia documental.

            </p>

            <asp:HyperLink
                ID="lnkHistorico"
                runat="server"
                NavigateUrl="~/Consultas/ConsultaHistorico.aspx"
                CssClass="btn-launcher">

                Consultar

            </asp:HyperLink>

        </div>

    </div>

</asp:Content>