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

namespace SistemasVentas.VISTA.DetalleVentaVista
{
    public partial class DetalleVentaIngresarVista : Form
    {
        public DetalleVentaIngresarVista()
        {
            InitializeComponent();
        }

        private void label5_Click(object sender, EventArgs e)
        {

        }
        DetalleVentaBss bss = new DetalleVentaBss();
        private void button1_Click(object sender, EventArgs e)
        {
            DetalleVenta p = new DetalleVenta();
            p.IdVenta = textBox1.TabIndex;
            p.IdProducto = textBox2.TabIndex;
            p.Cantidad = textBox3.TabIndex;
            p.PrecioVenta = textBox4.TabIndex;
            p.SubTotal = textBox5.TabIndex;
            
            bss.InsertarDetalleVentaBSs(p);
            MessageBox.Show("Se guardo correctamente");
        }
    }
}
