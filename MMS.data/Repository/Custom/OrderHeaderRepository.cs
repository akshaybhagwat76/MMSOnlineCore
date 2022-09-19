using Dapper;
using MMS.data.Entities;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
namespace MMS.data.Repository
{
    public partial class OrderHeaderRepository : BaseRepository, IOrderHeaderRepository
    {
       public async Task<OrderHeader> Search(string OrderNo)
		{
			using (var connection = connectionFactory.GetConnection)
			{
				var query = "[dbo].[OrderHeader_SELECT]";
				var param = new DynamicParameters();
				param.Add("@OrderNumber", OrderNo);
				var list = await SqlMapper.QueryAsync<OrderHeader>(connection, query, param, commandType: CommandType.StoredProcedure);
				
				if (list == null)
					return null;
				else
					return list.FirstOrDefault();

			}
		}

		public async Task<IEnumerable<OrderHeader>> Search(int pageIndex, int pageSize, string sortBy, string orderBy, string searchstring)
		{

			using (var connection = connectionFactory.GetConnection)
			{
				var query = "[dbo].[OrderHeader_CUSTOM]";
				var param = new DynamicParameters();
				param.Add("@PageIndex", pageIndex);
				param.Add("@PageSize", pageSize);
				param.Add("@sortBy", sortBy);
				param.Add("@orderBy", orderBy);
				param.Add("@searchstring", searchstring);

				var list = await SqlMapper.QueryAsync<OrderHeader>(connection, query, param, commandType: CommandType.StoredProcedure);

				if (list == null)
					return null;
				else
					return list;

			}
		}
    }
}
