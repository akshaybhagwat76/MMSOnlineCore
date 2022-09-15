using Microsoft.AspNetCore.Mvc;
using MMS.data.UnitOfWork;
using MMS.web.Areas.Admin.ViewModels.Input;
using MMS.web.Filters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MMS.web.Areas.Admin.Controllers
{

    public class OrderController : BaseController
    {
        private readonly IUnitOfWork _uowProvider;

        public OrderController(IUnitOfWork uowProvider)
        {
            _uowProvider = uowProvider;
        }

        public IActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public async Task<JsonResult> getOrders()
        {
            try
            {

                var draw = HttpContext.Request.Form["draw"].FirstOrDefault();
                var start = Request.Form["start"].FirstOrDefault();
                var length = Request.Form["length"].FirstOrDefault();
                var sortColumn = Request.Form["columns[" + Request.Form["order[0][column]"].FirstOrDefault() + "][name]"].FirstOrDefault();
                var sortColumnDir = Request.Form["order[0][dir]"].FirstOrDefault();
                var searchValue = Request.Form["search[value]"].FirstOrDefault();

                int pageSize = length != null ? Convert.ToInt32(length) : 0;
                var page = (Convert.ToInt32(start) / Convert.ToInt32(length)) + 1;
                int recordsTotal = 0;

                var data = await _uowProvider.OrderHeaderRepository.Search(page, pageSize, sortColumn, sortColumnDir, searchValue);

                if (data.Count() > 0)
                {
                    recordsTotal = data.FirstOrDefault().TotalRecord;

                    var query = data.Select(o => new
                    {
                        OrderNumber = o.OrderNumber,
                        EffectiveDate = o.EffectiveDate.Value.ToString("MM-dd-yyyy"),
                        ExpirationDate = o.ExpirationDate.Value.ToString("MM-dd-yyyy"),
                        Status = o.Status
                    });

                    return Json(new { draw = draw, recordsFiltered = recordsTotal, recordsTotal = recordsTotal, data = query });
                }
                else
                    return Json(new { draw = draw, recordsFiltered = 0, recordsTotal = 0, data = "" });

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public async Task<IActionResult> detail(string OrderNo)
        {
            var obj = new OrderModel();
            if (!string.IsNullOrEmpty(UserID))
            {
                try
                {
                    var OrderHeader = await _uowProvider.OrderHeaderRepository.Search(OrderNo);

                    if (OrderHeader == null)
                    {
                        return RedirectToAction("login", "Home", new { area = "" });

                    }
                    obj.OrderNumber = OrderHeader.OrderNumber;
                    obj.EffectiveDate = OrderHeader.EffectiveDate;
                    obj.ExpirationDate = OrderHeader.ExpirationDate;
                    obj.Status = OrderHeader.Status;
                    var OrderDetail = await _uowProvider.OrderDetailRepository.Search(OrderNo);

                    obj.orderDetails = new List<OrderDetails>();
                    obj.orderDetails.AddRange(OrderDetail.Select(o => new OrderDetails
                    {
                        OrderNumber = o.OrderNumber,
                        ItemName = o.ItemName,
                        OrderedWeight = o.OrderedWeight,
                        ReceivedWeight = o.ReceivedWeight,
                        DueWeight = o.DueWeight,
                        Price = o.Price
                    }));

                    var transactionHeader = await _uowProvider.TransactionHeaderRepository.SearchbyOrderNo(1, 10, OrderNo);
                    obj.TicketDetails = new List<TicketDetails>();
                    obj.TicketDetails.AddRange(transactionHeader.Select(o => new TicketDetails
                    {
                        TicketNumber = o.TicketNumber,
                        TicketDate = o.TicketDate,
                        GrossWeight = o.Weight
                    }));



                    return View(obj);
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }

            return RedirectToAction("login", "Home", new { area = "" });
        }

    }
}
