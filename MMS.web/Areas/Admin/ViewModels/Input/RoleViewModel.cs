using MMS.web.Models;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
namespace MMS.web.Areas.Admin.ViewModels.Input
{
    /// <summary>
    /// 
    /// </summary>
    public class RoleViewModel
    {
        /// <summary>
        /// 
        /// </summary>
        [Required]
        [StringLength(256, ErrorMessage = "The {0} must be at least {2} characters long.")]
        public string Name { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public string RedirectUrl { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public List<string> MenuList { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public IEnumerable<ControllerInfo> SelectedControllers { get; set; }
    }
}
