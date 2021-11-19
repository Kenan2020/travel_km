CLASS zcl_km_main_airplane_vi DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_km_main_airplane_vi IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA l_cargo_plane TYPE REF TO lcl_cargo_plane.
    DATA l_passenger_plane TYPE REF TO lcl_passenger_plane.

    lcl_airplane=>display_number_of_airplanes(  out ).

    l_cargo_plane = NEW #( im_name = 'Plane1' im_planetype = 'Boeing' im_max_cargo = 1000 ).
    l_cargo_plane->display_attributes(  out ).

    l_passenger_plane = NEW #( im_name = 'Plane2' im_planetype = 'Airbus'  im_max_seats = 500 ).
    l_passenger_plane->display_attributes(  out ).

    lcl_airplane=>display_number_of_airplanes(  out ).

  ENDMETHOD.
ENDCLASS.
