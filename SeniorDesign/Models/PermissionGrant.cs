using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SeniorDesign.Models
{
    public class PermissionGrant
    {
        public int GroupID { get; set; }
        public string Permission {get; set;}
        public Dictionary<string, int> Groups { get; set; }
        public List<String> Permissions { get; set; }
    }
}