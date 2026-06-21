<%@ Page Title="Consulta de Licencias" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ConsultaHistorico.aspx.cs" Inherits="ConsultaLicencias.Consulta" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Controles/ctrlCampoValido.ascx" TagPrefix="uc1" TagName="ctrlCampoValido" %>

<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">    

           <div class="busqueda-card">

    <h2>Consulta Histórica</h2>

    <p>
        Busque por CURP, RFC, nombre o apellidos.
    </p>

    <asp:TextBox
        ID="txtBusqueda"
        runat="server"
        CssClass="txt-busqueda" />

    <asp:Button
        ID="btnBuscar"
        runat="server"
        Text="Buscar"
        CssClass="btn-buscar"
        OnClick="btnBuscar_Click" />

</div>
    

    <asp:GridView
    ID="gvBusqueda"
    runat="server"
    AutoGenerateColumns="False"
    DataKeyNames="IdPersona"
    CssClass="grid-modern"
    AllowPaging="True"
    Visible="False"
    OnSelectedIndexChanged="gvBusqueda_SelectedIndexChanged">

    <Columns>

        <asp:TemplateField HeaderText="">
            <ItemTemplate>

                <asp:ImageButton
                    ID="imgPersona"
                    runat="server"
                    Height="80px"
                    Width="65px"
                    CommandName="Select"
                    CssClass="foto-persona"
                    ImageUrl='<%# Page.ResolveUrl("~/Infrastructure/Handlers/ImageHandler.ashx?IdImagen=" + Eval("IdPersona")) %>' />

            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Ciudadano">
            <ItemTemplate>

                <div class="persona-nombre">
                    <%# Eval("Nombre") %>
                    <%# Eval("ApellidoPaterno") %>
                    <%# Eval("ApellidoMaterno") %>
                </div>

                <div class="persona-rfc">
                    RFC: <%# Eval("RFC") %>
                </div>

                <div class="persona-curp">
                    CURP: <%# Eval("CURP") %>
                </div>

            </ItemTemplate>
        </asp:TemplateField>

        <asp:BoundField
            DataField="Municipio"
            HeaderText="Municipio" />

        <asp:TemplateField HeaderText="">
            <ItemTemplate>

                <asp:LinkButton
                    ID="btnSeleccionar"
                    runat="server"
                    CommandName="Select"
                    CssClass="btn-detalle"
                    Text="Ver detalle" />

            </ItemTemplate>
        </asp:TemplateField>

    </Columns>

</asp:GridView>
    
    <asp:EntityDataSource ID="EntityDataSourcePersonaSeleccionada" runat="server" ConnectionString="name=SILCVEREntities" DefaultContainerName="SILCVEREntities" EnableFlattening="False"
        EntitySetName="C_PERSONA" Include="C_COLONIA, C_COLONIA.C_DELEG_MUNICIPIO, C_ESTADO_CIVIL, C_PROFESION, C_RESTRICCIONES_FISICAS, C_PERSONA_DOC" AutoGenerateWhereClause="True" EntityTypeFilter="" Select="" Where="" OnSelected="EntityDataSourcePersonaSeleccionada_Selected" >
        <WhereParameters>
            <asp:ControlParameter ControlID="gvBusqueda" Name="ID_PERSONA" PropertyName="SelectedValue" />
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


    <%--<asp:FormView ID="fvPersonas" runat="server" DataKeyNames="ID_PERSONA" DataSourceID="EntityDataSourcePersonaSeleccionada" Visible ="false" >        
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
    </asp:FormView>--%>
    
</asp:Content>
