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
using System.Collections.Generic;
using System.Threading.Tasks;
using MMS.data.Entities;


namespace MMS.data.Repository
{
	public partial interface IUserAuditRepository
	{
		Task<UserAudit> Get(System.Int64? auditId);
		Task<IEnumerable<UserAudit>> Search(int pageIndex, int pageSize);
		Task<IEnumerable<UserAudit>> Search(int pageIndex, int pageSize,string sortBy, string orderBy);
		Task<IEnumerable<UserAudit>> Search(int pageIndex, int pageSize,string sortBy, string orderBy,string searchstring);
		
		Task<IEnumerable<UserAudit>> Search(System.Int64? auditId, System.Guid? userId, System.String sessionId, System.String ipAddress, System.String pageAccessed, System.String loggedInAt, System.String loggedOutAt, System.String loginStatus, System.String controllerName, System.String actionName, System.String urlReferrer, System.String area, System.Guid? roleId, System.String langId, System.String isFirstLogin, System.DateTime? createdOn);
		Task<int> Delete(System.Int64? auditId);
		Task<System.Int64> Insert(UserAudit model);
		Task<System.Int64> Insert(System.Guid? userId, System.String sessionId, System.String ipAddress, System.String pageAccessed, System.String loggedInAt, System.String loggedOutAt, System.String loginStatus, System.String controllerName, System.String actionName, System.String urlReferrer, System.String area, System.Guid? roleId, System.String langId, System.String isFirstLogin, System.DateTime? createdOn);
		Task<int> Update(UserAudit model);
		Task<int> Update(System.Int64? auditId, System.Guid? userId, System.String sessionId, System.String ipAddress, System.String pageAccessed, System.String loggedInAt, System.String loggedOutAt, System.String loginStatus, System.String controllerName, System.String actionName, System.String urlReferrer, System.String area, System.Guid? roleId, System.String langId, System.String isFirstLogin, System.DateTime? createdOn);
		
	}
}

