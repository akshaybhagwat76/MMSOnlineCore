using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MMS.web.Areas.Admin.ViewModels.Input
{
    /// <summary>
    /// 
    /// </summary>
    public class TicketModel
    {
		/// <summary>
		/// 
		/// </summary>
		public System.String TicketNumber { get; set; }
		/// <summary>
		///  OrderNumber (System.String )
		/// </summary>
		public System.String OrderNumber { get; set; }
		/// <summary>
		///  TicketDate (System.DateTime? )
		/// </summary>
		public System.String TicketDate { get; set; }
		/// <summary>
		///  PaymentTerms (System.String )
		/// </summary>
		public System.String PaymentTerms { get; set; }
		/// <summary>
		///  SupplierTicket (System.String )
		/// </summary>
		public System.String SupplierTicket { get; set; }
		/// <summary>
		///  CarrierTicket (System.String )
		/// </summary>
		public System.String CarrierTicket { get; set; }
		/// <summary>
		///  TruckDescription (System.String )
		/// </summary>
		public System.String TruckDescription { get; set; }
		/// <summary>
		///  Status (System.String )
		/// </summary>
		public System.String Status { get; set; }
		/// <summary>
		///  PaymentReceiptURL (System.String )
		/// </summary>
		public System.String PaymentReceiptURL { get; set; }
		/// <summary>
		/// 
		/// </summary>
        public List<TicketDetails> TicketDetails { get; set; }
		/// <summary>
		/// 
		/// </summary>
		public List<ScalePictures> ScalePictures { get; set; }
		/// <summary>
		/// 
		/// </summary>
		public List<ReceivedPaperwords> ReceivedPaperwords { get; set; }
		/// <summary>
		/// 
		/// </summary>
		public List<OtherPictures> OtherPictures { get; set; }
	}

	/// <summary>
	/// 
	/// </summary>
	public class TicketDetails
	{
		/// <summary>
		/// 
		/// </summary>
        public string ItemName { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public System.String TicketNumber { get; set; }
		/// <summary>
		///  DetailID (System.Int32? )
		/// </summary>
		public System.Int32? DetailID { get; set; }
		/// <summary>
		///  Gross (System.Int32? )
		/// </summary>
		public System.Int32? GrossWeight { get; set; }
		/// <summary>
		///  Tare (System.Int32? )
		/// </summary>
		public System.Int32? TareWeight { get; set; }
		/// <summary>
		///  Net (System.Int32? )
		/// </summary>
		public System.Int32? NetWeight { get; set; }
		/// <summary>
		///  UnitCost (System.Decimal? )
		/// </summary>
		public System.Decimal? UnitCost { get; set; }
		/// <summary>
		///  TotalCost (System.Decimal? )
		/// </summary>
		public System.Decimal? TotalCost { get; set; }
		public System.DateTime? TicketDate { get; set; }
		public int Weight { get; set; }
		public string OrderNumber { get; set; }

	}

	/// <summary>
	/// 
	/// </summary>
	public class ScalePictures
	{
		/// <summary>
		/// 
		/// </summary>
		public System.String ThumbnailURL { get; set; }
		/// <summary>
		/// 
		/// </summary>
		public System.String FullImageURL { get; set; }
	}

	/// <summary>
	/// 
	/// </summary>
	public class ReceivedPaperwords
	{
		/// <summary>
		/// 
		/// </summary>
		public System.String ThumbnailURL { get; set; }
		/// <summary>
		/// 
		/// </summary>
		public System.String FullImageURL { get; set; }
	}

	/// <summary>
	/// 
	/// </summary>
	public class OtherPictures
	{
		/// <summary>
		/// 
		/// </summary>
		public System.String ThumbnailURL { get; set; }
		/// <summary>
		/// 
		/// </summary>
		public System.String FullImageURL { get; set; }
	}
}
