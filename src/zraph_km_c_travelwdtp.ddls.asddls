@EndUserText.label: 'travel C'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true

define root view entity ZRAPH_KM_C_TravelWDTP
  provider contract transactional_query
  as projection on ZRAPH_KM_I_TravelWDTP
{
  key TravelUuid,
      @Search.defaultSearchElement: true
      TravelId,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      @ObjectModel.text.element: ['AgencyName']
      @Consumption.valueHelpDefinition: [{ entity : {name: '/DMO/I_Agency', element: 'AgencyID'  } }]
      AgencyId,
      _Agency.Name       as AgencyName,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      @ObjectModel.text.element: ['CustomerName']
      @Consumption.valueHelpDefinition: [{ entity : {name: '/DMO/I_Customer', element: 'CustomerID'  } }]
      CustomerId,
      _Customer.LastName as CustomerName,
      BeginDate,
      EndDate,
      BookingFee,
      TotalPrice,

      @Consumption.valueHelpDefinition: [{entity: {name: 'I_Currency', element: 'Currency' }}]
      CurrencyCode,
      Description,

      @Consumption.valueHelpDefinition: [{entity: { name:    'ZRAPH_I_OverallStatus',
                                                    element: 'TravelStatus' } }]
      @ObjectModel.foreignKey.association: '_TravelStatus'
      OverallStatus,
      LocalCreatedBy,
      LocalCreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt,
      /* Associations */
      _Booking         : redirected to composition child ZRAPH_KM_C_BookingWDTP,
      _RoomReservation : redirected to composition child ZRAPH_KM_C_RoomReservationWDTP,
      _Agency,
      _Currency,
      _Customer,
      _TravelStatus
}
