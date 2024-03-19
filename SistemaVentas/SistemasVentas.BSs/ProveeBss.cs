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
    public class ProveeBss
    {
        ProveeDal dal = new ProveeDal();
        public DataTable ListarProveeBss()
        {
            return dal.ListarProveeDal();
        }
        public void InsertarProveeBSs(Provee provee)
        {
            dal.InsertarProveeDal(provee);
        }
    }
}
