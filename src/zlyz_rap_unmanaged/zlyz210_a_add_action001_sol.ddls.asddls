@EndUserText.label: 'Travel values for ADD_ACTION001'
define abstract entity ZLYZ210_A_ADD_ACTION001_SOL
{
  TravelID           : /dmo/travel_id;
  AgencyID           : /dmo/agency_id;
  CustomerID         : /dmo/customer_id;
  BeginDate          : /dmo/begin_date;
  EndDate            : /dmo/end_date;
  @Semantics.amount.currencyCode: 'CurrencyCode'
  BookingFee         : /dmo/booking_fee;
  @Semantics.amount.currencyCode: 'CurrencyCode'
  TotalPrice         : /dmo/total_price;
  CurrencyCode       : /dmo/currency_code;
  Description        : /dmo/description;
  OverallStatus      : /dmo/overall_status;
  Attachment         : /dmo/attachment;
  MimeType           : /dmo/mime_type;
  FileName           : /dmo/filename;
  CreatedBy          : abp_creation_user;
  CreatedAt          : abp_creation_tstmpl;
  LocalLastChangedBy : abp_locinst_lastchange_user;
  LocalLastChangedAt : abp_locinst_lastchange_tstmpl;
  LastChangedAt      : abp_lastchange_tstmpl;
}
