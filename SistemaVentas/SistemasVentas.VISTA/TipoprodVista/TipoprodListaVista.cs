using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using SistemasVentas.BSs;

namespace SistemasVentas.VISTA.TipoprodVista
{
    public partial class TipoprodListaVista : Form
    {
        public TipoprodListaVista()
        {
            InitializeComponent();
        }
        TipoprodBss bss=new TipoprodBss();

        private void TipoprodListaVista_Load(object sender, EventArgs e)
        {
            dataGridView1.DataSource = bss.ListarTipoprodBss();
        }
    }
}
