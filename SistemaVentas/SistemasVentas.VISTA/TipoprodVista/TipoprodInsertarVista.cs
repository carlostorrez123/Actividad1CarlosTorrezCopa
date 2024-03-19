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
    public partial class TipoprodInsertarVista : Form
    {
        public TipoprodInsertarVista()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {

        }
        TipoprodBss bss= new TipoprodBss();

        private void button1_Click(object sender, EventArgs e)
        {
            TipoprodBss p=new TipoprodBss();
            p.Nombre = textBox1.Text;

            bss.InsertarTipoprodBSs(p);
            MessageBox.Show("Se guardo correctamente");
        }
    }
}
