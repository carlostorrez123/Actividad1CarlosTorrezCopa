using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SistemaVentas.Modelos;

namespace SistemasVentas.DAL
{
    public class VentaDal
    {
        public DataTable ListarVentaDal()
        {
            string consulta = "select * from Venta";
            DataTable Lista = conexion.EjecutarDataTabla(consulta, "tabla");
            return Lista;
        }
        public void InsertarVentaDal(Venta venta)
        {
            string consulta = "insert into venta values('" + venta.IdCliente + "'," +
                                                      "'" + venta.IdVenta + "'," +
                                                      "'" + venta.Fecha + "'," +
                                                      "'" + venta.Total + "'," +
                                                      "'Activo')";
            conexion.Ejecutar(consulta);
        }
    }
}
