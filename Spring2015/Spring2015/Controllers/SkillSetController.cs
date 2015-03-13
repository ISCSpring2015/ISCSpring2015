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
    public class SkillSetController : Controller
    {
        private ExamContext db = new ExamContext();

        // GET: /SkillSet/
        public ActionResult Index(int? id)
        {
            int? cur_id = (id ?? 0);

            List<SkillSet> skillsetlist = new List<SkillSet>();
            if (cur_id > 0)
            {
                Response.Write("Curriculum Id:" + cur_id);
                // skillsetlist=skillsetlist.
              skillsetlist= db.SkillSets.Where(t => t.CurriculumID==cur_id).ToList();
            }
            else
            {
                skillsetlist = db.SkillSets.ToList();
            }

            return View("Index", skillsetlist);
        }

        // GET: /SkillSet/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SkillSet skillset = db.SkillSets.Find(id);
            if (skillset == null)
            {
                return HttpNotFound();
            }
            return View(skillset);
        }

        // GET: /SkillSet/Create
        public ActionResult Create()
        {
            //ViewBag.CurriculumID = new SelectList(db.Curricula, "CurriculumID", "Name");
            return View();
        }

        // POST: /SkillSet/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="SkillsetID,Name,ShortName,CurriculumID")] SkillSet skillset)
        {
            if (ModelState.IsValid)
            {
                db.SkillSets.Add(skillset);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            //ViewBag.CurriculumID = new SelectList(db.Curricula, "CurriculumID", "Name", skillset.CurriculumID);
            return View(skillset);
        }

        // GET: /SkillSet/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SkillSet tblskillset = db.SkillSets.Find(id);
            if (tblskillset == null)
            {
                return HttpNotFound();
            }
            return View(tblskillset);
        }

        // POST: /SkillSet/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="SkillsetID,Name,ShortName,CurriculumID")] SkillSet skillset)
        {
            if (ModelState.IsValid)
            {
                db.Entry(skillset).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            //ViewBag.CurriculumID = new SelectList(db.Curricula, "CurriculumID", "Name", skillset.CurriculumID);
            return View(skillset);
        }

        // GET: /SkillSet/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SkillSet skillset = db.SkillSets.Find(id);
            if (skillset == null)
            {
                return HttpNotFound();
            }
            return View(skillset);
        }

        // POST: /SkillSet/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            SkillSet skillset = db.SkillSets.Find(id);
            db.SkillSets.Remove(skillset);
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
