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
	public partial class UserAudit
	{
		#region Properties
		/// <summary>
		///  AuditId (System.Int64? )
		/// </summary>
		public System.Int64? AuditId { get; set; }
		/// <summary>
		///  UserId (System.Guid? )
		/// </summary>
		public System.Guid? UserId { get; set; }
		/// <summary>
		///  SessionId (System.String )
		/// </summary>
		public System.String SessionId { get; set; }
		/// <summary>
		///  IpAddress (System.String )
		/// </summary>
		public System.String IpAddress { get; set; }
		/// <summary>
		///  PageAccessed (System.String )
		/// </summary>
		public System.String PageAccessed { get; set; }
		/// <summary>
		///  LoggedInAt (System.String )
		/// </summary>
		public System.String LoggedInAt { get; set; }
		/// <summary>
		///  LoggedOutAt (System.String )
		/// </summary>
		public System.String LoggedOutAt { get; set; }
		/// <summary>
		///  LoginStatus (System.String )
		/// </summary>
		public System.String LoginStatus { get; set; }
		/// <summary>
		///  ControllerName (System.String )
		/// </summary>
		public System.String ControllerName { get; set; }
		/// <summary>
		///  ActionName (System.String )
		/// </summary>
		public System.String ActionName { get; set; }
		/// <summary>
		///  UrlReferrer (System.String )
		/// </summary>
		public System.String UrlReferrer { get; set; }
		/// <summary>
		///  Area (System.String )
		/// </summary>
		public System.String Area { get; set; }
		/// <summary>
		///  RoleId (System.Guid? )
		/// </summary>
		public System.Guid? RoleId { get; set; }
		/// <summary>
		///  LangId (System.String )
		/// </summary>
		public System.String LangId { get; set; }
		/// <summary>
		///  IsFirstLogin (System.String )
		/// </summary>
		public System.String IsFirstLogin { get; set; }
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

