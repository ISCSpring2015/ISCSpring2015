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
    public class OutcomeController : Controller
    {
        private ExamdbContext db = new ExamdbContext();

        // GET: /Outcome/
        public ActionResult Index(int? id)
        {

            //var outcomes = db.Outcomes.Include(o => o.Course);
            //return View(outcomes.ToList());
            if (Convert.ToBoolean(Session["UserValid"]) == true)
            {
                //var subskills = db.SubSkills.Include(s => s.Skill).Include(s => s.SubskillsinBk2);
                //return View(subskills.ToList());

                int? Course_id = (id ?? 0);
                if (TempData["Course_id"] != null && Course_id == 0)
                {
                    Course_id = (int)TempData["Course_id"];
                }
                else { TempData["Course_id"] = Course_id; }
                List<Outcome> Outcomelist = new List<Outcome>();
                if (Course_id > 0)
                {
                    //Response.Write("Skillset Id:" + skillset_id);
                    // skillsetlist=skillsetlist.
                    Outcomelist = db.Outcomes.Where(t => t.CourseID == Course_id).ToList();
                    var course = db.Courses.Where(t => t.CourseID == Course_id).Single();
                    TempData["Course_Name"] = (string)course.Name;
                }
                TempData.Keep();
                //else
                //{
                //    skilllist = db.Skills.ToList();
                //}

                return View("Index", Outcomelist);
            }
            else { return RedirectToAction("Login", "Person"); }
        }
        

        // GET: /Outcome/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Outcome outcome = db.Outcomes.Find(id);
            if (outcome == null)
            {
                return HttpNotFound();
            }
            return View(outcome);
        }

        // GET: /Outcome/Create
        public ActionResult Create()
        {
            Outcome outcome = new Outcome();
            List<Outcome> lastOutcome = new List<Outcome>();
            int Courseid = (int)TempData["Course_id"];
            lastOutcome = db.Outcomes.Where(t => t.CourseID == Courseid).ToList();
            var maxlast = lastOutcome.Count() - 1;
            outcome.OutcomeID = lastOutcome[maxlast].OutcomeID + 1;
            outcome.CourseID = Courseid;
            return View(outcome);
            
            
            
            //ViewBag.CourseID = new SelectList(db.Courses, "CourseID", "Name");
            //return View();
        }

        // POST: /Outcome/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="OutcomeID,CourseID,Name,ShortName,DepthOfKnowledge")] Outcome outcome)
        {
            if (ModelState.IsValid)
            {
                db.Outcomes.Add(outcome);
                db.SaveChanges();
                return RedirectToAction("Index", new { @id = outcome.CourseID });
            }

            ViewBag.CourseID = new SelectList(db.Courses, "CourseID", "Name", outcome.CourseID);
            return View(outcome);
        }

        // GET: /Outcome/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Outcome outcome = db.Outcomes.Find(id);
            if (outcome == null)
            {
                return HttpNotFound();
            }
            ViewBag.CourseID = new SelectList(db.Courses, "CourseID", "Name", outcome.CourseID);
            return View(outcome);
        }

        // POST: /Outcome/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="OutcomeID,CourseID,Name,ShortName,DepthOfKnowledge")] Outcome outcome)
        {
            if (ModelState.IsValid)
            {
                db.Entry(outcome).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CourseID = new SelectList(db.Courses, "CourseID", "Name", outcome.CourseID);
            return View(outcome);
        }

        // GET: /Outcome/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Outcome outcome = db.Outcomes.Find(id);
            if (outcome == null)
            {
                return HttpNotFound();
            }
            return View(outcome);
        }

        // POST: /Outcome/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Outcome outcome = db.Outcomes.Find(id);
            db.Outcomes.Remove(outcome);
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
