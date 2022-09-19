using System.Collections.Generic;
namespace MMS.web.Models
{
    /// <summary>
    /// 
    /// </summary>
    public class WeekDays
    {
        /// <summary>
        /// 
        /// </summary>
        public int day { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public string dayName { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public static List<WeekDays> GetList()
        {
            List<WeekDays> data = new List<WeekDays>();
            data.Add(new WeekDays { day = 1, dayName = "Monday" });
            data.Add(new WeekDays { day = 2, dayName = "Tuesday" });
            data.Add(new WeekDays { day = 3, dayName = "Wednesday" });
            data.Add(new WeekDays { day = 4, dayName = "Thursday" });
            data.Add(new WeekDays { day = 5, dayName = "Friday" });
            data.Add(new WeekDays { day = 6, dayName = "Saturday" });
            data.Add(new WeekDays { day = 7, dayName = "Sunday" });

            return data;
        }


    }
}
