using System;
using System.Collections.Generic;
using System.Linq;
using ConsultaLicencias.DTOs;

namespace ConsultaLicencias.Services
{
    public class PersonaBusquedaService
    {
        public List<PersonaBusquedaDto> Buscar(string criterio)
        {
            criterio = criterio?.Trim();

            if (string.IsNullOrWhiteSpace(criterio))
            {
                return new List<PersonaBusquedaDto>();
            }

            var terminos = criterio
                .Split(new[] { ' ' },
                    StringSplitOptions.RemoveEmptyEntries);

            using (var contexto = new SILCVEREntities())
            {
                var query = contexto.C_PERSONA.AsQueryable();

                foreach (var termino in terminos)
                {
                    string terminoLocal = termino;

                    query = query.Where(p =>
                        p.PER_RFC.Contains(terminoLocal) ||
                        p.PER_CURP.Contains(terminoLocal) ||
                        p.PER_NOMBRE.Contains(terminoLocal) ||
                        p.PER_APELLIDO_PATERNO.Contains(terminoLocal) ||
                        p.PER_APELLIDO_MATERNO.Contains(terminoLocal));
                }

                return query
                    .Select(p => new PersonaBusquedaDto
                    {
                        IdPersona = p.ID_PERSONA,

                        Nombre = p.PER_NOMBRE,

                        ApellidoPaterno = p.PER_APELLIDO_PATERNO,

                        ApellidoMaterno = p.PER_APELLIDO_MATERNO,

                        RFC = p.PER_RFC,

                        CURP = p.PER_CURP,

                        Colonia = p.C_COLONIA.DSC_COLONIA,

                        Municipio =
                            p.C_COLONIA
                             .C_DELEG_MUNICIPIO
                             .DSC_DELEG_MUNICIPIO
                    })
                    .Take(200)
                    .ToList();
            }
        }
    }
}