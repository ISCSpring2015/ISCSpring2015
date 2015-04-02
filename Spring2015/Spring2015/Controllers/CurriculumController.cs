using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Spring2015.Models;

namespace Spring2015.Controllers
{
    public class CurriculumController : Controller
    {
        private ExamdbContext db = new ExamdbContext();

        // GET: /Curriculum/123
        public ActionResult Index()
        {
            if (Convert.ToBoolean(Session["UserValid"]) == true) {
            return View(db.Curricula.ToList());
            }
            else { return RedirectToAction("Login","Person"); }
        }

        // GET: /Curriculum/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Curriculum curriculum = db.Curricula.Find(id);
            if (curriculum == null)
            {
                return HttpNotFound();
            }
            
            return View(curriculum);
        }

        // GET: /Curriculum/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: /Curriculum/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="CurriculumID,Name,Shortname,InitialDate,ReleaseDate,CloseDate,Purpose")] Curriculum curriculum)
        {
            if (ModelState.IsValid)
            {
                db.Curricula.Add(curriculum);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(curriculum);
        }

        // GET: /Curriculum/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Curriculum curriculum = db.Curricula.Find(id);
            if (curriculum == null)
            {
                return HttpNotFound();
            }
            return View(curriculum);
        }

        // POST: /Curriculum/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="CurriculumID,Name,Shortname,InitialDate,ReleaseDate,CloseDate,Purpose")] Curriculum curriculum)
        {
            if (ModelState.IsValid)
            {
                db.Entry(curriculum).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(curriculum);
        }

        // GET: /Curriculum/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Curriculum curriculum = db.Curricula.Find(id);
            if (curriculum == null)
            {
                return HttpNotFound();
            }
            return View(curriculum);
        }

        // POST: /Curriculum/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Curriculum curriculum = db.Curricula.Find(id);
            db.Curricula.Remove(curriculum);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
