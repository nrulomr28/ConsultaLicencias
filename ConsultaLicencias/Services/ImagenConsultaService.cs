using System.Linq;
using ConsultaLicencias.DTOs;

namespace ConsultaLicencias.Services
{
    public class ImagenConsultaService
    {
        public ImagenDto ObtenerFoto(int idPersona)
        {
            using (var contexto = new SILCVEREntities())
            {
                return contexto.C_PERSONA_IMG
                    .Where(x => x.ID_PERSONA == idPersona)
                    .Select(x => new ImagenDto
                    {
                        IdPersona = x.ID_PERSONA,
                        Imagen = x.IMG_FOTO
                    })
                    .FirstOrDefault();
            }
        }

        public ImagenDto ObtenerFirma(int idPersona)
        {
            using (var contexto = new SILCVEREntities())
            {
                return contexto.C_PERSONA_IMG
                    .Where(x => x.ID_PERSONA == idPersona)
                    .Select(x => new ImagenDto
                    {
                        IdPersona = x.ID_PERSONA,
                        Imagen = x.IMG_FIRMA
                    })
                    .FirstOrDefault();
            }
        }

        public ImagenDto ObtenerFotoLicencia(int idAlterna)
        {
            using (var contexto = new SILCVEREntities())
            {
                return contexto.vLicencias_Imagen_New
                    .Where(x =>
                        x.ID_ALTERNA == idAlterna &&
                        x.ID_TIPO_IMAGEN == 11)
                    .Select(x => new ImagenDto
                    {
                        IdPersona = (int)x.ID_ALTERNA,
                        Imagen = x.IMAGEN
                    })
                    .FirstOrDefault();
            }
        }
    }
}