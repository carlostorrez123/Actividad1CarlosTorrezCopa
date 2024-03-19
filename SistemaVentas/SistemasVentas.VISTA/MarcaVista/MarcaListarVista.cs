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

namespace SistemasVentas.VISTA.MarcaVista
{
    public partial class MarcaListarVista : Form
    {
        public MarcaListarVista()
        {
            InitializeComponent();
        }
        MarcaBss bss = new MarcaBss();

        private void MarcaListarVista_Load(object sender, EventArgs e)
        {
            dataGridView1.DataSource = bss.ListarMarcaBss();
        }
    }
}
