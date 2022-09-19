using System;
using System.ComponentModel.DataAnnotations;
namespace MMS.web.Models
{
    /// <summary>
    /// 
    /// </summary>
    public class LoginModels
    {
        /// <summary>
        /// 
        /// </summary>
        [RegularExpression(@"^.{6,15}$", ErrorMessage = "Password must contain: Minimum 6 and Maximum 15 characters ")]
        [Required(ErrorMessage = "Please enter Password")]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public String Password { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [Required(ErrorMessage = "Please enter Email id")]
        [EmailAddress(ErrorMessage = "Please enter valid email address.")]
        public string Email { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public bool isEdit { get; set; }
    }
}
