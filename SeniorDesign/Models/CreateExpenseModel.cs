using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SeniorDesign.Models
{
    public class CreateExpenseModel
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public decimal Total { get; set; }
        public DateTime DateOfExpense { get; set; }
        public bool ASEPSA { get; set; }
        public int UserId { get; set; }
        public int GroupId { get; set; }
    }
}