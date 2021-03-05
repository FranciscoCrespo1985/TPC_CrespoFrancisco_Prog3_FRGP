using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using Club.Models;

namespace Club.Controllers
{
    [Authorize(Roles = "Admin")]
    public class ActividadTipoController : Controller
    {

        dbClub db = new dbClub();

        // GET: ActividadTipo
        
        public ActionResult Index()
        {
            var list = db.ACTIVIDAD_TIPO.OrderBy(x=> x.DESCRIPCION) ;
            
            return View(list);
        }
        
        public ActionResult Create() 
        {
            return View();
        }
      
        [HttpPost]
        public ActionResult Create(ACTIVIDAD_TIPO model)
        {

            db.ACTIVIDAD_TIPO.Add(model);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
       
        public ActionResult Delete(int id)
        {
            
            return View();
        }
        public ActionResult Edit(int? id)
        {

           
            var actividad_tipo_vm = new ACTIVIDAD_TIPO_VM();
            var actividad_tipo = db.ACTIVIDAD_TIPO.Find(id);
            

            if (actividad_tipo != null)
            {
                actividad_tipo_vm.ID_ACTIVIDAD_TIPO = actividad_tipo.ID_ACTIVIDAD_TIPO;
                actividad_tipo_vm.DESCRIPCION = actividad_tipo.DESCRIPCION;
            }

            return View(actividad_tipo_vm);
        }
        [HttpPost]
        public ActionResult Edit(ACTIVIDAD_TIPO_VM model)
        {

            if (ModelState.IsValid)
            {
                var tipo = db.ACTIVIDAD_TIPO.Find(model.ID_ACTIVIDAD_TIPO);
                if (tipo == null)
                {
                    tipo = new ACTIVIDAD_TIPO();
                    db.ACTIVIDAD_TIPO.Add(tipo);
                }
                   
                tipo.DESCRIPCION = model.DESCRIPCION;


                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(model);


        }
    }
}