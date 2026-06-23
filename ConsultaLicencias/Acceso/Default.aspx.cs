using System;

using System.Web.UI;


namespace ConsultaLicencias.Acceso
{
    public partial class _Default : Page
    {
        protected void Page_Load(
           object sender,
           EventArgs e)
        {
            if (!IsPostBack
            &&
            User != null
            &&
            User.Identity != null
            &&
            User.Identity.IsAuthenticated)
            {
                Response.Redirect(
                    "~/Consultas/ConsultaHistorico.aspx",
                    false);
            }
        }
    }
}