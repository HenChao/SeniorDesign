using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SeniorDesign.Controllers
{
    public class StatmentController : Controller
    {
        //
        // GET: /Statment/

        public ActionResult Details(int id, int group, string action)
        {
            ServiceClient sc = Sas.GetAuthenticatedServiceClient(this, action);
            var currentUser = ((UserInfo)Session["UserId"]);

            var Costs = sc.GetSplitCosts(group, -1, id).ToList();
            var Payments = sc.GetSplitPayments(group, -1, id).ToList();
            var allSplits = Costs.Union(Payments);
           
            var WindowInfo = sc.GetTransactionWindow(id, group);

            var users1 = allSplits.Select(p => p.FromUserName).Distinct();
            var users2 = allSplits.Select(p => p.ToUserName).Distinct();
            var users = users1.Union(users2);
            SeniorDesign.Models.StatmentData sd = new Models.StatmentData();
            sd.Lines = new List<Models.StatmentLine>();
            foreach (var item in users)
            {
                if (item != currentUser.Username)
                {
                    sd.Lines.Add(GetLine(currentUser.Username, item, allSplits));
                }
            }
            sd.Title = WindowInfo.Name;
            sd.AmountTotal = sd.Lines.Select(p => p.Amount).Sum();

            return View(sd);
        }

        private SeniorDesign.Models.StatmentLine  GetLine(string currentUser, string forUser, IEnumerable<TransactionInfo> transactions )
        {
            decimal inAmount = (from p in transactions
                                where (p.FromUserName == forUser) && (p.ToUserName == currentUser)
                                select p.Amount).Sum();
            decimal outAmount = (from p in transactions
                                 where (p.FromUserName == currentUser) && (p.ToUserName == forUser)
                                select p.Amount).Sum();

            return new SeniorDesign.Models.StatmentLine() { Amount = inAmount - outAmount, Username = forUser };

        }


    }
}
