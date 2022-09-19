
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
	public partial class TransactionHeaderRepository : BaseRepository, ITransactionHeaderRepository
	{
		public TransactionHeaderRepository(IConnectionFactory connectionFactory) : base(connectionFactory) { }
		
		#region Select One
		/// <summary>
		/// Get data according to the primary key value.
		/// </summary>
		/// <param name="id">System.Int64?</param>
		public async Task<TransactionHeader> Get(System.Int64? id)
		{
			using (var connection = connectionFactory.GetConnection)
			{
				var query = "[dbo].TransactionHeader_SELECT";
				var param = new DynamicParameters();
				param.Add(@"id", id, DbType.Int64);
				var list = await SqlMapper.QueryAsync<TransactionHeader>(connection, query, param, commandType: CommandType.StoredProcedure);
				return list.FirstOrDefault();
				
			}
		}
		#endregion
		
		#region Search
		public async Task<IEnumerable<TransactionHeader>> Search(int pageIndex, int pageSize)
		{
			
			using (var connection = connectionFactory.GetConnection)
			{
				var query = "[dbo].TransactionHeader_PAGING";
				var param = new DynamicParameters();
				param.Add("@PageIndex", pageIndex);
				param.Add("@PageSize", pageSize);
				
				var list = await SqlMapper.QueryAsync<TransactionHeader>(connection, query, param, commandType: CommandType.StoredProcedure);
				
				if (list == null)
				return null;
				else
				return list;
				
			}
		}
		public async Task<IEnumerable<TransactionHeader>> Search(int pageIndex, int pageSize,string sortBy, string orderBy)
		{
			
			using (var connection = connectionFactory.GetConnection)
			{
				var query = "[dbo].TransactionHeader_SORT";
				var param = new DynamicParameters();
				param.Add("@PageIndex", pageIndex);
				param.Add("@PageSize", pageSize);
				param.Add("@sortBy", sortBy);
				param.Add("@orderBy", orderBy);
				
				var list = await SqlMapper.QueryAsync<TransactionHeader>(connection, query, param, commandType: CommandType.StoredProcedure);
				
				if (list == null)
				return null;
				else
				return list;
				
			}
		}
		public async Task<IEnumerable<TransactionHeader>> Search(int pageIndex, int pageSize,string sortBy, string orderBy, string searchstring)
		{
			
			using (var connection = connectionFactory.GetConnection)
			{
				var query = "[dbo].TransactionHeader_CUSTOM";
				var param = new DynamicParameters();
				param.Add("@PageIndex", pageIndex);
				param.Add("@PageSize", pageSize);
				param.Add("@sortBy", sortBy);
				param.Add("@orderBy", orderBy);
				param.Add("@searchstring", searchstring);
				
				var list = await SqlMapper.QueryAsync<TransactionHeader>(connection, query, param, commandType: CommandType.StoredProcedure);
				
				if (list == null)
				return null;
				else
				return list;
				
			}
		}
		public async Task<IEnumerable<TransactionHeader>> Search(System.Int64? id, System.String accountID, System.String ticketNumber, System.String orderNumber, System.DateTime? ticketDate, System.String paymentTerms, System.String supplierTicket, System.String carrierTicket, System.String truckDescription, System.String status, System.String paymentReceiptURL)
		{
			try
			{
				
				using (var connection = connectionFactory.GetConnection)
				{
					var query = "[dbo].TransactionHeader_SEARCH";
					var param = new DynamicParameters();
					param.Add("id",id, DbType.Int64);
					param.Add("accountID",accountID, DbType.String);
					param.Add("ticketNumber",ticketNumber, DbType.String);
					param.Add("orderNumber",orderNumber, DbType.String);
					param.Add("ticketDate",ticketDate, DbType.Date);
					param.Add("paymentTerms",paymentTerms, DbType.String);
					param.Add("supplierTicket",supplierTicket, DbType.String);
					param.Add("carrierTicket",carrierTicket, DbType.String);
					param.Add("truckDescription",truckDescription, DbType.String);
					param.Add("status",status, DbType.String);
					param.Add("paymentReceiptURL",paymentReceiptURL, DbType.String);
					
					var list = await SqlMapper.QueryAsync<TransactionHeader>(connection, query, param, commandType: CommandType.StoredProcedure);
					
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
		/// Insert current TransactionHeader to database.
		/// </summary>
		/// <param name="accountID">System.String</param>
		/// <param name="ticketNumber">System.String</param>
		/// <param name="orderNumber">System.String</param>
		/// <param name="ticketDate">System.DateTime?</param>
		/// <param name="paymentTerms">System.String</param>
		/// <param name="supplierTicket">System.String</param>
		/// <param name="carrierTicket">System.String</param>
		/// <param name="truckDescription">System.String</param>
		/// <param name="status">System.String</param>
		/// <param name="paymentReceiptURL">System.String</param>
		public async Task<System.Int64> Insert(System.String accountID, System.String ticketNumber, System.String orderNumber, System.DateTime? ticketDate, System.String paymentTerms, System.String supplierTicket, System.String carrierTicket, System.String truckDescription, System.String status, System.String paymentReceiptURL)
		{
			try
			{
				
				using (var connection = connectionFactory.GetConnection)
				{
					var query = "[dbo].TransactionHeader_INSERT";
					var param = new DynamicParameters();
					param.Add("accountID", accountID, DbType.String);
					param.Add("ticketNumber", ticketNumber, DbType.String);
					param.Add("orderNumber", orderNumber, DbType.String);
					param.Add("ticketDate", ticketDate, DbType.Date);
					param.Add("paymentTerms", paymentTerms, DbType.String);
					param.Add("supplierTicket", supplierTicket, DbType.String);
					param.Add("carrierTicket", carrierTicket, DbType.String);
					param.Add("truckDescription", truckDescription, DbType.String);
					param.Add("status", status, DbType.String);
					param.Add("paymentReceiptURL", paymentReceiptURL, DbType.String);
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
		/// Insert current TransactionHeader to database.
		/// </summary>
		/// <param name=TransactionHeader Objects>TransactionHeader</param>
		public async Task<System.Int64> Insert(TransactionHeader model)
		{
			try
			{
				
				using (var connection = connectionFactory.GetConnection)
				{
					var query = "[dbo].TransactionHeader_INSERT";
					var param = new DynamicParameters();
					param.Add("accountID", model.AccountID, DbType.String);
					param.Add("ticketNumber", model.TicketNumber, DbType.String);
					param.Add("orderNumber", model.OrderNumber, DbType.String);
					param.Add("ticketDate", model.TicketDate, DbType.Date);
					param.Add("paymentTerms", model.PaymentTerms, DbType.String);
					param.Add("supplierTicket", model.SupplierTicket, DbType.String);
					param.Add("carrierTicket", model.CarrierTicket, DbType.String);
					param.Add("truckDescription", model.TruckDescription, DbType.String);
					param.Add("status", model.Status, DbType.String);
					param.Add("paymentReceiptURL", model.PaymentReceiptURL, DbType.String);
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
		/// Update current TransactionHeader to database.
		/// </summary>
		/// <param name="id">System.Int64?</param>
		/// <param name="accountID">System.String</param>
		/// <param name="ticketNumber">System.String</param>
		/// <param name="orderNumber">System.String</param>
		/// <param name="ticketDate">System.DateTime?</param>
		/// <param name="paymentTerms">System.String</param>
		/// <param name="supplierTicket">System.String</param>
		/// <param name="carrierTicket">System.String</param>
		/// <param name="truckDescription">System.String</param>
		/// <param name="status">System.String</param>
		/// <param name="paymentReceiptURL">System.String</param>
		public async Task<int> Update(System.Int64? id, System.String accountID, System.String ticketNumber, System.String orderNumber, System.DateTime? ticketDate, System.String paymentTerms, System.String supplierTicket, System.String carrierTicket, System.String truckDescription, System.String status, System.String paymentReceiptURL)
		{
			try
			{
				
				using (var connection = connectionFactory.GetConnection)
				{
					var query = "[dbo].TransactionHeader_UPDATE";
					var param = new DynamicParameters();
					param.Add("id", id, DbType.Int64);
					param.Add("accountID", accountID, DbType.String);
					param.Add("ticketNumber", ticketNumber, DbType.String);
					param.Add("orderNumber", orderNumber, DbType.String);
					param.Add("ticketDate", ticketDate, DbType.Date);
					param.Add("paymentTerms", paymentTerms, DbType.String);
					param.Add("supplierTicket", supplierTicket, DbType.String);
					param.Add("carrierTicket", carrierTicket, DbType.String);
					param.Add("truckDescription", truckDescription, DbType.String);
					param.Add("status", status, DbType.String);
					param.Add("paymentReceiptURL", paymentReceiptURL, DbType.String);
					var objs = await SqlMapper.ExecuteAsync(connection, query, param, commandType: CommandType.StoredProcedure);
					
					return objs;
					
				}
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}
		public async Task<int> Update(TransactionHeader model)
		{
			try
			{
				
				using (var connection = connectionFactory.GetConnection)
				{
					var query = "[dbo].TransactionHeader_UPDATE";
					var param = new DynamicParameters();
					param.Add("id", model.Id, DbType.Int64);
					param.Add("accountID", model.AccountID, DbType.String);
					param.Add("ticketNumber", model.TicketNumber, DbType.String);
					param.Add("orderNumber", model.OrderNumber, DbType.String);
					param.Add("ticketDate", model.TicketDate, DbType.Date);
					param.Add("paymentTerms", model.PaymentTerms, DbType.String);
					param.Add("supplierTicket", model.SupplierTicket, DbType.String);
					param.Add("carrierTicket", model.CarrierTicket, DbType.String);
					param.Add("truckDescription", model.TruckDescription, DbType.String);
					param.Add("status", model.Status, DbType.String);
					param.Add("paymentReceiptURL", model.PaymentReceiptURL, DbType.String);
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
		/// Delete current TransactionHeader from database.
		/// </summary>
		/// <param name="id">System.Int64?</param>
		public async Task<int> Delete(System.Int64? id)
		{
			using (var connection = connectionFactory.GetConnection)
			{
				var query = "[dbo].TransactionHeader_DELETE";
				var param = new DynamicParameters();
				param.Add("id", id, DbType.Int64);
				var iValue = await SqlMapper.ExecuteAsync(connection, query, param, commandType: CommandType.StoredProcedure);
				return iValue;
				
			}
		}
		#endregion
	}
}

