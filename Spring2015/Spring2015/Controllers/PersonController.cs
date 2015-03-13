using Spring2015.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace Spring2015.Controllers
{
    public class PersonController : Controller
    {
       //
        // GET: /Person/
        ExamContext db = new ExamContext();

        [HttpGet]
        public ActionResult LogIn()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(Login pid)
        {
            if((ModelState.IsValid))
            {
               if(IsValid(pid.Email,pid.Password))
               {
                   FormsAuthentication.SetAuthCookie(pid.Email,false);
                   Session["UserValid"] = true;
                   return RedirectToAction("Index","Curriculum");
               }
               else
               {
                   ModelState.AddModelError("","Login data is in correct");
               }
            }
            return View(pid);
        }

        [HttpGet]
        public ActionResult Create()
        {
            Person pid = new Person();
            return View(pid);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Person pid)
        {
            if (ModelState.IsValid)
            {
                var crypto = new SimpleCrypto.PBKDF2();
                var encrPass = crypto.Compute(pid.Password);
                var sysUser = db.People.Create();

                sysUser.Firstname = pid.Firstname;
                sysUser.Lastname = pid.Lastname;
                sysUser.Address1 = pid.Address1;
                sysUser.Address2 = pid.Address2;
                sysUser.City = pid.City;
                sysUser.St = pid.St;
                sysUser.Zip = pid.Zip;
                sysUser.Username = pid.Username;
                sysUser.Dob = pid.Dob;
                sysUser.Phonenumber1 = pid.Phonenumber1;
                sysUser.Phonenumber1type = pid.Phonenumber1type;
                sysUser.Phonenumber2 = pid.Phonenumber2;
                sysUser.Phonenumber2type = pid.Phonenumber2type;
                sysUser.Email = pid.Email;
                pid.Password = encrPass;
                pid.PasswordSalt = crypto.Salt;
                // sysUser.PersonID = Guid.NewGuid();
                db.People.Add(pid);
                db.SaveChanges();
                ModelState.Clear();
                pid = null;
                ViewBag.Message = "Successfully done";
            }
            return View(pid);
        }

        private bool IsValid(string Email,string Password)
        {
            var crypto = new SimpleCrypto.PBKDF2();
            bool isValid = false;
            var pid = db.People.FirstOrDefault(u => u.Email == Email);
            if(pid!=null)
            {
                if(pid.Password==crypto.Compute(Password,pid.PasswordSalt))
                {
                    isValid=true;
                }
            }
            return isValid;
        }
	}
}