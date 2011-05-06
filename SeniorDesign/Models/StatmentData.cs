using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SeniorDesign.Models
{
    public class StatmentData
    {
        public string Title { get; set; }
        public List<StatmentLine> Lines { get; set; }
        public decimal AmountTotal { get; set; }
    }

    public class StatmentLine
    {
        public string Username { get; set; }
        public decimal Amount { get; set; }
    }
}