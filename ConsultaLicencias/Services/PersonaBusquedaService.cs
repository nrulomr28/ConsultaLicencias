using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text.RegularExpressions;
using ConsultaLicencias.DTOs;

namespace ConsultaLicencias.Services
{
    public class PersonaBusquedaService
    {
        private const int MaxResultados = 50;

        public List<PersonaBusquedaDto> Buscar(string criterio)
        {
            criterio = (criterio ?? string.Empty)
                .Trim()
                .ToUpper();

            if (string.IsNullOrWhiteSpace(criterio))
            {
                return new List<PersonaBusquedaDto>();
            }

            var terminos = criterio
                .Split(new[] { ' ' },
                    StringSplitOptions.RemoveEmptyEntries)
                .Select(x => x.Trim())
                .ToList();

            using (var contexto = new SILCVEREntities())
            {
                IQueryable<C_PERSONA> query = contexto.C_PERSONA
                    .AsNoTracking();

                // =====================================================
                // CURP EXACTA
                // =====================================================
                if (Regex.IsMatch(criterio,
                    @"^[A-Z]{4}[0-9]{6}[A-Z]{8}$"))
                {
                    query = query.Where(x => x.PER_CURP == criterio);
                }

                // =====================================================
                // CURP PARCIAL
                // MERA850101
                // MERA850101HVZ
                // =====================================================
                else if (!criterio.Contains(" ")
                         && criterio.Length >= 8
                         && Regex.IsMatch(criterio,
                             @"^[A-Z0-9]+$"))
                {
                    query = query.Where(x =>
                        x.PER_CURP.StartsWith(criterio));
                }

                // =====================================================
                // RFC EXACTO
                // =====================================================
                else if (!criterio.Contains(" ")
                         && (criterio.Length == 12
                             || criterio.Length == 13))
                {
                    query = query.Where(x =>
                        x.PER_RFC == criterio);
                }

                // =====================================================
                // DOS PALABRAS
                // MESTIZO RAMIREZ
                // =====================================================
                else if (terminos.Count == 2)
                {
                    string apPat = terminos[0];
                    string apMat = terminos[1];

                    query = query.Where(x =>
                        x.PER_APELLIDO_PATERNO.Contains(apPat)
                        &&
                        x.PER_APELLIDO_MATERNO.Contains(apMat));
                }

                // =====================================================
                // TRES O MÁS PALABRAS
                // JUAN MESTIZO RAMIREZ
                // =====================================================
                else if (terminos.Count >= 3)
                {
                    string nombre = terminos[0];
                    string apPat = terminos[1];
                    string apMat = terminos[2];

                    query = query.Where(x =>
                        x.PER_NOMBRE.Contains(nombre)
                        &&
                        x.PER_APELLIDO_PATERNO.Contains(apPat)
                        &&
                        x.PER_APELLIDO_MATERNO.Contains(apMat));
                }

                // =====================================================
                // UNA PALABRA
                // =====================================================
                else
                {
                    string t = terminos[0];

                    query = query.Where(x =>
                        x.PER_NOMBRE.Contains(t)
                        ||
                        x.PER_APELLIDO_PATERNO.Contains(t)
                        ||
                        x.PER_APELLIDO_MATERNO.Contains(t));
                }

                return query
                    .OrderBy(x => x.PER_APELLIDO_PATERNO)
                    .ThenBy(x => x.PER_APELLIDO_MATERNO)
                    .ThenBy(x => x.PER_NOMBRE)
                    .Select(x => new PersonaBusquedaDto
                    {
                        IdPersona = x.ID_PERSONA,

                        Nombre = x.PER_NOMBRE,
                        ApellidoPaterno = x.PER_APELLIDO_PATERNO,
                        ApellidoMaterno = x.PER_APELLIDO_MATERNO,

                        CURP = x.PER_CURP,
                        RFC = x.PER_RFC,

                        Calle = x.PER_DOM_CALLE,
                        NumeroExterior = x.PER_DOM_NUM_EXT,
                        NumeroInterior = x.PER_DOM_NUM_INT,
                        CodigoPostal = x.PER_DOM_CP,

                        Colonia = x.C_COLONIA.DSC_COLONIA,
                        Municipio =
                                x.C_COLONIA.C_DELEG_MUNICIPIO.DSC_DELEG_MUNICIPIO

                    })
                    .Take(MaxResultados)
                    .ToList();
            }
        }
    }
}