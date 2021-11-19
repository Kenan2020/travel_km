@EndUserText.label: 'booking C'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true

define view entity ZRAPH_KM_C_BookingWDTP
  as projection on ZRAPH_KM_I_BookingWDTP
{
  key BookingUuid,
      TravelUuid,
      @Search.defaultSearchElement: true
      BookingId,
      BookingDate,

      @ObjectModel.text.element: ['CustomerName']
      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [{entity: {name: '/DMO/I_Customer', element: 'CustomerID' }}]
      CustomerId,
      _Customer.LastName as CustomerName,

      @ObjectModel.text.element: ['CarrierName']
      @Consumption.valueHelpDefinition: [{entity: {name: '/DMO/I_Carrier', element: 'AirlineID' }}]
      CarrierId,
      _Carrier.Name      as CarrierName,

      @Consumption.valueHelpDefinition: [ {entity: {name: '/DMO/I_Flight', element: 'ConnectionID'},
                     additionalBinding: [ { localElement: 'FlightDate',   element: 'FlightDate'},
                                          { localElement: 'CarrierID',    element: 'AirlineID'},
                                          { localElement: 'FlightPrice',  element: 'Price', usage: #RESULT},
                                          { localElement: 'CurrencyCode', element: 'CurrencyCode', usage: #RESULT } ] } ]
      ConnectionId,
      FlightDate,

      @Consumption.valueHelpDefinition: [ {entity: {name: '/DMO/I_Flight', element: 'ConnectionID'},
                     additionalBinding: [ { localElement: 'FlightDate',   element: 'FlightDate'},
                                          { localElement: 'CarrierID',    element: 'AirlineID'},
                                          { localElement: 'FlightPrice',  element: 'Price', usage: #RESULT },
                                          { localElement: 'CurrencyCode', element: 'CurrencyCode', usage: #RESULT } ] } ]
      FlightPrice,

      @Consumption.valueHelpDefinition: [{entity: {name: 'I_Currency', element: 'Currency' }}]

      CurrencyCode,
      BookingStatus,
      LocalLastChangedAt,
      Criticality,
      
      @ObjectModel.virtualElementCalculatedBy:'ABAP:ZRAPH_KM_CL_DAYS_TO_FLIGHT'
      virtual DaysToFlight: abap.int2,
      
      /* Associations */
      _BookingSupplement : redirected to composition child ZRAPH_KM_C_BookingSupplWDTP,
      _Carrier,
      _Connection,
      _Customer,
      _Travel            : redirected to parent ZRAPH_KM_C_TravelWDTP
}
