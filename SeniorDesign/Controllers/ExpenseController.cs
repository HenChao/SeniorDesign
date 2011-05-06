using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SeniorDesign.Controllers
{
    public class ExpenseController : Controller
    {
        //
        // GET: /Expense/

        public ActionResult Index(int group, string action)
        {
            ServiceClient sc = Sas.GetAuthenticatedServiceClient(this, action);
            ExpenceInfo[] exp = sc.GetAllExpences(group, DateTime.MinValue, DateTime.MaxValue);

            ViewBag.Message = sc.GetGroup(group);
            
            return View(exp);
        }

        //
        // GET: /Expense/Details/5

        public ActionResult Details(int id, string action)
        {
            ServiceClient sc = Sas.GetAuthenticatedServiceClient(this, action);
            ExpenceInfo exp = sc.GetExpence(id);
            return View(exp);
        }

        //
        // Get: /Expense/Image/1

        public ActionResult Image(int id, string action)
        {
            ServiceClient sc = Sas.GetAuthenticatedServiceClient(this, action);
            var imgData = sc.GetImage(id);
            string contentType = "image/jpeg";

            return this.Image(imgData.Data, contentType);
        }

        //
        // GET: /Expense/Create

        public ActionResult Create(int group)
        {
            SeniorDesign.Models.CreateExpenseModel em = new Models.CreateExpenseModel()
            {
                UserId = Sas.GetLoggedInUserId(this, "Create"),
                DateOfExpense = DateTime.Now,
                GroupId = group
            };
            return View(em);
        } 

        //
        // POST: /Expense/Create

        [HttpPost]
        public ActionResult Create(SeniorDesign.Models.CreateExpenseModel expense, string action)
        {
            // TODO: Add insert logic here
            ServiceClient sc = Sas.GetAuthenticatedServiceClient(this, action);
            sc.CreateExpence(expense.Name, expense.Description, expense.Total, expense.DateOfExpense, expense.UserId, expense.ASEPSA, expense.GroupId, "", -1); //TODO: Add category and window input
            return RedirectToAction("Index");
        }


        //
        // GET: /Expense/Finalize/

        public ActionResult Finalize(int id, string action)
        {
            ServiceClient sc = Sas.GetAuthenticatedServiceClient(this, action);
            var result = sc.GetExpence(id);
            
            return View(result);
        }

        [HttpPost]
        public ActionResult Finalize(int id, string action, ExpenceInfo info)
        {
            ServiceClient sc = Sas.GetAuthenticatedServiceClient(this, action);
            sc.FinalizeExpense(id);

            return RedirectToAction("Index");
        }

        public ActionResult SelectUsersForSplit(int id, int group, string action)
        {
            ServiceClient sc = Sas.GetAuthenticatedServiceClient(this, action);
            var usrs = sc.GetAllUsersInGroup(group).Select(p => new SeniorDesign.Models.UserSelectionData()
                {
                    Id = p.Id,
                    IsSelected = false,
                    UserName = p.Username
                }).ToList();
            return View(usrs);
        }

        [HttpPost]
        public ActionResult SelectUsersForSplit(int id, string action, int group, List<SeniorDesign.Models.UserSelectionData> Users)
        {
            TempData["SelectedUsers"] = Users.Where(p => p.IsSelected).ToList();
            return RedirectToAction("PreSplit", new { group = group, id = id });
        }

        public ActionResult PreSplit(int id, string action, int group)
        {
            ServiceClient sc = Sas.GetAuthenticatedServiceClient(this, action);
            SeniorDesign.Models.ExpensePreSplitDisplay data = new Models.ExpensePreSplitDisplay();
            data.Expense = sc.GetExpence(id);
            data.UsersToSplitOver = (List<SeniorDesign.Models.UserSelectionData>)TempData["SelectedUsers"] 
                ?? sc.GetAllUsersInGroup(group).Select(p => new SeniorDesign.Models.UserSelectionData() 
                { Id = p.Id, IsSelected = true, UserName = p.Username }).ToList();
            return View(data);
        }

        [HttpPost]
        public ActionResult PreSplit(int id, string action, int group, List<SeniorDesign.Models.PreSplitData> SplitData)
        {
            ServiceClient sc = Sas.GetAuthenticatedServiceClient(this, action);
            var Exp = sc.GetExpence(id);

            // Convert data to diff format
            var t = (from p in SplitData
                     group p by p.SubExpenseID into bySubExp
                     select new SeniorDesign.Models.SplitDisplayData()
                     {
                         SubExpenseID = bySubExp.Key,
                         SubExpenseName = Exp.SubExpenses.Single(m => m.ID == bySubExp.Key).Name,
                         UserExpences = (from q in bySubExp
                                         select new SeniorDesign.Models.UserExpense()
                                         {
                                             Amount = q.Selected ? 1 : 0,
                                             Id = q.UserID,
                                             UserName = q.UserName
                                         }).ToList()
                     }).ToList();

            // Split sub exp over users 
            foreach (var subExp in t)
            {
                decimal sum = subExp.UserExpences.Sum(p => p.Amount);
                decimal total = Exp.SubExpenses.Single(m => m.ID == subExp.SubExpenseID).AmountTotal;
                decimal amountPerTotal = total / sum;
                subExp.Amount = total;
                foreach (var userExp in subExp.UserExpences)
                {
                    if (userExp.Amount > 0) userExp.Amount = amountPerTotal;
                }
            }

            TempData["UserSplitData"] = t;
            return RedirectToAction("Split", new { group = group, id = id });
        }

        public ActionResult Split(int id, string action, int group)
        {
            var data = (List<SeniorDesign.Models.SplitDisplayData>)TempData["UserSplitData"];
            return View(data);
        }

        [HttpPost]
        public ActionResult Split(int id, string action, int group, List<SeniorDesign.Models.SplitData> SplitData)
        {
            ServiceClient sc = Sas.GetAuthenticatedServiceClient(this, action);
            var subExp = from p in SplitData
                         group p by p.SubExpenseID;
            foreach (var item in subExp)
            {
                var subExpSplitData = item.ToDictionary(p => p.UserID, p => p.Amount);
                sc.SplitSubExpense(item.First().SubExpenseID, subExpSplitData);
            }

            return View();
        }

        //
        // GET: /Expense/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Expense/Edit/5

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
        // GET: /Expense/Delete/5
 
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Expense/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
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
