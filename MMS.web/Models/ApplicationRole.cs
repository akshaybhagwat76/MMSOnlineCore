using Microsoft.AspNetCore.Identity;
using System;

namespace MMS.web.Models
{
    /// <summary>
    /// 
    /// </summary>
    public class ApplicationRole : IdentityRole<Guid>
    {
        /// <summary>
        /// 
        /// </summary>
        public string Description { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string Permission { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string RedirectUrl { get; set; }
    }
}
