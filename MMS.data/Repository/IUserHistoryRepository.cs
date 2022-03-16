/***************************************************************/
/* Code Writer (written by Anish M Mathew )                                 */
/*                                                                          */
/* This file was automatically generated using Code Writer                  */
/* Any manual changes to this file will be overwritten by a automated tool. */
/*                                                                          */
/* Date Generated : 07-03-2022 18:24:25                                      */
/*                                                                          */
/* More Details    --                                                       */
/*http://visualstudiogallery.msdn.microsoft.com/40d92d45-107e-4f83-b6c5-50a7e2419389*/
/****************************************************************************/
using System.Collections.Generic;
using System.Threading.Tasks;
using MMS.data.Entities;


namespace MMS.data.Repository
{
	public partial interface IUserHistoryRepository
	{
		Task<IEnumerable<UserHistory>> Search(int pageIndex, int pageSize);
		Task<IEnumerable<UserHistory>> Search(int pageIndex, int pageSize,string sortBy, string orderBy);
		Task<IEnumerable<UserHistory>> Search(int pageIndex, int pageSize,string sortBy, string orderBy,string searchstring);
		
		Task<IEnumerable<UserHistory>> Search(System.Guid? userID, System.DateTime? eventDate, System.String ip, System.String eventType, System.String details);
		Task<int> Insert(UserHistory model);
		Task<int> Insert(System.Guid? userID, System.DateTime? eventDate, System.String ip, System.String eventType, System.String details);
	}
}

