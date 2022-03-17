using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Routing;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Microsoft.IdentityModel.Tokens;
using MMS.data.Infrastructure;
using MMS.data.UnitOfWork;
using MMS.web.Config;
using MMS.web.Services;
using System;
using MMS.web.Filters;
using SGS.Infrastructure.ThirdPartyServices.IdentityServer;
using System.Collections.Generic;

namespace MMS.web
{
    /// <summary>
    /// 
    /// </summary>
    public class Startup
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="configuration"></param>
        //public IWebHostEnvironment WebHostEnvironment { get; }
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
            StaticConfig = configuration;
            IdentityServerConfiguration.LoadIS4Settings(configuration);
        }

        /// <summary>
        /// 
        /// </summary>
        public IConfiguration Configuration { get; }

        /// <summary>
        /// 
        /// </summary>
        public static IConfiguration StaticConfig { get; private set; }
        // This method gets called by the runtime. Use this method to add services to the container.

        /// <summary>
        /// 
        /// </summary>
        /// <param name="services"></param>
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddCors().AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_2_2);
            services.AddMvc(opt => { opt.EnableEndpointRouting = false; });
            services.AddAuthentication(options =>
            {
                options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(options =>
            {
                options.Authority = IdentityServerConfiguration.Instance.IS4URI;
                options.RequireHttpsMetadata = false;
                options.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidAudiences = new List<string> { "services_poc", "api_poc" }
                };
            });
            services.AddScoped<IUnitOfWork, UnitOfWork>();
            services.AddScoped<IConnectionFactory, ConnectionFactory>();
            services.AddHttpContextAccessor();
            services.Configure<AppConfig>(Configuration.GetSection("MyConfig"));
            services.Configure<EmailConfig>(Configuration.GetSection("Email"));
            services.AddTransient<IEmailSender, EmailSender>();

            services.AddCors(options =>
            {
                options.AddDefaultPolicy(builder =>
                     builder.SetIsOriginAllowed(_ => true)
                     .AllowAnyMethod()
                     .AllowAnyHeader()
                     .AllowCredentials());
            });
            services.AddSession(options => {
                options.IdleTimeout = TimeSpan.FromMinutes(20);
                options.IOTimeout = TimeSpan.FromMinutes(20);
            });
            services.AddMvc(opt => { opt.EnableEndpointRouting = false; });
            services.AddDistributedMemoryCache();
            services.AddScoped<AuditFilterAttribute>();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="app"></param>
        /// <param name="env"></param>
        /// <param name="serviceProvider"></param>
        /// <param name="loggerFactory"></param>
        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        [Obsolete]
        public void Configure(IApplicationBuilder app, IHostingEnvironment env, IServiceProvider serviceProvider, ILoggerFactory loggerFactory)
        {
            loggerFactory.AddConsole(Configuration.GetSection("Logging"));
            loggerFactory.AddDebug();

            app.UseDeveloperExceptionPage();
            app.UseDatabaseErrorPage();

            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseDatabaseErrorPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
                app.UseHsts();
            }

            app.UseHttpsRedirection();
            app.UseStaticFiles();
            app.UseSession();
            app.UseAuthentication();
           
            app.UseMvc(routes =>
            {
                routes.MapRoute("areaRoute", "{area:exists}/{controller=Home}/{action=login}/{id?}");

                routes.MapRoute(
                name: "default",
                template: "{controller=Home}/{action=login}/{id?}");

                routes.MapSpaFallbackRoute(
                 name: "spa-fallback",
                 defaults: new { controller = "Home", action = "login" });
            });
        }
    }
}