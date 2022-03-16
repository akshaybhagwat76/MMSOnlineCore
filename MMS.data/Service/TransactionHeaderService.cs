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
	public partial class TransactionHeaderService : ITransactionHeaderService
	{
		IUnitOfWork _unitOfWork;
		public TransactionHeaderService(IUnitOfWork unitOfWork)
		{
			_unitOfWork = unitOfWork;
		}
		public async Task<TransactionHeader> Get(System.Int64? id)
		{
			return await _unitOfWork.TransactionHeaderRepository.Get(id);
		}
		public async Task<int> Delete(System.Int64? id)
		{
			return await _unitOfWork.TransactionHeaderRepository.Delete(id);
		}
		public async Task<IEnumerable<TransactionHeader>> Search(int pageIndex, int pageSize)
		{
			return await _unitOfWork.TransactionHeaderRepository.Search(pageIndex, pageSize);
		}
		public async Task<IEnumerable<TransactionHeader>> Search(int pageIndex, int pageSize,string sortBy, string orderBy)
		{
			return await _unitOfWork.TransactionHeaderRepository.Search(pageIndex, pageSize,sortBy,orderBy);
		}
		public async Task<IEnumerable<TransactionHeader>> Search(System.Int64? id, System.String accountID, System.String ticketNumber, System.String orderNumber, System.DateTime? ticketDate, System.String paymentTerms, System.String supplierTicket, System.String carrierTicket, System.String truckDescription, System.String status, System.String paymentReceiptURL)
		{
			return await _unitOfWork.TransactionHeaderRepository.Search(id, accountID, ticketNumber, orderNumber, ticketDate, paymentTerms, supplierTicket, carrierTicket, truckDescription, status, paymentReceiptURL);
		}
		public async Task<System.Int64> Insert(TransactionHeader usermodel)
		{
			return await _unitOfWork.TransactionHeaderRepository.Insert(usermodel);
		}
		public async Task<System.Int64> Insert(System.String accountID, System.String ticketNumber, System.String orderNumber, System.DateTime? ticketDate, System.String paymentTerms, System.String supplierTicket, System.String carrierTicket, System.String truckDescription, System.String status, System.String paymentReceiptURL)
		{
			return await _unitOfWork.TransactionHeaderRepository.Insert(accountID, ticketNumber, orderNumber, ticketDate, paymentTerms, supplierTicket, carrierTicket, truckDescription, status, paymentReceiptURL);
		}
		public async Task<int> Update(TransactionHeader usermodel)
		{
			return await _unitOfWork.TransactionHeaderRepository.Update(usermodel);
		}
		public async Task<int> Update(System.Int64? id, System.String accountID, System.String ticketNumber, System.String orderNumber, System.DateTime? ticketDate, System.String paymentTerms, System.String supplierTicket, System.String carrierTicket, System.String truckDescription, System.String status, System.String paymentReceiptURL)
		{
			return await _unitOfWork.TransactionHeaderRepository.Update(id, accountID, ticketNumber, orderNumber, ticketDate, paymentTerms, supplierTicket, carrierTicket, truckDescription, status, paymentReceiptURL);
		}
	}
}

