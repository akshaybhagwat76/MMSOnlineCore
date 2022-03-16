using Microsoft.AspNetCore.Http;
using SixLabors.ImageSharp;
using SixLabors.ImageSharp.PixelFormats;
using SixLabors.ImageSharp.Processing;
using System;
using System.IO;
using System.Threading.Tasks;

namespace MMS.web.Extensions
{
    /// <summary>
    /// Upload Images
    /// </summary>
    public class Uploadfiles
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="UploadLogo"></param>
        /// <param name="WebRootPath"></param>
        /// <param name="folder"></param>
        /// <param name="width"></param>
        /// <param name="height"></param>
        /// <returns></returns>
        public static async Task<String> Uplaod(IFormFile UploadLogo, string WebRootPath, string folder, int width = 300, int height = 300)
        {
            if (UploadLogo != null)
            {

                string path_Root = WebRootPath;
                string uploadPath = path_Root + "/uploads/" + folder + "/";

                if (!Directory.Exists(uploadPath))
                    Directory.CreateDirectory(uploadPath);

                var ext = Path.GetExtension(UploadLogo.FileName).ToLower();

                var fileName = Guid.NewGuid().ToString().Replace("-", "") + ext;
                var uploadPathWithfileName = Path.Combine(uploadPath, fileName);
                var uploadAbsolutePath = Path.Combine(WebRootPath, uploadPathWithfileName);
                using (var fileStream = new FileStream(uploadAbsolutePath, FileMode.Create))
                {
                    await UploadLogo.CopyToAsync(fileStream);
                    //employee.ImageName = uploadPathWithfileName;
                }

                if (ext.EndsWith(".png") || ext.EndsWith(".jpg") || ext.EndsWith(".jpeg") || ext.EndsWith(".gif"))
                {

                    uploadPath = path_Root + "/uploads/" + folder + "/thumb/";

                    if (!Directory.Exists(uploadPath))
                        Directory.CreateDirectory(uploadPath);

                    string paths = Path.Combine(uploadPath.Replace("thumb/", ""), fileName);
                    try
                    {
                        using (Image<Rgba32> image = Image.Load(paths))
                        {
                            // Figure out the ratio
                            double ratioX = (double)width / (double)image.Width;
                            double ratioY = (double)height / (double)image.Height;
                            // use whichever multiplier is smaller
                            double ratio = ratioX < ratioY ? ratioX : ratioY;

                            // now we can get the new height and width
                            int newHeight = Convert.ToInt32(image.Height * ratio);
                            int newWidth = Convert.ToInt32(image.Width * ratio);

                            image.Mutate(x => x.Resize(newWidth, newHeight));  //.Grayscale());

                            image.Save(uploadPath + "/" + fileName); // automatic encoder selected based on extension.
                        }
                    }
                    catch { }
                }
                return fileName;
            }
            return null;
        }

        /// <summary>
        /// Upload
        /// </summary>
        /// <param name="UploadLogo"></param>
        /// <param name="WebRootPath"></param>
        /// <param name="folder"></param>
        /// <returns></returns>
        public static async Task<String> UplaodVideo(IFormFile UploadLogo, string WebRootPath, string folder)
        {
            try
            {
                if (UploadLogo != null)
                {

                    string path_Root = WebRootPath;
                    string uploadPath = path_Root + "/uploads/" + folder + "/";

                    if (!Directory.Exists(uploadPath))
                        Directory.CreateDirectory(uploadPath);

                    var fileName = Guid.NewGuid().ToString().Replace("-", "") + Path.GetExtension(UploadLogo.FileName);
                    var uploadPathWithfileName = Path.Combine(uploadPath, fileName);
                    var uploadAbsolutePath = Path.Combine(WebRootPath, uploadPathWithfileName);
                    using (var fileStream = new FileStream(uploadAbsolutePath, FileMode.Create))
                    {
                        await UploadLogo.CopyToAsync(fileStream);
                    }

                    return fileName;
                }
            }
            catch { }

            return null;
        }

        ///// <summary>
        ///// 
        ///// </summary>
        ///// <param name="videoFileName"></param>
        ///// <param name="WebRootPath"></param>
        ///// <param name="folder"></param>
        ///// <returns></returns>
        //public static async Task<String> Thumbnail(string videoFileName, string WebRootPath, string folder)
        //{
        //    try
        //    {
        //        string path_Root = WebRootPath;
        //        string uploadPath = path_Root + "/uploads/" + folder + "/";
        //        var fileName = Guid.NewGuid().ToString().Replace("-", "") + ".png";
        //        var InputFilePathname = Path.Combine(uploadPath, videoFileName);
        //        var InputFilePath = Path.Combine(WebRootPath, InputFilePathname);

        //        var OutputFilePathname = Path.Combine(uploadPath, fileName);
        //        var OutputFilePath = Path.Combine(WebRootPath, OutputFilePathname);

        //        var FFmpegpath = "C:/FFmpeg/bin";
        //        FFmpeg.SetExecutablesPath(FFmpegpath, ffmpegExeutableName: "FFmpeg");

        //        IConversion conversion = await FFmpeg.Conversions.FromSnippet.Snapshot(InputFilePath, OutputFilePath, TimeSpan.FromSeconds(0));
        //        IConversionResult result = await conversion.Start();

        //        return fileName;
        //    }
        //    catch { }
        //    return null;
        //}
    }
}