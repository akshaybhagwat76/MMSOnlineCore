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
	public partial class UsersRepository : BaseRepository, IUsersRepository
	{
		public UsersRepository(IConnectionFactory connectionFactory) : base(connectionFactory) { }
		
		#region Select One
		/// <summary>
		/// Get data according to the primary key value.
		/// </summary>
		/// <param name="userID">System.Int32?</param>
		public async Task<Users> Get(System.Int32? userID)
		{
			using (var connection = connectionFactory.GetConnection)
			{
				var query = "[dbo].Users_SELECT";
				var param = new DynamicParameters();
				param.Add(@"userID", userID, DbType.Int32);
				var list = await SqlMapper.QueryAsync<Users>(connection, query, param, commandType: CommandType.StoredProcedure);
				return list.FirstOrDefault();
				
			}
		}
		#endregion
		
		#region Search
		public async Task<IEnumerable<Users>> Search(int pageIndex, int pageSize)
		{
			
			using (var connection = connectionFactory.GetConnection)
			{
				var query = "[dbo].Users_PAGING";
				var param = new DynamicParameters();
				param.Add("@PageIndex", pageIndex);
				param.Add("@PageSize", pageSize);
				
				var list = await SqlMapper.QueryAsync<Users>(connection, query, param, commandType: CommandType.StoredProcedure);
				
				if (list == null)
				return null;
				else
				return list;
				
			}
		}
		public async Task<IEnumerable<Users>> Search(int pageIndex, int pageSize,string sortBy, string orderBy)
		{
			
			using (var connection = connectionFactory.GetConnection)
			{
				var query = "[dbo].Users_SORT";
				var param = new DynamicParameters();
				param.Add("@PageIndex", pageIndex);
				param.Add("@PageSize", pageSize);
				param.Add("@sortBy", sortBy);
				param.Add("@orderBy", orderBy);
				
				var list = await SqlMapper.QueryAsync<Users>(connection, query, param, commandType: CommandType.StoredProcedure);
				
				if (list == null)
				return null;
				else
				return list;
				
			}
		}
		public async Task<IEnumerable<Users>> Search(int pageIndex, int pageSize,string sortBy, string orderBy, string searchstring)
		{
			
			using (var connection = connectionFactory.GetConnection)
			{
				var query = "[dbo].Users_CUSTOM";
				var param = new DynamicParameters();
				param.Add("@PageIndex", pageIndex);
				param.Add("@PageSize", pageSize);
				param.Add("@sortBy", sortBy);
				param.Add("@orderBy", orderBy);
				param.Add("@searchstring", searchstring);
				
				var list = await SqlMapper.QueryAsync<Users>(connection, query, param, commandType: CommandType.StoredProcedure);
				
				if (list == null)
				return null;
				else
				return list;
				
			}
		}
		public async Task<IEnumerable<Users>> Search(System.Int32? userID, System.String emailAddress, System.String name, System.Byte[] passwordHash, System.String salt, System.Int32? passwordVersion, System.Boolean? accountDisabled, System.String accountID)
		{
			try
			{
				
				using (var connection = connectionFactory.GetConnection)
				{
					var query = "[dbo].Users_SEARCH";
					var param = new DynamicParameters();
					param.Add("userID",userID, DbType.Int32);
					param.Add("emailAddress",emailAddress, DbType.String);
					param.Add("name",name, DbType.String);
					param.Add("passwordHash",passwordHash, DbType.Binary);
					param.Add("salt",salt, DbType.String);
					param.Add("passwordVersion",passwordVersion, DbType.Int32);
					param.Add("accountDisabled",accountDisabled, DbType.Boolean);
					param.Add("accountID",accountID, DbType.String);
					
					var list = await SqlMapper.QueryAsync<Users>(connection, query, param, commandType: CommandType.StoredProcedure);
					
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
		/// Insert current Users to database.
		/// </summary>
		/// <param name="userID">System.Int32?</param>
		/// <param name="emailAddress">System.String</param>
		/// <param name="name">System.String</param>
		/// <param name="passwordHash">System.Byte[]</param>
		/// <param name="salt">System.String</param>
		/// <param name="passwordVersion">System.Int32?</param>
		/// <param name="accountDisabled">System.Boolean?</param>
		/// <param name="accountID">System.String</param>
		public async Task<int> Insert(System.Int32? userID, System.String emailAddress, System.String name, System.Byte[] passwordHash, System.String salt, System.Int32? passwordVersion, System.Boolean? accountDisabled, System.String accountID)
		{
			try
			{
				
				using (var connection = connectionFactory.GetConnection)
				{
					var query = "[dbo].Users_INSERT";
					var param = new DynamicParameters();
					param.Add("userID", userID, DbType.Int32);
					param.Add("emailAddress", emailAddress, DbType.String);
					param.Add("name", name, DbType.String);
					param.Add("passwordHash", passwordHash, DbType.Binary);
					param.Add("salt", salt, DbType.String);
					param.Add("passwordVersion", passwordVersion, DbType.Int32);
					param.Add("accountDisabled", accountDisabled, DbType.Boolean);
					param.Add("accountID", accountID, DbType.String);
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
		/// Insert current Users to database.
		/// </summary>
		/// <param name=Users Objects>Users</param>
		public async Task<int> Insert(Users model)
		{
			try
			{
				
				using (var connection = connectionFactory.GetConnection)
				{
					var query = "[dbo].Users_INSERT";
					var param = new DynamicParameters();
					param.Add("userID", model.UserID, DbType.Int32);
					param.Add("emailAddress", model.EmailAddress, DbType.String);
					param.Add("name", model.Name, DbType.String);
					param.Add("passwordHash", model.PasswordHash, DbType.Binary);
					param.Add("salt", model.Salt, DbType.String);
					param.Add("passwordVersion", model.PasswordVersion, DbType.Int32);
					param.Add("accountDisabled", model.AccountDisabled, DbType.Boolean);
					param.Add("accountID", model.AccountID, DbType.String);
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
		
		#region UPDATE
		/// <summary>
		/// Update current Users to database.
		/// </summary>
		/// <param name="userID">System.Int32?</param>
		/// <param name="emailAddress">System.String</param>
		/// <param name="name">System.String</param>
		/// <param name="passwordHash">System.Byte[]</param>
		/// <param name="salt">System.String</param>
		/// <param name="passwordVersion">System.Int32?</param>
		/// <param name="accountDisabled">System.Boolean?</param>
		/// <param name="accountID">System.String</param>
		public async Task<int> Update(System.Int32? userID, System.String emailAddress, System.String name, System.Byte[] passwordHash, System.String salt, System.Int32? passwordVersion, System.Boolean? accountDisabled, System.String accountID)
		{
			try
			{
				
				using (var connection = connectionFactory.GetConnection)
				{
					var query = "[dbo].Users_UPDATE";
					var param = new DynamicParameters();
					param.Add("userID", userID, DbType.Int32);
					param.Add("emailAddress", emailAddress, DbType.String);
					param.Add("name", name, DbType.String);
					param.Add("passwordHash", passwordHash, DbType.Binary);
					param.Add("salt", salt, DbType.String);
					param.Add("passwordVersion", passwordVersion, DbType.Int32);
					param.Add("accountDisabled", accountDisabled, DbType.Boolean);
					param.Add("accountID", accountID, DbType.String);
					var objs = await SqlMapper.ExecuteAsync(connection, query, param, commandType: CommandType.StoredProcedure);
					
					return objs;
					
				}
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}
		public async Task<int> Update(Users model)
		{
			try
			{
				
				using (var connection = connectionFactory.GetConnection)
				{
					var query = "[dbo].Users_UPDATE";
					var param = new DynamicParameters();
					param.Add("userID", model.UserID, DbType.Int32);
					param.Add("emailAddress", model.EmailAddress, DbType.String);
					param.Add("name", model.Name, DbType.String);
					param.Add("passwordHash", model.PasswordHash, DbType.Binary);
					param.Add("salt", model.Salt, DbType.String);
					param.Add("passwordVersion", model.PasswordVersion, DbType.Int32);
					param.Add("accountDisabled", model.AccountDisabled, DbType.Boolean);
					param.Add("accountID", model.AccountID, DbType.String);
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
		/// Delete current Users from database.
		/// </summary>
		/// <param name="userID">System.Int32?</param>
		public async Task<int> Delete(System.Int32? userID)
		{
			using (var connection = connectionFactory.GetConnection)
			{
				var query = "[dbo].Users_DELETE";
				var param = new DynamicParameters();
				param.Add("userID", userID, DbType.Int32);
				var iValue = await SqlMapper.ExecuteAsync(connection, query, param, commandType: CommandType.StoredProcedure);
				return iValue;
				
			}
		}
		#endregion
		
		
	}
}

