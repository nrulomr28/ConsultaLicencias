using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ConsultaLicencias.Test
{
    public partial class TestImages : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ConsultarYMostrar();
        }
        public class IMAGENPRO
        {
            public string Imagen { get; set; }
            public string Dato { get; set; }
        }
        protected void ConsultarYMostrar()
        {
            SILCVEREntities ctx = new SILCVEREntities();
            List<vLicencias_Imagen_New> imags = ctx.vLicencias_Imagen_New.Where(i => i.ID_ALTERNA == 1037).ToList();
            vLicencias_NEW D = ctx.vLicencias_NEW.Where(l => l.ID_ALTERNA == 1037).FirstOrDefault();
            if (D != null)
            {
                Label1.Text = $"{D.NOMBRECOND} {D.APELLIDOPA} {D.APELLIDOMA}";
                Label2.Text = $"{D.RFC}";
            }
            List<IMAGENPRO> Imagenes = new List<IMAGENPRO>();
            foreach (vLicencias_Imagen_New im in imags)
            {
                Imagenes.Add(new IMAGENPRO() { 
                    Imagen = "data:image/png;base64," + Convert.ToBase64String(im.IMAGEN),
                    Dato = $"TIPO: {im.ID_TIPO_IMAGEN}" });
            }
            repImages.DataSource = Imagenes;
            repImages.DataBind();
        }
    }
}