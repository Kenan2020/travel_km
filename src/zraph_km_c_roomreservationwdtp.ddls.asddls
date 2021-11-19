@EndUserText.label: 'room reservation C'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true

define view entity ZRAPH_KM_C_RoomReservationWDTP
  as projection on ZRAPH_KM_I_RoomReservationWDTP
{
  key RoomrsvUuid,
      TravelUuid,
      RoomrsvId,
      
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: ['HotelName']
      @Consumption.valueHelpDefinition: [ {entity: {name: 'ZRAPH_I_HOTEL', element: 'HotelID' } } ]
      HotelId,
      _Hotel.Name as HotelName,
      _Hotel.City as City,
      BeginDate,
      EndDate,

      @Consumption.valueHelpDefinition: [{ entity: { name:    'ZRAPH_I_HotelRoomType',
                                                     element: 'Value'  } }]
      @ObjectModel.text.element: ['RoomTypeText']
      @Search.defaultSearchElement: true
      RoomType,
      _HotelRoomType.Text as RoomTypeText,
      RoomrsvPrice,

      @Consumption.valueHelpDefinition: [{entity: {name: 'I_Currency', element: 'Currency' }}]
      
      CurrencyCode,
      LocalLastChangedAt,
      /* Associations */
      _Hotel,
      _HotelRoomType,
      _Travel : redirected to parent ZRAPH_KM_C_TravelWDTP
}
