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
	public partial class AccountsService : IAccountsService
	{
		IUnitOfWork _unitOfWork;
		public AccountsService(IUnitOfWork unitOfWork)
		{
			_unitOfWork = unitOfWork;
		}
		public async Task<Accounts> Get(System.Int64? id)
		{
			return await _unitOfWork.AccountsRepository.Get(id);
		}
		public async Task<int> Delete(System.Int64? id)
		{
			return await _unitOfWork.AccountsRepository.Delete(id);
		}
		public async Task<IEnumerable<Accounts>> Search(int pageIndex, int pageSize)
		{
			return await _unitOfWork.AccountsRepository.Search(pageIndex, pageSize);
		}
		public async Task<IEnumerable<Accounts>> Search(int pageIndex, int pageSize,string sortBy, string orderBy)
		{
			return await _unitOfWork.AccountsRepository.Search(pageIndex, pageSize,sortBy,orderBy);
		}
		public async Task<IEnumerable<Accounts>> Search(System.Int64? id, System.String accountID, System.String representative, System.Boolean? includeTransportation)
		{
			return await _unitOfWork.AccountsRepository.Search(id, accountID, representative, includeTransportation);
		}
		public async Task<System.Int64> Insert(Accounts usermodel)
		{
			return await _unitOfWork.AccountsRepository.Insert(usermodel);
		}
		public async Task<System.Int64> Insert(System.String accountID, System.String representative, System.Boolean? includeTransportation)
		{
			return await _unitOfWork.AccountsRepository.Insert(accountID, representative, includeTransportation);
		}
		public async Task<int> Update(Accounts usermodel)
		{
			return await _unitOfWork.AccountsRepository.Update(usermodel);
		}
		public async Task<int> Update(System.Int64? id, System.String accountID, System.String representative, System.Boolean? includeTransportation)
		{
			return await _unitOfWork.AccountsRepository.Update(id, accountID, representative, includeTransportation);
		}
	}
}

