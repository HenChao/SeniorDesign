using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SeniorDesign.Models
{
    public class SplitData
    {
        public string UserName { get; set; }
        public int UserID { get; set; }
        public decimal Amount { get; set; }
        public int SubExpenseID { get; set; }
    }
}