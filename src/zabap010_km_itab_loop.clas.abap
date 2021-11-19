CLASS zabap010_km_itab_loop DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZABAP010_KM_ITAB_LOOP IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  CONSTANTS: lc_index TYPE i VALUE '5' .

  DATA lt_flight TYPE  /dmo/t_flight."/dmo/t_flight => table type
  DATA ls_flight TYPE /dmo/flight.

  SELECT * FROM /dmo/flight
    INTO TABLE @lt_flight.

    TRY.
        ls_flight = lt_flight[ lc_index ].

        MESSAGE ID 'ZABAP010_KM' TYPE 'I' NUMBER '0001' WITH lc_index INTO DATA(lv_msg).
        out->write( EXPORTING data = lv_msg ).
        out->write( EXPORTING data = ls_flight ).
        out->write( EXPORTING data = '-----------------------------------------------------------------' ).

    CATCH cx_sy_itab_line_not_found.
        MESSAGE ID 'ZABAP010_KM' TYPE 'I' NUMBER '0002' WITH lc_index INTO lv_msg.
        out->write( EXPORTING data = lv_msg ).

    ENDTRY.


  LOOP AT lt_flight INTO ls_flight.

    out->write( EXPORTING data = ls_flight ).

  ENDLOOP.

* or => out->write( EXPORTING data = lt_flight ).

  ENDMETHOD.
ENDCLASS.
