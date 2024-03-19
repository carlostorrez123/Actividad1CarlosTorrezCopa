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
using SistemaVentas.Modelos;

namespace SistemasVentas.VISTA.MarcaVista
{
    public partial class MarcaInsertarVista : Form
    {
        public MarcaInsertarVista()
        {
            InitializeComponent();
        }

        private void MarcaInsertarVista_Load(object sender, EventArgs e)
        {

        }
        MarcaBss bss= new MarcaBss();
        private void button1_Click(object sender, EventArgs e)
        {
            Marca p= new Marca();
            p.Nombre = textBox1.Text;

            bss.InsertarMarcaBSs(p);
            MessageBox.Show("se guardo correctamente");
        }
    }
}
