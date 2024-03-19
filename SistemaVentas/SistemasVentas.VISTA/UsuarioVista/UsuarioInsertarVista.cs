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

namespace SistemasVentas.VISTA.UsuarioVista
{
    public partial class UsuarioInsertarVista : Form
    {
        public UsuarioInsertarVista()
        {
            InitializeComponent();
        }
        UsuarioBss bss=new UsuarioBss(); 
        private void button1_Click(object sender, EventArgs e)
        {
            Persona p= new Persona();
            p.Usuario = textBox1.Text;
            p.Contraseña = textBox2.Text;

            bss.InsertarUsuarioBSs(p);
            MessageBox.Show("Se guardo correctamente");
        }

        private void UsuarioInsertarVista_Load(object sender, EventArgs e)
        {

        }
    }
}
