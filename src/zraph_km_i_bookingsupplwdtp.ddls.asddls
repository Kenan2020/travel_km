@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'bookingsup interface views with DTP'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZRAPH_KM_I_BookingSupplWDTP
  as select from zraph_km_booksup
  association        to parent ZRAPH_KM_I_BookingWDTP as _Booking on $projection.BookingUuid = _Booking.BookingUuid
  association [1..1] to ZRAPH_KM_I_TravelWDTP         as _Travel  on $projection.TravelUuid = _Travel.TravelUuid
  
  association [1..1] to /DMO/I_Supplement          as _Product        on $projection.SupplementId = _Product.SupplementID
  association [1..*] to /DMO/I_SupplementText      as _SupplementText on $projection.SupplementId = _SupplementText.SupplementID
{
  key booksuppl_uuid        as BooksupplUuid,
      root_uuid             as TravelUuid,
      parent_uuid           as BookingUuid,
      booking_supplement_id as BookingSupplementId,
      supplement_id         as SupplementId,
      @Semantics.amount.currencyCode : 'CurrencyCode'
      price                 as Price,
      currency_code         as CurrencyCode,
      local_last_changed_at as LocalLastChangedAt,
      //Associations
      _Booking,
      _Travel,
      
      _Product,
      _SupplementText
}
