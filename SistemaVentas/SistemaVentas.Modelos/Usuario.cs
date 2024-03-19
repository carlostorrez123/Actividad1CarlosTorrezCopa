using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaVentas.Modelos
{
    public class Usuario
    {
        public string IdUsuario { get; set; }
        public int IdPersona { get; set; }
        public string NombreUser { get; set; }
        public string Contraseña { get; set; }
        public string Fechareg { get; set; }

    }
}
