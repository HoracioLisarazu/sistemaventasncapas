﻿using SistemasVentas.BSS;
using SistemasVentas.Modelos;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SistemasVentas.VISTA.MarcaVistas
{
    public partial class MarcaInsertarVista : Form
    {
        public MarcaInsertarVista()
        {
            InitializeComponent();
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }
        MarcaBSS bss = new MarcaBSS();

        

        private void button1_Click_1(object sender, EventArgs e)
        {
            Marca m = new Marca();
            m.Nombre = textBox2.Text;
            bss.InsertarMarcaBss(m);
            MessageBox.Show("Se guardo correctamente");
        }
    }
}
