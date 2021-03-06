﻿using System;
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
        private ExamdbContext db = new ExamdbContext();

        // GET: /SkillSet/
        public ActionResult Index(int? id)
        {
            if (Convert.ToBoolean(Session["UserValid"]) == true)
            {
                int? cur_id = (id ?? 0);
                if (TempData["CurriculumID"] != null && cur_id == 0)
                {
                    cur_id = (int)TempData["CurriculumID"];
                }
                else { TempData["CurriculumID"] = cur_id; }
                List<SkillSet> skillsetlist = new List<SkillSet>();
                if (cur_id > 0)
                {
                    TempData["CurriculumID"] = cur_id;
                    // Response.Write("Curriculum Id:" + cur_id);
                    // skillsetlist=skillsetlist.
                    skillsetlist = db.SkillSets.Where(t => t.CurriculumID == cur_id).ToList();
                    var cur = db.Curricula.Where(t => t.CurriculumID == cur_id).Single();
                    TempData["CurriculumName"] = (string)cur.Name;
                }
                TempData.Keep();


                return View("Index", skillsetlist);
            }

            else { return RedirectToAction("Login", "Person"); }
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
            TempData.Keep();
            return View(skillset);
        }

        // GET: /SkillSet/Create
        
        public ActionResult Create()
        {
            //ViewBag.CurriculumID = new SelectList(db.Curricula, "CurriculumID", "Name");
            SkillSet skillset = new SkillSet();
            List<SkillSet> lastskillset = new List<SkillSet>();
            int CurriculumID = (int)TempData["CurriculumID"];
            lastskillset = db.SkillSets.Where(t => t.CurriculumID == CurriculumID).ToList();
            // var te = db.Skills.Where(t => t.SkillsetID == (int)TempData["skillset_id"]).Last();
            var maxlast = lastskillset.Count() - 1;

            skillset.skillSetNum1 = lastskillset[maxlast].skillSetNum1 + 1;
            skillset.CurriculumID = CurriculumID;

            return View(skillset);
        }

        // POST: /SkillSet/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "SkillsetID,Name,ShortName,skillSetNum1,CurriculumID")] SkillSet skillset)
        {
            if (ModelState.IsValid)
            {

                db.SkillSets.Add(skillset);
                db.SaveChanges();
                return RedirectToAction("Index", new { @id = skillset.CurriculumID });
            }

            ViewBag.CurriculumID = new SelectList(db.Curricula, "CurriculumID", "Name", skillset.CurriculumID);
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
        public ActionResult Edit([Bind(Include = "SkillsetID,Name,ShortName,CurriculumID,skillSetNum1")] SkillSet skillset)
        {
            if (ModelState.IsValid)
            {
                db.Entry(skillset).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index", new {@id= skillset.CurriculumID });
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
            TempData.Keep();
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
