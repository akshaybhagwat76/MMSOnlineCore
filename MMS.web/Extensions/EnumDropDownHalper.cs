using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Linq;
using System.Reflection;


/// <summary>
/// 
/// </summary>
public static class EnumDropDownHalper
{

    /// <summary>
    /// 
    /// </summary>
    /// <typeparam name="TEnum"></typeparam>
    /// <param name="obj"></param>
    /// <param name="selectedValue"></param>
    /// <returns></returns>
    public static SelectList ToSelectList<TEnum>(this TEnum obj, object selectedValue)
  where TEnum : struct, IComparable, IFormattable, IConvertible
    {
        return new SelectList(Enum.GetValues(typeof(TEnum)).OfType<Enum>()
            .Select(x =>
                new SelectListItem
                {
                    Text = x.DisplayName(),
                    Value = (Convert.ToInt32(x)).ToString()
                }), "Value", "Text", selectedValue);
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="value"></param>
    /// <returns></returns>
    public static string DisplayName(this Enum value)
    {
        FieldInfo field = value.GetType().GetField(value.ToString());

        EnumDisplayNameAttribute attribute
                = Attribute.GetCustomAttribute(field, typeof(EnumDisplayNameAttribute))
                    as EnumDisplayNameAttribute;

        return attribute == null ? value.ToString() : attribute.DisplayName;
    }
    //public static SelectList ToSelectList<TEnum>(this TEnum obj)
    //    where TEnum : struct, IComparable, IFormattable, IConvertible
    //{

    //    return new SelectList(Enum.GetValues(typeof(TEnum)).OfType<Enum>()
    //        .Select(x =>
    //            new SelectListItem
    //            {
    //                Text = Enum.GetName(typeof(TEnum), x),
    //                Value = (Convert.ToInt32(x)).ToString()
    //            }), "Value", "Text");
    //}

}

/// <summary>
/// 
/// </summary>
public class EnumDisplayNameAttribute : Attribute
{
    private string _displayName;

    /// <summary>
    /// 
    /// </summary>
    public string DisplayName
    {
        get { return _displayName; }
        set { _displayName = value; }
    }
}
