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

namespace SistemasVentas.VISTA.UsuarioRolVista
{
    public partial class UsuarioRolInsertarVista : Form
    {
        public UsuarioRolInsertarVista()
        {
            InitializeComponent();
        }
        UsuarioRolBss bss = new UsuarioRolBss();
        private void button1_Click(object sender, EventArgs e)
        {
            UsuarioRol p = new UsuarioRol();
            p.IdUsuario = textBox1.TextLength;
            p.IdRol = textBox2.TextLength;
            bss.InsertarUsuarioRolBSs(p);
            MessageBox.Show("Se guardo correctamente");
        }
    }
}
