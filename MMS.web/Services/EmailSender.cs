
using MMS.web.Config;
using MailKit.Net.Smtp;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Options;
using MimeKit;
using MimeKit.Text;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace MMS.web.Services
{
    /// <summary>
    /// 
    /// </summary>
    public class EmailSender : IEmailSender
    {
        private readonly EmailConfig ec;
        private readonly IHostingEnvironment _appEnvironment;
        
        /// <summary>
        /// 
        /// </summary>
        /// <param name="emailConfig"></param>
        /// <param name="appEnvironment"></param>
        public EmailSender(IOptions<EmailConfig> emailConfig, IHostingEnvironment appEnvironment)
        {
            this.ec = emailConfig.Value;
            _appEnvironment = appEnvironment;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="email"></param>
        /// <param name="subject"></param>
        /// <param name="message"></param>
        /// <returns></returns>
        public async Task SendEmailAsync(string email, string subject, string message)
        {
            try
            {
                string BodyContent = message;

                var mimeMessage = new MimeMessage();
                mimeMessage.From.Add(new MailboxAddress(ec.FromName, ec.FromAddress));
                mimeMessage.To.Add(new MailboxAddress("", email));
                mimeMessage.Subject = subject;
                mimeMessage.Body = new TextPart(TextFormat.Html)
                {
                    Text = BodyContent
                };

                using (var client = new SmtpClient())
                {
                    client.Connect(ec.MailServerAddress, Convert.ToInt32(ec.MailServerPort), false);
                    client.Authenticate(ec.UserId, ec.UserPassword);
                    await client.SendAsync(mimeMessage);
                    await client.DisconnectAsync(true);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="email"></param>
        /// <param name="subject"></param>
        /// <param name="data"></param>
        /// <returns></returns>
        public async Task SendActivationEmailAsync(string email, string subject, Dictionary<string, string> data)
        {
            try
            {
                var emailMessage = new MimeMessage();
                emailMessage.From.Add(new MailboxAddress(ec.FromName, ec.FromAddress));
                emailMessage.To.Add(new MailboxAddress("", email));
                emailMessage.Subject = subject;
 
                var builder = new BodyBuilder();
                string contentRootPath = _appEnvironment.ContentRootPath;
                using (StreamReader SourceReader = System.IO.File.OpenText(contentRootPath + @"\wwwroot\template\activation_email.html"))
                {
                    builder.HtmlBody = SourceReader.ReadToEnd();
                }
                if (data != null && data.Count > 0)
                {
                    foreach (var entry in data)
                    {
                        builder.HtmlBody = builder.HtmlBody.Replace(entry.Key, entry.Value);
                    }
                }
                emailMessage.Body = builder.ToMessageBody();


                using (var client = new SmtpClient())
                {
                    client.Connect(ec.MailServerAddress, Convert.ToInt32(ec.MailServerPort), false);
                    client.Authenticate(ec.UserId, ec.UserPassword);
                    await client.SendAsync(emailMessage);
                    await client.DisconnectAsync(true);
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

 
        /// <summary>
        /// 
        /// </summary>
        /// <param name="email"></param>
        /// <param name="subject"></param>
        /// <param name="data"></param>
        /// <param name="template">html template file name</param>
        /// <returns></returns>
        public async Task SendEmailAsync(string email, string subject, Dictionary<string, string> data ,string template)
        {
            try
            {
                ////From Address  
                //string FromAddress = "mms@metalx.net";
                //string FromAdressTitle = "Email from Second Family";
                ////To Address  
                //string ToAddress = "akshaybhagwat76@gmail.com";
                //string ToAdressTitle = "Second Family";
                //string Subject = "";
                //string BodyContent = "";

                ////Smtp Server  
                //string SmtpServer = "10.110.1.11";
                ////Smtp Port Number  
                //int SmtpPortNumber = 25;

                //var mimeMessage = new MimeMessage();
                //mimeMessage.From.Add(new MailboxAddress(FromAdressTitle, FromAddress));
                //mimeMessage.To.Add(new MailboxAddress(ToAdressTitle, ToAddress));
                //mimeMessage.Subject = Subject;
                //BodyContent += @"Dear saf .";
                //BodyContent += "Your Donation Was Successfull !Thank you for Your Support to Second families!<br /><br />";



                //using (var client = new SmtpClient())
                //{
                //    await client.ConnectAsync(SmtpServer, SmtpPortNumber, false).ConfigureAwait(false);
                //    client.AuthenticationMechanisms.Remove("XOAUTH2");
                //    await client.AuthenticateAsync("mms@metalx.net", ec.UserPassword)
                //        .ConfigureAwait(false);
                //    await client.SendAsync(mimeMessage).ConfigureAwait(false);
                //    await client.DisconnectAsync(true).ConfigureAwait(false);
                //}

                if (string.IsNullOrWhiteSpace(template))
                    throw new Exception("template file is required");

                var emailMessage = new MimeMessage();
                emailMessage.From.Add(new MailboxAddress(ec.FromName, ec.FromAddress));
                emailMessage.To.Add(new MailboxAddress("", email));
                emailMessage.Subject = subject;

                var builder = new BodyBuilder();
                string contentRootPath = _appEnvironment.ContentRootPath;
                using (StreamReader SourceReader = System.IO.File.OpenText(contentRootPath + @"\wwwroot\template\" + template))
                {
                    builder.HtmlBody = SourceReader.ReadToEnd();
                }
                if (data != null && data.Count > 0)
                {
                    foreach (var entry in data)
                    {
                        builder.HtmlBody = builder.HtmlBody.Replace(entry.Key, entry.Value);
                    }
                }
                emailMessage.Body = builder.ToMessageBody();


                using (var client = new SmtpClient())
                {
                    client.Connect(ec.MailServerAddress, Convert.ToInt32(ec.MailServerPort), false);
                    client.Authenticate(ec.UserId, ec.UserPassword);
                    await client.SendAsync(emailMessage);
                    await client.DisconnectAsync(true);
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
