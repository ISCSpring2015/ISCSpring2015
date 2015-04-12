using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Spring2015.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            //Change123
            
            return View();
        }

        public ActionResult About()
        {
            //2nd
            //3rd Change
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}