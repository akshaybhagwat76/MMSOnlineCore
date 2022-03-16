using MMS.web.Config;
using MMS.web.Extensions;
using MMS.web.Models;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace MMS.web.Controllers
{
    /// <summary>
    /// 
    /// </summary>
    [ApiExplorerSettings(IgnoreApi = true)]
    public class CKEditorController : Controller
    {
        private readonly IOptions<AppConfig> config;
        private readonly IHostingEnvironment _appEnvironment;

        /// <summary>
        /// 
        /// </summary>
        /// <param name="appEnvironment"></param>
        /// <param name="_config"></param>
        public CKEditorController(IHostingEnvironment appEnvironment, IOptions<AppConfig> _config)
        {
            _appEnvironment = appEnvironment;
            config = _config;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="upload"></param>
        /// <returns></returns>
        [Route("~/uploadnow")]
        public async Task<IActionResult> uploadnow(IFormFile upload)
        {
            string ImageName = "";
            if (upload != null)
            {
                ImageName = await Uploadfiles.Uplaod(upload, _appEnvironment.WebRootPath, "ckedit");
            }
            return Ok(ImageName);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        [Route("~/uploadPartial")]
        public IActionResult uploadPartial()
        {
            string contentRootPath = _appEnvironment.ContentRootPath;
            var appData = contentRootPath + "/wwwroot/uploads/ckedit";
            var images = Directory.GetFiles(appData).Select(x => new imagesviewmodel
            {
                Url = Url.Content("/uploads/ckedit/" + Path.GetFileName(x))
            });
            return View(images);
        }
    }
}