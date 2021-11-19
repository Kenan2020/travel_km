*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
* templates
INTERFACE lif_partner.
  METHODS display_partner
    IMPORTING im_out TYPE REF TO if_oo_adt_classrun_out.
ENDINTERFACE.

CLASS lcl_rental DEFINITION.
  PUBLIC SECTION.
    METHODS constructor
      IMPORTING
        im_name TYPE string.

    INTERFACES lif_partner.

  PROTECTED SECTION.
    DATA name TYPE string.
ENDCLASS.

CLASS lcl_rental IMPLEMENTATION.
  METHOD lif_partner~display_partner.
    im_out->write( 'Displaying rental.' && me->name ).
  ENDMETHOD.
  METHOD constructor.
    me->name = im_name.
  ENDMETHOD.

ENDCLASS.
* end template

CLASS lcl_airplane DEFINITION.

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING
        im_name      TYPE string
        im_planetype TYPE /dmo/plane_type_id.
    METHODS display_attributes
      IMPORTING im_out TYPE REF TO if_oo_adt_classrun_out.

    CLASS-METHODS display_number_of_airplanes
      IMPORTING im_out TYPE REF TO if_oo_adt_classrun_out.
    CLASS-METHODS get_number_of_airplanes
      RETURNING VALUE(re_number_of_airplanes) TYPE i.

  PROTECTED SECTION.
    DATA name TYPE string.
    DATA planetype TYPE /dmo/plane_type_id.

  PRIVATE SECTION.
    CLASS-DATA number_of_airplanes TYPE i.

    METHODS get_technical_attributes
      IMPORTING im_planetype     TYPE /dmo/plane_type_id
      EXPORTING ex_weight        TYPE ZRAPH_KM_AIRPLANE_WEIGHT
      RAISING   zcx_km_unknown_planetype.
ENDCLASS.



CLASS lcl_airplane IMPLEMENTATION.
  METHOD constructor.
    me->name = im_name.
    me->planetype = im_planetype.
    lcl_airplane=>number_of_airplanes = lcl_airplane=>number_of_airplanes + 1.
  ENDMETHOD.

  METHOD display_attributes.
    TRY.
        me->get_technical_attributes(
            EXPORTING im_planetype = me->planetype
            IMPORTING ex_weight = DATA(l_weight)
        ).
        im_out->write( |{ me->name }: { me->planetype }, weight: { l_weight }| ).
      CATCH zcx_km_unknown_planetype INTO DATA(lx_unknown_planetype).
        im_out->write( lx_unknown_planetype->get_text(  ) ).
        im_out->write( lx_unknown_planetype->planetype ).
        im_out->write( |{ me->name }: { me->planetype }, weight: unknown| ).
    ENDTRY.
  ENDMETHOD.

  METHOD display_number_of_airplanes.
    im_out->write( |Number of airplanes: { lcl_airplane=>number_of_airplanes }| ).
  ENDMETHOD.

  METHOD get_number_of_airplanes.
    re_number_of_airplanes = lcl_airplane=>number_of_airplanes.
  ENDMETHOD.

  METHOD get_technical_attributes.
    SELECT SINGLE weight
        FROM zraph_km_airpln
        WHERE type_id = @im_planetype
        INTO @ex_weight.

    IF sy-subrc NE 0.
      RAISE EXCEPTION TYPE zcx_km_unknown_planetype EXPORTING im_planetype = im_planetype.
    ENDIF.
  ENDMETHOD.

ENDCLASS.

CLASS lcl_passenger_plane DEFINITION INHERITING FROM lcl_airplane.

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING
        im_name      TYPE string
        im_planetype TYPE /dmo/plane_type_id
        im_max_seats TYPE i.
    METHODS display_attributes REDEFINITION.

  PROTECTED SECTION.

  PRIVATE SECTION.

    DATA max_seats TYPE i.
ENDCLASS.

CLASS lcl_passenger_plane IMPLEMENTATION.
  METHOD constructor.
    super->constructor( im_name = im_name im_planetype = im_planetype ).
    me->max_seats = im_max_seats.
  ENDMETHOD.

  METHOD display_attributes.
* We cannot call get_technical_attributes directly, because it is private
*      me->get_technical_attributes(
*            exporting im_planetype = me->planetype
*            importing ex_weight = data(l_weight)
*        ).
*    im_out->write( |{ me->name }: { me->planetype }, weight: { l_weight }, max seats: { me->max_seats }| ).
    super->display_attributes( im_out = im_out ).
    im_out->write( |max seats: { me->max_seats }| ).
  ENDMETHOD.

ENDCLASS.


CLASS lcl_cargo_plane DEFINITION INHERITING FROM lcl_airplane.

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING
        im_name      TYPE string
        im_planetype TYPE /dmo/plane_type_id
        im_max_cargo TYPE i.
    METHODS display_attributes REDEFINITION.

  PROTECTED SECTION.

  PRIVATE SECTION.

    DATA max_cargo TYPE i.
ENDCLASS.

CLASS lcl_cargo_plane IMPLEMENTATION.
  METHOD constructor.
    super->constructor( im_name = im_name im_planetype = im_planetype ).
    me->max_cargo = im_max_cargo.
  ENDMETHOD.

  METHOD display_attributes.
* We cannot call get_technical_attributes directly, because it is private
*      me->get_technical_attributes(
*            exporting im_planetype = me->planetype
*            importing ex_weight = data(l_weight)
*        ).
*    im_out->write( |{ me->name }: { me->planetype }, weight: { l_weight }, max cargo: { me->max_cargo }| ).
    super->display_attributes( im_out = im_out ).
    im_out->write( |max cargo: { me->max_cargo }| ).
  ENDMETHOD.

ENDCLASS.


CLASS lcl_carrier DEFINITION.

  PUBLIC SECTION.
    INTERFACES lif_partner.

    METHODS constructor
      IMPORTING
        im_name TYPE string.
    METHODS add_airplane
      IMPORTING
        im_airplane TYPE REF TO lcl_airplane.
    METHODS display_airplanes
      IMPORTING
        im_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS display_attributes
      IMPORTING
        im_out TYPE REF TO if_oo_adt_classrun_out.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA name TYPE string.
    DATA airplanes TYPE TABLE OF REF TO lcl_airplane.
ENDCLASS.

CLASS lcl_carrier IMPLEMENTATION.
  METHOD constructor.
    me->name = im_name.
  ENDMETHOD.

  METHOD add_airplane.
    APPEND im_airplane TO me->airplanes.
  ENDMETHOD.

  METHOD lif_partner~display_partner.
    me->display_attributes(  im_out = im_out ).
  ENDMETHOD.

  METHOD display_airplanes.
    LOOP AT me->airplanes INTO DATA(l_airplane).
      l_airplane->display_attributes(  im_out ).
    ENDLOOP.
  ENDMETHOD.

  METHOD display_attributes.
    im_out->write( me->name ).
    me->display_airplanes(  im_out ).
  ENDMETHOD.

ENDCLASS.