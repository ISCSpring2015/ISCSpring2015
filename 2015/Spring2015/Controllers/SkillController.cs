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
    public class SkillController : Controller
    {
        private ExamdbContext db = new ExamdbContext();
        //
        // GET: /Skill/
        public ActionResult Index(int? id)
        {
            int? skillset_id = (id ?? 0);
            if (TempData["skillset_id"] != null && skillset_id == 0)
            {
                skillset_id = (int)TempData["skillset_id"];
            }
            else { TempData["skillset_id"] = skillset_id; }
            List<Skill> skilllist = new List<Skill>();
            if (skillset_id > 0)
            {
                //Response.Write("Skillset Id:" + skillset_id);
                // skillsetlist=skillsetlist.
                skilllist = db.Skills.Where(t => t.SkillsetID == skillset_id).ToList();
                var cur = db.SkillSets.Where(t => t.SkillsetID == skillset_id).Single();
                TempData["skillset_Name"] = (string)cur.Name;
            }
            TempData.Keep();
            //else
            //{
            //    skilllist = db.Skills.ToList();
            //}

            return View("Index", skilllist);
        }

        // GET: /Skill/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Skill skill = db.Skills.Find(id);
            if (skill == null)
            {
                return HttpNotFound();
            }
            TempData.Keep();
            return View(skill);
        }

        // GET: /Skill/Create
        public ActionResult Create()
        {
            ViewBag.SkillsetID = new SelectList(db.SkillSets, "SkillsetID", "Name");
            Skill skill = new Skill();
            List<Skill> lastskill = new List<Skill>();
            int skillsetid = (int)TempData["skillset_id"];
            lastskill = db.Skills.Where(t => t.SkillsetID == skillsetid).ToList();
           // var te = db.Skills.Where(t => t.SkillsetID == (int)TempData["skillset_id"]).Last();
            var maxlast=lastskill.Count()-1;

            skill.SkillNum2 = lastskill[maxlast].SkillNum2 + 1;
            skill.SkillSetNum1 = lastskill[maxlast].SkillSetNum1;
            skill.SkillsetID = lastskill[maxlast].SkillsetID;
            TempData.Keep();
            return View(skill);
        }

        // POST: /Skill/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="SkillID,SkillsetID,SkillSetNum1,SkillNum2,Name,ShortName")] Skill skill)
        {
            if (ModelState.IsValid)
            {
                db.Skills.Add(skill);
                db.SaveChanges();
                TempData.Keep();
                return RedirectToAction("Index");
            }

            ViewBag.SkillsetID = new SelectList(db.SkillSets, "SkillsetID", "Name", skill.SkillsetID);
            TempData.Keep();
            return View(skill);
        }

        // GET: /Skill/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Skill skill = db.Skills.Find(id);
            if (skill == null)
            {
                return HttpNotFound();
            }
            ViewBag.SkillsetID = new SelectList(db.SkillSets, "SkillsetID", "Name", skill.SkillsetID);
            TempData.Keep(); 
            return View(skill);
        }

        // POST: /Skill/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="SkillID,SkillsetID,SkillSetNum1,SkillNum2,Name,ShortName")] Skill skill)
        {
            if (ModelState.IsValid)
            {
                db.Entry(skill).State = EntityState.Modified;
                db.SaveChanges();
                TempData.Keep(); 
                return RedirectToAction("Index");
            }
            ViewBag.SkillsetID = new SelectList(db.SkillSets, "SkillsetID", "Name", skill.SkillsetID);
            return View(skill);
        }

        // GET: /Skill/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Skill skill = db.Skills.Find(id);
            if (skill == null)
            {
                return HttpNotFound();
            }
            TempData.Keep(); 
            return View(skill);
        }

        // POST: /Skill/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Skill skill = db.Skills.Find(id);
            db.Skills.Remove(skill);
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
