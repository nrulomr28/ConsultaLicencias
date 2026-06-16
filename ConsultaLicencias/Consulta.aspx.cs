using System;
using System.Collections.Generic;
using System.Data.Entity.SqlServer;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.Expressions;

namespace ConsultaLicencias
{
    public partial class Consulta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               // GridView1.Visible = !(txtNombre.Text.Equals(string.Empty) && txtPaterno.Text.Equals(string.Empty) && txtMaterno.Text.Equals(string.Empty) && txtRFC.Text.Equals(string.Empty));
            }
            //GridView2.Visible = !(txtNombreav.Text.Equals(string.Empty) && txtPaternoav.Text.Equals(string.Empty) && txtMaternoav.Text.Equals(string.Empty) && txtRFCav.Text.Equals(string.Empty));
        }
        

        protected void Button2_Click(object sender, EventArgs e)
        {
            GridView1.DataBind();
            GridView1.Visible = true;
            this.Panel1.Visible = false;

            
        }

        protected void QueryingRFC(object sender, CustomExpressionEventArgs e)
        {
            if (!txtRFCav.Text.Equals(string.Empty))
            {
                e.Query = from p in e.Query.Cast<C_PERSONA>()
                          where (SqlFunctions.PatIndex(txtRFCav.Text + "%", p.PER_RFC) > 0)
                          select p;
                GridView1.Visible = true;
            }
        }
        protected void QueryingNombre(object sender, CustomExpressionEventArgs e)
        {
            if (!txtNombreav.Text.Equals(string.Empty))
            {
                e.Query = from p in e.Query.Cast<C_PERSONA>()
                          where (SqlFunctions.PatIndex(txtNombreav.Text + "%", p.PER_NOMBRE) > 0)
                          select p;
                GridView1.Visible = true;
            }
        }
        protected void QueryingPaterno(object sender, CustomExpressionEventArgs e)
        {
            if (!txtPaternoav.Text.Equals(string.Empty))
            {
                e.Query = from p in e.Query.Cast<C_PERSONA>()
                          where (SqlFunctions.PatIndex(txtPaternoav.Text + "%", p.PER_APELLIDO_PATERNO) > 0)
                          select p;
                GridView1.Visible = true;
            }
        }
        protected void QueryingMaterno(object sender, CustomExpressionEventArgs e)
        {
            if (!txtMaternoav.Text.Equals(string.Empty))
            {
                e.Query = from p in e.Query.Cast<C_PERSONA>()
                          where (SqlFunctions.PatIndex(txtMaternoav.Text + "%", p.PER_APELLIDO_MATERNO) > 0)
                          select p;
                GridView1.Visible = true;
            }
        }

        protected void TCTabs_ActiveTabChanged(object sender, EventArgs e)
        {
            //VisualizarGrids();
        }

        protected void VisualizarGrids()
        {
            AjaxControlToolkit.TabContainer Tabs = TCTabs;
            if (Tabs.ActiveTab.ID.Equals("TabConsulta"))
            {
                GridView1.DataSourceID = "edsPersonas";
                GridView1.DataBind();
            }
            //else
            //    if (Tabs.ActiveTab.ID.Equals("TabConsultaAvanzada"))
            //    {

            //    }
        }

        protected void QueryingCP(object sender, CustomExpressionEventArgs e)
        {
            if (!txtCPav.Text.Equals(string.Empty))
            {
                e.Query = from p in e.Query.Cast<C_PERSONA>()
                          where (SqlFunctions.PatIndex(txtCPav.Text + "%", p.PER_DOM_CP) > 0)
                          select p;
                GridView1.Visible = true;
            }
        }

        protected void QueryingCalle(object sender, CustomExpressionEventArgs e)
        {
            if (!txtCalleav.Text.Equals(string.Empty))
            {
                e.Query = from p in e.Query.Cast<C_PERSONA>()
                          where (SqlFunctions.PatIndex(txtCalleav.Text + "%", p.PER_DOM_CALLE) > 0)
                          select p;
                GridView1.Visible = true;
            }
        }

        protected void QueryingColonia(object sender, CustomExpressionEventArgs e)
        {
            try
            {
                if (!txtColoniaav.Text.Equals(string.Empty))
                {
                    e.Query = from p in e.Query.Cast<C_PERSONA>()
                              where (SqlFunctions.PatIndex(txtColoniaav.Text + "%", p.C_COLONIA.DSC_COLONIA) > 0)
                              select p;
                    GridView1.Visible = true;
                }
            }
            catch (Exception ex)
            { ex.GetBaseException(); }
        }

        protected void QueryingMunicipio(object sender, CustomExpressionEventArgs e)
        {
            try
            {
                if (!txtMunicipioav.Text.Equals(string.Empty))
                {
                    e.Query = from p in e.Query.Cast<C_PERSONA>()
                              where (SqlFunctions.PatIndex(txtMunicipioav.Text + "%", p.C_COLONIA.C_DELEG_MUNICIPIO.DSC_DELEG_MUNICIPIO) > 0)
                              select p;
                    GridView1.Visible = true;
                }
            }
            catch (Exception ex)
            { ex.GetBaseException(); }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.GridView1.SelectedIndex > -1)
            {
                this.Panel1.Visible = true;
                string str = this.GridView1.SelectedDataKey.Value.ToString();
                this.Imagen1.ImageUrl = "ImagenDocto.ashx?IdPersona=" + str.Trim() + "&IdTipoDocto=1";
                this.Imagen2.ImageUrl = "ImagenDocto.ashx?IdPersona=" + str.Trim() + "&IdTipoDocto=2";
                this.Imagen3.ImageUrl = "ImagenDocto.ashx?IdPersona=" + str.Trim() + "&IdTipoDocto=3";
                this.Imagen3.ImageUrl = "ImagenDocto.ashx?IdPersona=" + str.Trim() + "&IdTipoDocto=5";
                this.Imagen3.ImageUrl = "ImagenDocto.ashx?IdPersona=" + str.Trim() + "&IdTipoDocto=10";
                this.Imagen3.ImageUrl = "ImagenDocto.ashx?IdPersona=" + str.Trim() + "&IdTipoDocto=11";
                this.Imagen3.ImageUrl = "ImagenDocto.ashx?IdPersona=" + str.Trim() + "&IdTipoDocto=14";
            }
            else
            {
                this.Panel1.Visible = false;
            }
        }

        protected void EntityDataSourcePersonaSeleccionada_Selected(object sender, EntityDataSourceSelectedEventArgs e)
        {
            this.fvPersonas.Visible = this.GridView1.SelectedIndex > -1;
        }

        protected void Unnamed_Querying(object sender, CustomExpressionEventArgs e)
        {
            QueryingCP(sender, e);
            QueryingRFC(sender, e);

        }

    }
}