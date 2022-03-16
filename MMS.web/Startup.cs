using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.ResponseCompression;
using Microsoft.AspNetCore.Routing;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Microsoft.IdentityModel.Tokens;
using MMS.data.Infrastructure;
using MMS.data.UnitOfWork;
using MMS.web.Config;
using MMS.web.Data;
using MMS.web.Extensions;
using MMS.web.Models;
using MMS.web.Services;
using Swashbuckle.AspNetCore.Swagger;
using System;
using System.IO;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using AspNetSeo.CoreMvc;
using Microsoft.AspNetCore.Routing.Constraints;
using Microsoft.AspNetCore.Localization;
using Microsoft.AspNetCore.Authentication.Cookies;
using MMS.web.Filters;
using SGS.Infrastructure.ThirdPartyServices.IdentityServer;
using System.Collections.Generic;
using Octopus.Client.Repositories.Async;

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
            //services.AddScoped<UserCultureInfo>();
            //services.AddAntiforgery(o => o.HeaderName = "XSRF-TOKEN");
            //services.Configure<IdentityOptions>(options =>
            //{
            //    // Password settings
            //    options.Password.RequireDigit = false;
            //    options.Password.RequiredLength = 6;
            //    options.Password.RequireNonAlphanumeric = false;
            //    options.Password.RequireUppercase = false;
            //    options.Password.RequireLowercase = false;
            //    options.Password.RequiredUniqueChars = 0;

            //    // Lockout settings
            //    options.Lockout.DefaultLockoutTimeSpan = TimeSpan.FromMinutes(30);
            //    options.Lockout.MaxFailedAccessAttempts = 10;
            //    options.Lockout.AllowedForNewUsers = true;

            //    // User settings
            //    options.User.RequireUniqueEmail = true;

            //});
            // Add framework services.
            services.AddDbContext<ApplicationDbContext>(options => options.UseSqlServer(Configuration.GetConnectionString("DefaultConnection")));
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

            //services.AddControllers()
            //        .AddJsonOptions(o =>
            //        {
            //            o.JsonSerializerOptions.PropertyNamingPolicy = JsonNamingPolicy.CamelCase;
            //            o.JsonSerializerOptions.DictionaryKeyPolicy = JsonNamingPolicy.CamelCase;
            //        });
            //services.AddIdentity<ApplicationUser, ApplicationRole>().AddEntityFrameworkStores<ApplicationDbContext>()
            //    .AddDefaultUI()
            //    .AddDefaultTokenProviders();

            //services.AddMvc(opt => { opt.EnableEndpointRouting = false; });

            //services.AddScoped<IUserClaimsPrincipalFactory<ApplicationUser>, AppClaimsPrincipalFactory>();

            //services.ConfigureApplicationCookie(options =>
            //{
            //    options.Cookie.Name = "safeName";
            //    options.Cookie.SameSite = SameSiteMode.Strict;
            //    options.Cookie.SecurePolicy = CookieSecurePolicy.SameAsRequest;
            //    options.Cookie.Path = "/";
            //    options.Cookie.HttpOnly = true;
            //    options.ExpireTimeSpan = TimeSpan.FromMinutes(20);
            //    options.Cookie.Expiration = TimeSpan.FromMinutes(20);
            //    options.LoginPath = new PathString("/Admin/Home/Login");
            //    options.AccessDeniedPath = "/Account/AccessDenied";
            //    options.SlidingExpiration = true;
            //});

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
            //services.AddRouting(option =>
            //{
            //    option.LowercaseUrls = false;
            //});

            //services.AddAuthorization(options =>
            //{
            //    options.AddPolicy("RequireSuperRole", policy => policy.RequireRole("superadmin"));
            //});
            //services.AddMvc().AddMvcOptions(options =>
            //{
            //    options.Filters.Add(typeof(AuditFilterAttribute));
            //});
            services.AddSession(options => {
                options.IdleTimeout = TimeSpan.FromMinutes(20);
                options.IOTimeout = TimeSpan.FromMinutes(20);
            });
            services.AddMvc(opt => { opt.EnableEndpointRouting = false; });
            services.AddDistributedMemoryCache();
            //services.AddScoped(UnitOfWork,IUnitOfWork);
            //services.AddDistributedMemoryCache();
            //services.AddSession();
            //services.AddResponseCompression();
            //services.AddDataProtection();
            services.AddScoped<AuditFilterAttribute>();

            //services.Configure<GzipCompressionProviderOptions>(options =>
            //{
            //    options.Level = System.IO.Compression.CompressionLevel.Fastest;
            //});

            //services.Configure<IISOptions>(options =>
            //{
            //    options.AutomaticAuthentication = false;
            //});

            //services.AddSingleton<IConnectionFactory, ConnectionFactory>();
            //services.AddScoped<IUnitOfWork, UnitOfWork>();
            //services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();
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
            //app.UseCookiePolicy();
            //app.UseCors("CorsPolicy");
            //app.UseAuthentication();
            //app.UseIdentity();
            app.UseSession();
            app.UseAuthentication();
            //app.UseAuthorization();
            //app.UseMvc(routes =>
            //{
            //    routes.MapRoute(
            //        name: "default",
            //        template: "{controller=Home}/{action=login}/{id?}");
            //});

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

            // CreateRoles(serviceProvider).Wait();
        }

        private async Task CreateRoles(IServiceProvider serviceProvider)
        {
            //adding customs roles

            var RoleManager = serviceProvider.GetRequiredService<RoleManager<ApplicationRole>>();
            var UserManager = serviceProvider.GetRequiredService<UserManager<ApplicationUser>>();
            string[] roleNames = { "superadmin" };
            IdentityResult roleResult;

            foreach (var roleName in roleNames)
            {
                //creating the roles and seeding them to the database
                var roleExist = await RoleManager.RoleExistsAsync(roleName);
                if (!roleExist)
                {
                    roleResult = await RoleManager.CreateAsync(new ApplicationRole { Name = roleName });
                }
            }

            //creating a super user who could maintain the web app
            var poweruser = new ApplicationUser
            {
                UserName = Configuration.GetSection("AppSettings")["UserName"],
                Email = Configuration.GetSection("AppSettings")["UserEmail"],
                FirstName = "Bob Smith",
                EmailConfirmed = true,
                IsActive = true,
                IsDeleted = false
            };

            string UserPassword = Configuration.GetSection("AppSettings")["UserPassword"];
            var _user = await UserManager.FindByEmailAsync(Configuration.GetSection("AppSettings")["UserEmail"]);

            if (_user == null)
            {
                var createPowerUser = await UserManager.CreateAsync(poweruser, UserPassword);
                if (createPowerUser.Succeeded)
                {
                    await UserManager.AddToRoleAsync(poweruser, "superadmin");
                }
            }
        }
    }
}