CLASS zcl_km_main_airplane_iv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_km_main_airplane_iv IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA l_airplane TYPE REF TO lcl_airplane.
    DATA l_airplanes TYPE TABLE OF REF TO lcl_airplane.

    lcl_airplane=>display_number_of_airplanes(  out )." EXPORTING: im_out = out

    l_airplane = NEW lcl_airplane( im_name = 'Plane1' im_planetype = 'A700' ).
    l_airplane->display_attributes(  out ).
    APPEND l_airplane TO l_airplanes.

    l_airplane = NEW lcl_airplane( im_name = 'Plane2' im_planetype = 'A600' ).
    l_airplane->display_attributes(  out ).
    APPEND l_airplane TO l_airplanes.

    l_airplane = NEW lcl_airplane( im_name = 'Plane3' im_planetype = 'Boeing' ).
    l_airplane->display_attributes(  out ).
    APPEND l_airplane TO l_airplanes.

    l_airplane = NEW lcl_airplane( im_name = 'Plane4' im_planetype = 'Airbus' ).
    l_airplane->display_attributes(  out ).
    APPEND l_airplane TO l_airplanes.

*   APPEND NEW lcl_airplane( ) TO l_airplanes.
    lcl_airplane=>display_number_of_airplanes(  out ).

* Another way to show the data:
*   DATA l_number_of_airplanes Type i.
*   lcl_airplane=>get_number_of_airplanes( RECEIVING re_number_of_airplanes = l_number_of_airplanes ).
    DATA(l_number_of_airlines) = lcl_airplane=>get_number_of_airplanes( ).
    out->write( |Number of airplanes alternative: { l_number_of_airlines }| ).

  ENDMETHOD.
ENDCLASS.
