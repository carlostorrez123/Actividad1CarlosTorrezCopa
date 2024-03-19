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
    public class TipoprodBss
    {
        TipoprodDal dal = new TipoprodDal();

        public string Nombre { get; set; }

        public DataTable ListarTipoprodBss()

        {
            return dal.ListarTipoprodDal();
        }
        public void InsertarTipoprodBSs(Tipoprod tipoprod)
        {
            dal.InserartipoprodDal(tipoprod);
        }
    }
}
