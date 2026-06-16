using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ConsultaLicencias.Controles
{
    public partial class ctrlCampoValido : System.Web.UI.UserControl
    {
        public enum DesactivaValidacion { Activar, Desactivar }
        private DesactivaValidacion tipoActivacion;
        public enum TipoUsoNombre { SoloLetras, LetrasyNumeros, Numeros, Correo }
        private TipoUsoNombre tipocontrol;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (TipoUsoControlNombre.Equals(TipoUsoNombre.LetrasyNumeros))
            {
                TextBox1_FilteredTextBoxExtender.ValidChars = "aáAÁbBcCdDeéEÉfFgGhHiíIÍjJkKlLmMnNñÑoóOÓpPqQrRsStTuúUÚvVwWxXyYzZ._ ´0123456789";
            }
            else
                if (TipoUsoControlNombre.Equals(TipoUsoNombre.SoloLetras))
                {
                    TextBox1_FilteredTextBoxExtender.ValidChars = "aáAÁbBcCdDeéEÉfFgGhHiíIÍjJkKlLmMnNñÑoóOÓpPqQrRsStTuúUÚvVwWxXyYzZ. ´";
                }
                else
                    if (TipoUsoControlNombre.Equals(TipoUsoNombre.Numeros))
                    {
                        TextBox1_FilteredTextBoxExtender.ValidChars = ".0123456789";
                    }
                    else
                        if (TipoUsoControlNombre.Equals(TipoUsoNombre.Correo))
                        {
                            TextBox1_FilteredTextBoxExtender.ValidChars = "aAbBcCdDeEfFgGhHiIjJkKlLmMnNñÑoOpPqQrRsStTuUvVwWxXyYzZ.@";
                            revCorreo.Enabled = true;
                        }

            if (tipoActivacion.Equals(DesactivaValidacion.Activar))
            {
                RequiredFieldValidator1.Enabled = true;
            }
            if (tipoActivacion.Equals(DesactivaValidacion.Desactivar))
            {
                RequiredFieldValidator1.Enabled = false;
            }

            if (!ValidationGroup.Equals(string.Empty))
            {
                TextBox1.ValidationGroup = this.ValidationGroup;
                RequiredFieldValidator1.ValidationGroup = this.ValidationGroup;
            }
        }

        public TipoUsoNombre TipoUsoControlNombre
        {
            get { return tipocontrol; }
            set { tipocontrol = value; }

        }

        public string Text
        {
            get
            {
                return TextBox1.Text;
            }
            set
            {
                TextBox1.Text = value;
            }
        }

        public string WaterMark
        {

            get
            {
                return TextBoxWatermarkExtender1.WatermarkText;
            }
            set
            {
                TextBoxWatermarkExtender1.WatermarkText = value;
            }
        }

        public DesactivaValidacion TipoUsoValidacion
        {
            get { return tipoActivacion; }
            set { tipoActivacion = value; }
        }

        public string ValidationGroup
        {
            get
            {

                if (Session[this.UniqueID.ToString() + "VG"] == null)
                {
                    Session[this.UniqueID.ToString() + "VG"] = string.Empty;
                }
                return (string)Session[this.UniqueID.ToString() + "VG"];
            }
            set
            {
                Session[this.UniqueID.ToString() + "VG"] = value;
            }
        }

    }

}