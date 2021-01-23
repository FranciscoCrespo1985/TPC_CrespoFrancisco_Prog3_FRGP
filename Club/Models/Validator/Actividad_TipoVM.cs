using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Club.Models
{
    [MetadataType(typeof(ACTIVIDAD_TIPO_METADATA))]
    public partial class ACTIVIDAD_TIPO
    {

    }

    public class ACTIVIDAD_TIPO_METADATA 
    {
        [ScaffoldColumn(false)]
        public object ID_ACTIVIDAD_TIPO { get; set; }
        [Required]
        [StringLength(50,ErrorMessage ="Como maxima {0} y minimo{2}",MinimumLength = 2)]
        public object DESCRIPCION { get; set; }

    }

}