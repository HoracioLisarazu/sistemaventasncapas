﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaVentas.Modelo
{
    public class Usuario
    {
        public int IdUsusario { get; set; }
        public int IdPersona { get; set; }
        public string NombreUser { get; set; }
        public string Contraseña { get; set; }
        public string FechaReg { get; set; }
    }
}
