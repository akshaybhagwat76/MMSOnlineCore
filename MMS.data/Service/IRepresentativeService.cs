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
namespace MMS.data.Service
{
	public partial interface IRepresentativeService
	{
		Task<Representative> Get(System.Int32? id);
		Task<IEnumerable<Representative>> Search(int pageIndex, int pageSize);
		Task<IEnumerable<Representative>> Search(int pageIndex, int pageSize,string sortBy, string orderBy);
		Task<IEnumerable<Representative>> Search(System.Int32? id, System.String accountId, System.String name, System.String email, System.String officePhone, System.String cellPhone, System.String imageURL, System.String notes);
		Task<int> Delete(System.Int32? id);
		Task<System.Int32> Insert(Representative model);
		Task<System.Int32> Insert(System.String accountId, System.String name, System.String email, System.String officePhone, System.String cellPhone, System.String imageURL, System.String notes);
		Task<int> Update(Representative model);
		Task<int> Update(System.Int32? id, System.String accountId, System.String name, System.String email, System.String officePhone, System.String cellPhone, System.String imageURL, System.String notes);
	}
}

