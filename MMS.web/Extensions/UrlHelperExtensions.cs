namespace Microsoft.AspNetCore.Mvc
{
    /// <summary>
    /// 
    /// </summary>
    public static class UrlHelperExtensions
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="urlHelper"></param>
        /// <param name="localUrl"></param>
        /// <returns></returns>
        public static string GetLocalUrl(this IUrlHelper urlHelper, string localUrl)
        {
            if (!urlHelper.IsLocalUrl(localUrl))
            {
                return urlHelper.Page("/Index");
            }

            return localUrl;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="urlHelper"></param>
        /// <param name="userId"></param>
        /// <param name="code"></param>
        /// <param name="scheme"></param>
        /// <returns></returns>
        public static string EmailConfirmationLink(this IUrlHelper urlHelper, string userId, string code, string scheme)
        {
            return urlHelper.Action(
                action: "ConfirmEmail",
                controller: "identity/Account",
                values: new { userId, code },
                protocol: scheme);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="urlHelper"></param>
        /// <param name="userId"></param>
        /// <param name="code"></param>
        /// <param name="scheme"></param>
        /// <returns></returns>
        public static string ResetPasswordCallbackLink(this IUrlHelper urlHelper, string userId, string code, string scheme)
        {
            return urlHelper.Action(
                action: "ResetPassword",
                controller: "identity/Account",
                values: new { userId, code },
                protocol: scheme);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="urlHelper"></param>
        /// <param name="userId"></param>
        /// <param name="code"></param>
        /// <param name="scheme"></param>
        /// <param name="BaseUrl"></param>
        /// <returns></returns>
        public static string EmailConfirmationLink(this IUrlHelper urlHelper, string userId, string code, string scheme, string BaseUrl)
        {
            return BaseUrl + "identity/Account/ConfirmEmail?userId=" + userId + "&code=" + code;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="urlHelper"></param>
        /// <param name="userId"></param>
        /// <param name="code"></param>
        /// <param name="scheme"></param>
        /// <param name="BaseUrl"></param>
        /// <returns></returns>
        public static string ResetPasswordCallbackLink(this IUrlHelper urlHelper, string userId, string code, string scheme, string BaseUrl)
        {
            return BaseUrl + "Identity/Account/ResetPassword?userId=" + userId + "&code=" + code;
        }

    }
}
