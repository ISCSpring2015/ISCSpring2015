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
    public class SubskillsinBk2Controller : Controller
    {
        private ExamdbContext db = new ExamdbContext();

        // GET: /SubskillsinBk2/
        public ActionResult Index(int? bk2id)
        {
            int bk2 = 0;
            if (bk2id != null)
                bk2 = (int)bk2id;
            ViewBag.bk2id = bk2.ToString();
            Subskills_Bk2 subskills_Bk2 = new Subskills_Bk2();
            subskills_Bk2.Subskills = db.SubSkills.ToList();
            subskills_Bk2.bk2 = db.BKLevel2.ToList();
            List<SubskillsinBk2> ssbk = new List<SubskillsinBk2>();
            ssbk = db.SubskillsinBk2.Where(soc => soc.BkLevel2ID == bk2).ToList();
            //subskills_outcome.subskilloutcome =  subskills_outcome.Subskills.Where(sub=>sub.SubskillsID.CompareTo())
            if (ssbk.Count > 0)
            {
                var subskillbk2 = subskills_Bk2.Subskills.
           Join(ssbk, u => u.SubskillsID, uir => uir.SubskillsID,
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
           }).OrderBy(x => x.ShortName);
                subskills_Bk2.subskillbk2 = subskillbk2.ToList();

            }
            else
            {
                SubSkill blackskill = new SubSkill();
                List<SubSkill> subskillbk2 = new List<SubSkill>();
                subskillbk2.Add(blackskill);
                subskills_Bk2.subskillbk2 = subskillbk2.ToList();
            }
            //        foreach (var item in subskills_outcome.subskilloutcome )
            //{
            subskills_Bk2.Subskills = subskills_Bk2.Subskills.Where(m => !subskills_Bk2.subskillbk2.Any(h => h.SubskillsID == m.SubskillsID)).OrderBy(x => x.ShortName).ToList();
            //}     

            //IEnumerable<SelectListItem> outcomeslist = db.Outcomes
            //                               .Select(i => new SelectListItem()
            //                               {
            //                                   Text = i.ShortName.ToString(),
            //                                   Value = i.OutcomeID.ToString()
            //                               });
            //ViewBag["outcomelist"] = outcomeslist;
            return View(subskills_Bk2);
        }


        // GET: /SubskillsinBk2/Details/5
        public ActionResult changes(int bk2id, int subskillid)
        {
            SubskillsinBk2 subskilbk2 = new SubskillsinBk2();
            subskilbk2.BkLevel2ID = bk2id;
            subskilbk2.SubskillsID = subskillid;
            List<SubskillsinBk2> lst_subskill_bk2 = new List<SubskillsinBk2>();
            lst_subskill_bk2 = db.SubskillsinBk2.Where(m => m.SubskillsID == subskillid && m.BkLevel2ID == bk2id).ToList();
            if (lst_subskill_bk2.Count() == 0)
                db.SubskillsinBk2.Add(subskilbk2);
            else
            {
                foreach (var item in lst_subskill_bk2)
                {
                    db.SubskillsinBk2.Remove(item);
                }
            }

            db.SaveChanges();

            return RedirectToAction("Index", new { @bk2id = bk2id });
        }
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SubskillsinBk2 subskillsinbk2 = db.SubskillsinBk2.Find(id);
            if (subskillsinbk2 == null)
            {
                return HttpNotFound();
            }
            return View(subskillsinbk2);
        }

        // GET: /SubskillsinBk2/Details/5
        //public ActionResult Details(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    SubskillsinBk2 subskillsinbk2 = db.SubskillsinBk2.Find(id);
        //    if (subskillsinbk2 == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(subskillsinbk2);
        //}

        // GET: /SubskillsinBk2/Create
        public ActionResult Create()
        {
            ViewBag.BkLevel2ID = new SelectList(db.BKLevel2, "BKLevel2ID", "Name");
            ViewBag.SubskillsBk2ID = new SelectList(db.SubSkills, "SubskillsID", "Name");
            ViewBag.SubskillsID = new SelectList(db.SubSkills, "SubskillsID", "Name");
            return View();
        }

        // POST: /SubskillsinBk2/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="SubskillsBk2ID,SubskillsID,BkLevel2ID")] SubskillsinBk2 subskillsinbk2)
        {
            if (ModelState.IsValid)
            {
                db.SubskillsinBk2.Add(subskillsinbk2);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.BkLevel2ID = new SelectList(db.BKLevel2, "BKLevel2ID", "Name", subskillsinbk2.BkLevel2ID);
            ViewBag.SubskillsBk2ID = new SelectList(db.SubSkills, "SubskillsID", "Name", subskillsinbk2.SubskillsBk2ID);
            ViewBag.SubskillsID = new SelectList(db.SubSkills, "SubskillsID", "Name", subskillsinbk2.SubskillsID);
            return View(subskillsinbk2);
        }

        // GET: /SubskillsinBk2/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SubskillsinBk2 subskillsinbk2 = db.SubskillsinBk2.Find(id);
            if (subskillsinbk2 == null)
            {
                return HttpNotFound();
            }
            ViewBag.BkLevel2ID = new SelectList(db.BKLevel2, "BKLevel2ID", "Name", subskillsinbk2.BkLevel2ID);
            ViewBag.SubskillsBk2ID = new SelectList(db.SubSkills, "SubskillsID", "Name", subskillsinbk2.SubskillsBk2ID);
            ViewBag.SubskillsID = new SelectList(db.SubSkills, "SubskillsID", "Name", subskillsinbk2.SubskillsID);
            return View(subskillsinbk2);
        }

        // POST: /SubskillsinBk2/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="SubskillsBk2ID,SubskillsID,BkLevel2ID")] SubskillsinBk2 subskillsinbk2)
        {
            if (ModelState.IsValid)
            {
                db.Entry(subskillsinbk2).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.BkLevel2ID = new SelectList(db.BKLevel2, "BKLevel2ID", "Name", subskillsinbk2.BkLevel2ID);
            ViewBag.SubskillsBk2ID = new SelectList(db.SubSkills, "SubskillsID", "Name", subskillsinbk2.SubskillsBk2ID);
            ViewBag.SubskillsID = new SelectList(db.SubSkills, "SubskillsID", "Name", subskillsinbk2.SubskillsID);
            return View(subskillsinbk2);
        }

        // GET: /SubskillsinBk2/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SubskillsinBk2 subskillsinbk2 = db.SubskillsinBk2.Find(id);
            if (subskillsinbk2 == null)
            {
                return HttpNotFound();
            }
            return View(subskillsinbk2);
        }

        // POST: /SubskillsinBk2/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            SubskillsinBk2 subskillsinbk2 = db.SubskillsinBk2.Find(id);
            db.SubskillsinBk2.Remove(subskillsinbk2);
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
