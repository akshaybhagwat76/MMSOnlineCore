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
	public partial class UserHistoryRepository : BaseRepository, IUserHistoryRepository
	{
		public UserHistoryRepository(IConnectionFactory connectionFactory) : base(connectionFactory) { }
		
		
		#region Search
		public async Task<IEnumerable<UserHistory>> Search(int pageIndex, int pageSize)
		{
			
			using (var connection = connectionFactory.GetConnection)
			{
				var query = "[dbo].UserHistory_PAGING";
				var param = new DynamicParameters();
				param.Add("@PageIndex", pageIndex);
				param.Add("@PageSize", pageSize);
				
				var list = await SqlMapper.QueryAsync<UserHistory>(connection, query, param, commandType: CommandType.StoredProcedure);
				
				if (list == null)
				return null;
				else
				return list;
				
			}
		}
		public async Task<IEnumerable<UserHistory>> Search(int pageIndex, int pageSize,string sortBy, string orderBy)
		{
			
			using (var connection = connectionFactory.GetConnection)
			{
				var query = "[dbo].UserHistory_SORT";
				var param = new DynamicParameters();
				param.Add("@PageIndex", pageIndex);
				param.Add("@PageSize", pageSize);
				param.Add("@sortBy", sortBy);
				param.Add("@orderBy", orderBy);
				
				var list = await SqlMapper.QueryAsync<UserHistory>(connection, query, param, commandType: CommandType.StoredProcedure);
				
				if (list == null)
				return null;
				else
				return list;
				
			}
		}
		public async Task<IEnumerable<UserHistory>> Search(int pageIndex, int pageSize,string sortBy, string orderBy, string searchstring)
		{
			
			using (var connection = connectionFactory.GetConnection)
			{
				var query = "[dbo].UserHistory_CUSTOM";
				var param = new DynamicParameters();
				param.Add("@PageIndex", pageIndex);
				param.Add("@PageSize", pageSize);
				param.Add("@sortBy", sortBy);
				param.Add("@orderBy", orderBy);
				param.Add("@searchstring", searchstring);
				
				var list = await SqlMapper.QueryAsync<UserHistory>(connection, query, param, commandType: CommandType.StoredProcedure);
				
				if (list == null)
				return null;
				else
				return list;
				
			}
		}
		public async Task<IEnumerable<UserHistory>> Search(System.Guid? userID, System.DateTime? eventDate, System.String ip, System.String eventType, System.String details)
		{
			try
			{
				
				using (var connection = connectionFactory.GetConnection)
				{
					var query = "[dbo].UserHistory_SEARCH";
					var param = new DynamicParameters();
					param.Add("userID",userID, DbType.Guid);
					param.Add("eventDate",eventDate, DbType.DateTime);
					param.Add("ip",ip, DbType.String);
					param.Add("eventType",eventType, DbType.String);
					param.Add("details",details, DbType.String);
					
					var list = await SqlMapper.QueryAsync<UserHistory>(connection, query, param, commandType: CommandType.StoredProcedure);
					
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
		/// Insert current UserHistory to database.
		/// </summary>
		/// <param name="userID">System.Guid?</param>
		/// <param name="eventDate">System.DateTime?</param>
		/// <param name="ip">System.String</param>
		/// <param name="eventType">System.String</param>
		/// <param name="details">System.String</param>
		public async Task<int> Insert(System.Guid? userID, System.DateTime? eventDate, System.String ip, System.String eventType, System.String details)
		{
			try
			{
				
				using (var connection = connectionFactory.GetConnection)
				{
					var query = "[dbo].UserHistory_INSERT";
					var param = new DynamicParameters();
					param.Add("userID", userID, DbType.Guid);
					param.Add("eventDate", eventDate, DbType.DateTime);
					param.Add("ip", ip, DbType.String);
					param.Add("eventType", eventType, DbType.String);
					param.Add("details", details, DbType.String);
					var objs = await SqlMapper.ExecuteAsync(connection, query, param, commandType: CommandType.StoredProcedure);
					return objs;
					
				}
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}
		/// <summary>
		/// Insert current UserHistory to database.
		/// </summary>
		/// <param name=UserHistory Objects>UserHistory</param>
		public async Task<int> Insert(UserHistory model)
		{
			try
			{
				
				using (var connection = connectionFactory.GetConnection)
				{
					var query = "[dbo].UserHistory_INSERT";
					var param = new DynamicParameters();
					param.Add("userID", model.UserID, DbType.Guid);
					param.Add("eventDate", model.EventDate, DbType.DateTime);
					param.Add("ip", model.Ip, DbType.String);
					param.Add("eventType", model.EventType, DbType.String);
					param.Add("details", model.Details, DbType.String);
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
		
		
		
		
	}
}

