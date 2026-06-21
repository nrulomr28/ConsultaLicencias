
namespace ConsultaLicencias.DTOs
{
    public class PersonaBusquedaDto
    {
        public int IdPersona { get; set; }

        public string RFC { get; set; }

        public string NombreCompleto { get; set; }

        public string Municipio { get; set; }

        public string Telefono { get; set; }
    }
}