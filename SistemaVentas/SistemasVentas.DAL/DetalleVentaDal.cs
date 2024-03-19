using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SistemaVentas.Modelos;

namespace SistemasVentas.DAL
{
    public class DetalleVentaDal
    {
        public DataTable ListarDetalleVentaDal()
        {
            string consulta = "select * from DetalleVenta";
            DataTable Lista = conexion.EjecutarDataTabla(consulta, "tabla");
            return Lista;
        }
        public void InsertarDetalleVentaDal(DetalleVenta detalleventa)
        {
            string consulta = "insert into detalleventa values('" + detalleventa.IdVenta + "'," +
                                                               "'" + detalleventa.IdProducto + "'" +
                                                               "'" + detalleventa.Cantidad + "'" +
                                                               "'" + detalleventa.PrecioVenta + "'" +
                                                               "'" + detalleventa.SubTotal + "'" +
                                                               "'Activo'";
            conexion.Ejecutar(consulta);
        }
    }
}
