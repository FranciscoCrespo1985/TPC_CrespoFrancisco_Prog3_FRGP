using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Club.Models
{
    

    public class ACTIVIDAD_TIPO_VM
    {
      
        public int ID_ACTIVIDAD_TIPO { get; set; }
        [Required]
        [StringLength(50,ErrorMessage ="Como maxima {0} y minimo{2}",MinimumLength = 2)]
        public string DESCRIPCION { get; set; }

    }

}