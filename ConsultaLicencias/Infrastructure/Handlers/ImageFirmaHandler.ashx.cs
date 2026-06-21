using System;
using System.IO;
using System.Web;
using ConsultaLicencias.Infrastructure.Security;
using ConsultaLicencias.Services;

namespace ConsultaLicencias.Infrastructure.Handlers
{
    public class ImageFirmaHandler : IHttpHandler
    {
        private readonly ImagenConsultaService _imagenService =
            new ImagenConsultaService();

        public void ProcessRequest(HttpContext context)
        {
            if (!SessionGuard.TieneSesionActiva())
            {
                context.Response.StatusCode = 401;
                return;
            }

            if (!int.TryParse(
                    context.Request.QueryString["IdImagen"],
                    out int imageId))
            {
                context.Response.StatusCode = 400;
                return;
            }

            try
            {
                var imagenDto =
                    _imagenService.ObtenerFirma(imageId);

                if (imagenDto == null ||
                    imagenDto.Imagen == null ||
                    imagenDto.Imagen.Length == 0)
                {
                    context.Response.StatusCode = 404;
                    return;
                }

                byte[] imagenSalida = imagenDto.Imagen;

                try
                {
                    using (var inStream =
                        new MemoryStream(imagenDto.Imagen))
                    using (var outStream =
                        new MemoryStream())
                    using (var bitmap =
                        (System.Drawing.Bitmap)
                        System.Drawing.Image.FromStream(inStream))
                    {
                        bitmap.Save(
                            outStream,
                            System.Drawing.Imaging.ImageFormat.Jpeg);

                        imagenSalida =
                            outStream.ToArray();
                    }
                }
                catch
                {
                    imagenSalida = imagenDto.Imagen;
                }

                context.Response.Clear();
                context.Response.ContentType = "image/jpeg";
                context.Response.BinaryWrite(imagenSalida);
                context.Response.Flush();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Trace.WriteLine(
                    $"ImageFirmaHandler error: {ex}");

                context.Response.StatusCode = 500;
            }
        }

        public bool IsReusable => false;
    }
}