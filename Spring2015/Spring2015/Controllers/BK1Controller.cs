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
    public class BK1Controller : Controller
    {
        private ExamdbContext db = new ExamdbContext();

        // GET: /BK1/11
        public ActionResult Index(int? id)
        {
            int? cur_id = (id ?? 0);
            if (TempData["CurriculumID"] != null && cur_id == 0)
            {
                cur_id = (int)TempData["CurriculumID"];
            }
            List<BKLevel1> BKLevel1list = new List<BKLevel1>();
            if (cur_id > 0)
            {
                TempData["CurriculumID"] = cur_id;

                //Response.Write("Curriculum Id:" + cur_id);
                // skillsetlist=skillsetlist.
                BKLevel1list = db.BKLevel1.Where(t => t.CurriculumID == cur_id).ToList();
                var cur = db.Curricula.Where(t => t.CurriculumID == cur_id).Single();
                TempData["CurriculumName"] = (string)cur.Name;
            }
                TempData.Keep();
            //else
            //{
            //    BKLevel1list = db.BKLevel1.ToList();
            //}
            return View("Index", BKLevel1list);

            //var bklevel1 = db.BKLevel1.Include(b => b.Curriculum);
            //return View(bklevel1.ToList());
        }

        // GET: /BK1/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BKLevel1 bklevel1 = db.BKLevel1.Find(id);
            if (bklevel1 == null)
            {
                return HttpNotFound();
            }
            return View(bklevel1);
        }

        // GET: /BK1/Create
        public ActionResult Create()
        {
            //ViewBag.CurriculumID = new SelectList(db.Curricula, "CurriculumID", "Name");
            BKLevel1 bklevel1 = new BKLevel1();
            List<BKLevel1> lastbklevel1 = new List<BKLevel1>();
            int CurriculumID = (int)TempData["CurriculumID"];
            lastbklevel1 = db.BKLevel1.Where(t => t.CurriculumID == CurriculumID).ToList();
            // var te = db.Skills.Where(t => t.SkillsetID == (int)TempData["skillset_id"]).Last();
            var maxlast = lastbklevel1.Count() - 1;

            bklevel1.NumberLevel1 = lastbklevel1[maxlast].NumberLevel1 + 1;
            bklevel1.CurriculumID = CurriculumID;
            return View(bklevel1);
        }

        // POST: /BK1/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="BKLevel1ID,CurriculumID,NumberLevel1,Name,ShortName")] BKLevel1 bklevel1)
        {
            if (ModelState.IsValid)
            {
                db.BKLevel1.Add(bklevel1);
                db.SaveChanges();
                return RedirectToAction("Index", new { @id = bklevel1.CurriculumID });
            }

            ViewBag.CurriculumID = new SelectList(db.Curricula, "CurriculumID", "Name", bklevel1.CurriculumID);
            return View(bklevel1);
        }

        // GET: /BK1/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BKLevel1 bklevel1 = db.BKLevel1.Find(id);
            if (bklevel1 == null)
            {
                return HttpNotFound();
            }
            //ViewBag.CurriculumID = new SelectList(db.Curricula, "CurriculumID", "Name", bklevel1.CurriculumID);
            return View(bklevel1);
        }

        // POST: /BK1/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "BKLevel1ID,Name,ShortName,CurriculumID,NumberLevel1")] BKLevel1 bklevel1)
        {
            if (ModelState.IsValid)
            {
                db.Entry(bklevel1).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index", new { @id = bklevel1.CurriculumID });
            }
            //ViewBag.CurriculumID = new SelectList(db.Curricula, "CurriculumID", "Name", bklevel1.CurriculumID);
            return View(bklevel1);
        }

        // GET: /BK1/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BKLevel1 bklevel1 = db.BKLevel1.Find(id);
            if (bklevel1 == null)
            {
                return HttpNotFound();
            }
            return View(bklevel1);
        }

        // POST: /BK1/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            BKLevel1 bklevel1 = db.BKLevel1.Find(id);
            db.BKLevel1.Remove(bklevel1);
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
