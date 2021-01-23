using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Club.Models
{
    public class HorarioVM
    {
        public long ID_HORARIO { get; set; }
        public int ID_ACTIVIDAD { get; set; }
        public string nombreLocacion { get; set; }
        public int ID_LOCACION { get; set; }
        [Required]
        public System.DateTime HORA_INICIO { get; set; }
        [Required]
        public System.DateTime HORA_FIN { get; set; }
        [Required]
        public string DIA { get; set; }
        public bool isDeleted { get; set; }
    }

}