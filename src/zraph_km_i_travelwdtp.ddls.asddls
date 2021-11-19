@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'travel interface views with DTP'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZRAPH_KM_I_TravelWDTP
  as select from zraph_km_travel
  composition [0..*] of ZRAPH_KM_I_BookingWDTP         as _Booking
  composition [0..*] of ZRAPH_KM_I_RoomReservationWDTP as _RoomReservation
  
  association [0..1] to /DMO/I_Agency             as _Agency       on $projection.AgencyId = _Agency.AgencyID
  association [0..1] to /DMO/I_Customer           as _Customer     on $projection.CustomerId = _Customer.CustomerID
  association [0..1] to I_Currency                as _Currency     on $projection.CurrencyCode = _Currency.Currency
  association [0..1] to ZRAPH_I_OverallStatus     as _TravelStatus on $projection.OverallStatus = _TravelStatus.TravelStatus

{
  key travel_uuid           as TravelUuid,
      travel_id             as TravelId,
      agency_id             as AgencyId,
      customer_id           as CustomerId,
      begin_date            as BeginDate,
      end_date              as EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee           as BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price           as TotalPrice,
      currency_code         as CurrencyCode,
      description           as Description,
      overall_status        as OverallStatus,
      local_created_by      as LocalCreatedBy,
      local_created_at      as LocalCreatedAt,
      local_last_changed_by as LocalLastChangedBy,
      local_last_changed_at as LocalLastChangedAt,
      last_changed_at       as LastChangedAt,
      //Associations
      _Booking,
      _RoomReservation,
      
      _Agency,
      _Customer,
      _Currency,
      _TravelStatus
}
