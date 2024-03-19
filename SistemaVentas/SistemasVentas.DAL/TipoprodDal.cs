using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SistemaVentas.Modelos;

namespace SistemasVentas.DAL
{
    public  class TipoprodDal
    {
        public DataTable ListarTipoprodDal()
        {
            string consulta = "select * from Tipoprod";
            DataTable Lista = conexion.EjecutarDataTabla(consulta, "tabla");
            return Lista;
        }
        public void InserartipoprodDal(Tipoprod tipoprod)
        {
            string consulta = "insert into tipoprod values('"+tipoprod.Nombre+"',"+
                                                           "'Activo')";
            conexion.Ejecutar(consulta);
        }

        
    }
}
