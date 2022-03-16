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
	public partial class TransportationLocationsService : ITransportationLocationsService
	{
		IUnitOfWork _unitOfWork;
		public TransportationLocationsService(IUnitOfWork unitOfWork)
		{
			_unitOfWork = unitOfWork;
		}
		public async Task<TransportationLocations> Get(System.Int64? id)
		{
			return await _unitOfWork.TransportationLocationsRepository.Get(id);
		}
		public async Task<int> Delete(System.Int64? id)
		{
			return await _unitOfWork.TransportationLocationsRepository.Delete(id);
		}
		public async Task<IEnumerable<TransportationLocations>> Search(int pageIndex, int pageSize)
		{
			return await _unitOfWork.TransportationLocationsRepository.Search(pageIndex, pageSize);
		}
		public async Task<IEnumerable<TransportationLocations>> Search(int pageIndex, int pageSize,string sortBy, string orderBy)
		{
			return await _unitOfWork.TransportationLocationsRepository.Search(pageIndex, pageSize,sortBy,orderBy);
		}
		public async Task<IEnumerable<TransportationLocations>> Search(System.Int64? id, System.String accountID, System.Int32? locationID, System.String locationName)
		{
			return await _unitOfWork.TransportationLocationsRepository.Search(id, accountID, locationID, locationName);
		}
		public async Task<System.Int64> Insert(TransportationLocations usermodel)
		{
			return await _unitOfWork.TransportationLocationsRepository.Insert(usermodel);
		}
		public async Task<System.Int64> Insert(System.String accountID, System.Int32? locationID, System.String locationName)
		{
			return await _unitOfWork.TransportationLocationsRepository.Insert(accountID, locationID, locationName);
		}
		public async Task<int> Update(TransportationLocations usermodel)
		{
			return await _unitOfWork.TransportationLocationsRepository.Update(usermodel);
		}
		public async Task<int> Update(System.Int64? id, System.String accountID, System.Int32? locationID, System.String locationName)
		{
			return await _unitOfWork.TransportationLocationsRepository.Update(id, accountID, locationID, locationName);
		}
	}
}

