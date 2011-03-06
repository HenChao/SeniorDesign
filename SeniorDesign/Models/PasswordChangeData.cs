using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace SeniorDesign.Models
{
    //[PropertiesMustMatch("Password", "PasswordAgain", ErrorMessage="Passwords Must Match")]
    public class PasswordChangeData
    {
        [Required]        
        public string Password { get; set; }
        [Required]
        public string PasswordAgain { get; set; }
    }
}