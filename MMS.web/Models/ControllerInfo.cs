using System.Collections.Generic;
namespace MMS.web.Models
{
    /// <summary>
    /// 
    /// </summary>
    public class ControllerInfo
    {
        /// <summary>
        /// 
        /// </summary>
        public string Id => $"{AreaName}:{Name}";
        /// <summary>
        /// 
        /// </summary>
        public string Name { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string DisplayName { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string AreaName { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public IEnumerable<ActionInfo> Actions { get; set; }
    }
    /// <summary>
    /// 
    /// </summary>
    public class ActionInfo
    { /// <summary>
      /// 
      /// </summary>
        public string Id => $"{ControllerId}:{Name}";
        /// <summary>
        /// 
        /// </summary>
        public string Name { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string DisplayName { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string ControllerId { get; set; }
    }
}
