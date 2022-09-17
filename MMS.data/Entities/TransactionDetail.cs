/***************************************************************/
/* Code Writer (written by Anish M Mathew )                                 */
/*                                                                          */
/* This file was automatically generated using Code Writer                  */
/* Any manual changes to this file will be overwritten by a automated tool. */
/*                                                                          */
/* Date Generated : 16-03-2022 13:05:30                                      */
/*                                                                          */
/* More Details    --                                                       */
/*http://visualstudiogallery.msdn.microsoft.com/40d92d45-107e-4f83-b6c5-50a7e2419389*/
/****************************************************************************/
namespace MMS.data.Entities
{
	public partial class TransactionDetail
	{
		#region Properties
		/// <summary>
		///  Id (System.Int64? )
		/// </summary>
		public System.Int64? Id { get; set; }
		/// <summary>
		///  AccountID (System.String )
		/// </summary>
		public System.String AccountID { get; set; }
		/// <summary>
		///  TicketNumber (System.String )
		/// </summary>
		public System.String TicketNumber { get; set; }
		public System.DateTime? TicketDate { get; set; }

		/// <summary>
		///  DetailID (System.Int32? )
		/// </summary>
		public System.Int32? DetailID { get; set; }
		/// <summary>
		///  Gross (System.Int32? )
		/// </summary>
		public System.Int32? Gross { get; set; }
		/// <summary>
		///  Tare (System.Int32? )
		/// </summary>
		public System.Int32? Tare { get; set; }
		/// <summary>
		///  Net (System.Int32? )
		/// </summary>
		public System.Int32? Net { get; set; }
		/// <summary>
		///  UnitCost (System.Decimal? )
		/// </summary>
		public System.Decimal? UnitCost { get; set; }
		/// <summary>
		///  TotalCost (System.Decimal? )
		/// </summary>
		public System.Decimal? TotalCost { get; set; }
		/// <summary>
		///  Total Record (int)
		///  For serach result count
		/// </summary>
		public int TotalRecord { get; set; }
		#endregion
		
	}
}

