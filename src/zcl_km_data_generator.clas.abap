CLASS zcl_km_data_generator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_km_data_generator IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    TYPES ltt_airplanes TYPE STANDARD TABLE OF zraph_km_airpln WITH DEFAULT KEY.

    DATA(l_airplanes) = VALUE ltt_airplanes(
        ( type_id = '767-200' weight = 99999 )
        ( type_id = 'A320-200' weight = 70000 )
        ( type_id = '747-400' weight = 250000 )
     ).

    " clear first to avoid duplicates on multiple runs
    DELETE FROM zraph_km_airpln.

    INSERT zraph_km_airpln FROM TABLE @l_airplanes.

  ENDMETHOD.
ENDCLASS.
