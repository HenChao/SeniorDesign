using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SeniorDesign.Models
{
    public class ExpensePreSplitDisplay
    {
        public List<UserSelectionData> UsersToSplitOver { get; set; }
        public ExpenceInfo Expense { get; set; }
    }
}