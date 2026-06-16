using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace ConsultaLicencias
{
    /// <summary>
    /// Summary description for ImagenDocto
    /// </summary>
    public class ImagenDocto : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {

            int _imageId, _idtipodocto;
            string TextoEstatus = "";
            if (context.Request.QueryString["IdPersona"] != null)
            {
                int.TryParse(context.Request.QueryString["IdPersona"].ToString(), out _imageId);
                int.TryParse(context.Request.QueryString["IdTipoDocto"].ToString(), out _idtipodocto);
            }
            else
                throw new ArgumentException("No parameter specified");
            if (context.Request.QueryString["TipoConsulta"] != null)
                TextoEstatus = context.Request.QueryString["TipoConsulta"].ToString();
            
            if (_imageId > 0)
            {
                using (var contexto = new SILCVEREntities())
                {
                    try
                    {
                        byte[] bImagenPeque = contexto.C_PERSONA_DOC.FirstOrDefault(x => x.ID_PERSONA.Equals(_imageId) && x.ID_TIPO_DOCUMENTO.Equals(_idtipodocto)).DOC_IMAGEN;
                        byte[] bImagenPeque2;

                        MemoryStream inStream = new MemoryStream(bImagenPeque);
                        MemoryStream outStream = new MemoryStream();

                        if (bImagenPeque != null)
                        {

                            try
                            {
                                System.Drawing.Bitmap.FromStream(inStream).Save(outStream, System.Drawing.Imaging.ImageFormat.Jpeg);
                                bImagenPeque2 = outStream.ToArray();
                            }
                            catch (Exception xxxx)
                            {
                                bImagenPeque2 = bImagenPeque;
                            }

                            context.Response.ContentType = "image/JPEG";
                            context.Response.BinaryWrite(bImagenPeque2);
                        }
                    }
                    catch (Exception xxx)
                    {}
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