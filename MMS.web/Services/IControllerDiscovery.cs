using MMS.web.Models;
using System.Collections.Generic;
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
