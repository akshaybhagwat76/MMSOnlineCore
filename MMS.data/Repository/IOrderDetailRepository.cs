using MMS.data.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;
namespace MMS.data.Repository
{
    public interface IOrderDetailRepository
    {
        Task<IEnumerable<OrderDetail>> Search(int pageIndex, int pageSize);
        Task<IEnumerable<OrderDetail>> Search(string orderNo);
    }
}
