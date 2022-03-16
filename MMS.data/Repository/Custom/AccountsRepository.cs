/***************************************************************/
/* Code Writer (written by Anish M Mathew )                                 */
/*                                                                          */
/* This file was automatically generated using Code Writer                  */
/* Any manual changes to this file will be overwritten by a automated tool. */
/*                                                                          */
/* Date Generated : 12-03-2022 10:38:20                                      */
/*                                                                          */
/* More Details    --                                                       */
/*http://visualstudiogallery.msdn.microsoft.com/40d92d45-107e-4f83-b6c5-50a7e2419389*/
/****************************************************************************/
using System;
using System.Data;
using System.Linq;
using System.Text;
using System.Collections.Generic;
using Dapper;
using System.Threading.Tasks;
using MMS.data.Infrastructure;
using MMS.data.Entities;

namespace MMS.data.Repository
{
	public partial class AccountsRepository : BaseRepository, IAccountsRepository
	{
		public async Task<Accounts> Get(string AccountId)
		{
			using (var connection = connectionFactory.GetConnection)
			{
				var query = "[dbo].Cust_Accounts";
				var param = new DynamicParameters();
				param.Add(@"AccountId", AccountId);
				var list = await SqlMapper.QueryAsync<Accounts>(connection, query, param, commandType: CommandType.StoredProcedure);
				return list.FirstOrDefault();

			}
		}
	}
}

