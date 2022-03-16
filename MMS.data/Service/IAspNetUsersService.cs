/***************************************************************/
/* Code Writer (written by Anish M Mathew )                                 */
/*                                                                          */
/* This file was automatically generated using Code Writer                  */
/* Any manual changes to this file will be overwritten by a automated tool. */
/*                                                                          */
/* Date Generated : 05-03-2022 14:32:56                                      */
/*                                                                          */
/* More Details    --                                                       */
/*http://visualstudiogallery.msdn.microsoft.com/40d92d45-107e-4f83-b6c5-50a7e2419389*/
/****************************************************************************/
using System.Collections.Generic;
using System.Threading.Tasks;
using MMS.data.Entities;


namespace MMS.data.Service
{
	public partial interface IAspNetUsersService
	{
		Task<AspNetUsers> Get(System.Guid? id);
		Task<IEnumerable<AspNetUsers>> Search(int pageIndex, int pageSize);
		Task<IEnumerable<AspNetUsers>> Search(int pageIndex, int pageSize,string sortBy, string orderBy);
		Task<IEnumerable<AspNetUsers>> Search(System.Guid? id, System.String userName, System.String normalizedUserName, System.String email, System.String normalizedEmail, System.Boolean? emailConfirmed, System.String passwordHash, System.String securityStamp, System.String concurrencyStamp, System.String phoneNumber, System.Boolean? phoneNumberConfirmed, System.Boolean? twoFactorEnabled, System.DateTimeOffset lockoutEnd, System.Boolean? lockoutEnabled, System.Int32? accessFailedCount, System.DateTime? joinTime, System.DateTime? dob, System.Int32? cid, System.String userImage, System.String title, System.String firstName, System.String surname, System.String lastName, System.String address, System.Int32? countryID, System.String pinCode, System.String gender, System.String companyName, System.Boolean? isActive, System.Boolean? isDeleted, System.String lastUpdatedBy, System.DateTime? lastUpdatedOn, System.String accountID);
		Task<int> Delete(System.Guid? id);
		Task<int> Insert(AspNetUsers model);
		Task<int> Insert(System.Guid? id, System.String userName, System.String normalizedUserName, System.String email, System.String normalizedEmail, System.Boolean? emailConfirmed, System.String passwordHash, System.String securityStamp, System.String concurrencyStamp, System.String phoneNumber, System.Boolean? phoneNumberConfirmed, System.Boolean? twoFactorEnabled, System.DateTimeOffset lockoutEnd, System.Boolean? lockoutEnabled, System.Int32? accessFailedCount, System.DateTime? joinTime, System.DateTime? dob, System.Int32? cid, System.String userImage, System.String title, System.String firstName, System.String surname, System.String lastName, System.String address, System.Int32? countryID, System.String pinCode, System.String gender, System.String companyName, System.Boolean? isActive, System.Boolean? isDeleted, System.String lastUpdatedBy, System.DateTime? lastUpdatedOn, System.String accountID);
		Task<int> Update(AspNetUsers model);
		Task<int> Update(System.Guid? id, System.String userName, System.String normalizedUserName, System.String email, System.String normalizedEmail, System.Boolean? emailConfirmed, System.String passwordHash, System.String securityStamp, System.String concurrencyStamp, System.String phoneNumber, System.Boolean? phoneNumberConfirmed, System.Boolean? twoFactorEnabled, System.DateTimeOffset lockoutEnd, System.Boolean? lockoutEnabled, System.Int32? accessFailedCount, System.DateTime? joinTime, System.DateTime? dob, System.Int32? cid, System.String userImage, System.String title, System.String firstName, System.String surname, System.String lastName, System.String address, System.Int32? countryID, System.String pinCode, System.String gender, System.String companyName, System.Boolean? isActive, System.Boolean? isDeleted, System.String lastUpdatedBy, System.DateTime? lastUpdatedOn, System.String accountID);
	}
}

