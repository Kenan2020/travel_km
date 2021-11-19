@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'boking interface views with DTP'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZRAPH_KM_I_BookingWDTP
  as select from zraph_km_booking
  association        to parent ZRAPH_KM_I_TravelWDTP as _Travel     on  $projection.TravelUuid = _Travel.TravelUuid
  composition [0..*] of ZRAPH_KM_I_BookingSupplWDTP  as _BookingSupplement

  association [1..1] to /DMO/I_Customer              as _Customer   on  $projection.CustomerId = _Customer.CustomerID
  association [1..1] to /DMO/I_Carrier               as _Carrier    on  $projection.CarrierId = _Carrier.AirlineID
  association [1..1] to /DMO/I_Connection            as _Connection on  $projection.CarrierId    = _Connection.AirlineID
                                                                    and $projection.ConnectionId = _Connection.ConnectionID

{
  key booking_uuid          as BookingUuid,
      parent_uuid           as TravelUuid,
      booking_id            as BookingId,
      booking_date          as BookingDate,
      customer_id           as CustomerId,
      carrier_id            as CarrierId,
      connection_id         as ConnectionId,
      flight_date           as FlightDate,
      @Semantics.amount.currencyCode : 'CurrencyCode'
      flight_price          as FlightPrice,
      currency_code         as CurrencyCode,
      booking_status        as BookingStatus,
      local_last_changed_at as LocalLastChangedAt,

      case when $projection.FlightPrice <  200 then 3
           when $projection.FlightPrice >= 200 and $projection.FlightPrice < 500 then 2
           when $projection.FlightPrice >= 500 then 1
           else 0
      end                   as Criticality,

      //Associations
      _Travel,
      _BookingSupplement,

      _Customer,
      _Carrier,
      _Connection
}
