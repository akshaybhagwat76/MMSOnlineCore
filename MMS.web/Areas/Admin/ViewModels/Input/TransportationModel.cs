using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace MMS.web.Areas.Admin.ViewModels.Input
{
    /// <summary>
    /// 
    /// </summary>
    public class TransportationModel
    {
        /// <summary>
        /// 
        /// </summary>
        public string UserId { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [Required(ErrorMessage = "Please select Location")]
        public string LocationId { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [Required(ErrorMessage = "Please select Commodity")]
        public string CommodityId { get; set; }
        /// <summary>
        /// 
        /// </summary>
        [Required(ErrorMessage = "Please enter Notes")]
        public string Notes { get; set; }
    }
}
