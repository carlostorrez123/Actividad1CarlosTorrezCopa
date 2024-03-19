using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaVentas.Modelos
{
    public class Persona
    {
        public string Usuario;
        public string Contraseña;

        public int IdPersona { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Telefono { get; set; }
        public string CI { get; set; }
        public string Correo { get; set; }
        public string Estado { get; set; }

    }
}
