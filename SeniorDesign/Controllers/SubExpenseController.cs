using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SeniorDesign.Controllers
{
    public class SubExpenseController : Controller
    {
        //
        // GET: /SubExpense/

        public ActionResult Index()
        {
            return View();
        }

        //
        // GET: /SubExpense/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /SubExpense/Create

        public ActionResult Create(int id, string action)
        {
            ServiceClient sc = Sas.GetAuthenticatedServiceClient(this, action);
            SubExpenceInfo subExp = new SubExpenceInfo();
            subExp.ExpenseID = id;

            return View(subExp);
        } 

        //
        // POST: /SubExpense/Create

        [HttpPost]
        public ActionResult Create(SubExpenceInfo subExp, string action)
        {
            ServiceClient sc = Sas.GetAuthenticatedServiceClient(this, action);
            sc.AddSubExpense(subExp.ExpenseID, subExp.AmountTotal, subExp.Name, subExp.Description);

            return RedirectToAction("Details", "Expense", new { id = subExp.ExpenseID });
        }
        
        //
        // GET: /SubExpense/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /SubExpense/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /SubExpense/Delete/5
 
        public ActionResult Delete(int id, string action)
        {
            ServiceClient sc = Sas.GetAuthenticatedServiceClient(this, action);
            var result = sc.GetSubExpense(id);
            return View(result);
        }

        //
        // POST: /SubExpense/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, SubExpenceInfo sei, string action)
        {
            ServiceClient sc = Sas.GetAuthenticatedServiceClient(this, action);
            sc.RemoveSubExpense(id);
            return RedirectToAction("Details", "Expense", new { id = sei.ExpenseID });
        }
    }
}
