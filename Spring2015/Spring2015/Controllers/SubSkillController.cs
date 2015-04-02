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
    public class SubSkillController : Controller
    {
        private ExamdbContext db = new ExamdbContext();

        // GET: /SubSkill/
        public ActionResult Index(int? id)
        {
            //var subskills = db.SubSkills.Include(s => s.Skill).Include(s => s.SubskillsinBk2);
            //return View(subskills.ToList());

            int? skill_id = (id ?? 0);
            if (TempData["skill_id"] != null && skill_id == 0)
            {
                skill_id = (int)TempData["skill_id"];
            }
            else { TempData["skill_id"] = skill_id; }
            List<SubSkill> Subskilllist = new List<SubSkill>();
            if (skill_id > 0)
            {
                //Response.Write("Skillset Id:" + skillset_id);
                // skillsetlist=skillsetlist.
                Subskilllist = db.SubSkills.Where(t => t.SkillID == skill_id).ToList();
                var skill = db.Skills.Where(t => t.SkillID == skill_id).Single();
                TempData["skill_Name"] = (string)skill.Name;
            }
            TempData.Keep();
            //else
            //{
            //    skilllist = db.Skills.ToList();
            //}

            return View("Index", Subskilllist);
        }

        // GET: /SubSkill/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SubSkill subskill = db.SubSkills.Find(id);
            if (subskill == null)
            {
                return HttpNotFound();
            }
            return View(subskill);
        }

        // GET: /SubSkill/Create
        public ActionResult Create()
        {
            ViewBag.SkillID = new SelectList(db.Skills, "SkillID", "Name");
            //ViewBag.SubskillsID = new SelectList(db.SubskillsinBk2, "SubskillsBk2ID", "SubskillsBk2ID");
            //return View();

           // ViewBag.SkillsetID = new SelectList(db.SkillSets, "SkillsetID", "Name");
            SubSkill Subskill = new SubSkill();
            List<SubSkill> lastSubskill = new List<SubSkill>();
            int Skillid = (int)TempData["skill_id"];
            lastSubskill = db.SubSkills.Where(t => t.SkillID == Skillid).ToList();
            // var te = db.Skills.Where(t => t.SkillsetID == (int)TempData["skillset_id"]).Last();
            var maxlast = lastSubskill.Count() - 1;
            Subskill.SubSkillNum3 = lastSubskill[maxlast].SubSkillNum3;
            Subskill.SkillNum2 = lastSubskill[maxlast].SkillNum2 + 1;
            Subskill.SkillSetNum1 = lastSubskill[maxlast].SkillSetNum1;
            //
            Subskill.SkillID = lastSubskill[maxlast].SkillID;
            TempData.Keep();
            return View(Subskill);
        }

        // POST: /SubSkill/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="SubskillsID,SkillID,OutcomeID,BKLevel2Id,SkillSetNum1,SkillNum2,SubSkillNum3,Name,ShortName,JobAdWords")] SubSkill subskill)
        {
            if (ModelState.IsValid)
            {
                db.SubSkills.Add(subskill);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.SkillID = new SelectList(db.Skills, "SkillID", "Name", subskill.SkillID);
            ViewBag.SubskillsID = new SelectList(db.SubskillsinBk2, "SubskillsBk2ID", "SubskillsBk2ID", subskill.SubskillsID);
            return View(subskill);
        }

        // GET: /SubSkill/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SubSkill subskill = db.SubSkills.Find(id);
            if (subskill == null)
            {
                return HttpNotFound();
            }
            ViewBag.SkillID = new SelectList(db.Skills, "SkillID", "Name", subskill.SkillID);
            ViewBag.SubskillsID = new SelectList(db.SubskillsinBk2, "SubskillsBk2ID", "SubskillsBk2ID", subskill.SubskillsID);
            return View(subskill);
        }

        // POST: /SubSkill/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="SubskillsID,SkillID,OutcomeID,BKLevel2Id,SkillSetNum1,SkillNum2,SubSkillNum3,Name,ShortName,JobAdWords")] SubSkill subskill)
        {
            if (ModelState.IsValid)
            {
                db.Entry(subskill).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.SkillID = new SelectList(db.Skills, "SkillID", "Name", subskill.SkillID);
            ViewBag.SubskillsID = new SelectList(db.SubskillsinBk2, "SubskillsBk2ID", "SubskillsBk2ID", subskill.SubskillsID);
            return View(subskill);
        }

        // GET: /SubSkill/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SubSkill subskill = db.SubSkills.Find(id);
            if (subskill == null)
            {
                return HttpNotFound();
            }
            return View(subskill);
        }

        // POST: /SubSkill/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            SubSkill subskill = db.SubSkills.Find(id);
            db.SubSkills.Remove(subskill);
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
