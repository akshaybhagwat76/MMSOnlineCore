/***************************************************************/
/* Code Writer (written by Akshay S Bhagwat )                                 */
/*                                                                          */
/* This file was automatically generated using Code Writer                  */
/* Any manual changes to this file will be overwritten by a automated tool. */
/*                                                                          */
/* Date Generated : 12-03-2022 10:38:20                                      */
/*                                                                          */
/* More Details    --                                                       */
/*http://visualstudiogallery.msdn.microsoft.com/40d92d45-107e-4f83-b6c5-50a7e2419389*/
/****************************************************************************/
using System.Data;
using System.Linq;
using Dapper;
using System.Threading.Tasks;
using MMS.data.Entities;
using Microsoft.Extensions.Configuration;
namespace MMS.data.Repository
{
	public partial class UsersRepository : BaseRepository, IUsersRepository
	{
		public IConfigurationRoot Configuration { get; }
		public string GetConnectingString()
		{
			return connectionFactory.GetConnectionString;
		}
		public async Task<Users> Get(string email)
		{
			using (var connection = connectionFactory.GetConnection)
			{
				var query = "[dbo].Cust_Users_SELECT";
				var param = new DynamicParameters();
				param.Add(@"email", email);
				var list = await SqlMapper.QueryAsync<Users>(connection, query, param, commandType: CommandType.StoredProcedure);
				return list.FirstOrDefault();
			}
		}
	}
}

