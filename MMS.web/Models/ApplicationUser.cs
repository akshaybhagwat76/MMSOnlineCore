using Microsoft.AspNetCore.Identity;
using System;
using System.ComponentModel.DataAnnotations;

namespace MMS.web.Models
{
    /// <summary>
    /// 
    /// </summary>
    public class ApplicationUser : IdentityUser<Guid>
    {
        /// <summary>
        /// 
        /// </summary>
        [StringLength(150)]
        public string FirstName { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [StringLength(150)]
        public string LastName { get; set; } = "";
        /// <summary>
        /// 
        /// </summary>
        public bool IsActive { get; set; } = true;
        /// <summary>
        /// 
        /// </summary>
        public bool IsDeleted { get; set; } = false;
        /// <summary>
        /// 
        /// </summary>
        [StringLength(50)]
        public string AccountId { get; set; } = "MX1000";
    }
}
