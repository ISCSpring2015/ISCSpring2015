using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Spring2015;
using Spring2015.Models;

namespace Spring2015.Controllers
{
    public class OutcomeInBK2Controller : Controller
    {
        private ExamdbContext db = new ExamdbContext();

        // GET: /OutcomeInBK2/
        public ActionResult Index(int? bklevel2id)
        {
            //var outcomeinbk2 = db.OutcomeinBK2.Include(o => o.BKLevel2).Include(o => o.Outcome);
            //return View(outcomeinbk2.ToList());
            int bklevel2 = 0;
            if (bklevel2id != null)
                bklevel2 = (int)bklevel2id;
            //ViewBag["outcomeid"] = outcome.ToString();
            Outcome_BKLevel2 outcome_bklevel2 = new Outcome_BKLevel2();
            outcome_bklevel2.Outcomes = db.Outcomes.ToList();
            outcome_bklevel2.BKLevel2 = db.BKLevel2.ToList();
            List<OutcomeinBK2> ssoc = new List<OutcomeinBK2>();
            ssoc = db.OutcomeinBK2.Where(soc => soc.BKLevelID == bklevel2).ToList();
            //subskills_outcome.subskilloutcome =  subskills_outcome.Subskills.Where(sub=>sub.SubskillsID.CompareTo())
            if (ssoc.Count > 0)
            {
                var outcomebklevel2 = outcome_bklevel2.Outcomes.
           Join(ssoc, u => u.OutcomeID, uir => uir.OutcomeID,
           (u, uir) => new { u, uir })
                    //.Where(m => m.r.u.UserId == 1)
           .Select(m => new Outcome
           {
               Course = m.u.Course,
               CourseID = m.u.CourseID,
               Name = m.u.Name,
               DepthOfKnowledge = m.u.DepthOfKnowledge,
               ShortName = m.u.ShortName,
               LearningUnitNumber = m.u.LearningUnitNumber,


               OutcomeID = m.u.OutcomeID,
               OutcomeinBK2 = m.u.OutcomeinBK2
           });
                outcome_bklevel2.OutcomeinBk2 = outcomebklevel2.ToList();

            }
            else
            {
                Outcome blackoutcome = new Outcome();
                List<Outcome> outcomebklevel2 = new List<Outcome>();
                outcomebklevel2.Add(blackoutcome);
                outcome_bklevel2.OutcomeinBk2 = outcomebklevel2.ToList();
            }
            //IEnumerable<SelectListItem> outcomeslist = db.Outcomes
            //                               .Select(i => new SelectListItem()
            //                               {
            //                                   Text = i.ShortName.ToString(),
            //                                   Value = i.OutcomeID.ToString()
            //                               });
            //ViewBag["outcomelist"] = outcomeslist;
            return View(outcome_bklevel2);
        
        }

        // GET: /OutcomeInBK2/Details/5
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

        // GET: /OutcomeInBK2/Create
        public ActionResult Create()
        {
            ViewBag.BKLevelID = new SelectList(db.BKLevel1, "BKLevel1ID", "Name");
            ViewBag.OutcomeID = new SelectList(db.OutcomeinBK2, "OutcomeBK2ID", "OutcomeBK2ID");
            return View();
        }

        // POST: /OutcomeInBK2/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="OutcomeBK2ID,OutcomeID,BKLevelID")] OutcomeinBK2 outcomeinbk2)
        {
            if (ModelState.IsValid)
            {
                db.OutcomeinBK2.Add(outcomeinbk2);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.BKLevelID = new SelectList(db.BKLevel2, "BKLevel2ID", "Name", outcomeinbk2.BKLevelID);
            ViewBag.OutcomeID = new SelectList(db.Outcomes, "OutcomeID", "Name", outcomeinbk2.OutcomeID);
            return View(outcomeinbk2);
        }

        // GET: /OutcomeInBK2/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OutcomeinBK2 outcomeinbk2 = db.OutcomeinBK2.Find(id);
            if (outcomeinbk2 == null)
            {
                return HttpNotFound();
            }
            ViewBag.BKLevelID = new SelectList(db.BKLevel2, "BKLevel2ID", "Name", outcomeinbk2.BKLevelID);
            ViewBag.OutcomeID = new SelectList(db.Outcomes, "OutcomeID", "Name", outcomeinbk2.OutcomeID);
            return View(outcomeinbk2);
        }

        // POST: /OutcomeInBK2/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="OutcomeBK2ID,OutcomeID,BKLevelID")] OutcomeinBK2 outcomeinbk2)
        {
            if (ModelState.IsValid)
            {
                db.Entry(outcomeinbk2).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.BKLevelID = new SelectList(db.BKLevel2, "BKLevel2ID", "Name", outcomeinbk2.BKLevelID);
            ViewBag.OutcomeID = new SelectList(db.Outcomes, "OutcomeID", "Name", outcomeinbk2.OutcomeID);
            return View(outcomeinbk2);
        }

        // GET: /OutcomeInBK2/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OutcomeinBK2 outcomeinbk2 = db.OutcomeinBK2.Find(id);
            if (outcomeinbk2 == null)
            {
                return HttpNotFound();
            }
            return View(outcomeinbk2);
        }

        // POST: /OutcomeInBK2/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            OutcomeinBK2 outcomeinbk2 = db.OutcomeinBK2.Find(id);
            db.OutcomeinBK2.Remove(outcomeinbk2);
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
