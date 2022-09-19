using System;

namespace MMS.web.Models
{
    /// <summary>
    /// 
    /// </summary>
    public class CmsModels
    {
        /// <summary>
        /// 
        /// </summary>
        public int Cmsid { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string url { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string title { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public DateTime createdOn{ get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string body { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public bool isBlog { get; set; }
    }
}
