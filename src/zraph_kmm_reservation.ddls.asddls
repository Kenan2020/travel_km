@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'reservation'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZRAPH_KMM_RESERVATION as select from zraph_km_roomrsv as roomrsv
  association[1..1] to zraph_km_hotel as _hotel on _hotel.hotel_id = roomrsv.hotel_id {//roomrsv.hotel_id <=> $projection.HotelID
  key roomrsv_uuid as RoomReservationUUID,
  parent_uuid as TravelUUID,
  roomrsv_id as RoomReservationID,
  hotel_id as HotelID,
  begin_date as BeginDate,
  end_date as EndDate,
  room_type as RoomType,
  @Semantics.amount.currencyCode : 'CurrencyCode'
  roomrsv_price as RoomReservationPrice,
  currency_code as CurrencyCode,
  local_last_changed_at as LocalChangeAt,
  
  _hotel.name as Name,
  _hotel.city as City,
  _hotel.country as Country
}
