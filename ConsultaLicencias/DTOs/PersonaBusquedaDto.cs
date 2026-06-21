namespace ConsultaLicencias.DTOs
{
    public class PersonaBusquedaDto
    {
        public int IdPersona { get; set; }

        public string Nombre { get; set; }

        public string ApellidoPaterno { get; set; }

        public string ApellidoMaterno { get; set; }

        public string RFC { get; set; }

        public string CURP { get; set; }

        public string Colonia { get; set; }

        public string Municipio { get; set; }
    }
}