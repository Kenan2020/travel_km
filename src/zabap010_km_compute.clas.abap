CLASS zabap010_km_compute DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZABAP010_KM_COMPUTE IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA lv_int1 TYPE i.
  DATA lv_int2 TYPE i.
  DATA lv_result TYPE p decimals 2.
  DATA lv_op TYPE c.

  lv_int1 = 10.
  lv_int2 = 20.
  lv_op = '.'.

  CASE lv_op.
    WHEN '+'.
        lv_result = lv_int1 + lv_int2.
    WHEN '-'.
        lv_result = lv_int1 - lv_int2.
    WHEN '*'.
        lv_result = lv_int1 * lv_int2.
    WHEN '/'.
        IF ( lv_int2 = 0 ) .
            out->write( EXPORTING data = 'Division by zero!' ).
            EXIT.
        ELSE.
            lv_result = lv_int1 / lv_int2.
        ENDIF.
       WHEN OTHERS.
        out->write( EXPORTING data = 'Invalid Operator!' ).
        EXIT.
   ENDCASE.

   out->write( EXPORTING data = lv_int1 && lv_op && lv_int2 && | = | && lv_result ).

  ENDMETHOD.
ENDCLASS.
