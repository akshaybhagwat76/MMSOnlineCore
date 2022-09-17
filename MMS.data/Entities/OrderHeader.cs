namespace MMS.data.Entities
{
    public class OrderHeader
    {
        public string OrderNumber { get; set; }
        public System.DateTime? EffectiveDate { get; set; }
        public System.DateTime? ExpirationDate { get; set; }
        public bool Status { get; set; }
        public string PaymentReceiptURL { get; set; }
        public int TotalRecord { get; set; }
    }
}
