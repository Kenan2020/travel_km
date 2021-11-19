CLASS zcl_km_hotel DEFINITION PUBLIC.

  PUBLIC SECTION.

    INTERFACES zif_kmm_partner.

    METHODS constructor
      IMPORTING
        im_name     TYPE string
        im_max_beds TYPE i.

    METHODS display_attributes
      IMPORTING
        im_out TYPE REF TO if_oo_adt_classrun_out.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA name TYPE string.
    DATA max_beds TYPE i.
ENDCLASS.

CLASS zcl_km_hotel IMPLEMENTATION.
  METHOD constructor.
    me->name = im_name.
    me->max_beds = im_max_beds.
  ENDMETHOD.

  METHOD display_attributes.
    im_out->write( |{ me->name } beds: { me->max_beds }| ).
  ENDMETHOD.

  METHOD zif_kmm_partner~display_partner.
    me->display_attributes( im_out ).
  ENDMETHOD.

ENDCLASS.

