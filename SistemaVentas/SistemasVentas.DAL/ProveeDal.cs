using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SistemaVentas.Modelos;

namespace SistemasVentas.DAL
{
    public class ProveeDal
    {
        public DataTable ListarProveeDal()
        {
            string consulta = "select * from Provee";
            DataTable Lista = conexion.EjecutarDataTabla(consulta, "tabla");
            return Lista;
        }
        public void InsertarProveeDal(Provee provee)
        {
            string consulta = "insert into provee values('" + provee.IdProducto + "'," +
                                                         "'" + provee.IdProveedor + "'" +
                                                         "'" + provee.Fecha + "'" +
                                                         "'" + provee.Precio + "'" +
                                                         "'Activo')";
            conexion.Ejecutar(consulta);
        }
       
    }
}
