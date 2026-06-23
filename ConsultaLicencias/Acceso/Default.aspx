<%@ Page Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Default.aspx.cs"
    Inherits="ConsultaLicencias.Acceso._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="main-container">

        <asp:LoginView ID="LoginView1" runat="server">

            <AnonymousTemplate>

                <div class="login-card">

                    <div class="login-card-header">
                        <h3>Acceso al Sistema</h3>
                    </div>

                    <div class="login-card-body">

                        <asp:Login
                            ID="Login1"
                            runat="server"
                            DisplayRememberMe="False"
                            DestinationPageUrl="~/Launcher.aspx"
                            FailureText="Usuario o contraseña incorrectos.">

                            <LayoutTemplate>

                                <div class="form-group">

                                    <label class="login-label">
                                        Usuario
                                    </label>

                                    <asp:TextBox
                                        ID="UserName"
                                        runat="server"
                                        CssClass="login-input" />

                                    <asp:RequiredFieldValidator
                                        ID="UserNameRequired"
                                        runat="server"
                                        ControlToValidate="UserName"
                                        ValidationGroup="Login1"
                                        ErrorMessage="El usuario es requerido."
                                        CssClass="validation-message"
                                        Display="Dynamic" />

                                </div>

                                <div class="form-group">

                                    <label class="login-label">
                                        Contraseña
                                    </label>

                                    <asp:TextBox
                                        ID="Password"
                                        runat="server"
                                        TextMode="Password"
                                        CssClass="login-input" />

                                    <asp:RequiredFieldValidator
                                        ID="PasswordRequired"
                                        runat="server"
                                        ControlToValidate="Password"
                                        ValidationGroup="Login1"
                                        ErrorMessage="La contraseña es requerida."
                                        CssClass="validation-message"
                                        Display="Dynamic" />

                                </div>

                                <div class="form-group">

                                    <asp:Literal
                                        ID="FailureText"
                                        runat="server"
                                        EnableViewState="False" />

                                </div>

                                <asp:Button
                                    ID="LoginButton"
                                    runat="server"
                                    CommandName="Login"
                                    Text="Iniciar Sesión"
                                    ValidationGroup="Login1"
                                    CssClass="btn-login" />

                            </LayoutTemplate>

                        </asp:Login>

                    </div>

                </div>

            </AnonymousTemplate>

            <LoggedInTemplate>

                <div class="alert alert-success">
                    Bienvenido al Arcoiris.
                </div>

            </LoggedInTemplate>

        </asp:LoginView>

    </div>

</asp:Content>