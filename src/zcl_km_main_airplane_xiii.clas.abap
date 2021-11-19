CLASS zcl_km_main_airplane_xiii DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_km_main_airplane_xiii IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA l_carrier TYPE REF TO lcl_carrier.
    DATA l_rental1 TYPE REF TO lcl_rental.
    DATA l_rental2 TYPE REF TO lcl_rental.
    DATA l_travel_agency TYPE REF TO lcl_travel_agency.

    DATA l_basic_airplane TYPE REF TO lcl_airplane.
    DATA l_cargo_plane TYPE REF TO lcl_cargo_plane.
    DATA l_passenger_plane TYPE REF TO lcl_passenger_plane.

* Creating carrier with airplanes
    l_carrier = NEW #( 'WEFEL - We fly everything lines' ).

    l_basic_airplane = NEW #( im_name = 'Basic Plane' im_planetype = 'A320-200' ).
    l_carrier->add_airplane( l_basic_airplane ).

    l_cargo_plane = NEW #( im_name = 'Cargo Plane' im_planetype = '747-400' im_max_cargo = 1000 ).
    l_carrier->add_airplane( l_cargo_plane ).

    l_passenger_plane = NEW #( im_name = 'Passenger Plane' im_planetype = 'Airbus'  im_max_seats = 500 ).
    l_carrier->add_airplane( l_passenger_plane ).

* Creating two rentals
    l_rental1 = NEW lcl_rental( 'Rental1' ).
    l_rental2 = NEW lcl_rental( 'Rental2' ).

*Creating two hotels
    DATA(l_hotel1) = NEW zcl_km_hotel( im_name = 'Hotel1' im_max_beds = 100 ).
    DATA(l_hotel2) = NEW zcl_km_hotel( im_name = 'Hotel2' im_max_beds = 2222 ).

* Creating travel agency and adding partners
    l_travel_agency = NEW #( 'my travel agency' ).
    l_travel_agency->add_partner( l_carrier ).
    l_travel_agency->add_partner( l_rental1 ).
    l_travel_agency->add_partner( l_rental2 ).
    l_travel_agency->add_partner( l_hotel1 ).
    l_travel_agency->add_partner( l_hotel2 ).

* Checking the result
    l_travel_agency->display_agency_partners( out ).

  ENDMETHOD.
ENDCLASS.

