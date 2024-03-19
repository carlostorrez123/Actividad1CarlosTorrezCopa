using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SistemaVentas.Modelos;


namespace SistemasVentas.DAL
{
    public class RolDal
    {
        public DataTable ListarRolDal()
        {
            string consulta = "select * from Rol";
            DataTable Lista = conexion.EjecutarDataTabla(consulta, "tabla");
            return Lista;
        }

        public void InserarRolDal(Rol rol)
        {
            string consulta = "insert int rol values('" + rol.Nombre + "'," +
                                                     "'Activo')";

            conexion.Ejecutar(consulta);
        }
    }
}
