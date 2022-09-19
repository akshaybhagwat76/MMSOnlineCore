using System;
namespace MMS.web.Config
{
    /// <summary>
    /// 
    /// </summary>
    public class EmailConfig
    {
        /// <summary>
        /// 
        /// </summary>
        public String FromName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public String FromAddress { get; set; }

        /// <summary>
        /// 
        /// </summary>

        public String MailServerAddress { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public String MailServerPort { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public String UserId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public String UserPassword { get; set; }
    }
}
