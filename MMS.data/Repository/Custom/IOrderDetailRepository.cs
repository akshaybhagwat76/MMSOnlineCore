using MMS.data.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace MMS.data.Repository.Custom
{
    public interface IOrderDetailRepository
    {
        Task<IEnumerable<OrderDetail>> Search(string OrderNo);
    }
}
