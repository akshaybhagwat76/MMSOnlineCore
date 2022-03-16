using MMS.web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MMS.web.Services
{
    /// <summary>
    /// 
    /// </summary>
    public interface IControllerDiscovery
    {
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        IEnumerable<ControllerInfo> GetControllers();
    }
}
