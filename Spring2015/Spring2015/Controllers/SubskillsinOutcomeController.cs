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
    public class SubskillsinOutcomeController : Controller
    {
        private ExamdbContext db = new ExamdbContext();

        // GET: /SubskillsinOutcome/
        public ActionResult Index(int? outcomeid)
        {
            int outcome = 0;
            if (outcomeid != null)
                outcome = (int)outcomeid;
            ViewBag.outcomeid = outcome.ToString();
            Subskills_Outcome subskills_outcome = new Subskills_Outcome();
            subskills_outcome.Subskills = db.SubSkills.ToList();
            subskills_outcome.Outcomes = db.Outcomes.ToList();
            List<SubskillsinOutcome> ssoc = new List<SubskillsinOutcome>();
            ssoc = db.SubskillsinOutcomes.Where(soc => soc.OutcomeID == outcome).ToList();
            //subskills_outcome.subskilloutcome =  subskills_outcome.Subskills.Where(sub=>sub.SubskillsID.CompareTo())
            if (ssoc.Count > 0)
            {
                var subskilloutcome = subskills_outcome.Subskills.
           Join(ssoc, u => u.SubskillsID, uir => uir.SubskillsID,
           (u, uir) => new { u, uir })
                    //.Where(m => m.r.u.UserId == 1)
           .Select(m => new SubSkill
           {
               BKLevel2Id = m.u.BKLevel2Id,
               JobAdWords = m.u.JobAdWords,
               Name = m.u.Name,
               OutcomeID = m.u.OutcomeID,
               ShortName = m.u.ShortName,
               Skill = m.u.Skill,
               SkillID = m.u.SkillID,
               SkillNum2 = m.u.SkillNum2,
               SkillSetNum1 = m.u.SkillSetNum1,
               SubSkillNum3 = m.u.SubSkillNum3,

               SubskillsID = m.u.SubskillsID,
               SubskillsinBk2 = m.u.SubskillsinBk2
           }).OrderBy(x=>x.ShortName);
                subskills_outcome.subskilloutcome = subskilloutcome.ToList(); 

            }
            else
            {
                SubSkill blackskill = new SubSkill();
                List<SubSkill> subskilloutcome = new List<SubSkill>();
                subskilloutcome.Add(blackskill);
                subskills_outcome.subskilloutcome = subskilloutcome.ToList();
            }
    //        foreach (var item in subskills_outcome.subskilloutcome )
    //{
            subskills_outcome.Subskills = subskills_outcome.Subskills.Where(m => !subskills_outcome.subskilloutcome.Any(h => h.SubskillsID == m.SubskillsID)).OrderBy(x => x.ShortName).ToList();
    //}     
                
            //IEnumerable<SelectListItem> outcomeslist = db.Outcomes
            //                               .Select(i => new SelectListItem()
            //                               {
            //                                   Text = i.ShortName.ToString(),
            //                                   Value = i.OutcomeID.ToString()
            //                               });
            //ViewBag["outcomelist"] = outcomeslist;
            return View(subskills_outcome);
        }

        // GET: /SubskillsinOutcome/Details/5
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

        // GET: /SubskillsinOutcome/Create
        public ActionResult changes(int outcomeid, int subskillid)
        {
            SubskillsinOutcome subskiloutcome = new SubskillsinOutcome();
            subskiloutcome.OutcomeID = outcomeid;
            subskiloutcome.SubskillsID = subskillid;
            List<SubskillsinOutcome> lst_subskill_outcome = new List<SubskillsinOutcome>();
            lst_subskill_outcome = db.SubskillsinOutcomes.Where(m => m.SubskillsID == subskillid && m.OutcomeID == outcomeid).ToList();
            if (lst_subskill_outcome.Count() == 0)
                db.SubskillsinOutcomes.Add(subskiloutcome);
            else {
                foreach (var item in lst_subskill_outcome)
                {
                     db.SubskillsinOutcomes.Remove(item);
                }
            }
               
            db.SaveChanges();
            
            return RedirectToAction("Index", new { @outcomeid = outcomeid });
        }

        // POST: /SubskillsinOutcome/Create
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

        // GET: /SubskillsinOutcome/Edit/5
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

        // POST: /SubskillsinOutcome/Edit/5
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

        // GET: /SubskillsinOutcome/Delete/5
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

        // POST: /SubskillsinOutcome/Delete/5
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
