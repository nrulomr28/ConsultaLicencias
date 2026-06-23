<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctrlCampoValido.ascx.cs" Inherits="ConsultaLicencias.Controles.ctrlCampoValido" %>
<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Campo Requerido*" ControlToValidate="TextBox1" SetFocusOnError="True" Display="Dynamic" Enabled="True" ForeColor="Red"></asp:RequiredFieldValidator>
<ajaxToolkit:FilteredTextBoxExtender ID="TextBox1_FilteredTextBoxExtender" runat="server" FilterType="Custom, UppercaseLetters, LowercaseLetters" TargetControlID="TextBox1" InvalidChars="&quot;#$%&/()=?¡*¨[]_:;:,{}+¿'!.@<>" FilterMode="ValidChars" ValidChars="aáAÁbBcCdDeéEÉfFgGhHiíIÍjJkKlLmMnNñÑoóOÓpPqQrRsStTuúUÚvVwWxXyYzZ. ´"></ajaxToolkit:FilteredTextBoxExtender>
<ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" Enabled="True" TargetControlID="TextBox1" WatermarkText="" WatermarkCssClass="sombra">
</ajaxToolkit:TextBoxWatermarkExtender>
<asp:RegularExpressionValidator ID="revCorreo" runat="server" ErrorMessage="Correo sin formato adecuado" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" ControlToValidate="TextBox1" CssClass="ClassLoginError" Enabled="False"></asp:RegularExpressionValidator></td>
