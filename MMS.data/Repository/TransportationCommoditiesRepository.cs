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
	public partial class TransportationCommoditiesRepository : BaseRepository, ITransportationCommoditiesRepository
	{
		public TransportationCommoditiesRepository(IConnectionFactory connectionFactory) : base(connectionFactory) { }
		
		#region Select One
		/// <summary>
		/// Get data according to the primary key value.
		/// </summary>
		/// <param name="id">System.Int64?</param>
		public async Task<TransportationCommodities> Get(System.Int64? id)
		{
			using (var connection = connectionFactory.GetConnection)
			{
				var query = "[dbo].TransportationCommodities_SELECT";
				var param = new DynamicParameters();
				param.Add(@"id", id, DbType.Int64);
				var list = await SqlMapper.QueryAsync<TransportationCommodities>(connection, query, param, commandType: CommandType.StoredProcedure);
				return list.FirstOrDefault();
				
			}
		}
		#endregion
		
		#region Search
		public async Task<IEnumerable<TransportationCommodities>> Search(int pageIndex, int pageSize)
		{
			
			using (var connection = connectionFactory.GetConnection)
			{
				var query = "[dbo].TransportationCommodities_PAGING";
				var param = new DynamicParameters();
				param.Add("@PageIndex", pageIndex);
				param.Add("@PageSize", pageSize);
				
				var list = await SqlMapper.QueryAsync<TransportationCommodities>(connection, query, param, commandType: CommandType.StoredProcedure);
				
				if (list == null)
				return null;
				else
				return list;
				
			}
		}
		public async Task<IEnumerable<TransportationCommodities>> Search(int pageIndex, int pageSize,string sortBy, string orderBy)
		{
			
			using (var connection = connectionFactory.GetConnection)
			{
				var query = "[dbo].TransportationCommodities_SORT";
				var param = new DynamicParameters();
				param.Add("@PageIndex", pageIndex);
				param.Add("@PageSize", pageSize);
				param.Add("@sortBy", sortBy);
				param.Add("@orderBy", orderBy);
				
				var list = await SqlMapper.QueryAsync<TransportationCommodities>(connection, query, param, commandType: CommandType.StoredProcedure);
				
				if (list == null)
				return null;
				else
				return list;
				
			}
		}
		public async Task<IEnumerable<TransportationCommodities>> Search(int pageIndex, int pageSize,string sortBy, string orderBy, string searchstring)
		{
			
			using (var connection = connectionFactory.GetConnection)
			{
				var query = "[dbo].TransportationCommodities_CUSTOM";
				var param = new DynamicParameters();
				param.Add("@PageIndex", pageIndex);
				param.Add("@PageSize", pageSize);
				param.Add("@sortBy", sortBy);
				param.Add("@orderBy", orderBy);
				param.Add("@searchstring", searchstring);
				
				var list = await SqlMapper.QueryAsync<TransportationCommodities>(connection, query, param, commandType: CommandType.StoredProcedure);
				
				if (list == null)
				return null;
				else
				return list;
				
			}
		}
		public async Task<IEnumerable<TransportationCommodities>> Search(System.Int64? id, System.String accountID, System.Int32? locationID, System.Int32? commodityID, System.String commodityName)
		{
			try
			{
				
				using (var connection = connectionFactory.GetConnection)
				{
					var query = "[dbo].TransportationCommodities_SEARCH";
					var param = new DynamicParameters();
					param.Add("id",id, DbType.Int64);
					param.Add("accountID",accountID, DbType.String);
					param.Add("locationID",locationID, DbType.Int32);
					param.Add("commodityID",commodityID, DbType.Int32);
					param.Add("commodityName",commodityName, DbType.String);
					
					var list = await SqlMapper.QueryAsync<TransportationCommodities>(connection, query, param, commandType: CommandType.StoredProcedure);
					
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
		/// Insert current TransportationCommodities to database.
		/// </summary>
		/// <param name="accountID">System.String</param>
		/// <param name="locationID">System.Int32?</param>
		/// <param name="commodityID">System.Int32?</param>
		/// <param name="commodityName">System.String</param>
		public async Task<System.Int64> Insert(System.String accountID, System.Int32? locationID, System.Int32? commodityID, System.String commodityName)
		{
			try
			{
				
				using (var connection = connectionFactory.GetConnection)
				{
					var query = "[dbo].TransportationCommodities_INSERT";
					var param = new DynamicParameters();
					param.Add("accountID", accountID, DbType.String);
					param.Add("locationID", locationID, DbType.Int32);
					param.Add("commodityID", commodityID, DbType.Int32);
					param.Add("commodityName", commodityName, DbType.String);
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
		/// Insert current TransportationCommodities to database.
		/// </summary>
		/// <param name=TransportationCommodities Objects>TransportationCommodities</param>
		public async Task<System.Int64> Insert(TransportationCommodities model)
		{
			try
			{
				
				using (var connection = connectionFactory.GetConnection)
				{
					var query = "[dbo].TransportationCommodities_INSERT";
					var param = new DynamicParameters();
					param.Add("accountID", model.AccountID, DbType.String);
					param.Add("locationID", model.LocationID, DbType.Int32);
					param.Add("commodityID", model.CommodityID, DbType.Int32);
					param.Add("commodityName", model.Commodity_Name, DbType.String);
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
		/// Update current TransportationCommodities to database.
		/// </summary>
		/// <param name="id">System.Int64?</param>
		/// <param name="accountID">System.String</param>
		/// <param name="locationID">System.Int32?</param>
		/// <param name="commodityID">System.Int32?</param>
		/// <param name="commodityName">System.String</param>
		public async Task<int> Update(System.Int64? id, System.String accountID, System.Int32? locationID, System.Int32? commodityID, System.String commodityName)
		{
			try
			{
				
				using (var connection = connectionFactory.GetConnection)
				{
					var query = "[dbo].TransportationCommodities_UPDATE";
					var param = new DynamicParameters();
					param.Add("id", id, DbType.Int64);
					param.Add("accountID", accountID, DbType.String);
					param.Add("locationID", locationID, DbType.Int32);
					param.Add("commodityID", commodityID, DbType.Int32);
					param.Add("commodityName", commodityName, DbType.String);
					var objs = await SqlMapper.ExecuteAsync(connection, query, param, commandType: CommandType.StoredProcedure);
					
					return objs;
					
				}
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}
		public async Task<int> Update(TransportationCommodities model)
		{
			try
			{
				
				using (var connection = connectionFactory.GetConnection)
				{
					var query = "[dbo].TransportationCommodities_UPDATE";
					var param = new DynamicParameters();
					param.Add("id", model.Id, DbType.Int64);
					param.Add("accountID", model.AccountID, DbType.String);
					param.Add("locationID", model.LocationID, DbType.Int32);
					param.Add("commodityID", model.CommodityID, DbType.Int32);
					param.Add("commodityName", model.Commodity_Name, DbType.String);
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
		/// Delete current TransportationCommodities from database.
		/// </summary>
		/// <param name="id">System.Int64?</param>
		public async Task<int> Delete(System.Int64? id)
		{
			using (var connection = connectionFactory.GetConnection)
			{
				var query = "[dbo].TransportationCommodities_DELETE";
				var param = new DynamicParameters();
				param.Add("id", id, DbType.Int64);
				var iValue = await SqlMapper.ExecuteAsync(connection, query, param, commandType: CommandType.StoredProcedure);
				return iValue;
				
			}
		}
		#endregion
		
		
	}
}

