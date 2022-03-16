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
	public partial class UsersService : IUsersService
	{
		IUnitOfWork _unitOfWork;
		public UsersService(IUnitOfWork unitOfWork)
		{
			_unitOfWork = unitOfWork;
		}
		public async Task<Users> Get(System.Int32? userID)
		{
			return await _unitOfWork.UsersRepository.Get(userID);
		}
		public async Task<int> Delete(System.Int32? userID)
		{
			return await _unitOfWork.UsersRepository.Delete(userID);
		}
		public async Task<IEnumerable<Users>> Search(int pageIndex, int pageSize)
		{
			return await _unitOfWork.UsersRepository.Search(pageIndex, pageSize);
		}
		public async Task<IEnumerable<Users>> Search(int pageIndex, int pageSize,string sortBy, string orderBy)
		{
			return await _unitOfWork.UsersRepository.Search(pageIndex, pageSize,sortBy,orderBy);
		}
		public async Task<IEnumerable<Users>> Search(System.Int32? userID, System.String emailAddress, System.String name, System.Byte[] passwordHash, System.String salt, System.Int32? passwordVersion, System.Boolean? accountDisabled, System.String accountID)
		{
			return await _unitOfWork.UsersRepository.Search(userID, emailAddress, name, passwordHash, salt, passwordVersion, accountDisabled, accountID);
		}
		public async Task<int> Insert(Users usermodel)
		{
			return await _unitOfWork.UsersRepository.Insert(usermodel);
		}
		public async Task<int> Insert(System.Int32? userID, System.String emailAddress, System.String name, System.Byte[] passwordHash, System.String salt, System.Int32? passwordVersion, System.Boolean? accountDisabled, System.String accountID)
		{
			return await _unitOfWork.UsersRepository.Insert(userID, emailAddress, name, passwordHash, salt, passwordVersion, accountDisabled, accountID);
		}
		public async Task<int> Update(Users usermodel)
		{
			return await _unitOfWork.UsersRepository.Update(usermodel);
		}
		public async Task<int> Update(System.Int32? userID, System.String emailAddress, System.String name, System.Byte[] passwordHash, System.String salt, System.Int32? passwordVersion, System.Boolean? accountDisabled, System.String accountID)
		{
			return await _unitOfWork.UsersRepository.Update(userID, emailAddress, name, passwordHash, salt, passwordVersion, accountDisabled, accountID);
		}
	}
}

