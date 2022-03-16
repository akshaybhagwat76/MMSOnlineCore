using MMS.web.Data;
using MMS.web.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Authorization;
using Microsoft.AspNetCore.Mvc.Controllers;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Routing;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Security.Claims;
using System.Threading.Tasks;

namespace MMS.web
{
    /// <summary>
    /// 
    /// </summary>
    //public class DynamicAuthorizationFilter : IAsyncAuthorizationFilter
    //{
    //    private readonly ApplicationDbContext _dbContext;

    //    /// <summary>
    //    /// 
    //    /// </summary>
    //    /// <param name="dbContext"></param>
    //    public DynamicAuthorizationFilter(ApplicationDbContext dbContext)
    //    {

           

    //        _dbContext = dbContext;
    //    }

    //    /// <summary>
    //    /// 
    //    /// </summary>
    //    /// <param name="context"></param>
    //    /// <returns></returns>
    //    public async Task OnAuthorizationAsync(AuthorizationFilterContext context)
    //    {
    //        if (!IsProtectedAction(context))
    //            return;

           

    //        if (!IsUserAuthenticated(context))
    //        {

    //            context.Result = new RedirectToRouteResult(new RouteValueDictionary(new
    //            {
    //                action = "Login",
    //                controller = "Account",
    //                area =  "Identity"  

    //            }));

    //            return;

    //        }
    //        var actionId = GetActionId(context);
    //        var userName = context.HttpContext.User.Identity.Name;

    //        if (context.HttpContext.User.FindFirst("access") != null)
    //        {
    //            var obj = context.HttpContext.User.FindFirst("access").Value;
    //            if (obj == "any")
    //            {
    //                return;
    //            }
    //        }

    //        var roles = await (
    //         from user in _dbContext.Users
    //         join userRole in _dbContext.UserRoles on user.Id equals userRole.UserId
    //         join role in _dbContext.Roles on userRole.RoleId equals role.Id
    //         where user.UserName == userName
    //         select role).ToListAsync();


    //        foreach (var role in roles)
    //        {
    //            var accessList = JsonConvert.DeserializeObject<IEnumerable<ControllerInfo>>(role.Permission);
    //            if (accessList.SelectMany(c => c.Actions).Any(a => a.Id == actionId))
    //                return;
    //        }



    //        context.Result = new ForbidResult();
    //    }

    //    /// <summary>
    //    /// 
    //    /// </summary>
    //    /// <param name="context"></param>
    //    /// <returns></returns>
    //    private bool IsProtectedAction(AuthorizationFilterContext context)
    //    {
    //        if (context.Filters.Any(item => item is IAllowAnonymousFilter))
    //            return false;

    //        var controllerActionDescriptor = (ControllerActionDescriptor)context.ActionDescriptor;
    //        var controllerTypeInfo = controllerActionDescriptor.ControllerTypeInfo;
    //        var actionMethodInfo = controllerActionDescriptor.MethodInfo;

    //        var authorizeAttribute = controllerTypeInfo.GetCustomAttribute<AuthorizeAttribute>();
    //        if (authorizeAttribute != null)
    //            return true;

    //        authorizeAttribute = actionMethodInfo.GetCustomAttribute<AuthorizeAttribute>();
    //        if (authorizeAttribute != null)
    //            return true;

    //        return false;
    //    }

    //    /// <summary>
    //    /// 
    //    /// </summary>
    //    /// <param name="context"></param>
    //    /// <returns></returns>

    //    private bool IsUserAuthenticated(AuthorizationFilterContext context)
    //    {
    //        return context.HttpContext.User.Identity.IsAuthenticated;
    //    }

    //    /// <summary>
    //    /// 
    //    /// </summary>
    //    /// <param name="context"></param>
    //    /// <returns></returns>
    //    private string GetActionId(AuthorizationFilterContext context)
    //    {
    //        var controllerActionDescriptor = (ControllerActionDescriptor)context.ActionDescriptor;
    //        var area = controllerActionDescriptor.ControllerTypeInfo.GetCustomAttribute<AreaAttribute>()?.RouteValue;
    //        var controller = controllerActionDescriptor.ControllerName;
    //        var action = controllerActionDescriptor.ActionName;

    //        return $"{area}:{controller}:{action}";
    //    }

    //    private string GetcontrollerId(AuthorizationFilterContext context)
    //    {
    //        var controllerActionDescriptor = (ControllerActionDescriptor)context.ActionDescriptor;
    //        var area = controllerActionDescriptor.ControllerTypeInfo.GetCustomAttribute<AreaAttribute>()?.RouteValue;
    //        var controller = controllerActionDescriptor.ControllerName;
    //        var action = controllerActionDescriptor.ActionName;

    //        return $"{area}:{controller}";
    //    }
    //}

}

