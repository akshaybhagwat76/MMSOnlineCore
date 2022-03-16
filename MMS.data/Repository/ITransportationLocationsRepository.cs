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
	public partial interface ITransportationLocationsRepository
	{
		Task<TransportationLocations> Get(System.Int64? id);
		Task<IEnumerable<TransportationLocations>> Search(int pageIndex, int pageSize);
		Task<IEnumerable<TransportationLocations>> Search(int pageIndex, int pageSize,string sortBy, string orderBy);
		Task<IEnumerable<TransportationLocations>> Search(int pageIndex, int pageSize,string sortBy, string orderBy,string searchstring);
		
		Task<IEnumerable<TransportationLocations>> Search(System.Int64? id, System.String accountID, System.Int32? locationID, System.String locationName);
		Task<int> Delete(System.Int64? id);
		Task<System.Int64> Insert(TransportationLocations model);
		Task<System.Int64> Insert(System.String accountID, System.Int32? locationID, System.String locationName);
		Task<int> Update(TransportationLocations model);
		Task<int> Update(System.Int64? id, System.String accountID, System.Int32? locationID, System.String locationName);
		
	}
}

