/***************************************************************/
/* Code Writer (written by Akshay S Bhagwat )                                 */
/*                                                                          */
/* This file was automatically generated using Code Writer                  */
/* Any manual changes to this file will be overwritten by a automated tool. */
/*                                                                          */
/* Date Generated : 05-03-2022 14:32:56                                      */
/*                                                                          */
/* More Details    --                                                       */
/*http://visualstudiogallery.msdn.microsoft.com/40d92d45-107e-4f83-b6c5-50a7e2419389*/
/****************************************************************************/
using System.Data;
using System.Collections.Generic;
using Dapper;
using System.Threading.Tasks;
using MMS.data.Entities;
namespace MMS.data.Repository
{
	public partial class TransactionDetailRepository : BaseRepository, ITransactionDetailRepository
	{
		public async Task<IEnumerable<TransactionDetail>> Search(string ticketNo)
		{
			using (var connection = connectionFactory.GetConnection)
			{
				var query = "[dbo].Cust_TransactionDetail";
				var param = new DynamicParameters();
				param.Add("@ticketNo", ticketNo);

				var list = await SqlMapper.QueryAsync<TransactionDetail>(connection, query, param, commandType: CommandType.StoredProcedure);

				if (list == null)
					return null;
				else
					return list;

			}
		}
	}
}

