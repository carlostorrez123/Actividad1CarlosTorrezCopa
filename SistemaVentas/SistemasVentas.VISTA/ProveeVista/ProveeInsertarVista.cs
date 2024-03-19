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

namespace SistemasVentas.VISTA.ProveeVista
{
    public partial class ProveeInsertarVista : Form
    {
        public ProveeInsertarVista()
        {
            InitializeComponent();
        }
        ProveeBss bss=new ProveeBss();
        private void button1_Click(object sender, EventArgs e)
        {
            Provee p = new Provee();
            p.IdProducto = textBox1.TabIndex;
            p.IdProveedor = textBox2.TabIndex;
            p.Fecha = textBox3.Text;
            p.Precio = textBox4.TabIndex;

            bss.InsertarProveeBSs(p);
            MessageBox.Show("Se guardo correctamente");
        }
    }
}
