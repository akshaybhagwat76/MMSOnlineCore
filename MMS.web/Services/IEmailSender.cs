using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MMS.web.Services
{
    /// <summary>
    /// 
    /// </summary>
    public interface IEmailSender
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="email"></param>
        /// <param name="subject"></param>
        /// <param name="message"></param>
        /// <returns></returns>
        Task SendEmailAsync(string email, string subject, string message);
        /// <summary>
        /// 
        /// </summary>
        /// <param name="email"></param>
        /// <param name="subject"></param>
        /// <param name="data"></param>
        /// <returns></returns>
        Task SendActivationEmailAsync(string email, string subject, Dictionary<string, string> data);

        /// <summary>
        /// 
        /// </summary>
        /// <param name="email"></param>
        /// <param name="subject"></param>
        /// <param name="data"></param>
        /// <param name="template"></param>
        /// <returns></returns>
        Task SendEmailAsync(string email, string subject, Dictionary<string, string> data, string template);
    }
}
