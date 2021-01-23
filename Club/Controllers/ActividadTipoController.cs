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
            var list = db.ACTIVIDAD_TIPO ;
            
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

    }
}