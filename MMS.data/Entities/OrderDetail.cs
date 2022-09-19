namespace MMS.data.Entities
{
    public class OrderDetail
    {
        public string OrderNumber { get; set; }
        public string ItemName { get; set; }
        public string OrderedWeight { get; set; }
        public string ReceivedWeight { get; set; }
        public string DueWeight { get; set; }
        public string Price { get; set; }
    }
}
