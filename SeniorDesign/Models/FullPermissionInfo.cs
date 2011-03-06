using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SeniorDesign.Models
{
    public class FullPermissionInfo
    {
        // For Display
        public string UserName { get; set; }
        public string GroupName { get; set; }


        // For Actions
        public int UserID { get; set; }
        public int GroupId { get; set; }
        public string PermissionName { get; set; }

    }
}