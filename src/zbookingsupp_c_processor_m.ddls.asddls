@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BookSuppl'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZBookingSupp_C_Processor_M as projection on ZBookingSupp_I_M
{
 key travel_id             as TravelID,
  key booking_id            as BookingID,
  key booking_supplement_id as BookingSupplementID,

  supplement_id             as SupplementID,
  _SupplementText.Description as SupplementDescription : localized,

  @Semantics.amount.currencyCode: 'CurrencyCode'
  price                     as Price,

  currency_code             as CurrencyCode,
  last_changed_at           as LastChangedAt,

  /* Associations */
  _Travel  : redirected to ZTRAVEL_C_PROCESSOR_M,
  _Booking : redirected to parent ZBooking_C_Processor_M,
  _Product
}
