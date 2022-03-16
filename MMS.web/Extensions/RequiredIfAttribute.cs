using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

/// <summary>
/// 
/// </summary>
public class RequiredIfAttribute : ValidationAttribute 
{
    private String PropertyName { get; set; }
    private Object DesiredValue { get; set; }
    private readonly RequiredAttribute _innerAttribute;

    /// <summary>
    /// 
    /// </summary>
    /// <param name="propertyName"></param>
    /// <param name="desiredvalue"></param>
    public RequiredIfAttribute(String propertyName, Object desiredvalue)
    {
        PropertyName = propertyName;
        DesiredValue = desiredvalue;
        _innerAttribute = new RequiredAttribute();
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="value"></param>
    /// <param name="context"></param>
    /// <returns></returns>
    protected override ValidationResult IsValid(object value, ValidationContext context)
    {
        var dependentValue = context.ObjectInstance.GetType().GetProperty(PropertyName).GetValue(context.ObjectInstance, null);
        if (dependentValue.ToString() == DesiredValue.ToString())
        {
            if (!_innerAttribute.IsValid(value))
            {
                return new ValidationResult(FormatErrorMessage(context.DisplayName), new[] { context.MemberName });
            }
        }
        return ValidationResult.Success;
    }

    
}


    /*
public class RequiredIfAttribute : RequiredAttribute
{
    private String PropertyName { get; set; }
    private Object DesiredValue { get; set; }

    public RequiredIfAttribute(String propertyName, Object desiredvalue)
    {
        PropertyName = propertyName;
        DesiredValue = desiredvalue;
    }

    protected override ValidationResult IsValid(object value, ValidationContext context)
    {
        Object instance = context.ObjectInstance;
        Type type = instance.GetType();
        Object proprtyvalue = type.GetProperty(PropertyName).GetValue(instance, null);
        if (proprtyvalue.ToString() == DesiredValue.ToString())
        {
            ValidationResult result = base.IsValid(value, context);
            return result;
        }
        return ValidationResult.Success;
    }
}*/

