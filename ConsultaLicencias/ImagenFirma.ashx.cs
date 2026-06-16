using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Drawing;
using System.IO;

namespace ConsultaLicencias
{
    /// <summary>
    /// Summary description for ImagenFirma
    /// </summary>
    public class ImagenFirma : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {

            int _imageId;
            if (context.Request.QueryString["IdImagen"] != null)
                int.TryParse(context.Request.QueryString["IdImagen"].ToString(), out _imageId);
            else
                throw new ArgumentException("No parameter specified");



            if (_imageId != null)
            {

                using (var contexto = new SILCVEREntities())
                {

                    byte[] bImagenPeque = contexto.C_PERSONA_IMG.FirstOrDefault(x => x.ID_PERSONA.Equals(_imageId)).IMG_FIRMA;
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