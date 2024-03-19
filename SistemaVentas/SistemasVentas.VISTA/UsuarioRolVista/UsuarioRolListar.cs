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
    public partial class UsuarioRolListar : Form
    {
        public UsuarioRolListar()
        {
            InitializeComponent();
        }
        UsuarioRolBss bss=new UsuarioRolBss();
        private void UsuarioRolListar_Load(object sender, EventArgs e)
        {
            dataGridView1.DataSource = bss.ListarUsuarioRolBss();
        }
    }
}
