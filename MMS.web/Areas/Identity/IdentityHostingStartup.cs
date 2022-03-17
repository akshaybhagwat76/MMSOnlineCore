using System;
using MMS.web.Models;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.UI;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

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