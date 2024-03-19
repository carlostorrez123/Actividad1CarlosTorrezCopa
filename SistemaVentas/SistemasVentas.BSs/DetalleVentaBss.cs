using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SistemasVentas.DAL;
using SistemaVentas.Modelos;

namespace SistemasVentas.BSs
{
    public class DetalleVentaBss
    {
        DetalleVentaDal dal = new DetalleVentaDal();
        public DataTable ListarDetalleVentaBss()
        {
            return dal.ListarDetalleVentaDal();
        }
        public void InsertarDetalleVentaBSs(DetalleVenta detalleventa)
        {
            dal.InsertarDetalleVentaDal(detalleventa);
        }
    }
}
