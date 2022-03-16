using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MMS.data.UnitOfWork;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ToolKit.Mvc;

namespace MMS.web.Controllers
{
    /// <summary>
    /// 
    /// </summary>
    public class GeneralController : Controller
    {
        private readonly IUnitOfWork _uowProvider;

        /// <summary>
        /// 
        /// </summary>
        /// <param name="uowProvider"></param>
        public GeneralController(IUnitOfWork uowProvider)
        {
            _uowProvider = uowProvider;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="v"></param>
        /// <param name="title"></param>
        /// <returns></returns>
        [AllowAnonymous]
        public async Task<ActionResult> getAllLocationsList(string v, string title)
        {
            List<data.Entities.TransportationLocations> data = new List<data.Entities.TransportationLocations>();
            var idata = await _uowProvider.TransportationLocationsRepository.Search(1, 50000);

            if (idata != null && idata.Count() > 0)
                data = idata.OrderBy(c => c.LocationID).ToList();

            data.Insert(0, new data.Entities.TransportationLocations { LocationID = null, LocationName = (string.IsNullOrWhiteSpace(title) ? "---  Select Location ---" : title) });

            return Json(data.Select(o => new KeyContent
            {
                Key = (o.LocationID != null ? General.Encode(o.LocationID.Value.ToString()) : null),
                Content = o.LocationName,
            }));
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="v"></param>
        /// <param name="title"></param>
        /// <returns></returns>
        [AllowAnonymous]
        public async Task<ActionResult> getAllCommodityList(string v, string title)
        {
            List<data.Entities.TransportationCommodities> data = new List<data.Entities.TransportationCommodities>();
            var idata = await _uowProvider.TransportationCommoditiesRepository.Search(1, 50000);

            if (idata != null && idata.Count() > 0)
                data = idata.OrderBy(c => c.CommodityID).ToList();

            data.Insert(0, new data.Entities.TransportationCommodities { CommodityID = null, Commodity_Name = (string.IsNullOrWhiteSpace(title) ? "---  Select Commodity ---" : title) });

            return Json(data.Select(o => new KeyContent
            {
                Key = (o.CommodityID != null ? o.CommodityID.Value.ToString() : null),
                Content = o.Commodity_Name,
            }));
        }

    }
}