INTERFACE zif_kmm_partner
  PUBLIC .

  METHODS display_partner
    IMPORTING
      im_out TYPE REF TO if_oo_adt_classrun_out.

ENDINTERFACE.
