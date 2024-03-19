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

namespace SistemasVentas.VISTA.ProveedorVista
{
    public partial class ProveedorInsertarVista : Form
    {
        public ProveedorInsertarVista()
        {
            InitializeComponent();
        }
        ProveedorBss bss=new ProveedorBss();
        private void button1_Click(object sender, EventArgs e)
        {
            Proveedor p = new Proveedor();
            p.Nombre = textBox1.Text;
            p.Telefono= textBox2.Text;
            p.Dirección = textBox3.Text;

            bss.InsertarProveedorBSs(p);
            MessageBox.Show("Se guardo correctamente");
        }
    }
}
