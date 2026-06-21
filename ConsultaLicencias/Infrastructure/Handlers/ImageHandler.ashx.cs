using System;
using System.Web;
using ConsultaLicencias.Infrastructure.Security;
using ConsultaLicencias.Services;

namespace ConsultaLicencias.Infrastructure.Handlers
{
    public class ImageHandler : IHttpHandler
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

            string tipoConsulta =
                context.Request.QueryString["TipoConsulta"] ?? "0";

            if (tipoConsulta != "0" &&
                tipoConsulta != "1")
            {
                context.Response.StatusCode = 400;
                return;
            }

            try
            {
                DTOs.ImagenDto imagenDto;

                if (tipoConsulta == "0")
                {
                    imagenDto =
                        _imagenService.ObtenerFoto(imageId);
                }
                else
                {
                    imagenDto =
                        _imagenService.ObtenerFotoLicencia(imageId);
                }

                if (imagenDto == null ||
                    imagenDto.Imagen == null ||
                    imagenDto.Imagen.Length == 0)
                {
                    context.Response.StatusCode = 404;
                    return;
                }

                context.Response.Clear();
                context.Response.ContentType = "image/jpeg";
                context.Response.BinaryWrite(imagenDto.Imagen);
                context.Response.Flush();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Trace.WriteLine(
                    $"ImageHandler error: {ex}");

                context.Response.StatusCode = 500;
            }
        }

        public bool IsReusable => false;
    }
}