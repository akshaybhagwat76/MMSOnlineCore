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
	public partial class TransectionSettingService : ITransectionSettingService
	{
		IUnitOfWork _unitOfWork;
		public TransectionSettingService(IUnitOfWork unitOfWork)
		{
			_unitOfWork = unitOfWork;
		}
		public async Task<TransectionSetting> Get(System.Int32? id)
		{
			return await _unitOfWork.TransectionSettingRepository.Get(id);
		}
		public async Task<int> Delete(System.Int32? id)
		{
			return await _unitOfWork.TransectionSettingRepository.Delete(id);
		}
		public async Task<IEnumerable<TransectionSetting>> Search(int pageIndex, int pageSize)
		{
			return await _unitOfWork.TransectionSettingRepository.Search(pageIndex, pageSize);
		}
		public async Task<IEnumerable<TransectionSetting>> Search(int pageIndex, int pageSize,string sortBy, string orderBy)
		{
			return await _unitOfWork.TransectionSettingRepository.Search(pageIndex, pageSize,sortBy,orderBy);
		}
		public async Task<IEnumerable<TransectionSetting>> Search(System.Int32? id, System.Int32? locationID, System.Int32? commodityID, System.String notes, System.Int32? createdBy, System.DateTime? createdOn)
		{
			return await _unitOfWork.TransectionSettingRepository.Search(id, locationID, commodityID, notes, createdBy, createdOn);
		}
		public async Task<System.Int32> Insert(TransectionSetting usermodel)
		{
			return await _unitOfWork.TransectionSettingRepository.Insert(usermodel);
		}
		public async Task<System.Int32> Insert(System.Int32? locationID, System.Int32? commodityID, System.String notes, System.Int32? createdBy, System.DateTime? createdOn)
		{
			return await _unitOfWork.TransectionSettingRepository.Insert(locationID, commodityID, notes, createdBy, createdOn);
		}
		public async Task<int> Update(TransectionSetting usermodel)
		{
			return await _unitOfWork.TransectionSettingRepository.Update(usermodel);
		}
		public async Task<int> Update(System.Int32? id, System.Int32? locationID, System.Int32? commodityID, System.String notes, System.Int32? createdBy, System.DateTime? createdOn)
		{
			return await _unitOfWork.TransectionSettingRepository.Update(id, locationID, commodityID, notes, createdBy, createdOn);
		}
	}
}

