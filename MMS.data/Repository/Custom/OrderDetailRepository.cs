using System.Data;
using System.Collections.Generic;
using Dapper;
using System.Threading.Tasks;
using MMS.data.Entities;
namespace MMS.data.Repository
{
	public partial class OrderDetailRepository : BaseRepository, IOrderDetailRepository
	{
        public async Task<IEnumerable<OrderDetail>> Search(string OrderNo)
		{

			using (var connection = connectionFactory.GetConnection)
			{
				var query = "OrderDetail_SELECT";
				var param = new DynamicParameters();
				param.Add("@OrderNumber", OrderNo);

				var list = await SqlMapper.QueryAsync<OrderDetail>(connection, query, param, commandType: CommandType.StoredProcedure);

				if (list == null)
					return null;
				else
					return list;

			}
		}
    }
}
