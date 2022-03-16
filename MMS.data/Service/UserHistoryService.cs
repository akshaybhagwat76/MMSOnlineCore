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
using System.Collections.Generic;
using System.Threading.Tasks;
using MMS.data.Infrastructure;
using MMS.data.UnitOfWork;
using MMS.data.Entities;

namespace MMS.data.Service
{
	public partial class UserHistoryService : IUserHistoryService
	{
		IUnitOfWork _unitOfWork;
		public UserHistoryService(IUnitOfWork unitOfWork)
		{
			_unitOfWork = unitOfWork;
		}
		public async Task<IEnumerable<UserHistory>> Search(int pageIndex, int pageSize)
		{
			return await _unitOfWork.UserHistoryRepository.Search(pageIndex, pageSize);
		}
		public async Task<IEnumerable<UserHistory>> Search(int pageIndex, int pageSize,string sortBy, string orderBy)
		{
			return await _unitOfWork.UserHistoryRepository.Search(pageIndex, pageSize,sortBy,orderBy);
		}
		public async Task<IEnumerable<UserHistory>> Search(System.Guid? userID, System.DateTime? eventDate, System.String ip, System.String eventType, System.String details)
		{
			return await _unitOfWork.UserHistoryRepository.Search(userID, eventDate, ip, eventType, details);
		}
		public async Task<int> Insert(UserHistory usermodel)
		{
			return await _unitOfWork.UserHistoryRepository.Insert(usermodel);
		}
		public async Task<int> Insert(System.Guid? userID, System.DateTime? eventDate, System.String ip, System.String eventType, System.String details)
		{
			return await _unitOfWork.UserHistoryRepository.Insert(userID, eventDate, ip, eventType, details);
		}
	}
}

