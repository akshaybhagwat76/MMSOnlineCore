using System.ComponentModel.DataAnnotations;
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
