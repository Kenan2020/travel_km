@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'room reservation interface WDTP'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZRAPH_KM_I_RoomReservationWDTP
  as select from zraph_km_roomrsv
  association to parent ZRAPH_KM_I_TravelWDTP as _Travel on $projection.TravelUuid = _Travel.TravelUuid
  
  association [1..1] to ZRAPH_I_HOTEL             as _Hotel         on $projection.HotelId  = _Hotel.HotelID
  association [1..1] to ZRAPH_I_HotelRoomType     as _HotelRoomType on $projection.RoomType = _HotelRoomType.Value
{
  key roomrsv_uuid          as RoomrsvUuid,
      parent_uuid           as TravelUuid,
      roomrsv_id            as RoomrsvId,
      hotel_id              as HotelId,
      begin_date            as BeginDate,
      end_date              as EndDate,
      room_type             as RoomType,
      @Semantics.amount.currencyCode : 'CurrencyCode'
      roomrsv_price         as RoomrsvPrice,
      currency_code         as CurrencyCode,
      local_last_changed_at as LocalLastChangedAt,
      //Association
      _Travel,
      
      _Hotel,
      _HotelRoomType
}
