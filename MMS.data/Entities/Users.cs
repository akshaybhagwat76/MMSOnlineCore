/***************************************************************/
/* Code Writer (written by Akshay S Bhagwat )                                 */
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
	public partial class Users
	{
		#region Properties
		/// <summary>
		///  UserID (System.Int32? )
		/// </summary>
		public System.Int32? UserID { get; set; }
		/// <summary>
		///  EmailAddress (System.String )
		/// </summary>
		public System.String EmailAddress { get; set; }
		/// <summary>
		///  Name (System.String )
		/// </summary>
		public System.String Name { get; set; }
		/// <summary>
		///  PasswordHash (System.Byte[] )
		/// </summary>
		public System.Byte[] PasswordHash { get; set; }
		/// <summary>
		///  Salt (System.String )
		/// </summary>
		public System.String Salt { get; set; }
		/// <summary>
		///  PasswordVersion (System.Int32? )
		/// </summary>
		public System.Int32? PasswordVersion { get; set; }
		/// <summary>
		///  AccountDisabled (System.Boolean? )
		/// </summary>
		public System.Boolean? AccountDisabled { get; set; }
		public System.Boolean? Include_Transportation { get; set; }
		/// <summary>
		///  AccountID (System.String )
		/// </summary>
		public System.String AccountID { get; set; }
		/// <summary>
		///  Total Record (int)
		///  For serach result count
		/// </summary>
		public int TotalRecord { get; set; }
		#endregion
	}
}

