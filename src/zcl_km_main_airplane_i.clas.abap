CLASS zcl_km_main_airplane_i DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_KM_MAIN_AIRPLANE_I IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA l_airplane TYPE REF TO lcl_airplane.
    DATA l_airplanes TYPE TABLE OF REF TO lcl_airplane.

    l_airplane = NEW lcl_airplane( ).
    APPEND l_airplane TO l_airplanes.

    APPEND NEW lcl_airplane( ) TO l_airplanes.

    APPEND NEW lcl_airplane( ) TO l_airplanes.

    APPEND NEW lcl_airplane( ) TO l_airplanes.

    out->write( 'Hello Airplanes' ).

  ENDMETHOD.
ENDCLASS.
