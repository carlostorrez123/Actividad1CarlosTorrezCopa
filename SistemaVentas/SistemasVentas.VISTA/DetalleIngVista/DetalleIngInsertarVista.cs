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

namespace SistemasVentas.VISTA.DetalleIngVista
{
    public partial class DetalleIngInsertarVista : Form
    {
        public DetalleIngInsertarVista()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }
        DetalleIngBss BSS = new DetalleIngBss();
        private void button1_Click(object sender, EventArgs e)
        {
            DetalleIng p = new DetalleIng();
            p.IdIngreso = textBox1.TabIndex;
            p.IdProducto = textBox2.TabIndex;
            p.FechaVenc = textBox3.Text;
            p.Cantidad = textBox4.TabIndex;
            p.PrecioCosto = textBox5.TabIndex;
            p.PrecioVenta = textBox6.TabIndex;
            p.SubTotal = textBox7.TabIndex;

            BSS.InsertarDetalleIngBSs(p);
            MessageBox.Show("Se guardo correctamente");
        }
    }
}
