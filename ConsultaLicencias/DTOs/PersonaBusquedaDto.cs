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
        public string Calle { get; set; }
        public string NumeroExterior { get; set; }
        public string NumeroInterior { get; set; }
        public string Colonia { get; set; }
        public string Municipio { get; set; }
        public string CodigoPostal { get; set; }

        public string DireccionCompleta
        {
            get
            {
                var numero = NumeroExterior;

                if (!string.IsNullOrWhiteSpace(NumeroInterior))
                {
                    numero += " Int. " + NumeroInterior;
                }

                return string.Format(
                    "{0} {1}",
                    Calle,
                    numero);
            }
        }

        public string UbicacionCompleta
        {
            get
            {
                return string.Format(
                    "{0}, {1}, CP {2}",
                    Colonia,
                    Municipio,
                    CodigoPostal);
            }
        }
    }
}