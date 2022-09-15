﻿using MMS.data.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MMS.web.Areas.Admin.ViewModels.Input
{
    public class OrderModel
    {
       
        public List<TicketDetails> TicketDetails { get; set; }
        public List<OrderDetails> orderDetails { get; set; }
        public string OrderNumber { get; set; }
        public System.DateTime? EffectiveDate { get; set; }
        public System.DateTime? ExpirationDate { get; set; }
        public bool Status { get; set; }

    }
    public class OrderDetails
    {
        public string OrderNumber { get; set; }
        public string ItemName { get; set; }
        public string OrderedWeight { get; set; }
        public string ReceivedWeight { get; set; }
        public string DueWeight { get; set; }
        public string Price { get; set; }




    }

}