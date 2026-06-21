using ConsultaLicencias.Services;
using System;

using System.Linq;
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


    }
}