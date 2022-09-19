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
	public partial interface IUsersRepository
	{
		Task<Users> Get(System.Int32? userID);
		Task<IEnumerable<Users>> Search(int pageIndex, int pageSize);
		Task<IEnumerable<Users>> Search(int pageIndex, int pageSize,string sortBy, string orderBy);
		Task<IEnumerable<Users>> Search(int pageIndex, int pageSize,string sortBy, string orderBy,string searchstring);
		Task<IEnumerable<Users>> Search(System.Int32? userID, System.String emailAddress, System.String name, System.Byte[] passwordHash, System.String salt, System.Int32? passwordVersion, System.Boolean? accountDisabled, System.String accountID);
		Task<int> Delete(System.Int32? userID);
		Task<int> Insert(Users model);
		string GetConnectingString();
		Task<int> Insert(System.Int32? userID, System.String emailAddress, System.String name, System.Byte[] passwordHash, System.String salt, System.Int32? passwordVersion, System.Boolean? accountDisabled, System.String accountID);
		Task<int> Update(Users model);
		Task<int> Update(System.Int32? userID, System.String emailAddress, System.String name, System.Byte[] passwordHash, System.String salt, System.Int32? passwordVersion, System.Boolean? accountDisabled, System.String accountID);
	}
}

