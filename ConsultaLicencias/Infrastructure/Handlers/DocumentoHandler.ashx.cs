using ConsultaLicencias.Infrastructure.Security;
using ConsultaLicencias.Services;
using System;
using System.IO;
using System.Web;

namespace ConsultaLicencias.Infrastructure.Handlers
{
    public class DocumentoHandler : IHttpHandler
    {
        private readonly DocumentoConsultaService _documentoService =
            new DocumentoConsultaService();

        public void ProcessRequest(HttpContext context)
        {
            // Seguridad básica
            if (!SessionGuard.TieneSesionActiva())
            {
                context.Response.StatusCode = 401;
                return;
            }

            // Validación de parámetros
            if (!int.TryParse(
                    context.Request.QueryString["IdPersona"],
                    out int imageId))
            {
                context.Response.StatusCode = 400;
                return;
            }

            if (!int.TryParse(
                    context.Request.QueryString["IdTipoDocto"],
                    out int tipoDocumento))
            {
                context.Response.StatusCode = 400;
                return;
            }

            try
            {
                var documento =
                    _documentoService.ObtenerDocumento(
                        imageId,
                        tipoDocumento);

                if (documento == null)
                {
                    context.Response.StatusCode = 404;
                    return;
                }

                byte[] imagen = documento.Imagen;

                if (imagen == null || imagen.Length == 0)
                {
                    context.Response.StatusCode = 404;
                    return;
                }

                byte[] imagenSalida = imagen;

                try
                {
                    using (var inStream = new MemoryStream(imagen))
                    using (var outStream = new MemoryStream())
                    using (var bitmap =
                        (System.Drawing.Bitmap)
                        System.Drawing.Image.FromStream(inStream))
                    {
                        bitmap.Save(
                            outStream,
                            System.Drawing.Imaging.ImageFormat.Jpeg);

                        imagenSalida = outStream.ToArray();
                    }
                }
                catch
                {
                    // Algunos documentos ya vienen en formato válido.
                    imagenSalida = imagen;
                }

                context.Response.Clear();
                context.Response.ContentType = "image/jpeg";
                context.Response.BinaryWrite(imagenSalida);
                context.Response.Flush();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Trace.WriteLine(
                    $"DocumentoHandler error: {ex}");

                context.Response.StatusCode = 500;
            }
        }

        public bool IsReusable => false;
    }
}