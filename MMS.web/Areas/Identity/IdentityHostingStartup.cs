using Microsoft.AspNetCore.Hosting;
[assembly: HostingStartup(typeof(MMS.web.Areas.Identity.IdentityHostingStartup))]
namespace MMS.web.Areas.Identity
{
    /// <summary>
    /// 
    /// </summary>
    public class IdentityHostingStartup : IHostingStartup
    { 
        /// <summary>
        /// 
        /// </summary>
        /// <param name="builder"></param>
        public void Configure(IWebHostBuilder builder)
        {
            builder.ConfigureServices((context, services) => {
            });
        }
    }
}