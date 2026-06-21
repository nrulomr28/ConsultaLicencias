using ConsultaLicencias.DTOs;
using System.Linq;

namespace ConsultaLicencias.Services
{
    public class DocumentoConsultaService
    {
        public DocumentoDto ObtenerDocumento(
            int idPersona,
            int idTipoDocumento)
        {
            using (var contexto = new SILCVEREntities())
            {
                var documento = contexto.C_PERSONA_DOC
                    .Where(x =>
                        x.ID_PERSONA == idPersona &&
                        x.ID_TIPO_DOCUMENTO == idTipoDocumento)
                    .Select(x => new DocumentoDto
                    {
                        IdPersona = x.ID_PERSONA,
                        IdTipoDocumento = x.ID_TIPO_DOCUMENTO,
                        Imagen = x.DOC_IMAGEN
                    })
                    .FirstOrDefault();

                return documento;
            }
        }
    }
}