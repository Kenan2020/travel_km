@EndUserText.label: 'booking sup C'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true

define view entity ZRAPH_KM_C_BookingSupplWDTP
  as projection on ZRAPH_KM_I_BookingSupplWDTP
{
  key BooksupplUuid,
      TravelUuid,
      BookingUuid,

      @Search.defaultSearchElement: true
      BookingSupplementId,

      @ObjectModel.text.element: ['SupplementDescription']
      @Consumption.valueHelpDefinition: [ {entity: {name: '/DMO/I_SUPPLEMENT', element: 'SupplementID' } ,
                     additionalBinding: [ { localElement: 'Price',  element: 'Price', usage: #RESULT },
                                          { localElement: 'CurrencyCode', element: 'CurrencyCode', usage: #RESULT }] }]
      SupplementId,
      _SupplementText.Description as SupplementDescription : localized,

      Price,

      @Consumption.valueHelpDefinition: [{entity: {name: 'I_Currency', element: 'Currency' }}]

      CurrencyCode,
      LocalLastChangedAt,
      /* Associations */
      _Booking : redirected to parent ZRAPH_KM_C_BookingWDTP,
      _Product,
      _SupplementText,
      _Travel  : redirected to ZRAPH_KM_C_TravelWDTP
}
