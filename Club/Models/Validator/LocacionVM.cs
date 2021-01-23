
using System.ComponentModel.DataAnnotations;

namespace Club.Models
{
    public class LocacionVM
    {
        public int ID_LOCACION { get; set; }

        [Required]
        [StringLength(40, ErrorMessage = "El {0} debe ser al menos {2} characters long", MinimumLength = 2)]
        [Display(Name = "Descripcion")]
        public string DESCRIPCION { get; set; }

        [Display(Name = "Tipo")]
        public int ID_TIPO_ACTIVIDAD { get; set; }
        public bool ESTADO { get; set; }
    }
}