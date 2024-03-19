using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SistemaVentas.Modelos;

namespace SistemasVentas.DAL
{
    public class PersonaDal
    {
        public DataTable ListarPersonaDal()
        {
            string consulta = "select * from persona";
            DataTable Lista = conexion.EjecutarDataTabla(consulta, "tabla");
            return Lista;
        }

        public void InsertarPersonaDal(Persona persona)
        {
            string consulta = "insert into persona values('"+persona.Nombre+"',"+
                                                         "'"+persona.Apellido +"',"+
                                                         "'"+persona.Telefono +"',"+
                                                         "'"+persona.CI +"',"+
                                                         "'"+persona.Correo +"'," +
                                                         "'Activo')";
            conexion.Ejecutar(consulta);
        }

    }
}
