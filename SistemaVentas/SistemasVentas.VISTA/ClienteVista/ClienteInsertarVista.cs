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

namespace SistemasVentas.VISTA.ClienteVista
{
    public partial class ClienteInsertarVista : Form
    {
        public ClienteInsertarVista()
        {
            InitializeComponent();
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }
        ClienteBss bss=new ClienteBss();   
        private void button1_Click(object sender, EventArgs e)
        {
            Cliente p = new Cliente();
            p.IdPersona=textBox1.TabIndex;
            p.TipoCliente = textBox2.Text;
            p.CodigoCliente = textBox3.Text;

            bss.InsertarClienteBSs(p);
            MessageBox.Show("Se guardo correctamente");
        }
    }
}
