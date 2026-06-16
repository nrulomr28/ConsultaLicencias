<%@ Page Title="Consulta de Licencias" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Consulta.aspx.cs" Inherits="ConsultaLicencias.Consulta" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Controles/ctrlCampoValido.ascx" TagPrefix="uc1" TagName="ctrlCampoValido" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <br />

    <ajaxToolkit:TabContainer ID="TCTabs" runat="server" ActiveTabIndex="0" AutoPostBack="True" Width="100%" OnActiveTabChanged="TCTabs_ActiveTabChanged">
    
            <ajaxToolkit:TabPanel ID="TabConsulta" runat="server">
            <HeaderTemplate>Consulta</HeaderTemplate>
            <ContentTemplate>
                
                <table>
                    <tr>
                        <td>RFC</td>
                        <td>
                            <uc1:ctrlCampoValido runat="server" ID="txtRFC" WaterMark="RFC que comienza con ..." TipoUsoControlNombre="LetrasyNumeros" TipoUsoValidacion="Desactivar" ValidationGroup="vgconsulta" />
                        </td>
                        <td>Nombre(s)</td>
                        <td>
                            <uc1:ctrlCampoValido runat="server" ID="txtNombre" TipoUsoControlNombre="SoloLetras" TipoUsoValidacion="Desactivar" ValidationGroup="vgconsulta" WaterMark="Nombre(s) que comienza con ..." />
                        </td>
                        <td>Apellido Paterno</td>
                        <td>
                            <uc1:ctrlCampoValido runat="server" ID="txtPaterno" TipoUsoControlNombre="SoloLetras" TipoUsoValidacion="Desactivar" ValidationGroup="vgconsulta" WaterMark="Apellido Paterno que comienza con ..." />
                        </td>
                        <td>Apellido Materno</td>
                        <td>
                            <uc1:ctrlCampoValido runat="server" ID="txtMaterno" TipoUsoControlNombre="SoloLetras" TipoUsoValidacion="Desactivar" ValidationGroup="vgconsulta" WaterMark="Apellido Materno que comienza con ..." />
                        </td>
                    </tr>
                    <tr>
                        <td>Código Postal</td>
                        <td>
                            <uc1:ctrlCampoValido runat="server" ID="txtCP" TipoUsoControlNombre="Numeros" TipoUsoValidacion="Desactivar" ValidationGroup="vgconsulta" WaterMark="CP que comienza con ..." />
                        </td>
                        <td>Calle</td>
                        <td>
                            <uc1:ctrlCampoValido runat="server" ID="txtCalle" TipoUsoControlNombre="LetrasyNumeros" TipoUsoValidacion="Desactivar" ValidationGroup="vgconsulta" WaterMark="Calle  que comienza con ..." />
                        </td>
                        <td>Colonia</td>
                        <td>
                            <uc1:ctrlCampoValido runat="server" ID="txtColonia" TipoUsoControlNombre="LetrasyNumeros" TipoUsoValidacion="Desactivar" ValidationGroup="vgconsulta" WaterMark="Colonia que comienza con ..." />
                        </td>
                        <td>Municipio</td>
                        <td>
                            <uc1:ctrlCampoValido runat="server" ID="txtMunicipio" TipoUsoControlNombre="SoloLetras" TipoUsoValidacion="Desactivar" ValidationGroup="vgconsulta" WaterMark="Municipio  que comienza con ..." />
                        </td>
                    </tr>
                </table>
                <asp:QueryExtender ID="QueryExtender1" runat="server" TargetControlID="edsPersonas">
                    <asp:SearchExpression DataFields="PER_RFC" SearchType="StartsWith">
                        <asp:ControlParameter ControlID="txtRFC" PropertyName="Text" />
                    </asp:SearchExpression>
                    <asp:SearchExpression DataFields="PER_NOMBRE" SearchType="StartsWith">
                        <asp:ControlParameter ControlID="txtNombre" PropertyName="Text"/>
                    </asp:SearchExpression>
                    <asp:SearchExpression DataFields="PER_APELLIDO_PATERNO" SearchType="StartsWith">
                        <asp:ControlParameter ControlID="txtPaterno" PropertyName="Text"/>
                    </asp:SearchExpression>
                    <asp:SearchExpression DataFields="PER_APELLIDO_MATERNO" SearchType="StartsWith">
                        <asp:ControlParameter ControlID="txtMaterno" PropertyName="Text"/>
                    </asp:SearchExpression>

                    <asp:SearchExpression DataFields="PER_DOM_CP" SearchType="StartsWith">
                        <asp:ControlParameter ControlID="txtCP" PropertyName="Text"/>
                    </asp:SearchExpression>
                    <asp:SearchExpression DataFields="PER_DOM_CALLE" SearchType="StartsWith">
                        <asp:ControlParameter ControlID="txtCalle" PropertyName="Text"/>
                    </asp:SearchExpression>
                    <asp:SearchExpression DataFields="C_COLONIA.DSC_COLONIA" SearchType="StartsWith">
                        <asp:ControlParameter ControlID="txtColonia" PropertyName="Text"/>
                    </asp:SearchExpression>
                    <asp:SearchExpression DataFields="C_COLONIA.C_DELEG_MUNICIPIO.DSC_DELEG_MUNICIPIO" SearchType="StartsWith">
                        <asp:ControlParameter ControlID="txtMunicipio" PropertyName="Text"/>
                    </asp:SearchExpression>

                    <asp:CustomExpression OnQuerying="QueryingRFC">
                    </asp:CustomExpression>
                    <asp:CustomExpression OnQuerying="QueryingNombre">
                    </asp:CustomExpression>
                    <asp:CustomExpression OnQuerying="QueryingPaterno">
                    </asp:CustomExpression>
                    <asp:CustomExpression OnQuerying="QueryingMaterno">
                    </asp:CustomExpression>
                    <asp:CustomExpression OnQuerying="QueryingCP">
                    </asp:CustomExpression>
                    <asp:CustomExpression OnQuerying="QueryingCalle">
                    </asp:CustomExpression>
                    <asp:CustomExpression OnQuerying="QueryingColonia">
                    </asp:CustomExpression>
                    <asp:CustomExpression OnQuerying="QueryingMunicipio">
                    </asp:CustomExpression>
                </asp:QueryExtender>

            </ContentTemplate>
        </ajaxToolkit:TabPanel>
        <ajaxToolkit:TabPanel ID="TabConsultaAvanzada" runat="server">
            <HeaderTemplate>Consultas Avanzadas</HeaderTemplate>
            <ContentTemplate>
                Puede usar comodines como % para todo y _ para una posición 
                <table>
                    <tr>
                        <td>RFC</td>
                        <td>
                            <uc1:ctrlCampoValido runat="server" ID="txtRFCav" TipoUsoControlNombre="LetrasyNumeros" TipoUsoValidacion="Desactivar" ValidationGroup="vgconsultaav" WaterMark="RFC" />
                        </td>
                        <td>Nombre(s)</td>
                        <td>
                            <uc1:ctrlCampoValido runat="server" ID="txtNombreav" TipoUsoControlNombre="LetrasyNumeros" TipoUsoValidacion="Desactivar" ValidationGroup="vgconsultaav" WaterMark="Nombre(s)"/>
                        </td>
                        <td>Paterno</td>
                        <td>
                            <uc1:ctrlCampoValido runat="server" ID="txtPaternoav" TipoUsoControlNombre="LetrasyNumeros" TipoUsoValidacion="Desactivar" ValidationGroup="vgconsultaav" WaterMark="Paterno"/>
                        </td>
                        <td>Materno</td>
                        <td>
                            <uc1:ctrlCampoValido runat="server" ID="txtMaternoav" TipoUsoControlNombre="LetrasyNumeros" TipoUsoValidacion="Desactivar" ValidationGroup="vgconsultaav" WaterMark="Materno" />
                        </td>
                    </tr>
                    <tr>
                        <td>Código Postal</td>
                        <td>
                            <uc1:ctrlCampoValido runat="server" ID="txtCPav" TipoUsoControlNombre="LetrasyNumeros" TipoUsoValidacion="Desactivar" ValidationGroup="vgconsulta" WaterMark="CP" />
                        </td>
                        <td>Calle</td>
                        <td>
                            <uc1:ctrlCampoValido runat="server" ID="txtCalleav" TipoUsoControlNombre="LetrasyNumeros" TipoUsoValidacion="Desactivar" ValidationGroup="vgconsulta" WaterMark="Calle" />
                        </td>
                        <td>Colonia</td>
                        <td>
                            <uc1:ctrlCampoValido runat="server" ID="txtColoniaav" TipoUsoControlNombre="LetrasyNumeros" TipoUsoValidacion="Desactivar" ValidationGroup="vgconsulta" WaterMark="Colonia" />
                        </td>
                        <td>Municipio</td>
                        <td>
                            <uc1:ctrlCampoValido runat="server" ID="txtMunicipioav" TipoUsoControlNombre="LetrasyNumeros" TipoUsoValidacion="Desactivar" ValidationGroup="vgconsulta" WaterMark="Municipio" />
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </ajaxToolkit:TabPanel>
         
       
    </ajaxToolkit:TabContainer>

    <br />

    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Buscar" Visible="True" />

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ID_PERSONA" DataSourceID="edsPersonas"
        GridLines="None" RowStyle-CssClass="ClassRenglonResultados" BorderStyle="None" CssClass="ClassRenglon" Visible="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:ImageButton ID="Image1" runat="server" ImageUrl='<%# "~/Imagen.ashx?IdImagen=" + Eval("ID_PERSONA") %>' Height="100px" Width="80px" CommandName ="Select" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ID_PERSONA" HeaderText="ID_PERSONA" ReadOnly="True" SortExpression="ID_PERSONA" Visible="False" />
            <asp:TemplateField HeaderText="Nombre" SortExpression="PER_NOMBRE">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("PER_NOMBRE") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("PER_NOMBRE") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="PER_APELLIDO_PATERNO" HeaderText="Paterno" SortExpression="PER_APELLIDO_PATERNO" />
            <asp:BoundField DataField="PER_APELLIDO_MATERNO" HeaderText="Materno" SortExpression="PER_APELLIDO_MATERNO" />
            <asp:BoundField DataField="PER_FCH_NACIMIENTO" HeaderText="Nacimiento" SortExpression="PER_FCH_NACIMIENTO" DataFormatString="{0:d}" />
            <asp:BoundField DataField="PER_RFC" HeaderText="Rfc" SortExpression="PER_RFC" />
            <asp:BoundField DataField="PER_CURP" HeaderText="Curp" SortExpression="PER_CURP" />
            <asp:BoundField DataField="PER_ESTATURA" HeaderText="Estatura" SortExpression="PER_ESTATURA" />
            <asp:BoundField DataField="PER_DOM_CALLE" HeaderText="Calle" SortExpression="PER_DOM_CALLE" />
            <asp:BoundField DataField="PER_DOM_NUM_EXT" HeaderText="Num Ext" SortExpression="PER_DOM_NUM_EXT" />
            <asp:BoundField DataField="PER_DOM_NUM_INT" HeaderText="Num Int" SortExpression="PER_DOM_NUM_INT" />
            <asp:TemplateField HeaderText="COLONIA" SortExpression="ID_COLONIA">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("C_COLONIA.DSC_COLONIA") %>' ID="Label1"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="PER_DOM_REF_ADIC" HeaderText="Referencia Adicional" SortExpression="PER_DOM_REF_ADIC" />
            <asp:BoundField DataField="C_COLONIA.C_DELEG_MUNICIPIO.DSC_DELEG_MUNICIPIO" HeaderText="Municipio" SortExpression="C_COLONIA.C_DELEG_MUNICIPIO.DSC_DELEG_MUNICIPIO" />
            <asp:BoundField DataField="PER_DOM_CP" HeaderText="CP" SortExpression="PER_DOM_CP" />
            <asp:BoundField DataField="C_PROFESION.DSC_PROFESION" HeaderText="Profesión" SortExpression="C_PROFESION" />
            <asp:TemplateField HeaderText="SEXO" SortExpression="ID_SEXO">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("ID_SEXO") == null ? "" :  Eval("ID_SEXO").Equals(1) ? "Masculino" : Eval("ID_SEXO").Equals(2) ? "Femenino" : "No especificado" %>' ID="lblGridSexo"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="C_ESTADO_CIVIL.DSC_ESTADO_CIVIL" HeaderText="Estado Civil" SortExpression="C_ESTADO_CIVIL.DSC_ESTADO_CIVIL"  />
            <asp:BoundField DataField="PER_TELEFONO" HeaderText="Tel&#233;fono" SortExpression="PER_TELEFONO" />
            <asp:TemplateField HeaderText="Dona Organos" SortExpression="DONA_ORGANOS">
                <ItemTemplate>
                    <asp:Label ID="lblDonador" runat="server" Text='<%# (Boolean.Parse(Eval("DONA_ORGANOS") == null ? "false" : Eval("DONA_ORGANOS").ToString() ) ) ? "Donador" : "No donador" %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="PER_SENAS_PART" HeaderText="Señas Part" SortExpression="PER_SENAS_PART" />
            <asp:BoundField DataField="PER_CORREO" HeaderText="Correo" SortExpression="PER_CORREO" />
            
            <asp:BoundField DataField="PER_NOTAS" HeaderText="Nota" SortExpression="PER_NOTAS" />
            <asp:BoundField DataField="PER_IFE" HeaderText="IFE" SortExpression="PER_IFE" />
            <%--        
            
            
            <asp:BoundField DataField="ID_NACIONALIDAD" HeaderText="ID_NACIONALIDAD" SortExpression="ID_NACIONALIDAD" Visible="false" />
            <asp:BoundField DataField="ID_TIPO_SANGRE" HeaderText="ID_TIPO_SANGRE" SortExpression="ID_TIPO_SANGRE" Visible="false" />
            <asp:BoundField DataField="ID_INSTITUCION" HeaderText="ID_INSTITUCION" SortExpression="ID_INSTITUCION" Visible="false" />    
            <asp:BoundField DataField="ID_ENTIDAD_NACIMIENTO" HeaderText="ID_ENTIDAD_NACIMIENTO" SortExpression="ID_ENTIDAD_NACIMIENTO" Visible="false" />
            <asp:CheckBoxField DataField="PER_CURP_CORRECTO" HeaderText="PER_CURP_CORRECTO" SortExpression="PER_CURP_CORRECTO" Visible="false" />
            <asp:CheckBoxField DataField="PER_RFC_CORRECTO" HeaderText="Rfc Correcto" SortExpression="PER_RFC_CORRECTO" Visible="false" />
            <asp:CheckBoxField DataField="PER_IFE_CORRECTO" HeaderText="Ife Correcto" SortExpression="PER_IFE_CORRECTO" Visible="false" />
            <asp:BoundField DataField="ID_TIPO_TELEFONO" HeaderText="ID_TIPO_TELEFONO" SortExpression="ID_TIPO_TELEFONO" Visible="false" />
            <asp:BoundField DataField="PER_TELEFONO_LADA" HeaderText="PER_TELEFONO_LADA" SortExpression="PER_TELEFONO_LADA" Visible="false" />
            <asp:BoundField DataField="FCH_CREACION" HeaderText="Creación" SortExpression="FCH_CREACION" Visible="false" />
            <asp:CheckBoxField DataField="DATOS_VALIDADOS" HeaderText="DATOS_VALIDADOS" SortExpression="DATOS_VALIDADOS" Visible="false" />
            <asp:BoundField DataField="ID_D_CURSO" HeaderText="ID_D_CURSO" SortExpression="ID_D_CURSO" Visible="false" />
            <asp:BoundField DataField="PER_DOM_CP_SEPOMEX" HeaderText="Cp SEPOMEX" SortExpression="PER_DOM_CP_SEPOMEX" />
            <asp:BoundField DataField="ID_PAIS_NACIMIENTO" HeaderText="ID_PAIS_NACIMIENTO" SortExpression="ID_PAIS_NACIMIENTO" Visible="false" />
            <asp:BoundField DataField="ID_RESTRICCIONES_FISICAS" HeaderText="ID_RESTRICCIONES_FISICAS" SortExpression="ID_RESTRICCIONES_FISICAS" Visible="false" />
            <asp:BoundField DataField="ID_BOCA" HeaderText="ID_BOCA" SortExpression="ID_BOCA" Visible="false" />
            <asp:BoundField DataField="ID_CABELLO" HeaderText="ID_CABELLO" SortExpression="ID_CABELLO" Visible="false" />
            <asp:BoundField DataField="ID_CARA" HeaderText="ID_CARA" SortExpression="ID_CARA" Visible="false" />
            <asp:BoundField DataField="ID_COMPLEXION" HeaderText="ID_COMPLEXION" SortExpression="ID_COMPLEXION" Visible="false" />
            <asp:BoundField DataField="ID_NARIZ" HeaderText="ID_NARIZ" SortExpression="ID_NARIZ" Visible="false" />
            <asp:BoundField DataField="ID_OJOS" HeaderText="ID_OJOS" SortExpression="ID_OJOS" Visible="false" />
            <asp:BoundField DataField="ID_PIEL" HeaderText="ID_PIEL" SortExpression="ID_PIEL" Visible="false" />
            <asp:BoundField DataField="TUT_APELLIDO_PATERNO" HeaderText="Paterno Tutor" SortExpression="TUT_APELLIDO_PATERNO" />
            <asp:BoundField DataField="TUT_APELLIDO_MATERNO" HeaderText="Materno Tutor" SortExpression="TUT_APELLIDO_MATERNO" />
            <asp:BoundField DataField="TUT_NOMBRE" HeaderText="Nombre Tutor" SortExpression="TUT_NOMBRE" />
            <asp:BoundField DataField="ora_modif_MvCrdl_prsIgu1" HeaderText="ora_modif_MvCrdl_prsIgu1" SortExpression="ora_modif_MvCrdl_prsIgu1" Visible="false" />
            <asp:CheckBoxField DataField="ora_modif_MvCrdl_i1" HeaderText="ora_modif_MvCrdl_i1" SortExpression="ora_modif_MvCrdl_i1" Visible="false" />
            <asp:BoundField DataField="ora_modif_MvCrdl_prsMig1" HeaderText="ora_modif_MvCrdl_prsMig1" SortExpression="ora_modif_MvCrdl_prsMig1" Visible="false" />
            <asp:BoundField DataField="ora_modif_MvCrdl_FchAct" HeaderText="ora_modif_MvCrdl_FchAct" SortExpression="ora_modif_MvCrdl_FchAct" Visible="false" />
            <asp:BoundField DataField="ora_modif_MvCrdl_FchHis" HeaderText="ora_modif_MvCrdl_FchHis" SortExpression="ora_modif_MvCrdl_FchHis" Visible="false" />
            <asp:CheckBoxField DataField="ora_modif_MvCrdl_SeSusti" HeaderText="ora_modif_MvCrdl_SeSusti" SortExpression="ora_modif_MvCrdl_SeSusti" Visible="false" />--%>
        </Columns>

