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

            var allSplits = GetAllTransactionsForUser(id, -1, group, sc);
           
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

        public ActionResult Direct(int id, int group, string action)
        {
            ServiceClient sc = Sas.GetAuthenticatedServiceClient(this, action);
            var nodes = BuildPaymentGraph( sc,  group,  id);
            var WindowInfo = sc.GetTransactionWindow(id, group);
            Models.PaymentData pd = new Models.PaymentData() { Title = WindowInfo.Name + " Direct Payment" };
            pd.Lines = new List<Models.PaymentLine>();
            var users = sc.GetAllUsersInGroup(group);

            foreach (var node in nodes)
            {
                foreach (var edge in node.EdgeWeight)
                {
                    if (edge.Value > 0)
                    {
                        Models.PaymentLine pl = new Models.PaymentLine();
                        pl.FromUsername = users.Where(p => p.Id == node.UserId).SingleOrDefault().Username;
                        pl.ToUsername = users.Where(p => p.Id == edge.Key).SingleOrDefault().Username;
                        pl.Amount = edge.Value;
                        pd.Lines.Add(pl);
                    }
                }
            }

            return View(pd);

        }

        private static IEnumerable<TransactionInfo> GetAllTransactionsForUser(int window, int userId, int group, ServiceClient sc)
        {
            var Costs = sc.GetSplitCosts(group, userId, window).ToList();
            var Payments = sc.GetSplitPayments(group, userId, window).ToList();
            var allSplits = Costs.Union(Payments);
            return allSplits;
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

        private static decimal GetUserDebtTo(string currentUser, string forUser, IEnumerable<TransactionInfo> transactions)
        {
            decimal inAmount = (from p in transactions
                        where (p.FromUserName == forUser) && (p.ToUserName == currentUser)
                        select p.Amount).Sum();
           decimal outAmount = (from p in transactions
                         where (p.FromUserName == currentUser) && (p.ToUserName == forUser)
                         select p.Amount).Sum();
           return inAmount - outAmount;
        }

        List<UserNode> BuildPaymentGraph(ServiceClient sc, int group, int window)
        {
            var users = sc.GetAllUsersInGroup(group);
            List<UserNode> nodes = new List<UserNode>();
            foreach (var usr in users)
            {
                var newNode = new UserNode() { UserId = usr.Id };
                var trans = GetAllTransactionsForUser(window, usr.Id, group, sc);
                foreach (var usr2 in users)
                {
                    newNode.EdgeWeight[usr2.Id] = GetUserDebtTo(usr.Username, usr2.Username, trans);
                }
                nodes.Add(newNode);
            }
            return nodes;
        }


    }

     class UserNode
    {
        Dictionary<int, decimal> edgeWeight = new Dictionary<int, decimal>();
        public Dictionary<int, decimal> EdgeWeight
        {
            get
            {
                return edgeWeight;
            }
        }

        public int UserId { get; set; }

    }
}
