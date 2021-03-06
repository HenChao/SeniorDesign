﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SeniorDesign.Controllers
{
    public class TransactionWindowController : Controller
    {
        //
        // GET: /TransactionWindow/

        public ActionResult Index(string action, int group)
        {
            ServiceClient sc = Sas.GetAuthenticatedServiceClient(this, action);
            var transactions = sc.GetTransactionWindows(group, new PagedDataRequest() { StartRow = 0, EndRow = 100000 });

            ViewBag.Message = sc.GetGroup(group).Name;

            return View(transactions.Data);
        }

        //
        // GET: /TransactionWindow/Details/5

        public ActionResult Details(int id, int group, string action)
        {
            ServiceClient sc = Sas.GetAuthenticatedServiceClient(this, action);
            SeniorDesign.Models.UserTransactionData utd = new Models.UserTransactionData()
            {
                Costs = sc.GetSplitCosts(group, -1, id).ToList(),
                Payments = sc.GetSplitPayments(group, -1, id).ToList(),
                WindowInfo = sc.GetTransactionWindow(id, group)
            };
            return View(utd);
        }

        //
        // GET: /TransactionWindow/Create

        public ActionResult Create()
        {
            return View(new TransactionWindowInfo());
        } 

        //
        // POST: /TransactionWindow/Create

        [HttpPost]
        public ActionResult Create(TransactionWindowInfo createTransactionWindow, string action, int group)
        {
            ServiceClient sc = Sas.GetAuthenticatedServiceClient(this, action);
            sc.OpenTransactionWindow(group, createTransactionWindow.Name, createTransactionWindow.IsPrimary, null);
            return RedirectToAction("Index", new {group = group});
        }
        

        //
        // GET: /TransactionWindow/Delete/5
 
        public ActionResult Close(int id)
        {
            return View();
        }

        //
        // POST: /TransactionWindow/Delete/5

        [HttpPost]
        public ActionResult Close(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
