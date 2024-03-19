using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SistemaVentas.Modelos;

namespace SistemasVentas.DAL
{
    public class UsuarioDal
    {
        public DataTable ListarUsuarioDal()
        {
            string consulta = "select * from Usuario";
            DataTable Lista = conexion.EjecutarDataTabla(consulta, "tabla");
            return Lista;
        }
        public void InsertarUsuarioDal(Usuario usuario)
        {
            string consulta = "insert into usuario values('" + usuario.NombreUser + "'," +
                                                          "'" + usuario.Contraseña + "'," +
                                                          "'Activo')";
            conexion.Ejecutar(consulta);
        }
    }
}
