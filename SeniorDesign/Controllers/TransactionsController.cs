using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SeniorDesign.Controllers
{
    public class TransactionsController : Controller
    {
        //
        // GET: /Transactions/

        public ActionResult Index(string action, int group, int id)
        {
            ServiceClient sc = Sas.GetAuthenticatedServiceClient(this, action);
            SeniorDesign.Models.UserTransactionData utd = new Models.UserTransactionData();
            utd.Costs = sc.GetSplitCosts(group, -1, id).ToList();
            utd.Payments = sc.GetSplitPayments(group, -1, id).ToList();
            utd.WindowInfo = sc.GetTransactionWindow(id, group);

            return View(utd);
        }

    }
}
