using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaVentas.Modelos
{
    public class Venta
    {
        public int IdVenta { get; set; }
        public int IdCliente { get; set; }
        public int IdVendedor { get; set; }
        public string Fecha { get; set; }
        public decimal Total { get; set; }
        public string Estado { get; set; }
    }
}
