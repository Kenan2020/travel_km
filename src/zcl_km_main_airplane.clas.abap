CLASS zcl_km_main_airplane DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_KM_MAIN_AIRPLANE IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    out->write( 'Hello Airplanes' ).

  ENDMETHOD.
ENDCLASS.
