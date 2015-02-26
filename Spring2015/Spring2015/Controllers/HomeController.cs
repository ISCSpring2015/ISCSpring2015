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
            //My first commit
            return View();
        }

        public ActionResult About()
        {
            //2nd
            //3rd change
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