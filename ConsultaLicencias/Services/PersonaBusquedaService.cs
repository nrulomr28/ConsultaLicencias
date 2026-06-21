using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ConsultaLicencias.Services
{
    public class PersonaBusquedaService
    {
        public IQueryable<C_PERSONA> Buscar(
            IQueryable<C_PERSONA> query,
            string criterio)
        {
            criterio = criterio?.Trim();

            if (string.IsNullOrWhiteSpace(criterio))
                return query.Take(0);

            return query.Where(p =>
                p.PER_RFC.Contains(criterio) ||
                p.PER_NOMBRE.Contains(criterio) ||
                p.PER_APELLIDO_PATERNO.Contains(criterio) ||
                p.PER_APELLIDO_MATERNO.Contains(criterio));
        }
    }
}