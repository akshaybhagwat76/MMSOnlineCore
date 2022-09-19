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
	public partial class RepresentativeService : IRepresentativeService
	{
		IUnitOfWork _unitOfWork;
		public RepresentativeService(IUnitOfWork unitOfWork)
		{
			_unitOfWork = unitOfWork;
		}
		public async Task<Representative> Get(System.Int32? id)
		{
			return await _unitOfWork.RepresentativeRepository.Get(id);
		}
		public async Task<int> Delete(System.Int32? id)
		{
			return await _unitOfWork.RepresentativeRepository.Delete(id);
		}
		public async Task<IEnumerable<Representative>> Search(int pageIndex, int pageSize)
		{
			return await _unitOfWork.RepresentativeRepository.Search(pageIndex, pageSize);
		}
		public async Task<IEnumerable<Representative>> Search(int pageIndex, int pageSize,string sortBy, string orderBy)
		{
			return await _unitOfWork.RepresentativeRepository.Search(pageIndex, pageSize,sortBy,orderBy);
		}
		public async Task<IEnumerable<Representative>> Search(System.Int32? id, System.String accountId, System.String name, System.String email, System.String officePhone, System.String cellPhone, System.String imageURL, System.String notes)
		{
			return await _unitOfWork.RepresentativeRepository.Search(id, accountId, name, email, officePhone, cellPhone, imageURL, notes);
		}
		public async Task<System.Int32> Insert(Representative usermodel)
		{
			return await _unitOfWork.RepresentativeRepository.Insert(usermodel);
		}
		public async Task<System.Int32> Insert(System.String accountId, System.String name, System.String email, System.String officePhone, System.String cellPhone, System.String imageURL, System.String notes)
		{
			return await _unitOfWork.RepresentativeRepository.Insert(accountId, name, email, officePhone, cellPhone, imageURL, notes);
		}
		public async Task<int> Update(Representative usermodel)
		{
			return await _unitOfWork.RepresentativeRepository.Update(usermodel);
		}
		public async Task<int> Update(System.Int32? id, System.String accountId, System.String name, System.String email, System.String officePhone, System.String cellPhone, System.String imageURL, System.String notes)
		{
			return await _unitOfWork.RepresentativeRepository.Update(id, accountId, name, email, officePhone, cellPhone, imageURL, notes);
		}
	}
}

