using Club.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Club.Controllers
{
    [Authorize(Roles = "Admin")]
    public class ProfesorController : Controller
    {
        // GET: Profeso
        dbClub db = new dbClub();
        public ActionResult Index()
        {
            var list = db.PROFESOR;
            return View(list);
        }

        public ActionResult Create()
        {
            return View();
        }

        

        public ActionResult Edit(int? id)
        {
            var profesorVM = new ProfesorVM();
            var profesor = db.PROFESOR.Find(id);

            if (profesor != null)
            {
                profesorVM.ID_PROFESOR = profesor.ID_PROFESOR;
                profesorVM.NOMBRE = profesor.NOMBRE;
                profesorVM.APELLIDO = profesor.APELLIDO;
                profesorVM.DNI = profesor.DNI;
                profesorVM.EMAIL = profesor.EMAIL;
                profesorVM.TELEFONO = profesor.TELEFONO;
                profesorVM.ESTADO = profesor.ESTADO;

            }

            return View(profesorVM);
        }
        [HttpPost]
        public ActionResult Edit(ProfesorVM model)
        {
            if (ModelState.IsValid)
            {
                var profesor = db.PROFESOR.Find(model.ID_PROFESOR);
                if (profesor == null)
                {
                    profesor = new PROFESOR();
                    db.PROFESOR.Add(profesor);
                }
                profesor.NOMBRE = model.NOMBRE;
                profesor.APELLIDO = model.APELLIDO;
                profesor.DNI = model.DNI;
                profesor.EMAIL = model.EMAIL;
                profesor.ESTADO = model.ESTADO;
                profesor.TELEFONO = model.TELEFONO;


                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(model);


        }

    }
}