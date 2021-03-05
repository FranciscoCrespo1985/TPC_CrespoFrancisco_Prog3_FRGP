using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Club.Models;

namespace Club.Controllers
{
    [Authorize(Roles = "Admin")]
    public class LocacionController : Controller
    {
        // GET: Locacion
        dbClub db = new dbClub();
        public ActionResult Index()
        {
            var list = db.LOCACION.OrderBy(e=> e.DESCRIPCION);
            return View(list);
        }

        public ActionResult Edit(int? id)
        {
            ViewBag.ACTIVIDAD_TIPO = db.ACTIVIDAD_TIPO;
            var locacionVM = new LocacionVM();
            var locacion = new LOCACION();

            locacion = db.LOCACION.Find(id);

            if (locacion != null)
            {
                locacionVM.DESCRIPCION = locacion.DESCRIPCION;
                locacionVM.ESTADO = locacion.ESTADO;
                locacionVM.ID_LOCACION = locacion.ID_LOCACION;
                locacionVM.ID_TIPO_ACTIVIDAD = locacion.ID_TIPO_ACTIVIDAD;              
            }

            return View(locacionVM);
        }
        [HttpPost]
        public ActionResult Edit(LocacionVM model)
        {

            if (ModelState.IsValid)
            {
                var locacion = db.LOCACION.Find(model.ID_LOCACION);
                if (locacion == null)
                {
                    locacion = new LOCACION();
                    db.LOCACION.Add(locacion);
                }
                locacion.ID_TIPO_ACTIVIDAD = model.ID_TIPO_ACTIVIDAD;
                locacion.ESTADO = model.ESTADO;
                locacion.DESCRIPCION = model.DESCRIPCION;


                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(model);


        }
    }
}