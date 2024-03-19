using Actividad1.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Computadora.DAL
{
    internal class ComputadoraDal
    {
        public DataTable computadoraDAL()
        {
            string consulta = "select * from computadora";
            DataTable Lista = conexion.EjecutarDataTabla(consulta, "tabla");
            return Lista;
        }

        public void InsertarComputadora(Computadora computadora)
        {
            string consulta = "insert into persona values('" + computadora.Nombre + "'," +
                                                         "'" + computadora.descripcion + "'," +
                                                         "'" + computadora.precio + "'," +
                                                         "'" + computadora.fecha + "'," +

                                                         "'Activo')";
            conexion.Ejecutar(consulta);
        }

    }


}
