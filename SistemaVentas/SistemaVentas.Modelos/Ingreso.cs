using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaVentas.Modelos
{
    public class Ingreso
    {
        public int IdIngreso { get; set; }
        public int IdProveedor { get; set; }
        public string FechaIngreso { get; set; }
        public decimal Total { get; set; }
        public string Estado { get; set; }
    }
}
