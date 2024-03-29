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
using System;
using System.Data;
using System.Linq;
using System.Collections.Generic;
using Dapper;
using System.Threading.Tasks;
using MMS.data.Infrastructure;
using MMS.data.Entities;

namespace MMS.data.Repository
{
	public partial class TransactionDetailRepository : BaseRepository, ITransactionDetailRepository
	{
		public TransactionDetailRepository(IConnectionFactory connectionFactory) : base(connectionFactory) { }
		
		#region Select One
		/// <summary>
		/// Get data according to the primary key value.
		/// </summary>
		/// <param name="id">System.Int64?</param>
		public async Task<TransactionDetail> Get(System.Int64? id)
		{
			using (var connection = connectionFactory.GetConnection)
			{
				var query = "[dbo].TransactionDetail_SELECT";
				var param = new DynamicParameters();
				param.Add(@"id", id, DbType.Int64);
				var list = await SqlMapper.QueryAsync<TransactionDetail>(connection, query, param, commandType: CommandType.StoredProcedure);
				return list.FirstOrDefault();
				
			}
		}
		#endregion
		
		#region Search
		public async Task<IEnumerable<TransactionDetail>> Search(int pageIndex, int pageSize)
		{
			
			using (var connection = connectionFactory.GetConnection)
			{
				var query = "[dbo].TransactionDetail_PAGING";
				var param = new DynamicParameters();
				param.Add("@PageIndex", pageIndex);
				param.Add("@PageSize", pageSize);
				
				var list = await SqlMapper.QueryAsync<TransactionDetail>(connection, query, param, commandType: CommandType.StoredProcedure);
				
				if (list == null)
				return null;
				else
				return list;
				
			}
		}
		public async Task<IEnumerable<TransactionDetail>> Search(int pageIndex, int pageSize,string sortBy, string orderBy)
		{
			
			using (var connection = connectionFactory.GetConnection)
			{
				var query = "[dbo].TransactionDetail_SORT";
				var param = new DynamicParameters();
				param.Add("@PageIndex", pageIndex);
				param.Add("@PageSize", pageSize);
				param.Add("@sortBy", sortBy);
				param.Add("@orderBy", orderBy);
				
				var list = await SqlMapper.QueryAsync<TransactionDetail>(connection, query, param, commandType: CommandType.StoredProcedure);
				
				if (list == null)
				return null;
				else
				return list;
				
			}
		}
		public async Task<IEnumerable<TransactionDetail>> Search(int pageIndex, int pageSize,string sortBy, string orderBy, string searchstring)
		{
			
			using (var connection = connectionFactory.GetConnection)
			{
				var query = "[dbo].TransactionDetail_CUSTOM";
				var param = new DynamicParameters();
				param.Add("@PageIndex", pageIndex);
				param.Add("@PageSize", pageSize);
				param.Add("@sortBy", sortBy);
				param.Add("@orderBy", orderBy);
				param.Add("@searchstring", searchstring);
				
				var list = await SqlMapper.QueryAsync<TransactionDetail>(connection, query, param, commandType: CommandType.StoredProcedure);
				
				if (list == null)
				return null;
				else
				return list;
				
			}
		}
		public async Task<IEnumerable<TransactionDetail>> Search(System.Int64? id, System.String accountID, System.String ticketNumber, System.Int32? detailID, System.Int32? gross, System.Int32? tare, System.Int32? net, System.Decimal? unitCost, System.Decimal? totalCost)
		{
			try
			{
				
				using (var connection = connectionFactory.GetConnection)
				{
					var query = "[dbo].TransactionDetail_SEARCH";
					var param = new DynamicParameters();
					param.Add("id",id, DbType.Int64);
					param.Add("accountID",accountID, DbType.String);
					param.Add("ticketNumber",ticketNumber, DbType.String);
					param.Add("detailID",detailID, DbType.Int32);
					param.Add("gross",gross, DbType.Int32);
					param.Add("tare",tare, DbType.Int32);
					param.Add("net",net, DbType.Int32);
					param.Add("unitCost",unitCost, DbType.Currency);
					param.Add("totalCost",totalCost, DbType.Currency);
					
					var list = await SqlMapper.QueryAsync<TransactionDetail>(connection, query, param, commandType: CommandType.StoredProcedure);
					
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
		/// Insert current TransactionDetail to database.
		/// </summary>
		/// <param name="accountID">System.String</param>
		/// <param name="ticketNumber">System.String</param>
		/// <param name="detailID">System.Int32?</param>
		/// <param name="gross">System.Int32?</param>
		/// <param name="tare">System.Int32?</param>
		/// <param name="net">System.Int32?</param>
		/// <param name="unitCost">System.Decimal?</param>
		/// <param name="totalCost">System.Decimal?</param>
		public async Task<System.Int64> Insert(System.String accountID, System.String ticketNumber, System.Int32? detailID, System.Int32? gross, System.Int32? tare, System.Int32? net, System.Decimal? unitCost, System.Decimal? totalCost)
		{
			try
			{
				
				using (var connection = connectionFactory.GetConnection)
				{
					var query = "[dbo].TransactionDetail_INSERT";
					var param = new DynamicParameters();
					param.Add("accountID", accountID, DbType.String);
					param.Add("ticketNumber", ticketNumber, DbType.String);
					param.Add("detailID", detailID, DbType.Int32);
					param.Add("gross", gross, DbType.Int32);
					param.Add("tare", tare, DbType.Int32);
					param.Add("net", net, DbType.Int32);
					param.Add("unitCost", unitCost, DbType.Currency);
					param.Add("totalCost", totalCost, DbType.Currency);
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
		/// Insert current TransactionDetail to database.
		/// </summary>
		/// <param name=TransactionDetail Objects>TransactionDetail</param>
		public async Task<System.Int64> Insert(TransactionDetail model)
		{
			try
			{
				
				using (var connection = connectionFactory.GetConnection)
				{
					var query = "[dbo].TransactionDetail_INSERT";
					var param = new DynamicParameters();
					param.Add("accountID", model.AccountID, DbType.String);
					param.Add("ticketNumber", model.TicketNumber, DbType.String);
					param.Add("detailID", model.DetailID, DbType.Int32);
					param.Add("gross", model.Gross, DbType.Int32);
					param.Add("tare", model.Tare, DbType.Int32);
					param.Add("net", model.Net, DbType.Int32);
					param.Add("unitCost", model.UnitCost, DbType.Currency);
					param.Add("totalCost", model.TotalCost, DbType.Currency);
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
		/// Update current TransactionDetail to database.
		/// </summary>
		/// <param name="id">System.Int64?</param>
		/// <param name="accountID">System.String</param>
		/// <param name="ticketNumber">System.String</param>
		/// <param name="detailID">System.Int32?</param>
		/// <param name="gross">System.Int32?</param>
		/// <param name="tare">System.Int32?</param>
		/// <param name="net">System.Int32?</param>
		/// <param name="unitCost">System.Decimal?</param>
		/// <param name="totalCost">System.Decimal?</param>
		public async Task<int> Update(System.Int64? id, System.String accountID, System.String ticketNumber, System.Int32? detailID, System.Int32? gross, System.Int32? tare, System.Int32? net, System.Decimal? unitCost, System.Decimal? totalCost)
		{
			try
			{
				
				using (var connection = connectionFactory.GetConnection)
				{
					var query = "[dbo].TransactionDetail_UPDATE";
					var param = new DynamicParameters();
					param.Add("id", id, DbType.Int64);
					param.Add("accountID", accountID, DbType.String);
					param.Add("ticketNumber", ticketNumber, DbType.String);
					param.Add("detailID", detailID, DbType.Int32);
					param.Add("gross", gross, DbType.Int32);
					param.Add("tare", tare, DbType.Int32);
					param.Add("net", net, DbType.Int32);
					param.Add("unitCost", unitCost, DbType.Currency);
					param.Add("totalCost", totalCost, DbType.Currency);
					var objs = await SqlMapper.ExecuteAsync(connection, query, param, commandType: CommandType.StoredProcedure);
					
					return objs;
					
				}
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}
		public async Task<int> Update(TransactionDetail model)
		{
			try
			{
				
				using (var connection = connectionFactory.GetConnection)
				{
					var query = "[dbo].TransactionDetail_UPDATE";
					var param = new DynamicParameters();
					param.Add("id", model.Id, DbType.Int64);
					param.Add("accountID", model.AccountID, DbType.String);
					param.Add("ticketNumber", model.TicketNumber, DbType.String);
					param.Add("detailID", model.DetailID, DbType.Int32);
					param.Add("gross", model.Gross, DbType.Int32);
					param.Add("tare", model.Tare, DbType.Int32);
					param.Add("net", model.Net, DbType.Int32);
					param.Add("unitCost", model.UnitCost, DbType.Currency);
					param.Add("totalCost", model.TotalCost, DbType.Currency);
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
		/// Delete current TransactionDetail from database.
		/// </summary>
		/// <param name="id">System.Int64?</param>
		public async Task<int> Delete(System.Int64? id)
		{
			using (var connection = connectionFactory.GetConnection)
			{
				var query = "[dbo].TransactionDetail_DELETE";
				var param = new DynamicParameters();
				param.Add("id", id, DbType.Int64);
				var iValue = await SqlMapper.ExecuteAsync(connection, query, param, commandType: CommandType.StoredProcedure);
				return iValue;
				
			}
		}
		#endregion
		
		
	}
}

