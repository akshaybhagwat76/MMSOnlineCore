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
using MMS.data.Infrastructure;
using MMS.data.UnitOfWork;
using MMS.data.Entities;

namespace MMS.data.Service
{
	public partial class UserAuditService : IUserAuditService
	{
		IUnitOfWork _unitOfWork;
		public UserAuditService(IUnitOfWork unitOfWork)
		{
			_unitOfWork = unitOfWork;
		}
		public async Task<UserAudit> Get(System.Int64? auditId)
		{
			return await _unitOfWork.UserAuditRepository.Get(auditId);
		}
		public async Task<int> Delete(System.Int64? auditId)
		{
			return await _unitOfWork.UserAuditRepository.Delete(auditId);
		}
		public async Task<IEnumerable<UserAudit>> Search(int pageIndex, int pageSize)
		{
			return await _unitOfWork.UserAuditRepository.Search(pageIndex, pageSize);
		}
		public async Task<IEnumerable<UserAudit>> Search(int pageIndex, int pageSize,string sortBy, string orderBy)
		{
			return await _unitOfWork.UserAuditRepository.Search(pageIndex, pageSize,sortBy,orderBy);
		}
		public async Task<IEnumerable<UserAudit>> Search(System.Int64? auditId, System.Guid? userId, System.String sessionId, System.String ipAddress, System.String pageAccessed, System.String loggedInAt, System.String loggedOutAt, System.String loginStatus, System.String controllerName, System.String actionName, System.String urlReferrer, System.String area, System.Guid? roleId, System.String langId, System.String isFirstLogin, System.DateTime? createdOn)
		{
			return await _unitOfWork.UserAuditRepository.Search(auditId, userId, sessionId, ipAddress, pageAccessed, loggedInAt, loggedOutAt, loginStatus, controllerName, actionName, urlReferrer, area, roleId, langId, isFirstLogin, createdOn);
		}
		public async Task<System.Int64> Insert(UserAudit usermodel)
		{
			return await _unitOfWork.UserAuditRepository.Insert(usermodel);
		}
		public async Task<System.Int64> Insert(System.Guid? userId, System.String sessionId, System.String ipAddress, System.String pageAccessed, System.String loggedInAt, System.String loggedOutAt, System.String loginStatus, System.String controllerName, System.String actionName, System.String urlReferrer, System.String area, System.Guid? roleId, System.String langId, System.String isFirstLogin, System.DateTime? createdOn)
		{
			return await _unitOfWork.UserAuditRepository.Insert(userId, sessionId, ipAddress, pageAccessed, loggedInAt, loggedOutAt, loginStatus, controllerName, actionName, urlReferrer, area, roleId, langId, isFirstLogin, createdOn);
		}
		public async Task<int> Update(UserAudit usermodel)
		{
			return await _unitOfWork.UserAuditRepository.Update(usermodel);
		}
		public async Task<int> Update(System.Int64? auditId, System.Guid? userId, System.String sessionId, System.String ipAddress, System.String pageAccessed, System.String loggedInAt, System.String loggedOutAt, System.String loginStatus, System.String controllerName, System.String actionName, System.String urlReferrer, System.String area, System.Guid? roleId, System.String langId, System.String isFirstLogin, System.DateTime? createdOn)
		{
			return await _unitOfWork.UserAuditRepository.Update(auditId, userId, sessionId, ipAddress, pageAccessed, loggedInAt, loggedOutAt, loginStatus, controllerName, actionName, urlReferrer, area, roleId, langId, isFirstLogin, createdOn);
		}
	}
}

