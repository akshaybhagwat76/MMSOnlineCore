using MMS.web.Config;
using Microsoft.Extensions.Options;
using System;
using System.Linq;
using System.Security.Cryptography;
using System.Text;

/// <summary>
/// 
/// </summary>
public class General
{

    /// <summary>
    /// 
    /// </summary>
    public static string AppName = "MMS Online";

    /// <summary>
    /// 
    /// </summary>
    public static string BuildVersion = System.Reflection.Assembly.GetExecutingAssembly().GetName().Version.ToString();

    /// <summary>
    /// 
    /// </summary>
    public static int PageSize = 25;

    /// <summary>
    /// 
    /// </summary>
    public static int BlogCatID = 5;

    /// <summary>
    /// 
    /// </summary>
    public static string defaultPassword = "23112c31-749c-48b8-902d-18c5df96b9a3A";

    /// <summary>
    /// 
    /// </summary>
    /// <param name="length"></param>
    /// <returns></returns>
    public static string GenerateToken(int length)
    {
        RNGCryptoServiceProvider cryptRNG = new RNGCryptoServiceProvider();
        byte[] tokenBuffer = new byte[length];
        cryptRNG.GetBytes(tokenBuffer);
        return Convert.ToBase64String(tokenBuffer);
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="length"></param>
    /// <returns></returns>
    public static string tempUsername(int length = 10)
    {
        const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        var random = new Random();
        var uname = new string(Enumerable.Repeat(chars, length).Select(s => s[random.Next(s.Length)]).ToArray());
        return uname;
    }
    private static string GetVersion(IOptions<AppConfig> config)
    {
        return config.Value.Version;
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="config"></param>
    /// <returns></returns>
    public static string getBaseUrl(IOptions<AppConfig> config)
    {
        return config.Value.ApplicationUrl;
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="ImageName"></param>
    /// <param name="config"></param>
    /// <returns></returns>
    public static string GetImageUrl(string ImageName, IOptions<AppConfig> config)
    {
        return getBaseUrl(config) + ImageName + "?v=" + GetVersion(config);
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="encodeMe"></param>
    /// <returns></returns>
    public static string Encode(string encodeMe)
    {

        byte[] encoded = System.Text.Encoding.UTF8.GetBytes(encodeMe);
        return System.Net.WebUtility.UrlEncode(Convert.ToBase64String(encoded));
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="decodeMe"></param>
    /// <returns></returns>
    public static string Decode(string decodeMe)
    {
        if (decodeMe == null)
            return "";

        decodeMe = System.Net.WebUtility.UrlDecode(decodeMe);
        byte[] encoded = Convert.FromBase64String(decodeMe);
        return System.Text.Encoding.UTF8.GetString(encoded);
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="filename"></param>
    /// <returns></returns>
    public static string CorrectFilename(string filename)
    {
        if (filename.Contains("\\"))
            filename = filename.Substring(filename.LastIndexOf("\\") + 1);

        return filename;
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="dateOfBirth"></param>
    /// <returns></returns>

    public static int GetAge(DateTime dateOfBirth)
    {
        var today = DateTime.Today;

        var a = (today.Year * 100 + today.Month) * 100 + today.Day;
        var b = (dateOfBirth.Year * 100 + dateOfBirth.Month) * 100 + dateOfBirth.Day;

        return (a - b) / 10000;
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="len"></param>
    /// <param name="name"></param>
    /// <returns></returns>

    public static string GenerateName(int len, string name)
    {
        Random r = new Random();
        string[] consonants = { "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "l", "n", "p", "q", "r", "s", "sh", "zh", "t", "v", "w", "x" };
        string[] vowels = { "a", "e", "i", "o", "u", "ae", "y" };
        string Name = "";
        Name += consonants[r.Next(consonants.Length)].ToUpper();
        Name += vowels[r.Next(vowels.Length)];
        int b = 2; //b tells how many times a new letter has been added. It's 2 right now because the first two letters are already in the name.
        while (b < len)
        {
            Name += consonants[r.Next(consonants.Length)];
            b++;
            Name += vowels[r.Next(vowels.Length)];
            b++;
        }

        return (name.Split(" ")[0] + "@" + Name).ToLower();


    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="dateTime"></param>
    /// <returns></returns>
    public static string NotificationDateTime(DateTime dateTime)
    {
        const int SECOND = 1;
        const int MINUTE = 60 * SECOND;
        const int HOUR = 60 * MINUTE;
        const int DAY = 24 * HOUR;
        const int MONTH = 30 * DAY;

        var ts = new TimeSpan(DateTime.Now.Ticks - dateTime.Ticks);
        double delta = Math.Abs(ts.TotalSeconds);

        if (delta < 1 * SECOND)
            return ts.Seconds == 1 ? "one second ago" : ts.Seconds + " seconds ago";

        if (delta < 2 * MINUTE)
            return "a minute ago";

        if (delta < 45 * MINUTE)
            return ts.Minutes + " minutes ago";

        if (delta < 90 * MINUTE)
            return "an hour ago";

        if (delta < 24 * HOUR)
            return ts.Hours + " hours ago";

        if (delta < 48 * HOUR)
            return "yesterday";

        if (delta < 30 * DAY)
            return ts.Days + " days ago";

        if (delta < 12 * MONTH)
        {
            int months = Convert.ToInt32(Math.Floor((double)ts.Days / 30));
            return months <= 1 ? "one month ago" : months + " months ago";
        }
        else
        {
            int years = Convert.ToInt32(Math.Floor((double)ts.Days / 365));
            return years <= 1 ? "one year ago" : years + " years ago";
        }
    }


    /// <summary>
    /// 
    /// </summary>
    /// <param name="orig"></param>
    /// <returns></returns>
    static public string removeSpecialCharacters(string orig)
    {
        string rv;
        // replacing with space allows the camelcase to work a little better in most cases.
        rv = orig.Replace("\\", "");
        rv = rv.Replace("(", "");
        rv = rv.Replace(")", "");
        rv = rv.Replace("/", "");
        rv = rv.Replace(",", "");
        rv = rv.Replace(">", "");
        rv = rv.Replace("<", "");
        rv = rv.Replace("&", "");
        rv = rv.Replace("'", "");
        rv = rv.Replace("\u2019", "");
        rv = rv.Replace("   ", "");
        rv = rv.Replace("  ", "");
        rv = rv.Replace("£", "");
        rv = rv.Replace("¬", "");
        rv = rv.Replace("$", "");
        rv = rv.Replace("%", "");
        rv = rv.Replace("^", "");
        rv = rv.Replace("*", "");
        rv = rv.Replace(":", "");
        rv = rv.Replace(";", "");
        rv = rv.Replace("@", "");
        rv = rv.Replace("#", "");
        rv = rv.Replace("~", "");
        rv = rv.Replace("[", "");
        rv = rv.Replace("]", "");
        rv = rv.Replace("{", "");
        rv = rv.Replace("}", "");
        rv = rv.Replace("?", "");
        rv = rv.Replace("+", "");
        rv = rv.Replace("+", "");
        rv = rv.Replace("`", "");
        rv = rv.Replace("!", "");
        //rv = rv.Replace(".", "");
        rv = rv.Replace('"', '-');
        rv = rv.Replace(" ", "-");
        rv = rv.Replace("=", "");
        rv = rv.Replace("|", "");
        rv = rv.Trim(' ');
        return (rv);
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="result"></param>
    public static void AddExcludingUsaAddress(ref System.Collections.Generic.Dictionary<string, string> result)
    {

        result.Add("ClaimAddress1", "Paramount Healthcare Management Pvt.Ltd. Travel Health Dept., 401 - 402, Sumer Plaza,");
        result.Add("ClaimAddress2", "Marol Maroshi Road, Marol, Andheri (East). Mumbai - 400059");
        result.Add("ClaimTelephone", "0912240004219/207");
        result.Add("ClaimFax", "0091 22 40004280");
        result.Add("ClaimUsTollFree", "866 978 5205");
        result.Add("ClaimEmail", "travelhealth@paramount.healthcare");
        result.Add("ClaimWebsite", "https://www.paramount.healthcare/ProviderNetwork.aspx");
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="result"></param>
    public static void AddIncludingUsaAddress(ref System.Collections.Generic.Dictionary<string, string> result)
    {

        result.Add("ClaimAddress1", "Europ Assistance India Pvt. Ltd. Star Hub Building No.2 , 7th Floor,");
        result.Add("ClaimAddress2", "Near ITC Maratha Hotel, Sahar, Andheri (East), Mumbai - 400059");
        result.Add("ClaimTelephone", "0091 22 67872021");
        result.Add("ClaimFax", "");
        result.Add("ClaimUsTollFree", "833 428 8421");
        result.Add("ClaimEmail", "iffcotokiotravel@europ-assistance.in");
        result.Add("ClaimWebsite", "http://www.europ-assistance.in/");

    }

    /// <summary>
    /// 
    /// </summary>
    public static string GetExcludingUsaAddress()
    {
        StringBuilder address = new StringBuilder();
        address.Append("<strong>Paramount Healthcare Management Pvt.Ltd.</strong> <br />");
        address.Append("Travel Health Dept., 401 - 402, Sumer Plaza, Marol Maroshi Road, Marol, Andheri (East). Mumbai - 400059 <br />");
        address.Append("Tel: 0912240004219/207, Fax: 0912240004280 <br />");
        address.Append("<strong>Us Toll free: 8669785205</strong> <br />");
        address.Append("Email: travelhealth@paramount.healthcare <br /> website: https://paramount.healthcare/ProviderNetwork.aspx");
       return  address.ToString();

    }

    /// <summary>
    /// 
    /// </summary>
    /// <returns></returns>
    public static string GetIncludingUsaAddress()
    {
        StringBuilder address = new StringBuilder();
        address.Append("<strong>Europ Assistance India Pvt. Ltd.</strong> <br />");
        address.Append("Star Hub Building No.2 , 7th Floor, Near ITC Maratha Hotel, Sahar, Andheri (East), Mumbai - 400059<br />");
        address.Append("Tel: 0091 22 67872021 <br />");
        address.Append("<strong>Us Toll free: 833 428 8421</strong><br />");
        address.Append("Email: iffcotokiotravel@europ-assistance.in <br />  website: http://www.europ-assistance.in/");
        return address.ToString();
    }

}