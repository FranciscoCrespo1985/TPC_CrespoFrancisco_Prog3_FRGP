using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Club.Models.Validator
{
    public class sociosInscriptosVM
    {
        public string DNI { get; set; }
        public string nombre { get; set; }
        public string apellido { get; set; }
        public string idSocio { get; set; }
        public string Email { get; set; }
        public string telefono { get; set; }
        public bool estado { get; set; }
        public int idActividad{ get; set; }

    }
}