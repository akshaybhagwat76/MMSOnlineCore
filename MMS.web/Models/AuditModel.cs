namespace MMS.web.Models
{
    /// <summary>
    /// 
    /// </summary>
    public class AuditModel
    {
        /// <summary>
        /// 
        /// </summary>
        public int AuditId { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string Area { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string ControllerName { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string ActionName { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string RoleId { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string LangId { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string IpAddress { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string IsFirstLogin { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string LoggedInAt { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string LoggedOutAt { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string LoginStatus { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string PageAccessed { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string SessionId { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string UrlReferrer { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string UserId { get; set; }
    }
}
