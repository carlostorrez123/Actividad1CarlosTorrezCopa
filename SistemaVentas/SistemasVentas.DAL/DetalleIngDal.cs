using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SistemaVentas.Modelos;

namespace SistemasVentas.DAL
{
    public class DetalleIngDal
    {
        public DataTable ListarDetalleIngDal()
        {
            string consulta = "select * from DetalleIng";
            DataTable Lista = conexion.EjecutarDataTabla(consulta, "tabla");
            return Lista;
        }
        public void InsertarDetalleIngDal(DetalleIng detalleing)
        {
            string consulta = "insert into detalleing('" + detalleing.IdIngreso + "'," +
                                                      "'" + detalleing.IdProducto + "'," +
                                                      "'" + detalleing.FechaVenc + "',"+
                                                      "'" + detalleing.Cantidad + "',"+
                                                      "'" + detalleing.PrecioCosto+ "',"+
                                                      "'"+ detalleing.PrecioVenta+ "',"+
                                                      "'"+ detalleing.SubTotal+ "',"+
                                                      "'Activo'";
            conexion.Ejecutar(consulta);

        }
    }
}
