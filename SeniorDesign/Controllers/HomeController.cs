﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SeniorDesign.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Message = "Welcome to CostSplit!";

            return View();
        }

        public ActionResult About()
        {
            return View();
        }

        public ActionResult Project()
        {
            return View();
        }
    }
}