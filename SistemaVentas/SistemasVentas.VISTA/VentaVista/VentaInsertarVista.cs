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

namespace SistemasVentas.VISTA.VentaVista
{
    public partial class VentaInsertarVista : Form
    {
        public VentaInsertarVista()
        {
            InitializeComponent();
        }
        VentaBss bss=new VentaBss();
        private void button1_Click(object sender, EventArgs e)
        {
            Venta p = new Venta();
            p.IdCliente = textBox1.TabIndex;
            p.IdVendedor = textBox2.TabIndex;
            p.Fecha = textBox3.Text;
            p.Total = textBox4.TabIndex;

            bss.InsertarVentaBSs(p);
            MessageBox.Show("Se guardo correctamente");
        }
    }
}
