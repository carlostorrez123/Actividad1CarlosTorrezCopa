using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SistemaVentas.Modelos;

namespace SistemasVentas.DAL
{
    public class ProveedorDal
    {
        public DataTable ListarProveedorDal()
        {
            string consulta = "select * from Proveedor";
            DataTable Lista = conexion.EjecutarDataTabla(consulta, "tabla");
            return Lista;
        }

        public void InsertarProvedorDal(Proveedor proveedor)
        {
            string consulta = "insert into proveedor values('"+proveedor.Nombre+"',"+
                                                            "'"+proveedor.Telefono+"',"+
                                                            "'" + proveedor.Dirección+"'," +
                                                            "'Activo')";
            conexion.Ejecutar(consulta);
        }
    }
}
