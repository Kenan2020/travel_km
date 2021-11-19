CLASS zcx_km_unknown_planetype DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .

    CONSTANTS:
      BEGIN OF default_text,
        msgid TYPE symsgid VALUE 'ZRAPH_CM_KM_MSGS',
        msgno TYPE symsgno VALUE '001', " change if you used another message number for this message
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF default_text.

    DATA planetype TYPE /dmo/plane_type_id.

    METHODS constructor
      IMPORTING
        !textid   LIKE if_t100_message=>t100key OPTIONAL
        !previous LIKE previous OPTIONAL
        im_planetype TYPE /dmo/plane_type_id optional.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcx_km_unknown_planetype IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    CALL METHOD super->constructor
      EXPORTING
        previous = previous.
    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = me->default_text.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.
    me->planetype = im_planetype.
  ENDMETHOD.
ENDCLASS.
