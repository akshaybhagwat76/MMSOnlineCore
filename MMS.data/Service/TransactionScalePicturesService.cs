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
	public partial class TransactionScalePicturesService : ITransactionScalePicturesService
	{
		IUnitOfWork _unitOfWork;
		public TransactionScalePicturesService(IUnitOfWork unitOfWork)
		{
			_unitOfWork = unitOfWork;
		}
		public async Task<TransactionScalePictures> Get(System.Int64? id)
		{
			return await _unitOfWork.TransactionScalePicturesRepository.Get(id);
		}
		public async Task<int> Delete(System.Int64? id)
		{
			return await _unitOfWork.TransactionScalePicturesRepository.Delete(id);
		}
		public async Task<IEnumerable<TransactionScalePictures>> Search(int pageIndex, int pageSize)
		{
			return await _unitOfWork.TransactionScalePicturesRepository.Search(pageIndex, pageSize);
		}
		public async Task<IEnumerable<TransactionScalePictures>> Search(int pageIndex, int pageSize,string sortBy, string orderBy)
		{
			return await _unitOfWork.TransactionScalePicturesRepository.Search(pageIndex, pageSize,sortBy,orderBy);
		}
		public async Task<IEnumerable<TransactionScalePictures>> Search(System.Int64? id, System.String accountID, System.String ticketNumber, System.String pictureID, System.String thumbnailURL, System.String fullResURL)
		{
			return await _unitOfWork.TransactionScalePicturesRepository.Search(id, accountID, ticketNumber, pictureID, thumbnailURL, fullResURL);
		}
		public async Task<System.Int64> Insert(TransactionScalePictures usermodel)
		{
			return await _unitOfWork.TransactionScalePicturesRepository.Insert(usermodel);
		}
		public async Task<System.Int64> Insert(System.String accountID, System.String ticketNumber, System.String pictureID, System.String thumbnailURL, System.String fullResURL)
		{
			return await _unitOfWork.TransactionScalePicturesRepository.Insert(accountID, ticketNumber, pictureID, thumbnailURL, fullResURL);
		}
		public async Task<int> Update(TransactionScalePictures usermodel)
		{
			return await _unitOfWork.TransactionScalePicturesRepository.Update(usermodel);
		}
		public async Task<int> Update(System.Int64? id, System.String accountID, System.String ticketNumber, System.String pictureID, System.String thumbnailURL, System.String fullResURL)
		{
			return await _unitOfWork.TransactionScalePicturesRepository.Update(id, accountID, ticketNumber, pictureID, thumbnailURL, fullResURL);
		}
	}
}

