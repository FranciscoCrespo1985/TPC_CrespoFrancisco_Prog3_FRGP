using Club.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace Club.Controllers
{
    [Authorize(Roles = "Admin")]
    public class ActividadController : Controller
    {
        // GET: Actividad
        dbClub db = new dbClub();
        public ActionResult Index()
        {
            var list = db.ACTIVIDAD.OrderBy(e=>e.descripcion);




            return View(list);
        }

        // GET: Actividad/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Actividad/Create


        // POST: Actividad/Create


        // GET: Actividad/Edit/5
        public ActionResult Edit(int? id)
        {
            ViewBag.Profesor = db.PROFESOR.Where(e => e.ESTADO == true);
            ViewBag.ActividadTipo = db.ACTIVIDAD_TIPO;
            ViewBag.Locacion = db.LOCACION.Where(e => e.ID_TIPO_ACTIVIDAD == 3);

            var actividadVM = new ActividadVM();
            var actividad = db.ACTIVIDAD.Find(id);
            HorarioVM horarioVM;

            if (actividad != null)
            {
                actividadVM.ESTADO = actividad.ESTADO;
                actividadVM.FECHA_FIN = actividad.FECHA_FIN;
                actividadVM.FECHA_INICIO = actividad.FECHA_INICIO;
                actividadVM.ID_ACTIVIDAD = actividad.ID_ACTIVIDAD;
                actividadVM.ID_PROFESOR = actividad.ID_PROFESOR;
                actividadVM.ID_ACTIVIDAD_TIPO = actividad.ID_ACTIVIDAD_TIPO;
                actividadVM.DESCRIPCION = actividad.descripcion;
                foreach (var horario in db.HORARIO.Where(e => e.ID_ACTIVIDAD == id))
                {
                    horarioVM = new HorarioVM();

                    horarioVM.DIA = Enum.GetName(typeof(Enumeradores.DIAS), horario.DIA);
                    horarioVM.HORA_INICIO = horario.HORA_INICIO;
                    horarioVM.HORA_FIN = horario.HORA_FIN;
                    horarioVM.ID_ACTIVIDAD = horario.ID_ACTIVIDAD;
                    horarioVM.ID_HORARIO = horario.ID_HORARIO;
                    horarioVM.ID_LOCACION = horario.ID_LOCACION;
                    actividadVM.lHorario.Add(horarioVM);
                }

            }

            return View(actividadVM);

        }



        // POST: Actividad/Edit/5
        [HttpPost]
        public ActionResult Edit(ActividadVM model)
        {
            if (ModelState.IsValid)
            {
                var actividad = db.ACTIVIDAD.Find(model.ID_ACTIVIDAD);
                if (actividad == null)
                {
                    actividad = new ACTIVIDAD();
                    db.ACTIVIDAD.Add(actividad);

                }
                actividad.ESTADO = model.ESTADO;
                actividad.FECHA_FIN = model.FECHA_FIN;
                actividad.FECHA_INICIO = model.FECHA_INICIO;
                actividad.ID_PROFESOR = model.ID_PROFESOR;
                actividad.ID_ACTIVIDAD_TIPO = model.ID_ACTIVIDAD_TIPO;                
                actividad.descripcion = model.DESCRIPCION;


                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(model);
        }

        // GET: Actividad/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        public JsonResult DeleteHorario(int ID_HORARIO)
        {
            bool result = false;
            var horario = new HORARIO { ID_HORARIO = ID_HORARIO };
            if (horario != null)
            {
                db.HORARIO.Attach(horario);
                db.Entry(horario).State = EntityState.Deleted;
                db.SaveChanges();
                result = true;
            }

            return Json(result, JsonRequestBehavior.AllowGet);
        }




        // POST: Actividad/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        public JsonResult AddHorario(ActividadVM actividadVM)
        {
            var result = false;

            try
            {

                var horario = db.HORARIO.Find(actividadVM.horario.ID_HORARIO);
                if (horario == null)
                {
                    horario = new HORARIO();
                    db.HORARIO.Add(horario);
                }
                horario.ID_ACTIVIDAD = actividadVM.ID_ACTIVIDAD;
                horario.ID_LOCACION = actividadVM.horario.ID_LOCACION;
                horario.HORA_INICIO = actividadVM.horario.HORA_INICIO;
                horario.HORA_FIN = actividadVM.horario.HORA_FIN;
                horario.DIA = (short)(Enumeradores.DIAS)Enum.Parse(typeof(Enumeradores.DIAS), actividadVM.horario.DIA, true).GetHashCode();

                if (horario.HORA_INICIO > horario.HORA_FIN)
                {

                    return Json(result, JsonRequestBehavior.AllowGet);

                }
                //si el horario esta disponible en esa locacion
                //profesor disponible en ese horario


               

                //// overlaps de fechas
                var query = db.HORARIO.Where(e => (DbFunctions.CreateDateTime(e.ACTIVIDAD.FECHA_INICIO.Year, e.ACTIVIDAD.FECHA_INICIO.Month, e.ACTIVIDAD.FECHA_INICIO.Day, 0, 0, 0)
                                                <= DbFunctions.CreateDateTime(actividadVM.FECHA_FIN.Year, actividadVM.FECHA_FIN.Month, actividadVM.FECHA_FIN.Day, 0, 0, 0))
                                                 && (DbFunctions.CreateDateTime(actividadVM.FECHA_INICIO.Year, actividadVM.FECHA_INICIO.Month, actividadVM.FECHA_INICIO.Day, 0, 0, 0)
                                                <= DbFunctions.CreateDateTime(e.ACTIVIDAD.FECHA_FIN.Year, e.ACTIVIDAD.FECHA_FIN.Month, e.ACTIVIDAD.FECHA_FIN.Day, 0, 0, 0)) && e.ACTIVIDAD.ESTADO==true);

                var t = query.Count();
                //// overlaps de horarios
                if (query.Count() > 0)
                    query = query.Where(e => (DbFunctions.CreateTime(e.HORA_INICIO.Hour, e.HORA_INICIO.Minute, e.HORA_INICIO.Second)
                                            < DbFunctions.CreateTime(horario.HORA_FIN.Hour, horario.HORA_FIN.Minute, horario.HORA_FIN.Second)) &&
                                             (DbFunctions.CreateTime(horario.HORA_INICIO.Hour, horario.HORA_INICIO.Minute, horario.HORA_INICIO.Second)
                                            < DbFunctions.CreateTime(e.HORA_FIN.Hour, e.HORA_FIN.Minute, e.HORA_FIN.Second)));
                t = query.Count();

                // overlops de dia
                if (query.Count() > 0)
                    query = query.Where(e => (horario.DIA == e.DIA));

                t = query.Count();
                //a partir de aca query tiene todos los horarios que se crusan en fecha  hora y dia
                // overlaps de profesor          

                query = query.Where(e => (e.ACTIVIDAD.ID_PROFESOR == actividadVM.ID_PROFESOR) || (e.ID_LOCACION == horario.ID_LOCACION));

                t = query.Count();




                if(t >0)
                    return Json(result, JsonRequestBehavior.AllowGet);

                db.SaveChanges();
                result = true;


            }
            catch (Exception ex)
            {
                throw ex;
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetHorarioList(int idActividad)
        {

            List<HorarioVM> lHorario = new List<HorarioVM>();
            HorarioVM horarioVM;

            foreach (var horario in db.HORARIO.Where(e => e.ID_ACTIVIDAD == idActividad))
            {
                horarioVM = new HorarioVM();
                horarioVM.DIA = Enum.GetName(typeof(Enumeradores.DIAS), horario.DIA);
                horarioVM.HORA_INICIO = horario.HORA_INICIO;
                horarioVM.HORA_FIN = horario.HORA_FIN;
                horarioVM.ID_ACTIVIDAD = horario.ID_ACTIVIDAD;
                horarioVM.ID_HORARIO = horario.ID_HORARIO;
                horarioVM.ID_LOCACION = horario.ID_LOCACION;
                lHorario.Add(horarioVM);
            }
            return Json(lHorario, JsonRequestBehavior.AllowGet);

        }





        public JsonResult getLocacion(string idTipo)
        {


            try
            {
                // convierto el string que recibo a entero
                int idLoc = idTipo != null && idTipo != "" ? Convert.ToInt32(idTipo) : 0;

                var locacion = db.LOCACION.Where(e => e.ID_TIPO_ACTIVIDAD == idLoc && e.ESTADO == true);
                // acá armas la lista de profesores y la devolves en un JSON 
                return Json(new SelectList(locacion, "ID_LOCACION", "DESCRIPCION"));
            }
            catch (Exception ex)
            {
                return Json(ex);
            }
            finally
            {

            }
        }
        
    }
}
