using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ConsultaLicencias
{
    /// <summary>
    /// Summary description for Imagen
    /// </summary>
    public class Imagen : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            
            int _imageId;
            string TextoEstatus = "";
            if (context.Request.QueryString["IdImagen"] != null)
                int.TryParse(context.Request.QueryString["IdImagen"].ToString(), out _imageId);
            else
                throw new ArgumentException("No parameter specified");
            if (context.Request.QueryString["TipoConsulta"] != null)
                TextoEstatus = context.Request.QueryString["TipoConsulta"].ToString();
            if (_imageId > 0)
            {
                if(_imageId == 367789)
                {
                    string x = "";
                }
                using (var contexto = new SILCVEREntities())
                {
                    try
                    {
                        byte[] bImagenPeque = { };
                        if (string.IsNullOrEmpty(TextoEstatus) || TextoEstatus.Equals("0"))
                        {
                            bImagenPeque = contexto.C_PERSONA_IMG.FirstOrDefault(x => x.ID_PERSONA.Equals(_imageId)).IMG_FOTO;
                        }
                        else if (!string.IsNullOrEmpty(TextoEstatus) && TextoEstatus.Equals("1"))
                        {
                            bImagenPeque = contexto.vLicencias_Imagen_New.Where(i => i.ID_ALTERNA == _imageId && i.ID_TIPO_IMAGEN == 11).Select(i => i.IMAGEN).FirstOrDefault();
                        }
                        if (bImagenPeque != null)
                        {
                            context.Response.ContentType = "image/JPEG";
                            context.Response.BinaryWrite(bImagenPeque);
                        }
                    }
                    catch (Exception xxx)
                    {
                        byte[] bImagenPeque = { };
                        context.Response.ContentType = "image/JPEG";
                        context.Response.BinaryWrite(bImagenPeque);
                    }

                }
            }







        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}