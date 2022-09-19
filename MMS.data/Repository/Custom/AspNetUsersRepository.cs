using System.Data;
using System.Linq;
using System.Collections.Generic;
using Dapper;
using System.Threading.Tasks;
using MMS.data.Entities;
namespace MMS.data.Repository
{
    public partial class AspNetUsersRepository
    {
        public async Task<IEnumerable<AspNetUsers>> Search_Old(int pageIndex, int pageSize, string sortBy, string orderBy, string searchkey)
        {
            using (var connection = connectionFactory.GetConnection)
            {
                var query = "[dbo].cust_AspNetUsers_SEARCH";
                var param = new DynamicParameters();
                param.Add("@PageIndex", pageIndex);
                param.Add("@PageSize", pageSize);
                param.Add("@sortBy", sortBy);
                param.Add("@orderBy", orderBy);
                param.Add("@searchkey", searchkey);

                var list = await SqlMapper.QueryAsync<AspNetUsers>(connection, query, param, commandType: CommandType.StoredProcedure);

                if (list == null)
                    return null;
                else
                    return list;

            }
        }
        public async Task<IEnumerable<AspNetUsers>> SearchByRole(int pageIndex, int pageSize, string sortBy, string orderBy, string searchkey, string Role)
        {
            using (var connection = connectionFactory.GetConnection)
            {
                var query = "[dbo].cust_AspNetUsers_SEARCH_BY_ROLE";
                var param = new DynamicParameters();
                param.Add("@PageIndex", pageIndex);
                param.Add("@PageSize", pageSize);
                param.Add("@sortBy", sortBy);
                param.Add("@orderBy", orderBy);
                param.Add("@searchkey", searchkey);
                param.Add("@role", Role);
                var list = await SqlMapper.QueryAsync<AspNetUsers>(connection, query, param, commandType: CommandType.StoredProcedure);

                if (list == null)
                    return null;
                else
                    return list;

            }
        }

        public async Task<AspNetUsers> Get2(System.String id)
        {
            using (var connection = connectionFactory.GetConnection)
            {
                var query = "[dbo].cust_AspNetUsers_SELECT2";
                var param = new DynamicParameters();
                param.Add(@"id", id, DbType.String);
                var list = await SqlMapper.QueryAsync<AspNetUsers>(connection, query, param, commandType: CommandType.StoredProcedure);
                return list.FirstOrDefault();
            }
        }

        public async Task<AspNetUsers> FindByPhoneNumberAsync(System.String phonenumber)
        {
            using (var connection = connectionFactory.GetConnection)
            {
                var query = "[dbo].cust_AspNetUsers_FindByPhoneNumber";
                var param = new DynamicParameters();
                param.Add(@"phonenumber", phonenumber);
                var list = await SqlMapper.QueryAsync<AspNetUsers>(connection, query, param, commandType: CommandType.StoredProcedure);
                return list.FirstOrDefault();

            }
        }
    }
}

