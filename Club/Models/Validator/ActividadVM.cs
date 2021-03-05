using Club.Models;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using PagedList.Mvc;
using PagedList;
namespace Club.Models
{
    public class ActividadVM 
    {
        public int ID_ACTIVIDAD { get; set; }
        public long ID_PROFESOR { get; set; }

        public int cantInscripto { get; set; }
        public string profesor { get; set; }

        public int ID_ACTIVIDAD_TIPO { get; set; }
        [Required]
        [StringLength(40, ErrorMessage = "El {0} debe ser al menos {2} characters long", MinimumLength = 2)]
        [Display(Name = "Descripcion")]
        public string descripcion { get; set; }

        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public System.DateTime FECHA_INICIO { get; set; }
      
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public System.DateTime FECHA_FIN { get; set; }
        


        public bool ESTADO { get; set; }
        public HorarioVM horario { get; set; }

        public List<HorarioVM> lHorario = new List<HorarioVM>();

    }
    public class VM_ACTIVIDAD_INSCRIPCION 
    {
        public List<HorarioVM> lHorario = new List<HorarioVM>();
        public int ID_ACTIVIDAD { get; set; }
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:dd-MM-yyyy}", ApplyFormatInEditMode = true)]
        public System.DateTime FECHA_INICIO { get; set; }
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:dd-MM-yyyy}", ApplyFormatInEditMode = true)]
        public System.DateTime FECHA_FIN { get; set; }
        public bool ESTADO { get; set; }
        public string ACTIVIDAD_DESCRIPCION { get; set; }
        public string DESCRIPCION { get; set; }
        public string NOMBRE_COMPLETO { get; set; }

        
    }

    public class VM_ACTIVIDAD_INSCRIPCION_2
    {
        public List<VM_ACTIVIDAD_INSCRIPCION> lActividad { get; set; }
        public List<VM_ACTIVIDAD_INSCRIPCION> lIncripto { get; set; }

        public IPagedList<VM_ACTIVIDAD_INSCRIPCION> pActividad { get; set; }
        public IPagedList<VM_ACTIVIDAD_INSCRIPCION> pInscripto { get; set; }

    }

   

}