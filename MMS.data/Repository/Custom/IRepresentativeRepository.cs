/***************************************************************/
/* Code Writer (written by Akshay S Bhagwat )                                 */
/*                                                                          */
/* This file was automatically generated using Code Writer                  */
/* Any manual changes to this file will be overwritten by a automated tool. */
/*                                                                          */
/* Date Generated : 07-03-2022 10:13:06                                      */
/*                                                                          */
/* More Details    --                                                       */
/*http://visualstudiogallery.msdn.microsoft.com/40d92d45-107e-4f83-b6c5-50a7e2419389*/
/****************************************************************************/
using System.Threading.Tasks;
using MMS.data.Entities;


namespace MMS.data.Repository
{
	public partial interface IRepresentativeRepository
	{
		Task<Representative> Get(string AccountId);
	}
}

