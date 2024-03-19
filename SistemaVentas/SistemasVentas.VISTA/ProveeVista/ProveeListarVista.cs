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

namespace SistemasVentas.VISTA.ProveeVista
{
    public partial class ProveeListarVista : Form
    {
        public ProveeListarVista()
        {
            InitializeComponent();
        }
        ProveeBss bss=new ProveeBss();
        private void ProveeListarVista_Load(object sender, EventArgs e)
        {
            dataGridView1.DataSource = bss.ListarProveeBss();
        }
    }
}
