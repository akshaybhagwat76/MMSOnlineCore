
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using MMS.data.Entities;
 

namespace MMS.data.Repository
{
	public partial interface IAspNetUsersRepository
	{
        Task<IEnumerable<AspNetUsers>> Search_Old(int pageIndex, int pageSize, string sortBy, string orderBy, string searchkey);
        Task<IEnumerable<AspNetUsers>> SearchByRole(int pageIndex, int pageSize, string sortBy, string orderBy, string searchkey, string Role);
        Task<AspNetUsers> Get2(String id);
        Task<AspNetUsers> FindByPhoneNumberAsync(System.String phonenumber);
    }
}

