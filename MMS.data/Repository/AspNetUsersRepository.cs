/***************************************************************/
/* Code Writer (written by Akshay S Bhagwat )                                 */
/*                                                                          */
/* This file was automatically generated using Code Writer                  */
/* Any manual changes to this file will be overwritten by a automated tool. */
/*                                                                          */
/* Date Generated : 05-03-2022 14:32:56                                      */
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
	public partial class AspNetUsersRepository : BaseRepository, IAspNetUsersRepository
	{
		public AspNetUsersRepository(IConnectionFactory connectionFactory) : base(connectionFactory) { }
		
		#region Select One
		/// <summary>
		/// Get data according to the primary key value.
		/// </summary>
		/// <param name="id">System.Guid?</param>
		public async Task<AspNetUsers> Get(System.Guid? id)
		{
			using (var connection = connectionFactory.GetConnection)
			{
				var query = "[dbo].AspNetUsers_SELECT";
				var param = new DynamicParameters();
				param.Add(@"id", id, DbType.Guid);
				var list = await SqlMapper.QueryAsync<AspNetUsers>(connection, query, param, commandType: CommandType.StoredProcedure);
				return list.FirstOrDefault();
				
			}
		}
		#endregion
		
		#region Search
		public async Task<IEnumerable<AspNetUsers>> Search(int pageIndex, int pageSize)
		{
			
			using (var connection = connectionFactory.GetConnection)
			{
				var query = "[dbo].AspNetUsers_PAGING";
				var param = new DynamicParameters();
				param.Add("@PageIndex", pageIndex);
				param.Add("@PageSize", pageSize);
				
				var list = await SqlMapper.QueryAsync<AspNetUsers>(connection, query, param, commandType: CommandType.StoredProcedure);
				
				if (list == null)
				return null;
				else
				return list;
				
			}
		}
		public async Task<IEnumerable<AspNetUsers>> Search(int pageIndex, int pageSize,string sortBy, string orderBy)
		{
			
			using (var connection = connectionFactory.GetConnection)
			{
				var query = "[dbo].AspNetUsers_SORT";
				var param = new DynamicParameters();
				param.Add("@PageIndex", pageIndex);
				param.Add("@PageSize", pageSize);
				param.Add("@sortBy", sortBy);
				param.Add("@orderBy", orderBy);
				
				var list = await SqlMapper.QueryAsync<AspNetUsers>(connection, query, param, commandType: CommandType.StoredProcedure);
				
				if (list == null)
				return null;
				else
				return list;
				
			}
		}
		public async Task<IEnumerable<AspNetUsers>> Search(int pageIndex, int pageSize,string sortBy, string orderBy, string searchstring)
		{
			
			using (var connection = connectionFactory.GetConnection)
			{
				var query = "[dbo].AspNetUsers_CUSTOM";
				var param = new DynamicParameters();
				param.Add("@PageIndex", pageIndex);
				param.Add("@PageSize", pageSize);
				param.Add("@sortBy", sortBy);
				param.Add("@orderBy", orderBy);
				param.Add("@searchstring", searchstring);
				
				var list = await SqlMapper.QueryAsync<AspNetUsers>(connection, query, param, commandType: CommandType.StoredProcedure);
				
				if (list == null)
				return null;
				else
				return list;
				
			}
		}
		public async Task<IEnumerable<AspNetUsers>> Search(System.Guid? id, System.String userName, System.String normalizedUserName, System.String email, System.String normalizedEmail, System.Boolean? emailConfirmed, System.String passwordHash, System.String securityStamp, System.String concurrencyStamp, System.String phoneNumber, System.Boolean? phoneNumberConfirmed, System.Boolean? twoFactorEnabled, System.DateTimeOffset lockoutEnd, System.Boolean? lockoutEnabled, System.Int32? accessFailedCount, System.DateTime? joinTime, System.DateTime? dob, System.Int32? cid, System.String userImage, System.String title, System.String firstName, System.String surname, System.String lastName, System.String address, System.Int32? countryID, System.String pinCode, System.String gender, System.String companyName, System.Boolean? isActive, System.Boolean? isDeleted, System.String lastUpdatedBy, System.DateTime? lastUpdatedOn, System.String accountID)
		{
			try
			{
				
				using (var connection = connectionFactory.GetConnection)
				{
					var query = "[dbo].AspNetUsers_SEARCH";
					var param = new DynamicParameters();
					param.Add("id",id, DbType.Guid);
					param.Add("userName",userName, DbType.String);
					param.Add("normalizedUserName",normalizedUserName, DbType.String);
					param.Add("email",email, DbType.String);
					param.Add("normalizedEmail",normalizedEmail, DbType.String);
					param.Add("emailConfirmed",emailConfirmed, DbType.Boolean);
					param.Add("passwordHash",passwordHash, DbType.String);
					param.Add("securityStamp",securityStamp, DbType.String);
					param.Add("concurrencyStamp",concurrencyStamp, DbType.String);
					param.Add("phoneNumber",phoneNumber, DbType.String);
					param.Add("phoneNumberConfirmed",phoneNumberConfirmed, DbType.Boolean);
					param.Add("twoFactorEnabled",twoFactorEnabled, DbType.Boolean);
					param.Add("lockoutEnd",lockoutEnd, DbType.DateTimeOffset);
					param.Add("lockoutEnabled",lockoutEnabled, DbType.Boolean);
					param.Add("accessFailedCount",accessFailedCount, DbType.Int32);
					param.Add("joinTime",joinTime, DbType.DateTime2);
					param.Add("dob",dob, DbType.DateTime2);
					param.Add("cid",cid, DbType.Int32);
					param.Add("userImage",userImage, DbType.String);
					param.Add("title",title, DbType.String);
					param.Add("firstName",firstName, DbType.String);
					param.Add("surname",surname, DbType.String);
					param.Add("lastName",lastName, DbType.String);
					param.Add("address",address, DbType.String);
					param.Add("countryID",countryID, DbType.Int32);
					param.Add("pinCode",pinCode, DbType.String);
					param.Add("gender",gender, DbType.String);
					param.Add("companyName",companyName, DbType.String);
					param.Add("isActive",isActive, DbType.Boolean);
					param.Add("isDeleted",isDeleted, DbType.Boolean);
					param.Add("lastUpdatedBy",lastUpdatedBy, DbType.String);
					param.Add("lastUpdatedOn",lastUpdatedOn, DbType.DateTime2);
					param.Add("accountID",accountID, DbType.String);
					
					var list = await SqlMapper.QueryAsync<AspNetUsers>(connection, query, param, commandType: CommandType.StoredProcedure);
					
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
		/// Insert current AspNetUsers to database.
		/// </summary>
		/// <param name="id">System.Guid?</param>
		/// <param name="userName">System.String</param>
		/// <param name="normalizedUserName">System.String</param>
		/// <param name="email">System.String</param>
		/// <param name="normalizedEmail">System.String</param>
		/// <param name="emailConfirmed">System.Boolean?</param>
		/// <param name="passwordHash">System.String</param>
		/// <param name="securityStamp">System.String</param>
		/// <param name="concurrencyStamp">System.String</param>
		/// <param name="phoneNumber">System.String</param>
		/// <param name="phoneNumberConfirmed">System.Boolean?</param>
		/// <param name="twoFactorEnabled">System.Boolean?</param>
		/// <param name="lockoutEnd">System.DateTimeOffset</param>
		/// <param name="lockoutEnabled">System.Boolean?</param>
		/// <param name="accessFailedCount">System.Int32?</param>
		/// <param name="joinTime">System.DateTime?</param>
		/// <param name="dob">System.DateTime?</param>
		/// <param name="cid">System.Int32?</param>
		/// <param name="userImage">System.String</param>
		/// <param name="title">System.String</param>
		/// <param name="firstName">System.String</param>
		/// <param name="surname">System.String</param>
		/// <param name="lastName">System.String</param>
		/// <param name="address">System.String</param>
		/// <param name="countryID">System.Int32?</param>
		/// <param name="pinCode">System.String</param>
		/// <param name="gender">System.String</param>
		/// <param name="companyName">System.String</param>
		/// <param name="isActive">System.Boolean?</param>
		/// <param name="isDeleted">System.Boolean?</param>
		/// <param name="lastUpdatedBy">System.String</param>
		/// <param name="lastUpdatedOn">System.DateTime?</param>
		/// <param name="accountID">System.String</param>
		public async Task<int> Insert(System.Guid? id, System.String userName, System.String normalizedUserName, System.String email, System.String normalizedEmail, System.Boolean? emailConfirmed, System.String passwordHash, System.String securityStamp, System.String concurrencyStamp, System.String phoneNumber, System.Boolean? phoneNumberConfirmed, System.Boolean? twoFactorEnabled, System.DateTimeOffset lockoutEnd, System.Boolean? lockoutEnabled, System.Int32? accessFailedCount, System.DateTime? joinTime, System.DateTime? dob, System.Int32? cid, System.String userImage, System.String title, System.String firstName, System.String surname, System.String lastName, System.String address, System.Int32? countryID, System.String pinCode, System.String gender, System.String companyName, System.Boolean? isActive, System.Boolean? isDeleted, System.String lastUpdatedBy, System.DateTime? lastUpdatedOn, System.String accountID)
		{
			try
			{
				
				using (var connection = connectionFactory.GetConnection)
				{
					var query = "[dbo].AspNetUsers_INSERT";
					var param = new DynamicParameters();
					param.Add("id", id, DbType.Guid);
					param.Add("userName", userName, DbType.String);
					param.Add("normalizedUserName", normalizedUserName, DbType.String);
					param.Add("email", email, DbType.String);
					param.Add("normalizedEmail", normalizedEmail, DbType.String);
					param.Add("emailConfirmed", emailConfirmed, DbType.Boolean);
					param.Add("passwordHash", passwordHash, DbType.String);
					param.Add("securityStamp", securityStamp, DbType.String);
					param.Add("concurrencyStamp", concurrencyStamp, DbType.String);
					param.Add("phoneNumber", phoneNumber, DbType.String);
					param.Add("phoneNumberConfirmed", phoneNumberConfirmed, DbType.Boolean);
					param.Add("twoFactorEnabled", twoFactorEnabled, DbType.Boolean);
					param.Add("lockoutEnd", lockoutEnd, DbType.DateTimeOffset);
					param.Add("lockoutEnabled", lockoutEnabled, DbType.Boolean);
					param.Add("accessFailedCount", accessFailedCount, DbType.Int32);
					param.Add("joinTime", joinTime, DbType.DateTime2);
					param.Add("dob", dob, DbType.DateTime2);
					param.Add("cid", cid, DbType.Int32);
					param.Add("userImage", userImage, DbType.String);
					param.Add("title", title, DbType.String);
					param.Add("firstName", firstName, DbType.String);
					param.Add("surname", surname, DbType.String);
					param.Add("lastName", lastName, DbType.String);
					param.Add("address", address, DbType.String);
					param.Add("countryID", countryID, DbType.Int32);
					param.Add("pinCode", pinCode, DbType.String);
					param.Add("gender", gender, DbType.String);
					param.Add("companyName", companyName, DbType.String);
					param.Add("isActive", isActive, DbType.Boolean);
					param.Add("isDeleted", isDeleted, DbType.Boolean);
					param.Add("lastUpdatedBy", lastUpdatedBy, DbType.String);
					param.Add("lastUpdatedOn", lastUpdatedOn, DbType.DateTime2);
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
		/// Insert current AspNetUsers to database.
		/// </summary>
		/// <param name=AspNetUsers Objects>AspNetUsers</param>
		public async Task<int> Insert(AspNetUsers model)
		{
			try
			{
				
				using (var connection = connectionFactory.GetConnection)
				{
					var query = "[dbo].AspNetUsers_INSERT";
					var param = new DynamicParameters();
					param.Add("id", model.Id, DbType.Guid);
					param.Add("userName", model.UserName, DbType.String);
					param.Add("normalizedUserName", model.NormalizedUserName, DbType.String);
					param.Add("email", model.Email, DbType.String);
					param.Add("normalizedEmail", model.NormalizedEmail, DbType.String);
					param.Add("emailConfirmed", model.EmailConfirmed, DbType.Boolean);
					param.Add("passwordHash", model.PasswordHash, DbType.String);
					param.Add("securityStamp", model.SecurityStamp, DbType.String);
					param.Add("concurrencyStamp", model.ConcurrencyStamp, DbType.String);
					param.Add("phoneNumber", model.PhoneNumber, DbType.String);
					param.Add("phoneNumberConfirmed", model.PhoneNumberConfirmed, DbType.Boolean);
					param.Add("twoFactorEnabled", model.TwoFactorEnabled, DbType.Boolean);
					param.Add("lockoutEnd", model.LockoutEnd, DbType.DateTimeOffset);
					param.Add("lockoutEnabled", model.LockoutEnabled, DbType.Boolean);
					param.Add("accessFailedCount", model.AccessFailedCount, DbType.Int32);
					param.Add("joinTime", model.JoinTime, DbType.DateTime2);
					param.Add("dob", model.Dob, DbType.DateTime2);
					param.Add("cid", model.Cid, DbType.Int32);
					param.Add("userImage", model.UserImage, DbType.String);
					param.Add("title", model.Title, DbType.String);
					param.Add("firstName", model.FirstName, DbType.String);
					param.Add("surname", model.Surname, DbType.String);
					param.Add("lastName", model.LastName, DbType.String);
					param.Add("address", model.Address, DbType.String);
					param.Add("countryID", model.CountryID, DbType.Int32);
					param.Add("pinCode", model.PinCode, DbType.String);
					param.Add("gender", model.Gender, DbType.String);
					param.Add("companyName", model.CompanyName, DbType.String);
					param.Add("isActive", model.IsActive, DbType.Boolean);
					param.Add("isDeleted", model.IsDeleted, DbType.Boolean);
					param.Add("lastUpdatedBy", model.LastUpdatedBy, DbType.String);
					param.Add("lastUpdatedOn", model.LastUpdatedOn, DbType.DateTime2);
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
		/// Update current AspNetUsers to database.
		/// </summary>
		/// <param name="id">System.Guid?</param>
		/// <param name="userName">System.String</param>
		/// <param name="normalizedUserName">System.String</param>
		/// <param name="email">System.String</param>
		/// <param name="normalizedEmail">System.String</param>
		/// <param name="emailConfirmed">System.Boolean?</param>
		/// <param name="passwordHash">System.String</param>
		/// <param name="securityStamp">System.String</param>
		/// <param name="concurrencyStamp">System.String</param>
		/// <param name="phoneNumber">System.String</param>
		/// <param name="phoneNumberConfirmed">System.Boolean?</param>
		/// <param name="twoFactorEnabled">System.Boolean?</param>
		/// <param name="lockoutEnd">System.DateTimeOffset</param>
		/// <param name="lockoutEnabled">System.Boolean?</param>
		/// <param name="accessFailedCount">System.Int32?</param>
		/// <param name="joinTime">System.DateTime?</param>
		/// <param name="dob">System.DateTime?</param>
		/// <param name="cid">System.Int32?</param>
		/// <param name="userImage">System.String</param>
		/// <param name="title">System.String</param>
		/// <param name="firstName">System.String</param>
		/// <param name="surname">System.String</param>
		/// <param name="lastName">System.String</param>
		/// <param name="address">System.String</param>
		/// <param name="countryID">System.Int32?</param>
		/// <param name="pinCode">System.String</param>
		/// <param name="gender">System.String</param>
		/// <param name="companyName">System.String</param>
		/// <param name="isActive">System.Boolean?</param>
		/// <param name="isDeleted">System.Boolean?</param>
		/// <param name="lastUpdatedBy">System.String</param>
		/// <param name="lastUpdatedOn">System.DateTime?</param>
		/// <param name="accountID">System.String</param>
		public async Task<int> Update(System.Guid? id, System.String userName, System.String normalizedUserName, System.String email, System.String normalizedEmail, System.Boolean? emailConfirmed, System.String passwordHash, System.String securityStamp, System.String concurrencyStamp, System.String phoneNumber, System.Boolean? phoneNumberConfirmed, System.Boolean? twoFactorEnabled, System.DateTimeOffset lockoutEnd, System.Boolean? lockoutEnabled, System.Int32? accessFailedCount, System.DateTime? joinTime, System.DateTime? dob, System.Int32? cid, System.String userImage, System.String title, System.String firstName, System.String surname, System.String lastName, System.String address, System.Int32? countryID, System.String pinCode, System.String gender, System.String companyName, System.Boolean? isActive, System.Boolean? isDeleted, System.String lastUpdatedBy, System.DateTime? lastUpdatedOn, System.String accountID)
		{
			try
			{
				
				using (var connection = connectionFactory.GetConnection)
				{
					var query = "[dbo].AspNetUsers_UPDATE";
					var param = new DynamicParameters();
					param.Add("id", id, DbType.Guid);
					param.Add("userName", userName, DbType.String);
					param.Add("normalizedUserName", normalizedUserName, DbType.String);
					param.Add("email", email, DbType.String);
					param.Add("normalizedEmail", normalizedEmail, DbType.String);
					param.Add("emailConfirmed", emailConfirmed, DbType.Boolean);
					param.Add("passwordHash", passwordHash, DbType.String);
					param.Add("securityStamp", securityStamp, DbType.String);
					param.Add("concurrencyStamp", concurrencyStamp, DbType.String);
					param.Add("phoneNumber", phoneNumber, DbType.String);
					param.Add("phoneNumberConfirmed", phoneNumberConfirmed, DbType.Boolean);
					param.Add("twoFactorEnabled", twoFactorEnabled, DbType.Boolean);
					param.Add("lockoutEnd", lockoutEnd, DbType.DateTimeOffset);
					param.Add("lockoutEnabled", lockoutEnabled, DbType.Boolean);
					param.Add("accessFailedCount", accessFailedCount, DbType.Int32);
					param.Add("joinTime", joinTime, DbType.DateTime2);
					param.Add("dob", dob, DbType.DateTime2);
					param.Add("cid", cid, DbType.Int32);
					param.Add("userImage", userImage, DbType.String);
					param.Add("title", title, DbType.String);
					param.Add("firstName", firstName, DbType.String);
					param.Add("surname", surname, DbType.String);
					param.Add("lastName", lastName, DbType.String);
					param.Add("address", address, DbType.String);
					param.Add("countryID", countryID, DbType.Int32);
					param.Add("pinCode", pinCode, DbType.String);
					param.Add("gender", gender, DbType.String);
					param.Add("companyName", companyName, DbType.String);
					param.Add("isActive", isActive, DbType.Boolean);
					param.Add("isDeleted", isDeleted, DbType.Boolean);
					param.Add("lastUpdatedBy", lastUpdatedBy, DbType.String);
					param.Add("lastUpdatedOn", lastUpdatedOn, DbType.DateTime2);
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
		public async Task<int> Update(AspNetUsers model)
		{
			try
			{
				
				using (var connection = connectionFactory.GetConnection)
				{
					var query = "[dbo].AspNetUsers_UPDATE";
					var param = new DynamicParameters();
					param.Add("id", model.Id, DbType.Guid);
					param.Add("userName", model.UserName, DbType.String);
					param.Add("normalizedUserName", model.NormalizedUserName, DbType.String);
					param.Add("email", model.Email, DbType.String);
					param.Add("normalizedEmail", model.NormalizedEmail, DbType.String);
					param.Add("emailConfirmed", model.EmailConfirmed, DbType.Boolean);
					param.Add("passwordHash", model.PasswordHash, DbType.String);
					param.Add("securityStamp", model.SecurityStamp, DbType.String);
					param.Add("concurrencyStamp", model.ConcurrencyStamp, DbType.String);
					param.Add("phoneNumber", model.PhoneNumber, DbType.String);
					param.Add("phoneNumberConfirmed", model.PhoneNumberConfirmed, DbType.Boolean);
					param.Add("twoFactorEnabled", model.TwoFactorEnabled, DbType.Boolean);
					param.Add("lockoutEnd", model.LockoutEnd, DbType.DateTimeOffset);
					param.Add("lockoutEnabled", model.LockoutEnabled, DbType.Boolean);
					param.Add("accessFailedCount", model.AccessFailedCount, DbType.Int32);
					param.Add("joinTime", model.JoinTime, DbType.DateTime2);
					param.Add("dob", model.Dob, DbType.DateTime2);
					param.Add("cid", model.Cid, DbType.Int32);
					param.Add("userImage", model.UserImage, DbType.String);
					param.Add("title", model.Title, DbType.String);
					param.Add("firstName", model.FirstName, DbType.String);
					param.Add("surname", model.Surname, DbType.String);
					param.Add("lastName", model.LastName, DbType.String);
					param.Add("address", model.Address, DbType.String);
					param.Add("countryID", model.CountryID, DbType.Int32);
					param.Add("pinCode", model.PinCode, DbType.String);
					param.Add("gender", model.Gender, DbType.String);
					param.Add("companyName", model.CompanyName, DbType.String);
					param.Add("isActive", model.IsActive, DbType.Boolean);
					param.Add("isDeleted", model.IsDeleted, DbType.Boolean);
					param.Add("lastUpdatedBy", model.LastUpdatedBy, DbType.String);
					param.Add("lastUpdatedOn", model.LastUpdatedOn, DbType.DateTime2);
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
		/// Delete current AspNetUsers from database.
		/// </summary>
		/// <param name="id">System.Guid?</param>
		public async Task<int> Delete(System.Guid? id)
		{
			using (var connection = connectionFactory.GetConnection)
			{
				var query = "[dbo].AspNetUsers_DELETE";
				var param = new DynamicParameters();
				param.Add("id", id, DbType.Guid);
				var iValue = await SqlMapper.ExecuteAsync(connection, query, param, commandType: CommandType.StoredProcedure);
				return iValue;
				
			}
		}
		#endregion
	}
}

