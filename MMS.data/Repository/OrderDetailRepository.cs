using System.Data;
using System.Collections.Generic;
using Dapper;
using System.Threading.Tasks;
using MMS.data.Infrastructure;
using MMS.data.Entities;

namespace MMS.data.Repository
{
   public partial class OrderDetailRepository: BaseRepository,IOrderDetailRepository
	{
		public OrderDetailRepository(IConnectionFactory connectionFactory) : base(connectionFactory) { }

		#region Select One
		/// <summary>
		/// Get data according to the primary key value.
		/// </summary>
		/// <param name="id">System.Int64?</param>
	
		#endregion

		public async Task<IEnumerable<OrderDetail>> Search(int pageIndex, int pageSize)
		{

			using (var connection = connectionFactory.GetConnection)
			{
				var query = "[dbo].TransactionDetail_PAGING";
				var param = new DynamicParameters();
				param.Add("@PageIndex", pageIndex);
				param.Add("@PageSize", pageSize);

				var list = await SqlMapper.QueryAsync<OrderDetail>(connection, query, param, commandType: CommandType.StoredProcedure);

				if (list == null)
					return null;
				else
					return list;

			}
		}

    }
}
