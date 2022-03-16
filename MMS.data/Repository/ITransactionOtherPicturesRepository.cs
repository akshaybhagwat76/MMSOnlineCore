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
	public partial interface ITransactionOtherPicturesRepository
	{
		Task<TransactionOtherPictures> Get(System.Int64? id);
		Task<IEnumerable<TransactionOtherPictures>> Search(int pageIndex, int pageSize);
		Task<IEnumerable<TransactionOtherPictures>> Search(int pageIndex, int pageSize,string sortBy, string orderBy);
		Task<IEnumerable<TransactionOtherPictures>> Search(int pageIndex, int pageSize,string sortBy, string orderBy,string searchstring);
		
		Task<IEnumerable<TransactionOtherPictures>> Search(System.Int64? id, System.String accountID, System.String ticketNumber, System.String pictureID, System.String thumbnailURL, System.String fullResURL);
		Task<int> Delete(System.Int64? id);
		Task<System.Int64> Insert(TransactionOtherPictures model);
		Task<System.Int64> Insert(System.String accountID, System.String ticketNumber, System.String pictureID, System.String thumbnailURL, System.String fullResURL);
		Task<int> Update(TransactionOtherPictures model);
		Task<int> Update(System.Int64? id, System.String accountID, System.String ticketNumber, System.String pictureID, System.String thumbnailURL, System.String fullResURL);
		
	}
}

