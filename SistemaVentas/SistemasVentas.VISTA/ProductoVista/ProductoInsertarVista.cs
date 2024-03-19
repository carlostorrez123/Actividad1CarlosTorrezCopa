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

namespace SistemasVentas.VISTA.ProductoVista
{
    public partial class ProductoInsertarVista : Form
    {
        public ProductoInsertarVista()
        {
            InitializeComponent();
        }

        private void ProductoInsertarVista_Load(object sender, EventArgs e)
        {

        }
        ProductoBss bss = new ProductoBss();
        private void button1_Click(object sender, EventArgs e)
        {
            Producto p = new Producto();
            p.IdTipoProd = textBox1.TabIndex;
            p.IdMarca = textBox2.TabIndex;
            p.Nombre = textBox3.Text;
            p.CodigoBarra = textBox4.Text;
            p.Unidad = textBox5.TabIndex;
            p.Descripcion = textBox6.Text;

            bss.InsertarProductoBSs(p);
            MessageBox.Show("Se guardo correctamente");
        }
    }
}
