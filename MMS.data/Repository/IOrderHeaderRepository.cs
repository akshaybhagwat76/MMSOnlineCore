using MMS.data.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;
namespace MMS.data.Repository
{
    public interface IOrderHeaderRepository
    {
        Task<OrderHeader> Search(string ticketNo);
        Task<IEnumerable<OrderHeader>> Search(int pageIndex, int pageSize, string sortBy, string orderBy, string searchstring);
    }
}
