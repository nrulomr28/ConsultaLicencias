using Microsoft.Data.OData;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ConsultaLicencias
{
    public partial class ConsultaLicencias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DIV_DETALLES.Visible = false;
                msjINEXISTENTE.Visible = false;
            }
        }

        protected void btnConsultarLicencias_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtNombre.Text) || !string.IsNullOrEmpty(txtPrimerAp.Text) || !string.IsNullOrEmpty(txtSegundoAp.Text) ||
                !string.IsNullOrEmpty(txtRFC.Text)                 
                )
            {
                try
                {
                    edsLicencias.DataBind();
                    gvLicencias.DataSource = edsLicencias;
                    gvLicencias.DataBind();
                    DIV_DETALLES.Visible = false;
                    msjINEXISTENTE.Visible = false;
                }
           catch (Exception ex)
                {
                    gvLicencias.DataSource = null;
                    DIV_DETALLES.Visible = false;
                    msjINEXISTENTE.Visible = true;
                    msjINEXISTENTE.InnerText = ex.Message;  
                }
                
            }
        }
        protected void BtnLimpiarFiltros_Click(object sender, EventArgs e)
        {
            txtNombre.Text = "";
            txtPrimerAp.Text = "";
            txtSegundoAp.Text = "";
            txtRFC.Text = "";
            //txtCP.Text = "";
            //txtCalle.Text = "";
            //txtColonia.Text = "";
            //txtMunicipio.Text = "";
        }
        protected void edsLicencias_Selecting(object sender, EntityDataSourceSelectingEventArgs e)
        {
        }
        public class ImagenLicencia
        {
            public string ImagenUrl { get; set; }
            public string DatoImagen { get; set; }
        }
        protected void gvLicencias_SelectedIndexChanged(object sender, EventArgs e)
        {
            DIV_DETALLES.Visible = true;
            LlenarInformacion();
            ProgressBarModalPopupExtender.Hide();
            for (int i = 0; i < gvLicencias.Rows.Count; i++)
            {
                gvLicencias.Rows[i].BackColor = System.Drawing.Color.FromArgb(217, 218, 220);
            }
            gvLicencias.SelectedRow.BackColor = System.Drawing.Color.Wheat;
        }
        protected void LlenarInformacion()
        {
            //TryCatchear

            var Keys = this.gvLicencias.SelectedDataKey.Values;
            var ID = Keys["ID_ALTERNA"];
            var ESTATUS = Keys["ESTATUS_REGISTRO"];
            if (ID != null && ESTATUS != null && int.TryParse(ID.ToString(), out int ID_ALT) && int.TryParse(ESTATUS.ToString(), out int ID_ESTATUS))
            {
                SILCVEREntities ctx = new SILCVEREntities();
                vLicencias_UNION DatoPersona = ctx.vLicencias_UNION.Where(l => l.ID_ALTERNA == ID_ALT).FirstOrDefault();

                //string RFC = ctx.vLicencias_UNION.Where(l => l.ID_ALTERNA == ID_ALT).Select(l => l.RFC).FirstOrDefault();
                string RFC = DatoPersona.RFC;

                /*LLENAR INFORMACIÓN DE LA PERSONA, DE ACUERDO A LA DISPONIBILIDAD - */
                //Obtener el registro inverso de la persona
                vLicencias_UNION DatoPersonaInversa = ctx.vLicencias_UNION.Where(l => l.RFC == RFC && l.ESTATUS_REGISTRO != DatoPersona.ESTATUS_REGISTRO).FirstOrDefault();
                if (DatoPersonaInversa == null)
                {
                    DatoPersonaInversa = DatoPersona;
                }
                /*Colocar los datos*/
                txtDetNombreCompleto.Text = $"{DatoPersona.NOMBRE} {DatoPersona.APELLIDO_PATERNO} {DatoPersona.APELLIDO_MATERNO}";
                //txtDetSexo.Text = !DatoPersona.SEXO.HasValue ? !DatoPersonaInversa.SEXO.HasValue ? ""
                //        : DatoPersonaInversa.SEXO.Equals(1) ? "Masculino" : DatoPersonaInversa.SEXO.Equals(2) ? "Femenino" : "No especificado"
                //        : DatoPersona.SEXO.Equals(1) ? "Masculino" : DatoPersona.SEXO.Equals(2) ? "Femenino" : "No especificado";
                txtDetEdad.Text = !DatoPersonaInversa.FCH_NACIMIENTO.HasValue ? !DatoPersonaInversa.FCH_NACIMIENTO.HasValue ? ""
                        : Convert.ToInt32(Math.Floor((DateTime.Now - DatoPersonaInversa.FCH_NACIMIENTO.Value).TotalDays / 365)).ToString() + $" años ({DatoPersonaInversa.FCH_NACIMIENTO.Value.ToShortDateString()})"
                        : Convert.ToInt32(Math.Floor((DateTime.Now - DatoPersona.FCH_NACIMIENTO.Value).TotalDays / 365)).ToString() + $" años ({DatoPersona.FCH_NACIMIENTO.Value.ToShortDateString()})";
                txtDetRFC.Text = string.IsNullOrEmpty(DatoPersona.RFC) ? DatoPersonaInversa.RFC : DatoPersona.RFC;
                txtDetCURP.Text = string.IsNullOrEmpty(DatoPersona.CURP) ? DatoPersonaInversa.CURP : DatoPersona.CURP;
                //txtDetEstadoCivil.Text = string.IsNullOrEmpty(DatoPersona.ESTADO_CIVIL) ? GetDatoConColofon(DatoPersonaInversa.ESTADO_CIVIL, DatoPersonaInversa.FECHA_REGISTRO) : GetDatoConColofon(DatoPersona.ESTADO_CIVIL, DatoPersona.FECHA_REGISTRO);

                //txtDetEstatura.Text = !DatoPersona.ESTATURA.HasValue ? GetDatoConColofon(GetEstatura(DatoPersonaInversa.ESTATURA), DatoPersonaInversa.FECHA_REGISTRO) : GetDatoConColofon(GetEstatura(DatoPersona.ESTATURA), DatoPersona.FECHA_REGISTRO);
                //string direccionPersona = GetDireccion(DatoPersona.CALLE, DatoPersona.NUM_INT, DatoPersona.NUM_EXT, DatoPersona.COLONIA, DatoPersona.CODPOSTAL, DatoPersona.REF_DOM);
                //string direccionPersonaInversa = GetDireccion(DatoPersonaInversa.CALLE, DatoPersonaInversa.NUM_INT, DatoPersonaInversa.NUM_EXT, DatoPersonaInversa.COLONIA, DatoPersonaInversa.CODPOSTAL, DatoPersonaInversa.REF_DOM);
                //txtDetDireccion.Text = string.IsNullOrEmpty(direccionPersona) ? GetDatoConColofon(direccionPersonaInversa, DatoPersonaInversa.FECHA_REGISTRO) : GetDatoConColofon(direccionPersona, DatoPersona.FECHA_REGISTRO);
                //txtDetMunicipio.Text = string.IsNullOrEmpty(DatoPersona.MUNICIPIO) ? GetDatoConColofon(DatoPersonaInversa.MUNICIPIO, DatoPersonaInversa.FECHA_REGISTRO) : GetDatoConColofon(DatoPersona.MUNICIPIO, DatoPersona.FECHA_REGISTRO);
                //txtDetProfesion.Text = string.IsNullOrEmpty(DatoPersona.PROFESION) ? GetDatoConColofon(DatoPersonaInversa.PROFESION, DatoPersonaInversa.FECHA_REGISTRO) : GetDatoConColofon(DatoPersona.PROFESION, DatoPersona.FECHA_REGISTRO);
                //txtDetTelefono.Text = string.IsNullOrEmpty(DatoPersona.TELEFONO) ? GetDatoConColofon(DatoPersonaInversa.TELEFONO, DatoPersonaInversa.FECHA_REGISTRO) : GetDatoConColofon(DatoPersona.TELEFONO, DatoPersona.FECHA_REGISTRO);
                //txtDetCorreo.Text = string.IsNullOrEmpty(DatoPersona.CORREO) ? GetDatoConColofon(DatoPersonaInversa.CORREO, DatoPersonaInversa.FECHA_REGISTRO) : GetDatoConColofon(DatoPersona.CORREO, DatoPersona.FECHA_REGISTRO);
                //txtDetFechaReg.Text = !DatoPersona.FECHA_REGISTRO.HasValue ? !DatoPersonaInversa.FECHA_REGISTRO.HasValue ? "" : DatoPersonaInversa.FECHA_REGISTRO.Value.ToString() : DatoPersona.FECHA_REGISTRO.Value.ToString();
                //..................

                List<ImagenLicencia> ListaImagenes = new List<ImagenLicencia>();
                /*Si la persona seleccionada fue del registro viejo, obtener su nuevo ID para la nueva foto*/
                int ID_Busqueda = ID_ALT;
                //DateTime? fechaImagen = null;
                /*Buscar el ID NUEVO*/
                if (ESTATUS.ToString() == "0")
                {
                    //if (DatoPersona.ESTATUS_REGISTRO == 0)
                    //    fechaImagen = DatoPersona.FECHA_REGISTRO;
                    //else if (DatoPersonaInversa.ESTATUS_REGISTRO == 0)
                    //    fechaImagen = DatoPersonaInversa.FECHA_REGISTRO;
                    ID_Busqueda = ctx.vLicencias_UNION.Where(l => l.RFC == RFC && l.ESTATUS_REGISTRO == 1).Select(l => l.ID_ALTERNA).FirstOrDefault();
                }
                List<vLicencias_Imagen_New> ImagsNuevas = ctx.vLicencias_Imagen_New.Where(i => i.ID_ALTERNA == ID_Busqueda && i.ID_TIPO_IMAGEN > 10).ToList();
                foreach (vLicencias_Imagen_New im in ImagsNuevas)
                {
                    int T = Convert.ToInt32(im.ID_TIPO_IMAGEN);
                    ListaImagenes.Add(new ImagenLicencia()
                    {
                        ImagenUrl = "data:image/png;base64," + Convert.ToBase64String(im.IMAGEN),
                        DatoImagen = GetTextoTipoDato(1, T)
                                        + (im.Expedicion.HasValue ? $" - [{im.Expedicion.Value.ToString()}]" : "")
                        //DatoImagen = GetTextoTipoDato(1, T) + (!string.IsNullOrEmpty(im.Expedicion) ? $" - [{im.Expedicion}]" : "")
                        //DatoImagen = GetTextoTipoDato(1, T) + ( fechaImagen.HasValue ? $" - [{fechaImagen.Value}]" : "")
                    });
                }
                /*Buscar el ID VIEJO*/
                if (ESTATUS.ToString() == "1")
                {
                    //if (DatoPersona.ESTATUS_REGISTRO == 1)
                    //    fechaImagen = DatoPersona.FECHA_REGISTRO;
                    //else if (DatoPersonaInversa.ESTATUS_REGISTRO == 1)
                    //    fechaImagen = DatoPersonaInversa.FECHA_REGISTRO;
                    ID_Busqueda = ctx.vLicencias_UNION.Where(l => l.RFC == RFC && l.ESTATUS_REGISTRO == 0).Select(l => l.ID_ALTERNA).FirstOrDefault();
                }
                else
                    ID_Busqueda = ID_ALT;

                List<C_PERSONA_IMG> ImagenesViejas = ctx.C_PERSONA_IMG.Where(p => p.ID_PERSONA == ID_Busqueda).ToList();
                foreach (C_PERSONA_IMG im in ImagenesViejas)
                {
                    int T = im.ID_TIPO_LICENCIA;
                    ListaImagenes.Add(new ImagenLicencia()
                    {
                        ImagenUrl = "data:image/png;base64," + Convert.ToBase64String(im.IMG_FOTO),
                        DatoImagen = GetTextoTipoDato(-1, T) + (im.FEC_CREACION.HasValue ? " - [" + im.FEC_CREACION.Value.ToShortDateString() + "]" : "")
                        //DatoImagen = GetTextoTipoDato(-1, T) + (fechaImagen.HasValue ? $" - [{fechaImagen.Value}]" : "")
                    });
                }
                List<C_PERSONA_DOC> ImagenesViejasDoc = ctx.C_PERSONA_DOC.Where(p => p.ID_PERSONA == ID_Busqueda).ToList();
                foreach (C_PERSONA_DOC im in ImagenesViejasDoc)
                {
                    int T = im.ID_TIPO_DOCUMENTO;
                    ListaImagenes.Add(new ImagenLicencia()
                    {
                        ImagenUrl = "data:image/png;base64," + Convert.ToBase64String(im.DOC_IMAGEN),
                        DatoImagen = GetTextoTipoDato(0, T) + (im.FEC_CREACION.HasValue ? " - [" + im.FEC_CREACION.Value.ToShortDateString() + "]" : "")
                        //DatoImagen = GetTextoTipoDato(0, T) + (fechaImagen.HasValue ? $" - [{fechaImagen.Value}]" : "")
                    });
                }
                //dlDetalleImagenes.DataSource = ListaImagenes;
                //dlDetalleImagenes.DataBind();
                repDetalleImagenes.DataSource = ListaImagenes;
                repDetalleImagenes.DataBind();

            }
        }
        protected string GetEstatura(decimal? Estatura)
        {
            string altura = "";
            if (Estatura.HasValue)
            {
                if (Estatura.Value > 100)
                    Estatura = Math.Round(Estatura.Value / 100, 2);
                altura = $"{Estatura} Metros";
            }
            return altura;
        }
        protected string GetDatoConColofon(string dato, DateTime? fecha)
        {
            if (!string.IsNullOrEmpty(dato) && fecha.HasValue)
                return dato + " - [" + fecha.Value.ToShortDateString() + "]";
            return dato;
        }
        protected string GetDireccion(string calle, string numInt, string numExt, string colonia, string CP, string refDir)
        {
            string direccion = $"{calle} {numInt} {numExt}, {colonia}";
            if (!string.IsNullOrEmpty(CP))
            {
                direccion += $". CP: {CP}";
            }
            if (!string.IsNullOrEmpty(refDir))
            {
                direccion += $"; Referencia del lugar: {refDir}";
            }
            direccion = Regex.Replace(direccion, @"\s{2,}", " ");
            direccion = Regex.Replace(direccion, @"^\s*\,\s*$", "");
            return direccion;
        }
        protected string GetTextoTipoDato(int Estatus, int Tipo)
        {
            string tipo = "";
            if (Estatus == 0)
            {
                switch (Tipo)
                {
                    case 1:
                        tipo = $"INE (IFE) / LICENCIA [0:{Tipo}]"; break;
                    case 2:
                        tipo = $"ACTA DE NACIMIENTO [0:{Tipo}]"; break;
                    case 3:
                        tipo = $"COMPROBANTE DE DOMICILIO [0:{Tipo}]"; break;
                    case 4:
                        tipo = $"SOLICITUD DE TRÁMITE [0:{Tipo}]"; break;
                    case 11:
                        tipo = $"LÍNEA DE CAPTURA PARA PAGO [0:{Tipo}]"; break;
                    default:
                        tipo = $"IMAGEN (?) [0:{Tipo}]"; break;
                }
            }
            else if (Estatus == -1)
            {
                switch (Tipo)
                {
                    case 1:
                    case 2:
                    case 3:
                    case 5:
                        tipo = $"FOTO FRENTE [0_1:{Tipo}]"; break;
                    default:
                        tipo = $"IMAGEN (?) [0_1:{Tipo}]"; break;
                }
            }
            else if (Estatus == 1)
            {
                switch (Tipo)
                {
                    case 11:
                        tipo = $"FOTO FRENTE [1:{Tipo}]"; break;
                    case 12:
                        tipo = $"FIRMA [1:{Tipo}]"; break;
                    default:
                        tipo = $"IMAGEN (?) [1:{Tipo}]"; break;
                }
            }
            return tipo;
        }

        protected void gvLicencias_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //if (int.TryParse(e.CommandArgument.ToString(), out int ID_ALT))
            //    if (e.CommandName.Equals("ConsultarDetalle"))
            //    {
            //        GridViewRow row = (GridViewRow)((ImageButton)e.CommandSource).NamingContainer;

            //        var Dato  = EntityDataSourceExtensions.GetItemObject<vLicencias_UNION>(row.DataItem);
            //    }
        }

        static class EntityDataSourceExtensions
        {
            public static TEntity GetItemObject<TEntity>(object dataItem) where TEntity : class
            {
                if (dataItem is TEntity entity)
                {
                    return entity;
                }
                if (dataItem is ICustomTypeDescriptor td)
                {
                    return (TEntity)td.GetPropertyOwner(null);
                }
                return null;
            }
        }

        
    }
}