using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SeniorDesign.Models
{
    public class UserTransactionData
    {
        public List<TransactionInfo> Costs { get; set; }
        public List<TransactionInfo> Payments { get; set; }
        public TransactionWindowInfo WindowInfo { get; set; }
    }
}