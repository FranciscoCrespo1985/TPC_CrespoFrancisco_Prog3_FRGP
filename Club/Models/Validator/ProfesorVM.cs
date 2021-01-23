using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel.DataAnnotations;
using System.Web;
using System.Web.Profile;

namespace Club.Models
{

    public class ProfesorVM 
    {

      
        public long ID_PROFESOR { get; set; }
        [Required]
        [RegularExpression("([1-9][0-9]*)", ErrorMessage = "Solo se admiten numeros naturales")]
        [StringLength(15, ErrorMessage = "El {0} debe ser al menos {2} characters de largo y {1} de maximo", MinimumLength = 8)]
        [Display(Name = "Ingrese su DNI")]
        public string DNI { get; set; }
        [Required]
        [StringLength(255, ErrorMessage = "El {0} debe ser al menos {2} characters long", MinimumLength = 2)]
        [Display(Name = "Nombre")]
        public string NOMBRE { get; set; }
        [Required]
        [StringLength(255, ErrorMessage = "El {0} debe ser al menos {2} characters long", MinimumLength = 2)]
        [Display(Name = "Apellido")]
        public string APELLIDO { get; set; }
        [Required]
        [RegularExpression(@"^\d{8,14}$")]
        [StringLength(15, ErrorMessage = "El {0} debe ser al menos {2} characters de largo y {1} de maximo", MinimumLength = 8)]

        public string TELEFONO { get; set; }
        [Required]
        [EmailAddress]
        [Display(Name = "Email")]
        public string EMAIL { get; set; }

        public bool ESTADO { get; set; }


    }
    [MetadataType(typeof(PROFESOR_METADATA))]
    public partial class PROFESOR 
    { 
    
    }
    public class PROFESOR_METADATA
    {
        //[ScaffoldColumn(false)]
        //public long ID_PROFESOR { get; set; }
        //[Required]
        //[RegularExpression("([1-9][0-9]*)", ErrorMessage = "Solo se admiten numeros naturales")]
        //[StringLength(15, ErrorMessage = "El {0} debe ser al menos {2} characters de largo y {1} de maximo", MinimumLength = 8)]
        //[Display(Name = "Ingrese su DNI")]
        //public string DNI { get; set; }
        //[Required]
        //[StringLength(255, ErrorMessage = "El {0} debe ser al menos {2} characters long", MinimumLength = 2)]
        //[Display(Name = "Nombre")]
        //public string NOMBRE { get; set; }
        //[Required]
        //[StringLength(255, ErrorMessage = "El {0} debe ser al menos {2} characters long", MinimumLength = 2)]
        //[Display(Name = "Apellido")]
        //public string APELLIDO { get; set; }
        //[Required]
        //[RegularExpression(@"^\d{8,14}$")]
        //[StringLength(15, ErrorMessage = "El {0} debe ser al menos {2} characters de largo y {1} de maximo", MinimumLength = 8)]
        
        //public string TELEFONO { get; set; }
        //[Required]
        //[EmailAddress]
        //[Display(Name = "Email")]
        //public string EMAIL { get; set; }
    }
}