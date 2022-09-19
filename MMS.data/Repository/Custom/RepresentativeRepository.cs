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
using System.Data;
using System.Linq;
using Dapper;
using System.Threading.Tasks;
using MMS.data.Entities;

namespace MMS.data.Repository
{
	public partial class RepresentativeRepository : BaseRepository, IRepresentativeRepository
	{
		public async Task<Representative> Get(string AccountId)
		{
			using (var connection = connectionFactory.GetConnection)
			{
				var query = "[dbo].Cust_Representative_SELECT";
				var param = new DynamicParameters();
				param.Add(@"AccountId", AccountId);
				var list = await SqlMapper.QueryAsync<Representative>(connection, query, param, commandType: CommandType.StoredProcedure);
				return list.FirstOrDefault();
			}
		}

	}
}

