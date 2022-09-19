using MMS.data.UnitOfWork;
using Microsoft.AspNetCore.Mvc;
using MMS.web.Areas.Admin.ViewModels.Input;
using MMS.web.Filters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MMS.web.Areas.Admin.Controllers
{
    /// <summary>
    /// 
    /// </summary>
    /// 
    [ServiceFilter(typeof(AuditFilterAttribute))]
    public class TransectionController : BaseController
    {
        private readonly IUnitOfWork _uowProvider;

        /// <summary>
        /// 
        /// </summary>
        /// <param name="uowProvider"></param>
        public TransectionController(IUnitOfWork uowProvider)
        {
            _uowProvider = uowProvider;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="ticketNo"></param>
        /// <returns></returns>
        public async Task<IActionResult> detail(string ticketNo)
        {
            var obj = new TicketModel();
            if (!string.IsNullOrEmpty(UserID))
            {
                try
                {
                    var TransactionHeader = await _uowProvider.TransactionHeaderRepository.Search(ticketNo,AccountId);

                    if (TransactionHeader == null)
                    {
                        return RedirectToAction("login", "Home", new { area = "" });

                    }
                    obj.TicketNumber = TransactionHeader.TicketNumber;
                    obj.TicketDate = TransactionHeader.TicketDate.Value.ToString("MM-dd-yyyy");
                    obj.OrderNumber = TransactionHeader.OrderNumber;
                    obj.PaymentTerms = TransactionHeader.PaymentTerms;
                    obj.SupplierTicket = TransactionHeader.SupplierTicket;
                    obj.Status = TransactionHeader.Status;
                    obj.TruckDescription = TransactionHeader.TruckDescription;
                    obj.PaymentReceiptURL = TransactionHeader.PaymentReceiptURL;

                    var transactionDetail = await _uowProvider.TransactionDetailRepository.Search(ticketNo);

                    obj.TicketDetails = new List<TicketDetails>();
                    obj.TicketDetails.AddRange(transactionDetail.Select(o => new TicketDetails
                    {
                        GrossWeight = o.Gross,
                        ItemName = "",
                        NetWeight = o.Net,
                        TareWeight = o.Tare,
                        UnitCost = o.TotalCost,
                        TotalCost = o.UnitCost
                    }));

                    var scalePictures = await _uowProvider.TransactionScalePicturesRepository.Search(ticketNo);

                    obj.ScalePictures = new List<ScalePictures>();

                    obj.ScalePictures.AddRange(scalePictures.Select(o => new ScalePictures
                    {
                        ThumbnailURL = o.Thumbnail_URL,
                        FullImageURL = o.FullRes_URL
                    }));

                    var receivedPaperwords = await _uowProvider.TransactionReceivedPaperwordRepository.Search(ticketNo);
                    obj.ReceivedPaperwords = new List<ReceivedPaperwords>();

                    obj.ReceivedPaperwords.AddRange(receivedPaperwords.Select(o => new ReceivedPaperwords
                    {
                        ThumbnailURL = o.Thumbnail_URL,
                        FullImageURL = o.FullRes_URL
                    }));

                    var otherPictures = await _uowProvider.TransactionOtherPicturesRepository.Search(ticketNo);

                    obj.OtherPictures = new List<OtherPictures>();

                    obj.OtherPictures.AddRange(otherPictures.Select(o => new OtherPictures
                    {
                        ThumbnailURL = o.Thumbnail_URL,
                        FullImageURL = o.FullRes_URL
                    }));

                    return View(obj);
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }

            return RedirectToAction("login", "Home", new { area = ""});
        }
    }
}
