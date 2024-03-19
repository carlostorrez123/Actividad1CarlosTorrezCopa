using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SistemaVentas.Modelos;

namespace SistemasVentas.DAL
{
    public class MarcaDal
    {
        public DataTable ListarMarcaDal()
        {
            string consulta = "select * from Marca";
            DataTable Lista = conexion.EjecutarDataTabla(consulta, "tabla");
            return Lista;
        }

        public void InsertarMarcaDal(Marca marca)
        {
            string consulta = "insert intro marca values('" + marca.Nombre + "'," +
                                                         "'Activo')";
            conexion.Ejecutar(consulta);
        }
    }
}
