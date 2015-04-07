using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Spring2015;

namespace Spring2015.Controllers
{
    public class SectionController : Controller
    {
        private ExamdbContext db = new ExamdbContext();

        // GET: /Section/
        public ActionResult Index(int? id)
        {
            if (Convert.ToBoolean(Session["UserValid"]) == true)
            {
                int? cur_id = (id ?? 0);
                if (TempData["CurriculumID"] != null && cur_id == 0)
                {
                    cur_id = (int)TempData["CurriculumID"];
                }
                List<Section> Sectionlist = new List<Section>();
                if (cur_id > 0)
                {
                    TempData["CurriculumID"] = cur_id;
                    Sectionlist = db.Sections.Where(t => t.CurriculumID == cur_id).ToList();
                    var cur = db.Curricula.Where(t => t.CurriculumID == cur_id).Single();
                    TempData["CurriculumName"] = (string)cur.Name;
                }
                TempData.Keep();

                return View("Index", Sectionlist);
            }
            else { return RedirectToAction("Login", "Person"); }
        }

        // GET: /Section/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Section section = db.Sections.Find(id);
            if (section == null)
            {
                return HttpNotFound();
            }
            return View(section);
        }

        // GET: /Section/Create
        public ActionResult Create()
        {
            Section section = new Section();
            List<Section> lastsection = new List<Section>();
            int CurriculumID = (int)TempData["CurriculumID"];
            lastsection = db.Sections.Where(t => t.CurriculumID == CurriculumID).ToList();
            var maxlast = lastsection.Count() - 1;
            section.SectionID = lastsection[maxlast].SectionID + 1;
            section.CurriculumID = CurriculumID;
            return View(section);
        }

        // POST: /Section/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="SectionID,CurriculumID,Name,ShortName,Purpose")] Section section)
        {
            if (ModelState.IsValid)
            {
               
                db.Sections.Add(section);
                db.SaveChanges();
                return RedirectToAction("Index", new { @id = section.CurriculumID });
            }

            ViewBag.CurriculumID = new SelectList(db.Curricula, "CurriculumID", "Name", section.CurriculumID);
            return View(section);
        }

        // GET: /Section/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Section section = db.Sections.Find(id);
            if (section == null)
            {
                return HttpNotFound();
            }
           // ViewBag.CurriculumID = new SelectList(db.Curricula, "CurriculumID", "Name", section.CurriculumID);
            return View(section);
        }

        // POST: /Section/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="SectionID,CurriculumID,Name,ShortName,Purpose")] Section section)
        {
            if (ModelState.IsValid)
            {
                db.Entry(section).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index", new { @id = section.CurriculumID });
            }
            ViewBag.CurriculumID = new SelectList(db.Curricula, "CurriculumID", "Name", section.CurriculumID);
            return View(section);
        }

        // GET: /Section/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Section section = db.Sections.Find(id);
            if (section == null)
            {
                return HttpNotFound();
            }
            return View(section);
        }

        // POST: /Section/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Section section = db.Sections.Find(id);
            db.Sections.Remove(section);
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
