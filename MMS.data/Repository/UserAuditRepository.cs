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
using System;
using System.Data;
using System.Linq;
using System.Text;
using System.Collections.Generic;
using Dapper;
using System.Threading.Tasks;
using MMS.data.Infrastructure;
using MMS.data.Entities;

namespace MMS.data.Repository
{
	public partial class UserAuditRepository : BaseRepository, IUserAuditRepository
	{
		public UserAuditRepository(IConnectionFactory connectionFactory) : base(connectionFactory) { }
		
		#region Select One
		/// <summary>
		/// Get data according to the primary key value.
		/// </summary>
		/// <param name="auditId">System.Int64?</param>
		public async Task<UserAudit> Get(System.Int64? auditId)
		{
			using (var connection = connectionFactory.GetConnection)
			{
				var query = "[dbo].UserAudit_SELECT";
				var param = new DynamicParameters();
				param.Add(@"auditId", auditId, DbType.Int64);
				var list = await SqlMapper.QueryAsync<UserAudit>(connection, query, param, commandType: CommandType.StoredProcedure);
				return list.FirstOrDefault();
				
			}
		}
		#endregion
		
		#region Search
		public async Task<IEnumerable<UserAudit>> Search(int pageIndex, int pageSize)
		{
			
			using (var connection = connectionFactory.GetConnection)
			{
				var query = "[dbo].UserAudit_PAGING";
				var param = new DynamicParameters();
				param.Add("@PageIndex", pageIndex);
				param.Add("@PageSize", pageSize);
				
				var list = await SqlMapper.QueryAsync<UserAudit>(connection, query, param, commandType: CommandType.StoredProcedure);
				
				if (list == null)
				return null;
				else
				return list;
				
			}
		}
		public async Task<IEnumerable<UserAudit>> Search(int pageIndex, int pageSize,string sortBy, string orderBy)
		{
			
			using (var connection = connectionFactory.GetConnection)
			{
				var query = "[dbo].UserAudit_SORT";
				var param = new DynamicParameters();
				param.Add("@PageIndex", pageIndex);
				param.Add("@PageSize", pageSize);
				param.Add("@sortBy", sortBy);
				param.Add("@orderBy", orderBy);
				
				var list = await SqlMapper.QueryAsync<UserAudit>(connection, query, param, commandType: CommandType.StoredProcedure);
				
				if (list == null)
				return null;
				else
				return list;
				
			}
		}
		public async Task<IEnumerable<UserAudit>> Search(int pageIndex, int pageSize,string sortBy, string orderBy, string searchstring)
		{
			
			using (var connection = connectionFactory.GetConnection)
			{
				var query = "[dbo].UserAudit_CUSTOM";
				var param = new DynamicParameters();
				param.Add("@PageIndex", pageIndex);
				param.Add("@PageSize", pageSize);
				param.Add("@sortBy", sortBy);
				param.Add("@orderBy", orderBy);
				param.Add("@searchstring", searchstring);
				
				var list = await SqlMapper.QueryAsync<UserAudit>(connection, query, param, commandType: CommandType.StoredProcedure);
				
				if (list == null)
				return null;
				else
				return list;
				
			}
		}
		public async Task<IEnumerable<UserAudit>> Search(System.Int64? auditId, System.Guid? userId, System.String sessionId, System.String ipAddress, System.String pageAccessed, System.String loggedInAt, System.String loggedOutAt, System.String loginStatus, System.String controllerName, System.String actionName, System.String urlReferrer, System.String area, System.Guid? roleId, System.String langId, System.String isFirstLogin, System.DateTime? createdOn)
		{
			try
			{
				
				using (var connection = connectionFactory.GetConnection)
				{
					var query = "[dbo].UserAudit_SEARCH";
					var param = new DynamicParameters();
					param.Add("auditId",auditId, DbType.Int64);
					param.Add("userId",userId, DbType.Guid);
					param.Add("sessionId",sessionId, DbType.String);
					param.Add("ipAddress",ipAddress, DbType.String);
					param.Add("pageAccessed",pageAccessed, DbType.String);
					param.Add("loggedInAt",loggedInAt, DbType.String);
					param.Add("loggedOutAt",loggedOutAt, DbType.String);
					param.Add("loginStatus",loginStatus, DbType.String);
					param.Add("controllerName",controllerName, DbType.String);
					param.Add("actionName",actionName, DbType.String);
					param.Add("urlReferrer",urlReferrer, DbType.String);
					param.Add("area",area, DbType.String);
					param.Add("roleId",roleId, DbType.Guid);
					param.Add("langId",langId, DbType.String);
					param.Add("isFirstLogin",isFirstLogin, DbType.String);
					param.Add("createdOn",createdOn, DbType.DateTime);
					
					var list = await SqlMapper.QueryAsync<UserAudit>(connection, query, param, commandType: CommandType.StoredProcedure);
					
					if (list == null)
					return null;
					else
					return list;
					
				}
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}
		#endregion
		
		#region INSERT
		/// <summary>
		/// Insert current UserAudit to database.
		/// </summary>
		/// <param name="userId">System.Guid?</param>
		/// <param name="sessionId">System.String</param>
		/// <param name="ipAddress">System.String</param>
		/// <param name="pageAccessed">System.String</param>
		/// <param name="loggedInAt">System.String</param>
		/// <param name="loggedOutAt">System.String</param>
		/// <param name="loginStatus">System.String</param>
		/// <param name="controllerName">System.String</param>
		/// <param name="actionName">System.String</param>
		/// <param name="urlReferrer">System.String</param>
		/// <param name="area">System.String</param>
		/// <param name="roleId">System.Guid?</param>
		/// <param name="langId">System.String</param>
		/// <param name="isFirstLogin">System.String</param>
		/// <param name="createdOn">System.DateTime?</param>
		public async Task<System.Int64> Insert(System.Guid? userId, System.String sessionId, System.String ipAddress, System.String pageAccessed, System.String loggedInAt, System.String loggedOutAt, System.String loginStatus, System.String controllerName, System.String actionName, System.String urlReferrer, System.String area, System.Guid? roleId, System.String langId, System.String isFirstLogin, System.DateTime? createdOn)
		{
			try
			{
				
				using (var connection = connectionFactory.GetConnection)
				{
					var query = "[dbo].UserAudit_INSERT";
					var param = new DynamicParameters();
					param.Add("userId", userId, DbType.Guid);
					param.Add("sessionId", sessionId, DbType.String);
					param.Add("ipAddress", ipAddress, DbType.String);
					param.Add("pageAccessed", pageAccessed, DbType.String);
					param.Add("loggedInAt", loggedInAt, DbType.String);
					param.Add("loggedOutAt", loggedOutAt, DbType.String);
					param.Add("loginStatus", loginStatus, DbType.String);
					param.Add("controllerName", controllerName, DbType.String);
					param.Add("actionName", actionName, DbType.String);
					param.Add("urlReferrer", urlReferrer, DbType.String);
					param.Add("area", area, DbType.String);
					param.Add("roleId", roleId, DbType.Guid);
					param.Add("langId", langId, DbType.String);
					param.Add("isFirstLogin", isFirstLogin, DbType.String);
					param.Add("createdOn", createdOn, DbType.DateTime);
					var objs = await SqlMapper.ExecuteScalarAsync<System.Int64>(connection, query, param, commandType: CommandType.StoredProcedure);
					return objs;
					
				}
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}
		/// <summary>
		/// Insert current UserAudit to database.
		/// </summary>
		/// <param name=UserAudit Objects>UserAudit</param>
		public async Task<System.Int64> Insert(UserAudit model)
		{
			try
			{
				
				using (var connection = connectionFactory.GetConnection)
				{
					var query = "[dbo].UserAudit_INSERT";
					var param = new DynamicParameters();
					param.Add("userId", model.UserId, DbType.Guid);
					param.Add("sessionId", model.SessionId, DbType.String);
					param.Add("ipAddress", model.IpAddress, DbType.String);
					param.Add("pageAccessed", model.PageAccessed, DbType.String);
					param.Add("loggedInAt", model.LoggedInAt, DbType.String);
					param.Add("loggedOutAt", model.LoggedOutAt, DbType.String);
					param.Add("loginStatus", model.LoginStatus, DbType.String);
					param.Add("controllerName", model.ControllerName, DbType.String);
					param.Add("actionName", model.ActionName, DbType.String);
					param.Add("urlReferrer", model.UrlReferrer, DbType.String);
					param.Add("area", model.Area, DbType.String);
					param.Add("roleId", model.RoleId, DbType.Guid);
					param.Add("langId", model.LangId, DbType.String);
					param.Add("isFirstLogin", model.IsFirstLogin, DbType.String);
					param.Add("createdOn", model.CreatedOn, DbType.DateTime);
					var objs = await SqlMapper.ExecuteScalarAsync<System.Int64>(connection, query, param, commandType: CommandType.StoredProcedure);
					return objs;
					
				}
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}
		#endregion
		
		#region UPDATE
		/// <summary>
		/// Update current UserAudit to database.
		/// </summary>
		/// <param name="auditId">System.Int64?</param>
		/// <param name="userId">System.Guid?</param>
		/// <param name="sessionId">System.String</param>
		/// <param name="ipAddress">System.String</param>
		/// <param name="pageAccessed">System.String</param>
		/// <param name="loggedInAt">System.String</param>
		/// <param name="loggedOutAt">System.String</param>
		/// <param name="loginStatus">System.String</param>
		/// <param name="controllerName">System.String</param>
		/// <param name="actionName">System.String</param>
		/// <param name="urlReferrer">System.String</param>
		/// <param name="area">System.String</param>
		/// <param name="roleId">System.Guid?</param>
		/// <param name="langId">System.String</param>
		/// <param name="isFirstLogin">System.String</param>
		/// <param name="createdOn">System.DateTime?</param>
		public async Task<int> Update(System.Int64? auditId, System.Guid? userId, System.String sessionId, System.String ipAddress, System.String pageAccessed, System.String loggedInAt, System.String loggedOutAt, System.String loginStatus, System.String controllerName, System.String actionName, System.String urlReferrer, System.String area, System.Guid? roleId, System.String langId, System.String isFirstLogin, System.DateTime? createdOn)
		{
			try
			{
				
				using (var connection = connectionFactory.GetConnection)
				{
					var query = "[dbo].UserAudit_UPDATE";
					var param = new DynamicParameters();
					param.Add("auditId", auditId, DbType.Int64);
					param.Add("userId", userId, DbType.Guid);
					param.Add("sessionId", sessionId, DbType.String);
					param.Add("ipAddress", ipAddress, DbType.String);
					param.Add("pageAccessed", pageAccessed, DbType.String);
					param.Add("loggedInAt", loggedInAt, DbType.String);
					param.Add("loggedOutAt", loggedOutAt, DbType.String);
					param.Add("loginStatus", loginStatus, DbType.String);
					param.Add("controllerName", controllerName, DbType.String);
					param.Add("actionName", actionName, DbType.String);
					param.Add("urlReferrer", urlReferrer, DbType.String);
					param.Add("area", area, DbType.String);
					param.Add("roleId", roleId, DbType.Guid);
					param.Add("langId", langId, DbType.String);
					param.Add("isFirstLogin", isFirstLogin, DbType.String);
					param.Add("createdOn", createdOn, DbType.DateTime);
					var objs = await SqlMapper.ExecuteAsync(connection, query, param, commandType: CommandType.StoredProcedure);
					
					return objs;
					
				}
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}
		public async Task<int> Update(UserAudit model)
		{
			try
			{
				
				using (var connection = connectionFactory.GetConnection)
				{
					var query = "[dbo].UserAudit_UPDATE";
					var param = new DynamicParameters();
					param.Add("auditId", model.AuditId, DbType.Int64);
					param.Add("userId", model.UserId, DbType.Guid);
					param.Add("sessionId", model.SessionId, DbType.String);
					param.Add("ipAddress", model.IpAddress, DbType.String);
					param.Add("pageAccessed", model.PageAccessed, DbType.String);
					param.Add("loggedInAt", model.LoggedInAt, DbType.String);
					param.Add("loggedOutAt", model.LoggedOutAt, DbType.String);
					param.Add("loginStatus", model.LoginStatus, DbType.String);
					param.Add("controllerName", model.ControllerName, DbType.String);
					param.Add("actionName", model.ActionName, DbType.String);
					param.Add("urlReferrer", model.UrlReferrer, DbType.String);
					param.Add("area", model.Area, DbType.String);
					param.Add("roleId", model.RoleId, DbType.Guid);
					param.Add("langId", model.LangId, DbType.String);
					param.Add("isFirstLogin", model.IsFirstLogin, DbType.String);
					param.Add("createdOn", model.CreatedOn, DbType.DateTime);
					var objs = await SqlMapper.ExecuteAsync(connection, query, param, commandType: CommandType.StoredProcedure);
					return objs;
					
				}
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}
		#endregion
		
		#region DELETE
		/// <summary>
		/// Delete current UserAudit from database.
		/// </summary>
		/// <param name="auditId">System.Int64?</param>
		public async Task<int> Delete(System.Int64? auditId)
		{
			using (var connection = connectionFactory.GetConnection)
			{
				var query = "[dbo].UserAudit_DELETE";
				var param = new DynamicParameters();
				param.Add("auditId", auditId, DbType.Int64);
				var iValue = await SqlMapper.ExecuteAsync(connection, query, param, commandType: CommandType.StoredProcedure);
				return iValue;
				
			}
		}
		#endregion
		
		
	}
}

