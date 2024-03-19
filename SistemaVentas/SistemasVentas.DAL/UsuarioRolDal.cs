using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SistemaVentas.Modelos;

namespace SistemasVentas.DAL
{
    public class UsuarioRolDal
    {
        public DataTable ListarUsuarioRolDal()
        {
            string consulta = "select * from UsuarioRol";
            DataTable Lista = conexion.EjecutarDataTabla(consulta, "tabla");
            return Lista;
        }

        public void InsertarUsuarioRolDal(UsuarioRol usuariorol)
        {
            string consulta = "insert into usuariorol values('" + usuariorol.IdUsuario + "'," +
                                                             "'" + usuariorol.IdRol + "'," +
                                                             "'Activo')";
            conexion.Ejecutar(consulta);
        }
    }
}
