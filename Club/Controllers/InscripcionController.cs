using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Mapping;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Club.Models;
using Microsoft.AspNet.Identity;
namespace Club.Controllers
{
    [Authorize(Roles = "Admin,Socio")]
    public class InscripcionController : Controller
    {




        // GET: Inscripcion
        dbClub db = new dbClub();
        
        public ActionResult Index()
        {


         
            List<VM_ACTIVIDAD_INSCRIPCION> vm_actividad_incripcion_List = new List<VM_ACTIVIDAD_INSCRIPCION>();
            VM_ACTIVIDAD_INSCRIPCION vm_actividad_incripcion;
            VM_ACTIVIDAD_INSCRIPCION_2 vm_actividad_insciopcion_2 = new VM_ACTIVIDAD_INSCRIPCION_2();
            vm_actividad_insciopcion_2.lIncripto = new List<VM_ACTIVIDAD_INSCRIPCION>();


            HorarioVM horarioVM;
            var strCurrentUserId = User.Identity.GetUserId();
            foreach (var actividad in db.SV_ACTIVIDAD.Where(e => e.ESTADO == true && e.ESTADO_PROFESOR== true && e.FECHA_FIN >DateTime.Now))
            {
                vm_actividad_incripcion = new VM_ACTIVIDAD_INSCRIPCION();

                
                    vm_actividad_incripcion.FECHA_FIN = actividad.FECHA_FIN;
                    vm_actividad_incripcion.ESTADO = actividad.ESTADO;
                    vm_actividad_incripcion.FECHA_INICIO = actividad.FECHA_INICIO;
                    vm_actividad_incripcion.ID_ACTIVIDAD = actividad.ID_ACTIVIDAD;
                    vm_actividad_incripcion.NOMBRE_COMPLETO = actividad.NOMBRE_COMPLETO;
                    vm_actividad_incripcion.DESCRIPCION = actividad.DESCRIPCION;
                    vm_actividad_incripcion.ACTIVIDAD_DESCRIPCION = actividad.ACTIVIDAD_DESCRIPCION;

                    foreach (var horario in db.HORARIO.Where(e => e.ID_ACTIVIDAD == actividad.ID_ACTIVIDAD && e.LOCACION.ESTADO == true))
                    {
                        horarioVM = new HorarioVM();

                        horarioVM.DIA = Enum.GetName(typeof(Enumeradores.DIAS), horario.DIA);
                        horarioVM.HORA_INICIO = horario.HORA_INICIO;
                        horarioVM.HORA_FIN = horario.HORA_FIN;
                        horarioVM.ID_ACTIVIDAD = horario.ID_ACTIVIDAD;
                        horarioVM.nombreLocacion = horario.LOCACION.DESCRIPCION;
                        vm_actividad_incripcion.lHorario.Add(horarioVM);
                    }
                    vm_actividad_incripcion_List.Add(vm_actividad_incripcion);
                
            }
            vm_actividad_insciopcion_2.lActividad =  vm_actividad_incripcion_List;


            var inscripciones = db.SV_USER_INSCRIPCION.ToList(); // preguntar
           
            
            foreach (var actividad in db.SV_USER_INSCRIPCION.Where(e=>e.ID_SOCIO == strCurrentUserId && e.ESTADO_INSCRIPCION == true))
            {
                vm_actividad_incripcion = new VM_ACTIVIDAD_INSCRIPCION();
                
                if (actividad.ESTADO_ACTIVIDAD == true)
                {
                    vm_actividad_incripcion.FECHA_FIN = actividad.FECHA_FIN;
                    vm_actividad_incripcion.ESTADO = actividad.ESTADO_ACTIVIDAD;
                    vm_actividad_incripcion.FECHA_INICIO = actividad.FECHA_INICIO;
                    vm_actividad_incripcion.ID_ACTIVIDAD = actividad.ID_ACTIVIDAD;
                    vm_actividad_incripcion.NOMBRE_COMPLETO = actividad.NOMBRE_COMPLETO;
                    vm_actividad_incripcion.DESCRIPCION = actividad.DESCRIPCION;
                    vm_actividad_incripcion.ACTIVIDAD_DESCRIPCION = actividad.ACTIVIDAD_DESCRIPCION;

                    foreach (var horario in db.HORARIO.Where(e => e.ID_ACTIVIDAD == actividad.ID_ACTIVIDAD))
                    {
                        horarioVM = new HorarioVM();

                        horarioVM.DIA = Enum.GetName(typeof(Enumeradores.DIAS), horario.DIA);
                        horarioVM.HORA_INICIO = horario.HORA_INICIO;
                        horarioVM.HORA_FIN = horario.HORA_FIN;
                        horarioVM.ID_ACTIVIDAD = horario.ID_ACTIVIDAD;
                        horarioVM.nombreLocacion = horario.LOCACION.DESCRIPCION;
                        vm_actividad_incripcion.lHorario.Add(horarioVM);
                    }
                    vm_actividad_insciopcion_2.lIncripto.Add(vm_actividad_incripcion);
                }
            }
            
            return View(vm_actividad_insciopcion_2);
        }

       
        public ActionResult Edit(int? id)
        {
            var user = User.Identity.GetUserId();
            db.SP_INSCRIPCION(User.Identity.GetUserId(),id,DateTime.Today);


            return RedirectToAction("Index");
        }

        public ActionResult Baja(int? id)
        {

            db.SP_INSCRIPCION_BAJA(User.Identity.GetUserId(), id, DateTime.Today);


            return RedirectToAction("Index");
        }



    }

}