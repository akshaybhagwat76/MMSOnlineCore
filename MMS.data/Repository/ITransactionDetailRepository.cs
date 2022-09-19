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
using MMS.data.Entities;
namespace MMS.data.Repository
{
	public partial interface ITransactionDetailRepository
	{
		Task<TransactionDetail> Get(System.Int64? id);
		Task<IEnumerable<TransactionDetail>> Search(int pageIndex, int pageSize);
		Task<IEnumerable<TransactionDetail>> Search(int pageIndex, int pageSize,string sortBy, string orderBy);
		Task<IEnumerable<TransactionDetail>> Search(int pageIndex, int pageSize,string sortBy, string orderBy,string searchstring);
		Task<IEnumerable<TransactionDetail>> Search(System.Int64? id, System.String accountID, System.String ticketNumber, System.Int32? detailID, System.Int32? gross, System.Int32? tare, System.Int32? net, System.Decimal? unitCost, System.Decimal? totalCost);
		Task<int> Delete(System.Int64? id);
		Task<System.Int64> Insert(TransactionDetail model);
		Task<System.Int64> Insert(System.String accountID, System.String ticketNumber, System.Int32? detailID, System.Int32? gross, System.Int32? tare, System.Int32? net, System.Decimal? unitCost, System.Decimal? totalCost);
		Task<int> Update(TransactionDetail model);
		Task<int> Update(System.Int64? id, System.String accountID, System.String ticketNumber, System.Int32? detailID, System.Int32? gross, System.Int32? tare, System.Int32? net, System.Decimal? unitCost, System.Decimal? totalCost);
	}
}

