using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace MMS.web.Areas.Admin.ViewModels.Input
{
	/// <summary>
	/// 
	/// </summary>
    public class RepresentativeModel
    {
		/// <summary>
		///  Name (System.String )
		/// </summary>
		public System.String Name { get; set; }
		public System.String UserName { get; set; }

		/// <summary>
		///  Email (System.String )
		/// </summary>
		public System.String Email { get; set; }
		/// <summary>
		///  OfficePhone (System.String )
		/// </summary>
		public System.String OfficePhone { get; set; }
		/// <summary>
		///  CellPhone (System.String )
		/// </summary>
		public System.String CellPhone { get; set; }
		/// <summary>
		///  ImageURL (System.String )
		/// </summary>
		public System.String ImageURL { get; set; }
		/// <summary>
		///  Notes (System.String )
		/// </summary>
		public System.String Notes { get; set; }
		/// <summary>
		/// 
		/// </summary>
		[Required(ErrorMessage = "Please enter message")]
		public string Message { get; set; }
    }
}
