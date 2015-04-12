using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Spring2015;
using System.Data.Entity.Infrastructure;

namespace Spring2015.Controllers
{
    public class BK2Controller : Controller
    {
        private ExamdbContext db = new ExamdbContext();

        // GET: /BK2/11
        public ActionResult Index(int? id)
        {
            if (Convert.ToBoolean(Session["UserValid"]) == true)
            {
                int? BkLevel1_id = (id ?? 0);
                if (TempData["BkLevel1_id"] != null && BkLevel1_id == 0)
                {
                    BkLevel1_id = (int)TempData["BkLevel1_id"];
                }
                else { TempData["BkLevel1_id"] = BkLevel1_id; }
                List<BKLevel2> BKLevel2list = new List<BKLevel2>();
                if (BkLevel1_id > 0)
                {
                    //Response.Write("BKLevel1 Id:" + BK1_id);
                    // skillsetlist=skillsetlist.
                    BKLevel2list = db.BKLevel2.Where(t => t.BKLevel1ID == BkLevel1_id).ToList();
                    var cur = db.BKLevel1.Where(t => t.BKLevel1ID == BkLevel1_id).Single();
                    TempData["BkLevel1_Name"] = (string)cur.ShortName;
                }
                TempData.Keep();
                //else
                //{
                //    BKLevel2list = db.BKLevel2.ToList();
                //}
                return View("Index", BKLevel2list);
            }
            else { return RedirectToAction("Login", "Person"); }
        }

        // GET: /BK2/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BKLevel2 bklevel2 = db.BKLevel2.Find(id);
            if (bklevel2 == null)
            {
                return HttpNotFound();
            }
            TempData.Keep();
            return View(bklevel2);
        }

        // GET: /BK2/Create
        public ActionResult Create()
        {
            ViewBag.BKLevel1ID = new SelectList(db.BKLevel1, "BKLevel1ID", "Name");
            BKLevel2 bklevel2 = new BKLevel2();
            List<BKLevel2> lastBklevel2 = new List<BKLevel2>();
            int BkLevel1id = (int)TempData["BkLevel1_id"];
            lastBklevel2 = db.BKLevel2.Where(t => t.BKLevel1ID == BkLevel1id).ToList();
            // var te = db.Skills.Where(t => t.SkillsetID == (int)TempData["skillset_id"]).Last();
            var maxlast = lastBklevel2.Count() - 1;

            bklevel2.NumberLevel2 = lastBklevel2[maxlast].NumberLevel2 + 1;
            bklevel2.NumberLevel1 = lastBklevel2[maxlast].NumberLevel1;
            bklevel2.BKLevel1ID = lastBklevel2[maxlast].BKLevel1ID;
            TempData.Keep();
            return View(bklevel2);
        }

        // POST: /BK2/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "BKLevel2ID,BKLevel1ID,Name,ShortName,NumberLevel1,NumberLevel2")] BKLevel2 bklevel2)
        {
            if (ModelState.IsValid)
            {
                db.BKLevel2.Add(bklevel2);
                db.SaveChanges();
                TempData.Keep();
                return RedirectToAction("Index");
            }

            ViewBag.BKLevel1ID = new SelectList(db.BKLevel1, "BKLevel1ID", "Name", bklevel2.BKLevel1ID);
            TempData.Keep();
            return View(bklevel2);
        }

        // GET: /BK2/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BKLevel2 bklevel2 = db.BKLevel2.Find(id);
            if (bklevel2 == null)
            {
                return HttpNotFound();
            }
            ViewBag.BKLevel1ID = new SelectList(db.BKLevel1, "BKLevel1ID", "Name", bklevel2.BKLevel1ID);
            TempData.Keep();
            return View(bklevel2);
        }

        // POST: /BK2/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "BKLevel2ID,BKLevel1ID,Name,ShortName,NumberLevel1,NumberLevel2")] BKLevel2 bklevel2)
        {
            if (ModelState.IsValid)
            {
                db.Entry(bklevel2).State = EntityState.Modified;
                try
                {
                    db.SaveChanges();
                    TempData.Keep();
                    return RedirectToAction("Index");
                }
                catch (DbUpdateConcurrencyException ex)
                {
                    var bkleve2 = ex.Entries.Single();
                    bkleve2.OriginalValues.SetValues(bkleve2.GetDatabaseValues());
                    db.SaveChanges();
                    TempData.Keep();
                    return RedirectToAction("Index");
                }
            }
            ViewBag.BKLevel1ID = new SelectList(db.BKLevel1, "BKLevel1ID", "Name", bklevel2.BKLevel1ID);
            return View(bklevel2);
        }

        // GET: /BK2/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BKLevel2 bklevel2 = db.BKLevel2.Find(id);
            if (bklevel2 == null)
            {
                return HttpNotFound();
            }
            TempData.Keep();
            return View(bklevel2);
        }

        // POST: /BK2/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            BKLevel2 bklevel2 = db.BKLevel2.Find(id);
            db.BKLevel2.Remove(bklevel2);
            db.SaveChanges();
            TempData.Keep();
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
