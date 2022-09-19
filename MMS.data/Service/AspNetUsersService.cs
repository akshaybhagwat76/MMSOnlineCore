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
using System.Collections.Generic;
using System.Threading.Tasks;
using MMS.data.UnitOfWork;
using MMS.data.Entities;

namespace MMS.data.Service
{
	public partial class AspNetUsersService : IAspNetUsersService
	{
		IUnitOfWork _unitOfWork;
		public AspNetUsersService(IUnitOfWork unitOfWork)
		{
			_unitOfWork = unitOfWork;
		}
		public async Task<AspNetUsers> Get(System.Guid? id)
		{
			return await _unitOfWork.AspNetUsersRepository.Get(id);
		}
		public async Task<int> Delete(System.Guid? id)
		{
			return await _unitOfWork.AspNetUsersRepository.Delete(id);
		}
		public async Task<IEnumerable<AspNetUsers>> Search(int pageIndex, int pageSize)
		{
			return await _unitOfWork.AspNetUsersRepository.Search(pageIndex, pageSize);
		}
		public async Task<IEnumerable<AspNetUsers>> Search(int pageIndex, int pageSize,string sortBy, string orderBy)
		{
			return await _unitOfWork.AspNetUsersRepository.Search(pageIndex, pageSize,sortBy,orderBy);
		}
		public async Task<IEnumerable<AspNetUsers>> Search(System.Guid? id, System.String userName, System.String normalizedUserName, System.String email, System.String normalizedEmail, System.Boolean? emailConfirmed, System.String passwordHash, System.String securityStamp, System.String concurrencyStamp, System.String phoneNumber, System.Boolean? phoneNumberConfirmed, System.Boolean? twoFactorEnabled, System.DateTimeOffset lockoutEnd, System.Boolean? lockoutEnabled, System.Int32? accessFailedCount, System.DateTime? joinTime, System.DateTime? dob, System.Int32? cid, System.String userImage, System.String title, System.String firstName, System.String surname, System.String lastName, System.String address, System.Int32? countryID, System.String pinCode, System.String gender, System.String companyName, System.Boolean? isActive, System.Boolean? isDeleted, System.String lastUpdatedBy, System.DateTime? lastUpdatedOn, System.String accountID)
		{
			return await _unitOfWork.AspNetUsersRepository.Search(id, userName, normalizedUserName, email, normalizedEmail, emailConfirmed, passwordHash, securityStamp, concurrencyStamp, phoneNumber, phoneNumberConfirmed, twoFactorEnabled, lockoutEnd, lockoutEnabled, accessFailedCount, joinTime, dob, cid, userImage, title, firstName, surname, lastName, address, countryID, pinCode, gender, companyName, isActive, isDeleted, lastUpdatedBy, lastUpdatedOn, accountID);
		}
		public async Task<int> Insert(AspNetUsers usermodel)
		{
			return await _unitOfWork.AspNetUsersRepository.Insert(usermodel);
		}
		public async Task<int> Insert(System.Guid? id, System.String userName, System.String normalizedUserName, System.String email, System.String normalizedEmail, System.Boolean? emailConfirmed, System.String passwordHash, System.String securityStamp, System.String concurrencyStamp, System.String phoneNumber, System.Boolean? phoneNumberConfirmed, System.Boolean? twoFactorEnabled, System.DateTimeOffset lockoutEnd, System.Boolean? lockoutEnabled, System.Int32? accessFailedCount, System.DateTime? joinTime, System.DateTime? dob, System.Int32? cid, System.String userImage, System.String title, System.String firstName, System.String surname, System.String lastName, System.String address, System.Int32? countryID, System.String pinCode, System.String gender, System.String companyName, System.Boolean? isActive, System.Boolean? isDeleted, System.String lastUpdatedBy, System.DateTime? lastUpdatedOn, System.String accountID)
		{
			return await _unitOfWork.AspNetUsersRepository.Insert(id, userName, normalizedUserName, email, normalizedEmail, emailConfirmed, passwordHash, securityStamp, concurrencyStamp, phoneNumber, phoneNumberConfirmed, twoFactorEnabled, lockoutEnd, lockoutEnabled, accessFailedCount, joinTime, dob, cid, userImage, title, firstName, surname, lastName, address, countryID, pinCode, gender, companyName, isActive, isDeleted, lastUpdatedBy, lastUpdatedOn, accountID);
		}
		public async Task<int> Update(AspNetUsers usermodel)
		{
			return await _unitOfWork.AspNetUsersRepository.Update(usermodel);
		}
		public async Task<int> Update(System.Guid? id, System.String userName, System.String normalizedUserName, System.String email, System.String normalizedEmail, System.Boolean? emailConfirmed, System.String passwordHash, System.String securityStamp, System.String concurrencyStamp, System.String phoneNumber, System.Boolean? phoneNumberConfirmed, System.Boolean? twoFactorEnabled, System.DateTimeOffset lockoutEnd, System.Boolean? lockoutEnabled, System.Int32? accessFailedCount, System.DateTime? joinTime, System.DateTime? dob, System.Int32? cid, System.String userImage, System.String title, System.String firstName, System.String surname, System.String lastName, System.String address, System.Int32? countryID, System.String pinCode, System.String gender, System.String companyName, System.Boolean? isActive, System.Boolean? isDeleted, System.String lastUpdatedBy, System.DateTime? lastUpdatedOn, System.String accountID)
		{
			return await _unitOfWork.AspNetUsersRepository.Update(id, userName, normalizedUserName, email, normalizedEmail, emailConfirmed, passwordHash, securityStamp, concurrencyStamp, phoneNumber, phoneNumberConfirmed, twoFactorEnabled, lockoutEnd, lockoutEnabled, accessFailedCount, joinTime, dob, cid, userImage, title, firstName, surname, lastName, address, countryID, pinCode, gender, companyName, isActive, isDeleted, lastUpdatedBy, lastUpdatedOn, accountID);
		}
	}
}

