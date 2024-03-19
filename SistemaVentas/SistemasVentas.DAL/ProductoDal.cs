using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SistemaVentas.Modelos;

namespace SistemasVentas.DAL
{
    public class ProductoDal
    {
        public DataTable ListarProductoDal()
        {
            string consulta = "select * from Producto";
            DataTable Lista = conexion.EjecutarDataTabla(consulta, "tabla");
            return Lista;
        }
        public void InsertarProducto(Producto producto)
        {
            string consulta = "inser into producto values('" + producto.IdProducto + "'," +
                                                        "'" + producto.IdMarca + "'," +
                                                        "'" + producto.Nombre + "'," +
                                                        "'" + producto.CodigoBarra + "'," +
                                                        "'" + producto.Unidad + "'," +
                                                        "'" + producto.Descripcion + "'," +
                                                        "'Activo'";
            conexion.Ejecutar(consulta);

        }
    }
}
