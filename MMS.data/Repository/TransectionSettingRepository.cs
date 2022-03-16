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
	public partial class TransectionSettingRepository : BaseRepository, ITransectionSettingRepository
	{
		public TransectionSettingRepository(IConnectionFactory connectionFactory) : base(connectionFactory) { }
		
		#region Select One
		/// <summary>
		/// Get data according to the primary key value.
		/// </summary>
		/// <param name="id">System.Int32?</param>
		public async Task<TransectionSetting> Get(System.Int32? id)
		{
			using (var connection = connectionFactory.GetConnection)
			{
				var query = "[dbo].TransectionSetting_SELECT";
				var param = new DynamicParameters();
				param.Add(@"id", id, DbType.Int32);
				var list = await SqlMapper.QueryAsync<TransectionSetting>(connection, query, param, commandType: CommandType.StoredProcedure);
				return list.FirstOrDefault();
				
			}
		}
		#endregion
		
		#region Search
		public async Task<IEnumerable<TransectionSetting>> Search(int pageIndex, int pageSize)
		{
			
			using (var connection = connectionFactory.GetConnection)
			{
				var query = "[dbo].TransectionSetting_PAGING";
				var param = new DynamicParameters();
				param.Add("@PageIndex", pageIndex);
				param.Add("@PageSize", pageSize);
				
				var list = await SqlMapper.QueryAsync<TransectionSetting>(connection, query, param, commandType: CommandType.StoredProcedure);
				
				if (list == null)
				return null;
				else
				return list;
				
			}
		}
		public async Task<IEnumerable<TransectionSetting>> Search(int pageIndex, int pageSize,string sortBy, string orderBy)
		{
			
			using (var connection = connectionFactory.GetConnection)
			{
				var query = "[dbo].TransectionSetting_SORT";
				var param = new DynamicParameters();
				param.Add("@PageIndex", pageIndex);
				param.Add("@PageSize", pageSize);
				param.Add("@sortBy", sortBy);
				param.Add("@orderBy", orderBy);
				
				var list = await SqlMapper.QueryAsync<TransectionSetting>(connection, query, param, commandType: CommandType.StoredProcedure);
				
				if (list == null)
				return null;
				else
				return list;
				
			}
		}
		public async Task<IEnumerable<TransectionSetting>> Search(int pageIndex, int pageSize,string sortBy, string orderBy, string searchstring)
		{
			
			using (var connection = connectionFactory.GetConnection)
			{
				var query = "[dbo].TransectionSetting_CUSTOM";
				var param = new DynamicParameters();
				param.Add("@PageIndex", pageIndex);
				param.Add("@PageSize", pageSize);
				param.Add("@sortBy", sortBy);
				param.Add("@orderBy", orderBy);
				param.Add("@searchstring", searchstring);
				
				var list = await SqlMapper.QueryAsync<TransectionSetting>(connection, query, param, commandType: CommandType.StoredProcedure);
				
				if (list == null)
				return null;
				else
				return list;
				
			}
		}
		public async Task<IEnumerable<TransectionSetting>> Search(System.Int32? id, System.Int32? locationID, System.Int32? commodityID, System.String notes, System.Guid? createdBy, System.DateTime? createdOn)
		{
			try
			{
				
				using (var connection = connectionFactory.GetConnection)
				{
					var query = "[dbo].TransectionSetting_SEARCH";
					var param = new DynamicParameters();
					param.Add("id",id, DbType.Int32);
					param.Add("locationID",locationID, DbType.Int32);
					param.Add("commodityID",commodityID, DbType.Int32);
					param.Add("notes",notes, DbType.String);
					param.Add("createdBy",createdBy, DbType.Guid);
					param.Add("createdOn",createdOn, DbType.DateTime);
					
					var list = await SqlMapper.QueryAsync<TransectionSetting>(connection, query, param, commandType: CommandType.StoredProcedure);
					
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
		/// Insert current TransectionSetting to database.
		/// </summary>
		/// <param name="locationID">System.Int32?</param>
		/// <param name="commodityID">System.Int32?</param>
		/// <param name="notes">System.String</param>
		/// <param name="createdBy">System.Guid?</param>
		/// <param name="createdOn">System.DateTime?</param>
		public async Task<System.Int32> Insert(System.Int32? locationID, System.Int32? commodityID, System.String notes, System.Guid? createdBy, System.DateTime? createdOn)
		{
			try
			{
				
				using (var connection = connectionFactory.GetConnection)
				{
					var query = "[dbo].TransectionSetting_INSERT";
					var param = new DynamicParameters();
					param.Add("locationID", locationID, DbType.Int32);
					param.Add("commodityID", commodityID, DbType.Int32);
					param.Add("notes", notes, DbType.String);
					param.Add("createdBy", createdBy, DbType.Guid);
					param.Add("createdOn", createdOn, DbType.DateTime);
					var objs = await SqlMapper.ExecuteScalarAsync<System.Int32>(connection, query, param, commandType: CommandType.StoredProcedure);
					return objs;
					
				}
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}
		/// <summary>
		/// Insert current TransectionSetting to database.
		/// </summary>
		/// <param name=TransectionSetting Objects>TransectionSetting</param>
		public async Task<System.Int32> Insert(TransectionSetting model)
		{
			try
			{
				
				using (var connection = connectionFactory.GetConnection)
				{
					var query = "[dbo].TransectionSetting_INSERT";
					var param = new DynamicParameters();
					param.Add("locationID", model.LocationID, DbType.Int32);
					param.Add("commodityID", model.CommodityID, DbType.Int32);
					param.Add("notes", model.Notes, DbType.String);
					param.Add("createdBy", model.CreatedBy, DbType.Guid);
					param.Add("createdOn", model.CreatedOn, DbType.DateTime);
					var objs = await SqlMapper.ExecuteScalarAsync<System.Int32>(connection, query, param, commandType: CommandType.StoredProcedure);
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
		/// Update current TransectionSetting to database.
		/// </summary>
		/// <param name="id">System.Int32?</param>
		/// <param name="locationID">System.Int32?</param>
		/// <param name="commodityID">System.Int32?</param>
		/// <param name="notes">System.String</param>
		/// <param name="createdBy">System.Guid?</param>
		/// <param name="createdOn">System.DateTime?</param>
		public async Task<int> Update(System.Int32? id, System.Int32? locationID, System.Int32? commodityID, System.String notes, System.Guid? createdBy, System.DateTime? createdOn)
		{
			try
			{
				
				using (var connection = connectionFactory.GetConnection)
				{
					var query = "[dbo].TransectionSetting_UPDATE";
					var param = new DynamicParameters();
					param.Add("id", id, DbType.Int32);
					param.Add("locationID", locationID, DbType.Int32);
					param.Add("commodityID", commodityID, DbType.Int32);
					param.Add("notes", notes, DbType.String);
					param.Add("createdBy", createdBy, DbType.Guid);
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
		public async Task<int> Update(TransectionSetting model)
		{
			try
			{
				
				using (var connection = connectionFactory.GetConnection)
				{
					var query = "[dbo].TransectionSetting_UPDATE";
					var param = new DynamicParameters();
					param.Add("id", model.Id, DbType.Int32);
					param.Add("locationID", model.LocationID, DbType.Int32);
					param.Add("commodityID", model.CommodityID, DbType.Int32);
					param.Add("notes", model.Notes, DbType.String);
					param.Add("createdBy", model.CreatedBy, DbType.Guid);
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
		/// Delete current TransectionSetting from database.
		/// </summary>
		/// <param name="id">System.Int32?</param>
		public async Task<int> Delete(System.Int32? id)
		{
			using (var connection = connectionFactory.GetConnection)
			{
				var query = "[dbo].TransectionSetting_DELETE";
				var param = new DynamicParameters();
				param.Add("id", id, DbType.Int32);
				var iValue = await SqlMapper.ExecuteAsync(connection, query, param, commandType: CommandType.StoredProcedure);
				return iValue;
				
			}
		}
		#endregion
		
		
	}
}

