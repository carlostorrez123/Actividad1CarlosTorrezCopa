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

namespace SistemasVentas.VISTA.RolVista
{
    public partial class RolInsertarVista : Form
    {
        public RolInsertarVista()
        {
            InitializeComponent();
        }

        RolBss bss = new RolBss();

        private void button1_Click(object sender, EventArgs e)
        {
            Rol p = new Rol();
            p.Nombre = textBox1.Text;

            bss.InsertarRolBSs(p);
            MessageBox.Show("Se guardo correctamente");
        }

        private void RolInsertarVista_Load(object sender, EventArgs e)
        {

        }
    }
}
