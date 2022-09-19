using MMS.data.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;
namespace MMS.data.Repository.Custom
{
    public interface IOrderDetailRepository
    {
        Task<IEnumerable<OrderDetail>> Search(string OrderNo);
    }
}
