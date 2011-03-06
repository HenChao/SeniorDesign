using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SeniorDesign.Models
{
    public class SplitDisplayData
    {
        public string SubExpenseName { get; set; }
        public int SubExpenseID { get; set; }
        public decimal Amount { get; set; }
        public List<UserExpense> UserExpences { get; set; }
    }

    public class UserExpense
    {
        public string UserName { get; set; }
        public int Id { get; set; }
        public decimal Amount { get; set; }
    }
}