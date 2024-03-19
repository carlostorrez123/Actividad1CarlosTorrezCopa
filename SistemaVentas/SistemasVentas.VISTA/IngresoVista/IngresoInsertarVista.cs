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

namespace SistemasVentas.VISTA.IngresoVista
{
    public partial class IngresoInsertarVista : Form
    {
        public IngresoInsertarVista()
        {
            InitializeComponent();
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }
        IngresoBss bss= new IngresoBss();
        private int tabindex;

        private void button1_Click(object sender, EventArgs e)
        {
            Ingreso p = new Ingreso();
            p.IdProveedor = tabindex;
            p.Total=tabindex;
            bss.InsertarIngresoBSs(p);
            MessageBox.Show("Se guardo correctamente");
        }
    }
}
