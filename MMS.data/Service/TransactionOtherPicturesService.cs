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
	public partial class TransactionOtherPicturesService : ITransactionOtherPicturesService
	{
		IUnitOfWork _unitOfWork;
		public TransactionOtherPicturesService(IUnitOfWork unitOfWork)
		{
			_unitOfWork = unitOfWork;
		}
		public async Task<TransactionOtherPictures> Get(System.Int64? id)
		{
			return await _unitOfWork.TransactionOtherPicturesRepository.Get(id);
		}
		public async Task<int> Delete(System.Int64? id)
		{
			return await _unitOfWork.TransactionOtherPicturesRepository.Delete(id);
		}
		public async Task<IEnumerable<TransactionOtherPictures>> Search(int pageIndex, int pageSize)
		{
			return await _unitOfWork.TransactionOtherPicturesRepository.Search(pageIndex, pageSize);
		}
		public async Task<IEnumerable<TransactionOtherPictures>> Search(int pageIndex, int pageSize,string sortBy, string orderBy)
		{
			return await _unitOfWork.TransactionOtherPicturesRepository.Search(pageIndex, pageSize,sortBy,orderBy);
		}
		public async Task<IEnumerable<TransactionOtherPictures>> Search(System.Int64? id, System.String accountID, System.String ticketNumber, System.String pictureID, System.String thumbnailURL, System.String fullResURL)
		{
			return await _unitOfWork.TransactionOtherPicturesRepository.Search(id, accountID, ticketNumber, pictureID, thumbnailURL, fullResURL);
		}
		public async Task<System.Int64> Insert(TransactionOtherPictures usermodel)
		{
			return await _unitOfWork.TransactionOtherPicturesRepository.Insert(usermodel);
		}
		public async Task<System.Int64> Insert(System.String accountID, System.String ticketNumber, System.String pictureID, System.String thumbnailURL, System.String fullResURL)
		{
			return await _unitOfWork.TransactionOtherPicturesRepository.Insert(accountID, ticketNumber, pictureID, thumbnailURL, fullResURL);
		}
		public async Task<int> Update(TransactionOtherPictures usermodel)
		{
			return await _unitOfWork.TransactionOtherPicturesRepository.Update(usermodel);
		}
		public async Task<int> Update(System.Int64? id, System.String accountID, System.String ticketNumber, System.String pictureID, System.String thumbnailURL, System.String fullResURL)
		{
			return await _unitOfWork.TransactionOtherPicturesRepository.Update(id, accountID, ticketNumber, pictureID, thumbnailURL, fullResURL);
		}
	}
}

