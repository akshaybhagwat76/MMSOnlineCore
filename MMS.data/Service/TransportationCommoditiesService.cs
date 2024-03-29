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
using System.Collections.Generic;
using System.Threading.Tasks;
using MMS.data.UnitOfWork;
using MMS.data.Entities;
namespace MMS.data.Service
{
	public partial class TransportationCommoditiesService : ITransportationCommoditiesService
	{
		IUnitOfWork _unitOfWork;
		public TransportationCommoditiesService(IUnitOfWork unitOfWork)
		{
			_unitOfWork = unitOfWork;
		}
		public async Task<TransportationCommodities> Get(System.Int64? id)
		{
			return await _unitOfWork.TransportationCommoditiesRepository.Get(id);
		}
		public async Task<int> Delete(System.Int64? id)
		{
			return await _unitOfWork.TransportationCommoditiesRepository.Delete(id);
		}
		public async Task<IEnumerable<TransportationCommodities>> Search(int pageIndex, int pageSize)
		{
			return await _unitOfWork.TransportationCommoditiesRepository.Search(pageIndex, pageSize);
		}
		public async Task<IEnumerable<TransportationCommodities>> Search(int pageIndex, int pageSize,string sortBy, string orderBy)
		{
			return await _unitOfWork.TransportationCommoditiesRepository.Search(pageIndex, pageSize,sortBy,orderBy);
		}
		public async Task<IEnumerable<TransportationCommodities>> Search(System.Int64? id, System.String accountID, System.Int32? locationID, System.Int32? commodityID, System.String commodityName)
		{
			return await _unitOfWork.TransportationCommoditiesRepository.Search(id, accountID, locationID, commodityID, commodityName);
		}
		public async Task<System.Int64> Insert(TransportationCommodities usermodel)
		{
			return await _unitOfWork.TransportationCommoditiesRepository.Insert(usermodel);
		}
		public async Task<System.Int64> Insert(System.String accountID, System.Int32? locationID, System.Int32? commodityID, System.String commodityName)
		{
			return await _unitOfWork.TransportationCommoditiesRepository.Insert(accountID, locationID, commodityID, commodityName);
		}
		public async Task<int> Update(TransportationCommodities usermodel)
		{
			return await _unitOfWork.TransportationCommoditiesRepository.Update(usermodel);
		}
		public async Task<int> Update(System.Int64? id, System.String accountID, System.Int32? locationID, System.Int32? commodityID, System.String commodityName)
		{
			return await _unitOfWork.TransportationCommoditiesRepository.Update(id, accountID, locationID, commodityID, commodityName);
		}
	}
}

