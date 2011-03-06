using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SeniorDesign.Models
{
    public class UsernamePasswordCreds
    {
        public string Username { get; set; }
        public string Password { get; set; }
        public bool CredStatusFailed { get; set; }
    }
}