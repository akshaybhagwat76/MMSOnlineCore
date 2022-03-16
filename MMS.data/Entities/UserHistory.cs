/***************************************************************/
/* Code Writer (written by Anish M Mathew )                                 */
/*                                                                          */
/* This file was automatically generated using Code Writer                  */
/* Any manual changes to this file will be overwritten by a automated tool. */
/*                                                                          */
/* Date Generated : 07-03-2022 18:24:25                                      */
/*                                                                          */
/* More Details    --                                                       */
/*http://visualstudiogallery.msdn.microsoft.com/40d92d45-107e-4f83-b6c5-50a7e2419389*/
/****************************************************************************/
namespace MMS.data.Entities
{
	public partial class UserHistory
	{
		#region Properties
		/// <summary>
		///  UserID (System.Guid? )
		/// </summary>
		public System.Guid? UserID { get; set; }
		/// <summary>
		///  EventDate (System.DateTime? )
		/// </summary>
		public System.DateTime? EventDate { get; set; }
		/// <summary>
		///  Ip (System.String )
		/// </summary>
		public System.String Ip { get; set; }
		/// <summary>
		///  EventType (System.String )
		/// </summary>
		public System.String EventType { get; set; }
		/// <summary>
		///  Details (System.String )
		/// </summary>
		public System.String Details { get; set; }
		/// <summary>
		///  Total Record (int)
		///  For serach result count
		/// </summary>
		public int TotalRecord { get; set; }
		#endregion
		
	}
}