<RowStyle CssClass="ClassRenglonResultados"></RowStyle>
        <SelectedRowStyle BackColor="#FFFF99" />
    </asp:GridView>

    <asp:EntityDataSource ID="edsPersonas" runat="server" ConnectionString="name=SILCVEREntities" DefaultContainerName="SILCVEREntities" EnableFlattening="False"
        EntitySetName="C_PERSONA" Include="C_COLONIA, C_COLONIA.C_DELEG_MUNICIPIO, C_ESTADO_CIVIL, C_PROFESION, C_RESTRICCIONES_FISICAS">
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="EntityDataSourcePersonaSeleccionada" runat="server" ConnectionString="name=SILCVEREntities" DefaultContainerName="SILCVEREntities" EnableFlattening="False"
        EntitySetName="C_PERSONA" Include="C_COLONIA, C_COLONIA.C_DELEG_MUNICIPIO, C_ESTADO_CIVIL, C_PROFESION, C_RESTRICCIONES_FISICAS, C_PERSONA_DOC" AutoGenerateWhereClause="True" EntityTypeFilter="" Select="" Where="" OnSelected="EntityDataSourcePersonaSeleccionada_Selected" >
        <WhereParameters>
            <asp:ControlParameter ControlID="GridView1" Name="ID_PERSONA" PropertyName="SelectedValue" />
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:Panel ID="Panel1" runat="server" Visible ="true" >
        <br />
        <asp:Image ID="Imagen1" runat="server"  />
        <br />
        <asp:Image ID="Imagen2" runat="server"  />
        <br />
        <asp:Image ID="Imagen3" runat="server"  />


    </asp:Panel>


    <asp:FormView ID="fvPersonas" runat="server" DataKeyNames="ID_PERSONA" DataSourceID="EntityDataSourcePersonaSeleccionada" Visible ="false" >        
        <ItemTemplate>
            ID_PERSONA:
            <asp:Label ID="ID_PERSONALabel" runat="server" Text='<%# Eval("ID_PERSONA") %>' />
            <br />
            PER_NOMBRE:
            <asp:Label ID="PER_NOMBRELabel" runat="server" Text='<%# Bind("PER_NOMBRE") %>' />
            <br />
            PER_APELLIDO_PATERNO:
            <asp:Label ID="PER_APELLIDO_PATERNOLabel" runat="server" Text='<%# Bind("PER_APELLIDO_PATERNO") %>' />
            <br />
            PER_APELLIDO_MATERNO:
            <asp:Label ID="PER_APELLIDO_MATERNOLabel" runat="server" Text='<%# Bind("PER_APELLIDO_MATERNO") %>' />
            <br />
            PER_FCH_NACIMIENTO:
            <asp:Label ID="PER_FCH_NACIMIENTOLabel" runat="server" Text='<%# Bind("PER_FCH_NACIMIENTO") %>' />
            <br />
            PER_RFC:
            <asp:Label ID="PER_RFCLabel" runat="server" Text='<%# Bind("PER_RFC") %>' />
            <br />
            PER_CURP:
            <asp:Label ID="PER_CURPLabel" runat="server" Text='<%# Bind("PER_CURP") %>' />
            <br />
            PER_DOM_CALLE:
            <asp:Label ID="PER_DOM_CALLELabel" runat="server" Text='<%# Bind("PER_DOM_CALLE") %>' />
            <br />
            PER_DOM_NUM_EXT:
            <asp:Label ID="PER_DOM_NUM_EXTLabel" runat="server" Text='<%# Bind("PER_DOM_NUM_EXT") %>' />
            <br />
            PER_DOM_NUM_INT:
            <asp:Label ID="PER_DOM_NUM_INTLabel" runat="server" Text='<%# Bind("PER_DOM_NUM_INT") %>' />
            <br />
            PER_DOM_REF_ADIC:
            <asp:Label ID="PER_DOM_REF_ADICLabel" runat="server" Text='<%# Bind("PER_DOM_REF_ADIC") %>' />
            <br />
            PER_DOM_CP:
            <asp:Label ID="PER_DOM_CPLabel" runat="server" Text='<%# Bind("PER_DOM_CP") %>' />
            <br />
            COLONIA:
            <asp:Label runat="server" Text='<%# Eval("C_COLONIA.DSC_COLONIA") %>' ID="LabelColonia"></asp:Label>
            <asp:Label ID="ID_COLONIALabel" runat="server" Text='<%# Bind("ID_COLONIA") %>' />
            <br />
            ID_DELEG_MUNICIPIO:
            <asp:Label ID="ID_DELEG_MUNICIPIOLabel" runat="server" Text='<%# Bind("ID_DELEG_MUNICIPIO") %>' />
            <br />
            ID_ESTADO:
            <asp:Label ID="ID_ESTADOLabel" runat="server" Text='<%# Bind("ID_ESTADO") %>' />
            <br />
            ID_SEXO:
            <asp:Label ID="ID_SEXOLabel" runat="server" Text='<%# Bind("ID_SEXO") %>' />
            <br />
            ID_ESTADO_CIVIL:
            <asp:Label ID="ID_ESTADO_CIVILLabel" runat="server" Text='<%# Bind("ID_ESTADO_CIVIL") %>' />
            <br />
            PER_IFE:
            <asp:Label ID="PER_IFELabel" runat="server" Text='<%# Bind("PER_IFE") %>' />
            <br />
            ID_NACIONALIDAD:
            <asp:Label ID="ID_NACIONALIDADLabel" runat="server" Text='<%# Bind("ID_NACIONALIDAD") %>' />
            <br />
            ID_TIPO_SANGRE:
            <asp:Label ID="ID_TIPO_SANGRELabel" runat="server" Text='<%# Bind("ID_TIPO_SANGRE") %>' />
            <br />
            ID_INSTITUCION:
            <asp:Label ID="ID_INSTITUCIONLabel" runat="server" Text='<%# Bind("ID_INSTITUCION") %>' />
            <br />
            PER_TELEFONO:
            <asp:Label ID="PER_TELEFONOLabel" runat="server" Text='<%# Bind("PER_TELEFONO") %>' />
            <br />
            PER_NOTAS:
            <asp:Label ID="PER_NOTASLabel" runat="server" Text='<%# Bind("PER_NOTAS") %>' />
            <br />
            ID_ENTIDAD_NACIMIENTO:
            <asp:Label ID="ID_ENTIDAD_NACIMIENTOLabel" runat="server" Text='<%# Bind("ID_ENTIDAD_NACIMIENTO") %>' />
            <br />
            PER_DOM_CP_SEPOMEX:
            <asp:Label ID="PER_DOM_CP_SEPOMEXLabel" runat="server" Text='<%# Bind("PER_DOM_CP_SEPOMEX") %>' />
            <br />
            PER_CURP_CORRECTO:
            <asp:CheckBox ID="PER_CURP_CORRECTOCheckBox" runat="server" Checked='<%# Bind("PER_CURP_CORRECTO") %>' Enabled="false" />
            <br />
            PER_RFC_CORRECTO:
            <asp:CheckBox ID="PER_RFC_CORRECTOCheckBox" runat="server" Checked='<%# Bind("PER_RFC_CORRECTO") %>' Enabled="false" />
            <br />
            PER_IFE_CORRECTO:
            <asp:CheckBox ID="PER_IFE_CORRECTOCheckBox" runat="server" Checked='<%# Bind("PER_IFE_CORRECTO") %>' Enabled="false" />
            <br />
            PER_CORREO:
            <asp:Label ID="PER_CORREOLabel" runat="server" Text='<%# Bind("PER_CORREO") %>' />
            <br />
            ID_TIPO_TELEFONO:
            <asp:Label ID="ID_TIPO_TELEFONOLabel" runat="server" Text='<%# Bind("ID_TIPO_TELEFONO") %>' />
            <br />
            PER_TELEFONO_LADA:
            <asp:Label ID="PER_TELEFONO_LADALabel" runat="server" Text='<%# Bind("PER_TELEFONO_LADA") %>' />
            <br />
            FCH_CREACION:
            <asp:Label ID="FCH_CREACIONLabel" runat="server" Text='<%# Bind("FCH_CREACION") %>' />
            <br />
            DATOS_VALIDADOS:
            <asp:CheckBox ID="DATOS_VALIDADOSCheckBox" runat="server" Checked='<%# Bind("DATOS_VALIDADOS") %>' Enabled="false" />
            <br />
            ID_D_CURSO:
            <asp:Label ID="ID_D_CURSOLabel" runat="server" Text='<%# Bind("ID_D_CURSO") %>' />
            <br />
            ID_PROFESION:
            <asp:Label ID="ID_PROFESIONLabel" runat="server" Text='<%# Bind("ID_PROFESION") %>' />
            <br />
            ID_PAIS_NACIMIENTO:
            <asp:Label ID="ID_PAIS_NACIMIENTOLabel" runat="server" Text='<%# Bind("ID_PAIS_NACIMIENTO") %>' />
            <br />
            DONA_ORGANOS:
            <asp:CheckBox ID="DONA_ORGANOSCheckBox" runat="server" Checked='<%# Bind("DONA_ORGANOS") %>' Enabled="false" />
            <br />
            ID_RESTRICCIONES_FISICAS:
            <asp:Label ID="ID_RESTRICCIONES_FISICASLabel" runat="server" Text='<%# Bind("ID_RESTRICCIONES_FISICAS") %>' />
            <br />
            ID_BOCA:
            <asp:Label ID="ID_BOCALabel" runat="server" Text='<%# Bind("ID_BOCA") %>' />
            <br />
            ID_CABELLO:
            <asp:Label ID="ID_CABELLOLabel" runat="server" Text='<%# Bind("ID_CABELLO") %>' />
            <br />
            ID_CARA:
            <asp:Label ID="ID_CARALabel" runat="server" Text='<%# Bind("ID_CARA") %>' />
            <br />
            ID_COMPLEXION:
            <asp:Label ID="ID_COMPLEXIONLabel" runat="server" Text='<%# Bind("ID_COMPLEXION") %>' />
            <br />
            ID_NARIZ:
            <asp:Label ID="ID_NARIZLabel" runat="server" Text='<%# Bind("ID_NARIZ") %>' />
            <br />
            ID_OJOS:
            <asp:Label ID="ID_OJOSLabel" runat="server" Text='<%# Bind("ID_OJOS") %>' />
            <br />
            ID_PIEL:
            <asp:Label ID="ID_PIELLabel" runat="server" Text='<%# Bind("ID_PIEL") %>' />
            <br />
            PER_ESTATURA:
            <asp:Label ID="PER_ESTATURALabel" runat="server" Text='<%# Bind("PER_ESTATURA") %>' />
            <br />
            PER_SENAS_PART:
            <asp:Label ID="PER_SENAS_PARTLabel" runat="server" Text='<%# Bind("PER_SENAS_PART") %>' />
            <br />
            TUT_APELLIDO_PATERNO:
            <asp:Label ID="TUT_APELLIDO_PATERNOLabel" runat="server" Text='<%# Bind("TUT_APELLIDO_PATERNO") %>' />
            <br />
            TUT_APELLIDO_MATERNO:
            <asp:Label ID="TUT_APELLIDO_MATERNOLabel" runat="server" Text='<%# Bind("TUT_APELLIDO_MATERNO") %>' />
            <br />
            TUT_NOMBRE:
            <asp:Label ID="TUT_NOMBRELabel" runat="server" Text='<%# Bind("TUT_NOMBRE") %>' />
            <br />
            ora_modif_MvCrdl_prsIgu1:
            <asp:Label ID="ora_modif_MvCrdl_prsIgu1Label" runat="server" Text='<%# Bind("ora_modif_MvCrdl_prsIgu1") %>' />
            <br />
            ora_modif_MvCrdl_i1:
            <asp:CheckBox ID="ora_modif_MvCrdl_i1CheckBox" runat="server" Checked='<%# Bind("ora_modif_MvCrdl_i1") %>' Enabled="false" />
            <br />
            ora_modif_MvCrdl_prsMig1:
            <asp:Label ID="ora_modif_MvCrdl_prsMig1Label" runat="server" Text='<%# Bind("ora_modif_MvCrdl_prsMig1") %>' />
            <br />
            ora_modif_MvCrdl_FchAct:
            <asp:Label ID="ora_modif_MvCrdl_FchActLabel" runat="server" Text='<%# Bind("ora_modif_MvCrdl_FchAct") %>' />
            <br />
            ora_modif_MvCrdl_FchHis:
            <asp:Label ID="ora_modif_MvCrdl_FchHisLabel" runat="server" Text='<%# Bind("ora_modif_MvCrdl_FchHis") %>' />
            <br />
            ora_modif_MvCrdl_SeSusti:
            <asp:CheckBox ID="ora_modif_MvCrdl_SeSustiCheckBox" runat="server" Checked='<%# Bind("ora_modif_MvCrdl_SeSusti") %>' Enabled="false" />
            <br />
            C_PERSONA_IMG:
            <asp:Label ID="C_PERSONA_IMGLabel" runat="server" Text='<%# Bind("C_PERSONA_IMG") %>' />
            <br />
            C_PERSONA_DOC:
            <asp:Label ID="C_PERSONA_DOCLabel" runat="server" Text='<%# Bind("C_PERSONA_DOC") %>' />
            <br />
            C_COLONIA:
            <asp:Label ID="C_COLONIALabel" runat="server" Text='<%# Bind("C_COLONIA") %>' />
            <br />
            C_ESTADO_CIVIL:
            <asp:Label ID="C_ESTADO_CIVILLabel" runat="server" Text='<%# Bind("C_ESTADO_CIVIL") %>' />
            <br />
            C_PROFESION:
            <asp:Label ID="C_PROFESIONLabel" runat="server" Text='<%# Bind("C_PROFESION") %>' />
            <br />
            C_RESTRICCIONES_FISICAS:
            <asp:Label ID="C_RESTRICCIONES_FISICASLabel" runat="server" Text='<%# Bind("C_RESTRICCIONES_FISICAS") %>' />
            <br />

        </ItemTemplate>
    </asp:FormView>
    <br />
</asp:Content>
