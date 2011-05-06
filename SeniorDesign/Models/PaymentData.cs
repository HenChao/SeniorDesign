using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SeniorDesign.Models
{
    public class PaymentData
    {
        public string Title { get; set; }
        public List<PaymentLine> Lines { get; set; }
    }

    public class PaymentLine
    {
        public string FromUsername { get; set; }
        public string ToUsername { get; set; }
        public decimal Amount { get; set; }
    }
}