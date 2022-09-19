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
using MMS.data.Infrastructure;
using MMS.data.UnitOfWork;
using MMS.data.Entities;
namespace MMS.data.Service
{
	public partial class TransactionDetailService : ITransactionDetailService
	{
		IUnitOfWork _unitOfWork;
		public TransactionDetailService(IUnitOfWork unitOfWork)
		{
			_unitOfWork = unitOfWork;
		}
		public async Task<TransactionDetail> Get(System.Int64? id)
		{
			return await _unitOfWork.TransactionDetailRepository.Get(id);
		}
		public async Task<int> Delete(System.Int64? id)
		{
			return await _unitOfWork.TransactionDetailRepository.Delete(id);
		}
		public async Task<IEnumerable<TransactionDetail>> Search(int pageIndex, int pageSize)
		{
			return await _unitOfWork.TransactionDetailRepository.Search(pageIndex, pageSize);
		}
		public async Task<IEnumerable<TransactionDetail>> Search(int pageIndex, int pageSize,string sortBy, string orderBy)
		{
			return await _unitOfWork.TransactionDetailRepository.Search(pageIndex, pageSize,sortBy,orderBy);
		}
		public async Task<IEnumerable<TransactionDetail>> Search(System.Int64? id, System.String accountID, System.String ticketNumber, System.Int32? detailID, System.Int32? gross, System.Int32? tare, System.Int32? net, System.Decimal? unitCost, System.Decimal? totalCost)
		{
			return await _unitOfWork.TransactionDetailRepository.Search(id, accountID, ticketNumber, detailID, gross, tare, net, unitCost, totalCost);
		}
		public async Task<System.Int64> Insert(TransactionDetail usermodel)
		{
			return await _unitOfWork.TransactionDetailRepository.Insert(usermodel);
		}
		public async Task<System.Int64> Insert(System.String accountID, System.String ticketNumber, System.Int32? detailID, System.Int32? gross, System.Int32? tare, System.Int32? net, System.Decimal? unitCost, System.Decimal? totalCost)
		{
			return await _unitOfWork.TransactionDetailRepository.Insert(accountID, ticketNumber, detailID, gross, tare, net, unitCost, totalCost);
		}
		public async Task<int> Update(TransactionDetail usermodel)
		{
			return await _unitOfWork.TransactionDetailRepository.Update(usermodel);
		}
		public async Task<int> Update(System.Int64? id, System.String accountID, System.String ticketNumber, System.Int32? detailID, System.Int32? gross, System.Int32? tare, System.Int32? net, System.Decimal? unitCost, System.Decimal? totalCost)
		{
			return await _unitOfWork.TransactionDetailRepository.Update(id, accountID, ticketNumber, detailID, gross, tare, net, unitCost, totalCost);
		}
	}
}

