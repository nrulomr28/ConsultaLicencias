<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ConsultaLicencias.aspx.cs" Inherits="ConsultaLicencias.ConsultaLicencias" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .encabezadoTabla {
            color: White;
            background-color: #ED9927;
            font-weight: bold;
        }

            .encabezadoTabla > th {
                text-align: center;
            }

        .encabezadoTabla-Gris {
            color: White;
            background-color: #4A2C2A;
            font-weight: bold;
        }

            .encabezadoTabla-Gris > th {
                text-align: center;
            }

        .textoCentrado {
            text-align: center;
        }

        .textoCentradoLlamativo {
            text-align: center;
            font-weight: bold;
        }

        body {
            padding: 10px;
        }

        /*Para las notificaciones tipo PopUp*/
        .modalBackground {
            background-color: Black;
            filter: alpha(opacity=90);
            opacity: 0.8;
        }
    </style>
    <script>
        function ShowProgress() {
            var myExtender = $find('ProgressBarModalPopupExtender');
            myExtender.show();
            return true;
        }
        function HiddeProgress() {
            var myExtender = $find('ProgressBarModalPopupExtender');
            myExtender.hide();
            return true;
        }
    </script>
    F<asp:UpdateProgress ID="updPanProg_Actualización" runat="server" AssociatedUpdatePanelID="upFilter">
        <ProgressTemplate>
            <table style="width: 100%; height: 100%;">
                <tr>
                    <td style="align-content: center; align-items: center; align-self: center; text-align: center;">
                        <h1>Realizando búsqueda, espere por favor...</h1>
                        <asp:Image ID="imgCargando2" runat="server" ImageUrl="~/Images/imgCargando.gif" Width="80px" />
                    </td>
                </tr>
            </table>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <div class="row" style="text-align: center; background-color: yellow;">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            La consulta podría tardar dependiendo la cantidad de coincidencias en la base de datos.</div>
    </div>
    <asp:UpdatePanel ID="upFilter" runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="input-group">
                        <span class="input-group-addon" style="min-width: 150px; text-align: left;">
                            <i class="glyphicon glyphicon-user"></i>Nombre
                        </span>
                        <asp:TextBox ID="txtNombre" runat="server" Width="100%" autocomplete="off"></asp:TextBox>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="input-group">
                        <span class="input-group-addon" style="min-width: 150px; text-align: left;">
                            <i class="glyphicon glyphicon-user"></i>Primer Apellido
                        </span>
                        <asp:TextBox ID="txtPrimerAp" runat="server" Width="100%" autocomplete="off"></asp:TextBox>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="input-group">
                        <span class="input-group-addon" style="min-width: 150px; text-align: left;">
                            <i class="glyphicon glyphicon-user"></i>Segundo Apellido
                        </span>
                        <asp:TextBox ID="txtSegundoAp" runat="server" Width="100%" autocomplete="off"></asp:TextBox>
                    </div>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
                    <div class="input-group">
                        <span class="input-group-addon" style="min-width: 150px; text-align: left;">
                            <i class="glyphicon glyphicon-tag"></i>RFC
                        </span>
                        <asp:TextBox ID="txtRFC" runat="server" Width="100%" autocomplete="off"></asp:TextBox>
                    </div>
                </div>
                <%--<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="input-group">
                        <span class="input-group-addon" style="min-width: 150px; text-align: left;">
                            <i class="glyphicon glyphicon-map-marker"></i>C.P.
                        </span>
                        <asp:TextBox ID="txtCP" runat="server" Width="100%" autocomplete="off"></asp:TextBox>
                    </div>
                </div>--%>
                <%--<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="input-group">
                        <span class="input-group-addon" style="min-width: 150px; text-align: left;">
                            <i class="glyphicon glyphicon-globe"></i>Calle
                        </span>
                        <asp:TextBox ID="txtCalle" runat="server" Width="100%" autocomplete="off"></asp:TextBox>
                    </div>
                </div>--%>
                
                
                <div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">                    
                    <asp:LinkButton ID="btnConsultarLicencias" runat="server" CssClass="btn btn-primary"
                        OnClick="btnConsultarLicencias_Click">
                    <span class="glyphicon glyphicon-search" aria-hidden="true" style="font-size: 20px;"></span> BUSCAR
                    </asp:LinkButton>
                    <%--<asp:LinkButton ID="btnLimpiarFiltros" runat="server" CssClass="btn btn-info" Style="margin-left: 20px;"
                        OnClick="BtnLimpiarFiltros_Click">
                    <span class="glyphicon glyphicon-unchecked" aria-hidden="true" style="font-size: 20px;"></span> LIMPIAR
                    </asp:LinkButton>--%>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>    
    <asp:UpdatePanel ID="upModal" runat="server">
        <ContentTemplate>
            <ajaxToolkit:ModalPopupExtender ID="ProgressBarModalPopupExtender" runat="server"
                BackgroundCssClass="modalBackground" BehaviorID="ProgressBarModalPopupExtender"
                TargetControlID="hiddenField" PopupControlID="Panel1" Enabled="True" />
            <asp:Panel ID="Panel1" runat="server" Style="display: none; text-align: center;">
                <div style="width: 80%; height: 15em; background-color: white; text-align: center;">
                    <p class="wait">Obteniendo información, la operación podría tardar, espere por favor...</p>
                    <br />
                    <asp:Image ID="imgCargando" runat="server" ImageUrl="~/Images/imgCargando.gif" Width="80px" />
                    <br />
                    <p class="wait">Los resultados se desplegarán en la parte inferior...</p>
                </div>
            </asp:Panel>
            <asp:HiddenField ID="hiddenField" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="upListaLicencias" runat="server">
        <ContentTemplate>
            <div style="width: 100%; max-height: 500px; overflow-y: scroll; overflow-x: scroll;">
                <div class="row">
                    <div class="col-lg-10 col-md-10 hidden-sm hidden-xs"></div>
                    <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12">
                        <asp:GridView ID="gvLicencias" runat="server" AutoGenerateColumns="False"
                            DataKeyNames="ID_ALTERNA,ESTATUS_REGISTRO"
                            CssClass="table table-bordered bs-table"
                            HeaderStyle-CssClass="encabezadoTabla-Gris"
                            RowStyle-CssClass="textoCentrado"
                            OnSelectedIndexChanged="gvLicencias_SelectedIndexChanged"
                            OnRowCommand="gvLicencias_RowCommand">
                            <Columns>
                                <asp:TemplateField HeaderText="N°">
                                    <ItemTemplate>
                                        <%# (gvLicencias.PageIndex * gvLicencias.PageSize) + Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="FOTO">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="Image1" runat="server" ImageUrl='<%# "~/Imagen.ashx?IdImagen=" + Eval("ID_ALTERNA") + "&TipoConsulta=" + Eval("ESTATUS_REGISTRO") %>'
                                            Height="100px" Width="80px" CommandName="Select" CommandArgument='<%# Eval("ID_ALTERNA") %>' OnClientClick="ShowProgress();" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="NOMBRE">
                                    <ItemTemplate>
                                        <span>
                                            <%# Eval("NOMBRE") + "<br />" + Eval("APELLIDO_PATERNO") + "<br />" + Eval("APELLIDO_MATERNO")%>
                                        </span>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="FECHA_REGISTRO" HeaderText="FECHA REGISTRO" SortExpression="FECHA_REGISTRO"></asp:BoundField>
                                <asp:BoundField DataField="FCH_NACIMIENTO" HeaderText="NACIMIENTO" SortExpression="FCH_NACIMIENTO" DataFormatString="{0:dd/MM/yyyy}"></asp:BoundField>
                                <asp:BoundField DataField="RFC" HeaderText="RFC" SortExpression="RFC"></asp:BoundField>
                                <asp:BoundField DataField="CURP" HeaderText="CURP" SortExpression="CURP"></asp:BoundField>
                                <asp:TemplateField HeaderText="ESTATURA">
                                    <ItemTemplate>
                                        <span>
                                            <%# Eval("ESTATURA") != null && Convert.ToDecimal(Eval("ESTATURA").ToString()) > 100 ?
                                       Math.Round(Convert.ToDecimal(Eval("ESTATURA").ToString()) / 100, 2) : Eval("ESTATURA") %>
                                        </span>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="CALLE">
                                    <ItemTemplate>
                                        <span>
                                            <%# Eval("CALLE") + " " + Eval("NUM_EXT") + " " + Eval("NUM_INT") %>
                                        </span>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="COLONIA" HeaderText="COLONIA" SortExpression="COLONIA"></asp:BoundField>
                                <asp:BoundField DataField="REF_DOM" HeaderText="REFERENCIA" SortExpression="REF_DOM"></asp:BoundField>
                                <asp:BoundField DataField="MUNICIPIO" HeaderText="MUNICIPIO" SortExpression="MUNICIPIO"></asp:BoundField>
                                <asp:BoundField DataField="CODPOSTAL" HeaderText="C.P." SortExpression="CODPOSTAL"></asp:BoundField>
                                <asp:BoundField DataField="PROFESION" HeaderText="PROFESIÓN" SortExpression="PROFESION"></asp:BoundField>                                
                                <asp:TemplateField HeaderText="SEXO" SortExpression="SEXO">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("SEXO") == null ? "" :  Eval("SEXO").Equals(1) ? "Masculino" : Eval("SEXO").Equals(2) ? "Femenino" : "No especificado" %>' ID="lblGridSexo"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="TELEFONO" HeaderText="TELÉFONO" SortExpression="TELEFONO"></asp:BoundField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="col-lg-10 col-md-10 hidden-sm hidden-xs"></div>
                </div>
            </div>
            <asp:EntityDataSource runat="server" ID="edsLicencias" DefaultContainerName="SILCVEREntities"
                ConnectionString="name=SILCVEREntities" EnableFlattening="False" EntitySetName="vLicencias_UNION"                 
                EntityTypeFilter="vLicencias_UNION" 
                Where="(@NOMBRE IS NULL || it.NOMBRE LIKE '%' + @NOMBRE + '%') && 
                (@PRIMER IS NULL ||it.APELLIDO_PATERNO LIKE '%' + @PRIMER + '%') && 
                (@RFC IS NULL ||it.Busqueda LIKE '%' + @RFC + '%') 
                " 
                OrderBy="it.RFC, it.CURP, it.FECHA_REGISTRO DESC" >
                <WhereParameters>
                    <asp:ControlParameter ControlID="txtNombre" DefaultValue="" ConvertEmptyStringToNull="true" Name="NOMBRE" Type="String" />
                    <asp:ControlParameter ControlID="txtPrimerAp" DefaultValue="" ConvertEmptyStringToNull="true" Name="PRIMER" Type="String" />
                    <asp:ControlParameter ControlID="txtSegundoAp" DefaultValue="" ConvertEmptyStringToNull="true" Name="SEGUNDO" Type="String" />
                    <asp:ControlParameter ControlID="txtRFC" DefaultValue="" ConvertEmptyStringToNull="true" Name="RFC" Type="String" />                    
                </WhereParameters>
            </asp:EntityDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
    <hr style="border: 2px solid;" />
    <asp:UpdatePanel ID="upMSJ" runat="server">
        <ContentTemplate>
            <div class="row" style="text-align: center; background-color: yellow;" id="msjINEXISTENTE" runat="server">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    NO FUE POSIBLE ACCEDER A LOS DATOS MÁS RECIENTES, FAVOR DE CONSULTAR EN HISTÓRICO.
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <hr />
    <br />
    <asp:UpdatePanel ID="upDetallePersona" runat="server">
        <ContentTemplate>
            <div class="row" id="DIV_DETALLES" runat="server">
                <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                    <div class="input-group">
                        <span class="input-group-addon" style="min-width: 150px; text-align: left;">
                            <i class="glyphicon glyphicon-user"></i>Nombre
                        </span>
                        <asp:TextBox ID="txtDetNombreCompleto" runat="server" Width="100%" autocomplete="off" Enabled="false"></asp:TextBox>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon" style="min-width: 150px; text-align: left;">
                            <i class="glyphicon glyphicon-user"></i>Sexo
                        </span>
                        <asp:TextBox ID="txtDetSexo" runat="server" Width="100%" autocomplete="off" Enabled="false"></asp:TextBox>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon" style="min-width: 150px; text-align: left;">
                            <i class="glyphicon glyphicon-calendar"></i>Edad
                        </span>
                        <asp:TextBox ID="txtDetEdad" runat="server" Width="100%" autocomplete="off" Enabled="false"></asp:TextBox>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon" style="min-width: 150px; text-align: left;">
                            <i class="glyphicon glyphicon-tag"></i>RFC
                        </span>
                        <asp:TextBox ID="txtDetRFC" runat="server" Width="100%" autocomplete="off" Enabled="false"></asp:TextBox>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon" style="min-width: 150px; text-align: left;">
                            <i class="glyphicon glyphicon-tag"></i>CURP
                        </span>
                        <asp:TextBox ID="txtDetCURP" runat="server" Width="100%" autocomplete="off" Enabled="false"></asp:TextBox>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon" style="min-width: 150px; text-align: left;">
                            <i class="glyphicon glyphicon-bullhorn"></i>Estado Civil
                        </span>
                        <asp:TextBox ID="txtDetEstadoCivil" runat="server" Width="100%" autocomplete="off" Enabled="false"></asp:TextBox>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon" style="min-width: 150px; text-align: left;">
                            <i class="glyphicon glyphicon-sort-by-attributes-alt"></i>Estatura
                        </span>
                        <asp:TextBox ID="txtDetEstatura" runat="server" Width="100%" autocomplete="off" Enabled="false"></asp:TextBox>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon" style="min-width: 150px; text-align: left;">
                            <i class="glyphicon glyphicon-globe"></i>Dirección
                        </span>
                        <asp:TextBox ID="txtDetDireccion" runat="server" Width="100%" autocomplete="off" Enabled="false"
                            TextMode="MultiLine" Height="100px" Style="background-color: white; font-size: 12px;"></asp:TextBox>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon" style="min-width: 150px; text-align: left;">
                            <i class="glyphicon glyphicon-globe"></i>Municipio
                        </span>
                        <asp:TextBox ID="txtDetMunicipio" runat="server" Width="100%" autocomplete="off" Enabled="false"></asp:TextBox>
                    </div>

                    <div class="input-group">
                        <span class="input-group-addon" style="min-width: 150px; text-align: left;">
                            <i class="glyphicon glyphicon-briefcase"></i>Profesión
                        </span>
                        <asp:TextBox ID="txtDetProfesion" runat="server" Width="100%" autocomplete="off" Enabled="false"></asp:TextBox>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon" style="min-width: 150px; text-align: left;">
                            <i class="glyphicon glyphicon-earphone"></i>Teléfono
                        </span>
                        <asp:TextBox ID="txtDetTelefono" runat="server" Width="100%" autocomplete="off" Enabled="false"></asp:TextBox>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon" style="min-width: 150px; text-align: left;">
                            <i class="glyphicon glyphicon-envelope"></i>Correo
                        </span>
                        <asp:TextBox ID="txtDetCorreo" runat="server" Width="100%" autocomplete="off" Enabled="false"></asp:TextBox>
                    </div>
                </div>
                <asp:Repeater ID="repDetalleImagenes" runat="server">
                    <ItemTemplate>
                        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12" style="padding: 10px;">
                            <asp:Label ID="lblTexto" runat="server" Text='<%# Eval("DatoImagen") %>' Font-Bold="true"></asp:Label>
                            <br />
                            IMAGEN:<br />
                            <asp:Image ID="Image" runat="server" ImageUrl='<%# Eval("ImagenUrl") %>' Style="max-width: 100%;" />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
