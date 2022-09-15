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
   
	public partial class OrderHeaderRepository : BaseRepository, IOrderHeaderRepository
	{
        public OrderHeaderRepository(IConnectionFactory connectionFactory) : base(connectionFactory)
        {
        }

		public async Task<IEnumerable<OrderHeader>> Search(int pageIndex, int pageSize, string sortBy, string orderBy)
		{

			using (var connection = connectionFactory.GetConnection)
			{
				var query = "[dbo].TransactionHeader_SORT";
				var param = new DynamicParameters();
				param.Add("@PageIndex", pageIndex);
				param.Add("@PageSize", pageSize);
				param.Add("@sortBy", sortBy);
				param.Add("@orderBy", orderBy);

				var list = await SqlMapper.QueryAsync<OrderHeader>(connection, query, param, commandType: CommandType.StoredProcedure);

				if (list == null)
					return null;
				else
					return list;

			}
		}
		
	}
}
