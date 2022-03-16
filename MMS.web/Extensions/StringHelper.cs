using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

/// <summary>
/// 
/// </summary>
public static class StringHelper
{
    /// <summary>
    /// 
    /// </summary>
    /// <param name="str"></param>
    /// <returns></returns>
    public static string ToTitleCase(this string str)
    {
        var tokens = str.Split(new[] { " ", "-" }, StringSplitOptions.RemoveEmptyEntries);
        for (var i = 0; i < tokens.Length; i++)
        {
            var token = tokens[i];
            tokens[i] = token == token.ToLower()
                ? token
                : token.Substring(0, 1).ToUpper() + token.Substring(1).ToLower();
        }

        return string.Join(" ", tokens);
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="str"></param>
    /// <returns></returns>
    public static Int64 ToDecode(this string str)
    {

        if (string.IsNullOrWhiteSpace(str))
            return 0;
        try
        {
            return Convert.ToInt64(General.Decode(str));
        }
        catch
        {
            return 0;
        }


    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="orig"></param>
    /// <returns></returns>
    public static string ToSeoUrl(this string orig)
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
    /// <param name="str"></param>
    /// <returns></returns>
    public static string ToEncode(this decimal str)
    {
        try
        {
            return General.Encode(str.ToString());
        }
        catch
        {
            return "";
        }


    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="str"></param>
    /// <returns></returns>
    public static string ToEncode(this decimal? str)
    {

        if (str == null)
            return "";
        try
        {
            return General.Encode(str.ToString());
        }
        catch
        {
            return "";
        }


    }
    /// <summary>
    /// 
    /// </summary>
    /// <param name="str"></param>
    /// <returns></returns>
    public static string ToEncode(this int str)
    {
        try
        {
            return General.Encode(str.ToString());
        }
        catch
        {
            return "";
        }
    }
    /// <summary>
    /// 
    /// </summary>
    /// <param name="str"></param>
    /// <returns></returns>
    public static string ToEncode(this int? str)
    {

        if (str == 0)
            return "";
        try
        {
            return General.Encode(str.ToString());
        }
        catch
        {
            return "";
        }


    }
    /// <summary>
    /// 
    /// </summary>
    /// <param name="str"></param>
    /// <returns></returns>
    public static string ToEncode(this long? str)
    {

        if (str == null)
            return "";
        try
        {
            return General.Encode(str.ToString());
        }
        catch
        {
            return "";
        }


    }
    /// <summary>
    /// 
    /// </summary>
    /// <param name="str"></param>
    /// <returns></returns>
    public static string ToEncode(this string str)
    {

        if (str == null)
            return "";
        try
        {
            return General.Encode(str.ToString());
        }
        catch
        {
            return "";
        }


    }
    /// <summary>
    /// 
    /// </summary>
    /// <param name="str"></param>
    /// <returns></returns>
    public static string FormatPrice(this decimal? str)
    {
        if (str == null)
            return "0.00";
        try
        {
            return String.Format("{0:0.00}", Math.Round(str.Value, 2, MidpointRounding.AwayFromZero));
        }
        catch
        {
            return "0.00";
        }
    }
    /// <summary>
    /// 
    /// </summary>
    /// <param name="utcdate"></param>
    /// <returns></returns>
    public static DateTime? ToIST(this DateTime? utcdate)
    {
        if (utcdate == null)
            return null;
        try
        {
            return TimeZoneInfo.ConvertTimeFromUtc(utcdate.Value, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time"));
        }
        catch
        {
            return null;
        }
    }
    /// <summary>
    /// 
    /// </summary>
    /// <typeparam name="T"></typeparam>
    /// <param name="value"></param>
    /// <returns></returns>
    public static T ToEnum<T>(this string value)
    {
        return (T)Enum.Parse(typeof(T), value, true);
    }
    /// <summary>
    /// 
    /// </summary>
    /// <param name="str"></param>
    /// <returns></returns>
    public static bool isEmail(this string str)
    {
        string pattern = @"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$";
        RegexOptions options = RegexOptions.Compiled | RegexOptions.IgnoreCase | RegexOptions.ExplicitCapture;

        if (str == null)
            return false;
        try
        {
            return Regex.IsMatch(str, pattern, options);
        }
        catch
        {
            return false;
        }


    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="str"></param>
    /// <returns></returns>
    public static bool isPhoneNumber(this string str)
    {
        string pattern = @"^\d+$";
        RegexOptions options = RegexOptions.Compiled | RegexOptions.IgnoreCase | RegexOptions.ExplicitCapture;

        if (str == null)
            return false;
        try
        {
            if (Regex.IsMatch(str, pattern, options) && str.Length <= 15)
                return true;
            else
                return false;

            //return Regex.IsMatch(str, pattern, options);
        }
        catch
        {
            return false;
        }


    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="str"></param>
    /// <returns></returns>
    public static string Base64ForUrlEncode(this string str)
    {
        var buffer = Encoding.UTF8.GetBytes(str);
        return UrlTokenEncode(buffer);
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="str"></param>
    /// <returns></returns>
    public static string Base64ForUrlDecode(this string str)
    {
        var buffer = UrlTokenDecode(str);
        return buffer != null ? Encoding.UTF8.GetString(buffer) : null;
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="input"></param>
    /// <returns></returns>
    private static string UrlTokenEncode(byte[] input)
    {
        if (input == null)
            throw new ArgumentNullException(nameof(input));
        if (input.Length < 1)
            return string.Empty;

        ////////////////////////////////////////////////////////
        // Step 1: Do a Base64 encoding
        var base64String = Convert.ToBase64String(input);
        if (base64String == null)
            return null;

        int endPosition;
        ////////////////////////////////////////////////////////
        // Step 2: Find how many padding chars are present in the end
        for (endPosition = base64String.Length; endPosition > 0; endPosition--)
        {
            if (base64String[endPosition - 1] != '=') // Found a non-padding char!
            {
                break; // Stop here
            }
        }

        ////////////////////////////////////////////////////////
        // Step 3: Create char array to store all non-padding chars,
        //      plus a char to indicate how many padding chars are needed
        var base64Chars = new char[endPosition + 1];
        base64Chars[endPosition] = (char)('0' + base64String.Length - endPosition); // Store a char at the end, to indicate how many padding chars are needed

        ////////////////////////////////////////////////////////
        // Step 3: Copy in the other chars. Transform the "+" to "-", and "/" to "_"
        for (var i = 0; i < endPosition; i++)
        {
            var character = base64String[i];

            switch (character)
            {
                case '+':
                    base64Chars[i] = '-';
                    break;

                case '/':
                    base64Chars[i] = '_';
                    break;

                case '=':
                    //Debug.Assert(false);
                    base64Chars[i] = character;
                    break;

                default:
                    base64Chars[i] = character;
                    break;
            }
        }
        return new string(base64Chars);
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="input"></param>
    /// <returns></returns>
    private static byte[] UrlTokenDecode(string input)
    {
        if (input == null)
            throw new ArgumentNullException(nameof(input));

        var inputLength = input.Length;
        if (inputLength < 1)
            return new byte[0];

        ///////////////////////////////////////////////////////////////////
        // Step 1: Calculate the number of padding chars to append to this string.
        //         The number of padding chars to append is stored in the last char of the string.
        var paddingCharacters = input[inputLength - 1] - '0';
        if (paddingCharacters < 0 || paddingCharacters > 10)
            return null;


        ///////////////////////////////////////////////////////////////////
        // Step 2: Create array to store the chars (not including the last char)
        //          and the padding chars
        var base64Chars = new char[inputLength - 1 + paddingCharacters];


        ////////////////////////////////////////////////////////
        // Step 3: Copy in the chars. Transform the "-" to "+", and "*" to "/"
        for (var i = 0; i < inputLength - 1; i++)
        {
            var character = input[i];

            switch (character)
            {
                case '-':
                    base64Chars[i] = '+';
                    break;

                case '_':
                    base64Chars[i] = '/';
                    break;

                default:
                    base64Chars[i] = character;
                    break;
            }
        }

        ////////////////////////////////////////////////////////
        // Step 4: Add padding chars
        for (var i = inputLength - 1; i < base64Chars.Length; i++)
        {
            base64Chars[i] = '=';
        }

        // Do the actual conversion
        return Convert.FromBase64CharArray(base64Chars, 0, base64Chars.Length);
    }
}

/// <summary>
/// 
/// </summary>
public static class DoubleHelper
{
    /// <summary>
    /// 
    /// </summary>
    /// <param name="str"></param>
    /// <returns></returns>
    public static Double ToRound(this Double str)
    {
 
        return Math.Round(str, 2, MidpointRounding.AwayFromZero);
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="str"></param>
    /// <returns></returns>
    public static Double ToRound(this Double? str)
    {
        if (str == null)
            return 0;

        return Math.Round(str.Value, 2);
    }
}

/// <summary>
/// 
/// </summary>
public static class Extensions
{
    /// <summary>
    ///     A generic extension method that aids in reflecting 
    ///     and retrieving any attribute that is applied to an `Enum`.
    /// </summary>
    public static TAttribute GetAttribute<TAttribute>(this Enum enumValue)
            where TAttribute : Attribute
    {
        try
        {
            return enumValue.GetType()
                        .GetMember(enumValue.ToString())
                        .First()
                        .GetCustomAttribute<TAttribute>();
        }
        catch (Exception)
        {

            return null;
        }
        
    }

    /// <summary>
    /// 
    /// </summary>
    /// <typeparam name="T"></typeparam>
    /// <param name="value"></param>
    /// <returns></returns>
    public static T ParseEnum<T>(string value)
    {
        return (T)Enum.Parse(typeof(T), value, true);
    }

   
     
}

