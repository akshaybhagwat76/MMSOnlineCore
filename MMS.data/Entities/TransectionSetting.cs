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
	public partial class TransectionSetting
	{
		#region Properties
		/// <summary>
		///  Id (System.Int32? )
		/// </summary>
		public System.Int32? Id { get; set; }
		/// <summary>
		///  LocationID (System.Int32? )
		/// </summary>
		public System.Int32? LocationID { get; set; }
		/// <summary>
		///  CommodityID (System.Int32? )
		/// </summary>
		public System.Int32? CommodityID { get; set; }
		/// <summary>
		///  Notes (System.String )
		/// </summary>
		public System.String Notes { get; set; }
		/// <summary>
		///  CreatedBy (System.Guid? )
		/// </summary>
		public int? CreatedBy { get; set; }
		/// <summary>
		///  CreatedOn (System.DateTime? )
		/// </summary>
		public System.DateTime? CreatedOn { get; set; }
		/// <summary>
		///  Total Record (int)
		///  For serach result count
		/// </summary>
		public int TotalRecord { get; set; }
		#endregion
		
	}
}

