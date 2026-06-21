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
                GridView1.Visible = false;
                Panel1.Visible = false;
            }
        }        

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            GridView1.DataBind();
            GridView1.Visible = true;
            this.Panel1.Visible = false;            
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



        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (GridView1.SelectedIndex < 0)
            {
                Panel1.Visible = false;
                return;
            }

            Panel1.Visible = true;

            string idPersona =
                GridView1.SelectedDataKey.Value.ToString();

            Imagen1.ImageUrl =
                $"ImagenDocto.ashx?IdPersona={idPersona}&IdTipoDocto=1";

            Imagen2.ImageUrl =
                $"ImagenDocto.ashx?IdPersona={idPersona}&IdTipoDocto=2";

            Imagen3.ImageUrl =
                $"ImagenDocto.ashx?IdPersona={idPersona}&IdTipoDocto=14";
        }

        protected void EntityDataSourcePersonaSeleccionada_Selected(
           object sender,
           EntityDataSourceSelectedEventArgs e)
        {
        }


    }
}