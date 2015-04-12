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
    public class CourseController : Controller
    {
        private ExamdbContext db = new ExamdbContext();

        // GET: /Course/
        public ActionResult Index(int? id)
        {
            if (Convert.ToBoolean(Session["UserValid"]) == true)
            {
                int? cur_id = (id ?? 0);
                if (TempData["SectionID"] != null && cur_id == 0)
                {
                    cur_id = (int)TempData["SectionID"];
                }
                List<Course> Courselist = new List<Course>();
                if (cur_id > 0)
                {
                    TempData["SectionID"] = cur_id;
                    Courselist = db.Courses.Where(t => t.SectionID == cur_id).ToList();
                    var cur = db.Sections.Where(t => t.SectionID == cur_id).Single();
                    TempData["SectionName"] = (string)cur.ShortName;
                }
                TempData.Keep();

                return View("Index", Courselist);
            }
            else { return RedirectToAction("Login", "Person"); }
        }

        // GET: /Course/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Course course = db.Courses.Find(id);
            if (course == null)
            {
                return HttpNotFound();
            }
            return View(course);
        }

        // GET: /Course/Create
        public ActionResult Create()
        {
            ViewBag.SectionID = new SelectList(db.Sections, "SectionID", "Name");
            Course course = new Course();
            List<Course> lastcourse = new List<Course>();
            try
            {
                int SectionId = (int)TempData["SectionID"];
                lastcourse = db.Courses.Where(t => t.SectionID == SectionId).ToList();
                var maxlast = lastcourse.Count() - 1;
                course.CourseID = lastcourse[maxlast].CourseID + 1;
                course.SectionID = SectionId;
                TempData.Keep();

            }
            catch (Exception e)
            {
                string s = e.Message;
                //int SectionId = Convert.ToInt16(TempData["SectionID"]);
            }
            return View(course);
        }

        // POST: /Course/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "CourseID,SectionID,Name,ShortName,CatalogCopy,Prerequisites,YearInCurriculum,Scope,Topics,Discussion")] Course course)
        {
            if (ModelState.IsValid)
            {
                db.Courses.Add(course);
                db.SaveChanges();
                return RedirectToAction("Index", new { @id = course.SectionID });
            }

            ViewBag.SectionID = new SelectList(db.Sections, "SectionID", "Name", course.SectionID);
            return View(course);
        }

        // GET: /Course/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Course course = db.Courses.Find(id);
            if (course == null)
            {
                return HttpNotFound();
            }
            //ViewBag.SectionID = new SelectList(db.Sections, "SectionID", "Name", course.SectionID);
            return View(course);
        }

        // POST: /Course/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "CourseID,SectionID,Name,ShortName,CatalogCopy,Prerequisites,YearInCurriculum,Scope,Topics,Discussion")] Course course)
        {
            if (ModelState.IsValid)
            {
                db.Entry(course).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index", new { @id = course.SectionID });
            }
            ViewBag.SectionID = new SelectList(db.Sections, "SectionID", "Name", course.SectionID);
            return View(course);
        }

        // GET: /Course/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Course course = db.Courses.Find(id);
            if (course == null)
            {
                return HttpNotFound();
            }
            return View(course);
        }

        // POST: /Course/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Course course = db.Courses.Find(id);
            db.Courses.Remove(course);
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
