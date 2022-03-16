using Microsoft.AspNetCore.Http;
using System;
using System.ComponentModel.DataAnnotations;

namespace MMS.web.Areas.Admin.ViewModels.Input
{
    /// <summary>
    /// 
    /// </summary>
    public class UserModel 
    {
        /// <summary>
        /// 
        /// </summary>
        public string userid { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public string role { get; set; }

        /// <summary>
        /// 
        /// </summary>
        [Required]
        [Display(Name = "First Name")]
        [MaxLength(100, ErrorMessage = "{0} can have a max of {1} characters")]
        public string FirstName { get; set; }
        /// <summary>
        /// 
        /// </summary>
        //[Required]
        [Display(Name = "Last Name")]
        [MaxLength(100, ErrorMessage = "{0} can have a max of {1} characters")]
        public string LastName { get; set; }
        /// <summary>
        /// 
        /// </summary>
        //[Required]
        [MaxLength(100, ErrorMessage = "{0} can have a max of {1} characters")]
        public String Address { get; set; }
        /// <summary>
        /// 
        /// </summary>
        //[Required]
        [MaxLength(25, ErrorMessage = "{0} can have a max of {1} characters")]
        public String City { get; set; }
        /// <summary>
        /// 
        /// </summary>
        //[Required]
        [MaxLength(25, ErrorMessage = "{0} can have a max of {1} characters")]
        public String State { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [Required(ErrorMessage = "Please enter Phone")]
        [MaxLength(15, ErrorMessage = "{0} can have a max of {1} characters")]
        [RegularExpression("([1-9][0-9]*)", ErrorMessage = "No spaces, dashes, or periods")]
        public String Phone { get; set; }
        /// <summary>
        /// 
        /// </summary>
        //[Required]
        [Display(Name = "Country")]
        public string CountryID { get; set; }
        /// <summary>
        /// 
        /// </summary>
        //[Display(Name = "Zip Code")]
        [MaxLength(10, ErrorMessage = "{0} can have a max of {1} characters")]
        public string ZipCode { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public String UserImage { get; set; }


        /// <summary>
        /// 
        /// </summary>
        [Required(ErrorMessage ="Please Select Status")]
        public bool? isActive { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [Required(ErrorMessage = "Please Select Email Status")]
        public bool? isEmailVerified { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public IFormFile UploadLogo { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string Imagname { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public bool isEdit { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [Required(ErrorMessage = "Please Enter Email")]
        public string Email { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [Required(ErrorMessage = "Please Enter Password")]
        [DataType(DataType.Password)]
        public string Password { get; set; }

    }
}
