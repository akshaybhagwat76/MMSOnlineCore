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
using MMS.data.Entities;


namespace MMS.data.Repository
{
	public partial interface ITransactionHeaderRepository
	{
		Task<TransactionHeader> Get(System.Int64? id);
		Task<IEnumerable<TransactionHeader>> Search(int pageIndex, int pageSize);
		Task<IEnumerable<TransactionHeader>> Search(int pageIndex, int pageSize,string sortBy, string orderBy);
		Task<IEnumerable<TransactionHeader>> Search(int pageIndex, int pageSize,string sortBy, string orderBy,string searchstring);
		
		Task<IEnumerable<TransactionHeader>> Search(System.Int64? id, System.String accountID, System.String ticketNumber, System.String orderNumber, System.DateTime? ticketDate, System.String paymentTerms, System.String supplierTicket, System.String carrierTicket, System.String truckDescription, System.String status, System.String paymentReceiptURL);
		Task<int> Delete(System.Int64? id);
		Task<System.Int64> Insert(TransactionHeader model);
		Task<System.Int64> Insert(System.String accountID, System.String ticketNumber, System.String orderNumber, System.DateTime? ticketDate, System.String paymentTerms, System.String supplierTicket, System.String carrierTicket, System.String truckDescription, System.String status, System.String paymentReceiptURL);
		Task<int> Update(TransactionHeader model);
		Task<int> Update(System.Int64? id, System.String accountID, System.String ticketNumber, System.String orderNumber, System.DateTime? ticketDate, System.String paymentTerms, System.String supplierTicket, System.String carrierTicket, System.String truckDescription, System.String status, System.String paymentReceiptURL);
      
		Task<IEnumerable<TransactionHeader>> SearchbyOrderNo(int v1, int v2, string orderNo);
	}
}

