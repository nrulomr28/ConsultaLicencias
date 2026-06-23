using ConsultaLicencias.Services;
using System;
using System.IO;
using System.IO.Compression;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace ConsultaLicencias
{
    public partial class Consulta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gvBusqueda.Visible = false;
                Panel1.Visible = false;
            }
        }

        protected void btnBuscar_Click(
            object sender,
            EventArgs e)
        {
            string criterio =
                txtBusqueda.Text.Trim();

            var service =
                new PersonaBusquedaService();

            var resultados =
                service.Buscar(criterio);

            gvBusqueda.DataSource = resultados;
            gvBusqueda.DataBind();

            gvBusqueda.Visible = resultados.Any();

            Panel1.Visible = false;
        }


        protected void TCTabs_ActiveTabChanged(object sender, EventArgs e)
        {
            //VisualizarGrids();
        }

        protected void VisualizarGrids()
        {
            //AjaxControlToolkit.TabContainer Tabs = TCTabs;
            //if (Tabs.ActiveTab.ID.Equals("TabConsulta"))
            //{
            //    GridView1.DataSourceID = "edsPersonas";
            //    GridView1.DataBind();
            //}            
        }



        protected void gvBusqueda_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (gvBusqueda.SelectedIndex < 0)
            {
                Panel1.Visible = false;
                return;
            }

            Panel1.Visible = true;

            string idPersona =
                gvBusqueda.SelectedDataKey.Value.ToString();

            Imagen1.ImageUrl =
                    ResolveUrl(
                    $"~/Infrastructure/Handlers/DocumentoHandler.ashx?IdPersona={idPersona}&IdTipoDocto=1");

            Imagen2.ImageUrl =
                ResolveUrl(
                    $"~/Infrastructure/Handlers/DocumentoHandler.ashx?IdPersona={idPersona}&IdTipoDocto=2");

            Imagen3.ImageUrl =
                ResolveUrl(
                    $"~/Infrastructure/Handlers/DocumentoHandler.ashx?IdPersona={idPersona}&IdTipoDocto=14");
        }

        protected void EntityDataSourcePersonaSeleccionada_Selected(
           object sender,
           EntityDataSourceSelectedEventArgs e)
        {
        }


        protected void gvBusqueda_RowCommand(
                object sender,
                GridViewCommandEventArgs e)
        {
            if (e.CommandName != "DescargarZip")
            {
                return;
            }

            int idPersona = Convert.ToInt32(
                e.CommandArgument);

            DescargarExpedienteZip(idPersona);
        }

        private void DescargarExpedienteZip(
                int idPersona)
        {
            using (var contexto = new SILCVEREntities())
            {
                var persona = contexto.C_PERSONA
                    .FirstOrDefault(x =>
                        x.ID_PERSONA == idPersona);

                if (persona == null)
                {
                    return;
                }

                string carpetaTemporal =
                    Path.Combine(
                        Path.GetTempPath(),
                        Guid.NewGuid().ToString());

                Directory.CreateDirectory(
                    carpetaTemporal);

                try
                {
                    GenerarZipPersona(
                        contexto,
                        persona,
                        carpetaTemporal);

                    string archivoZip =
                        carpetaTemporal + ".zip";

                    ZipFile.CreateFromDirectory(
                        carpetaTemporal,
                        archivoZip);

                    Response.Clear();

                    Response.ContentType =
                        "application/zip";

                    Response.AddHeader(
                        "content-disposition",
                        $"attachment; filename=Expediente_{idPersona}.zip");

                    Response.TransmitFile(
                        archivoZip);

                    Response.Flush();
                    HttpContext.Current.ApplicationInstance.CompleteRequest();
                }
                finally
                {
                    if (Directory.Exists(
                        carpetaTemporal))
                    {
                        Directory.Delete(
                            carpetaTemporal,
                            true);
                    }
                }
            }
        }

        private void GenerarZipPersona(
                SILCVEREntities contexto,
                C_PERSONA persona,
                string carpeta)
        {
                var imagenes = contexto.C_PERSONA_IMG
                    .Where(x =>
                    x.ID_PERSONA == persona.ID_PERSONA)
                    .ToList();

            int contador = 1;

            foreach (var img in imagenes)
            {
                if (img.IMG_FOTO != null)
                {
                    File.WriteAllBytes(
                        Path.Combine(
                            carpeta,
                            $"Foto_{contador}.jpg"),
                        img.IMG_FOTO);
                }

                if (img.IMG_FIRMA != null)
                {
                    File.WriteAllBytes(
                        Path.Combine(
                            carpeta,
                            $"Firma_{contador}.jpg"),
                        img.IMG_FIRMA);
                }

                contador++;
            }

            var documentos = contexto.C_PERSONA_DOC
                .Where(x =>
                    x.ID_PERSONA == persona.ID_PERSONA)
                .ToList();

            contador = 1;

            foreach (var doc in documentos)
            {
                if (doc.DOC_IMAGEN == null)
                {
                    continue;
                }

                File.WriteAllBytes(
                    Path.Combine(
                        carpeta,
                        $"Documento_{contador}.jpg"),
                    doc.DOC_IMAGEN);

                contador++;
            }

            File.WriteAllText(
                Path.Combine(carpeta, "Datos.txt"),
                    $@"Nombre: {persona.PER_NOMBRE} {persona.PER_APELLIDO_PATERNO} {persona.PER_APELLIDO_MATERNO}
                    CURP: {persona.PER_CURP}
                    RFC: {persona.PER_RFC}

                    Dirección:
                    {persona.PER_DOM_CALLE} #{persona.PER_DOM_NUM_EXT}
                    {persona.C_COLONIA?.DSC_COLONIA}
                    {persona.C_COLONIA?.C_DELEG_MUNICIPIO?.DSC_DELEG_MUNICIPIO}
                    CP: {persona.PER_DOM_CP}

                    Teléfono: {persona.PER_TELEFONO}
                    Correo: {persona.PER_CORREO}");
        }
    }
}