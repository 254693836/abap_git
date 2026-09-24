CLASS zlyz210_setup_nr_sol DEFINITION
  PUBLIC FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zlyz210_setup_nr_sol IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    CONSTANTS object_name TYPE cl_numberrange_objects=>nr_attributes-object
      VALUE 'ZLYZ210SOL'.
    DATA intervals TYPE cl_numberrange_intervals=>nr_interval.
    DATA travel_id TYPE /dmo/travel_id.

    "Run once in ADT, outside RAP, while Travel creation is stopped.
    TRY.
        cl_numberrange_intervals=>read(
          EXPORTING
            object = object_name
            nr_range_nr1 = space
            nr_range_nr2 = space
            subobject = space
          IMPORTING interval = intervals ).

        IF line_exists( intervals[ nrrangenr = '01' ] ).
          out->write( 'Interval 01 already exists. No changes made; its current status is preserved.' ).
          out->write( intervals ).

        ELSE.
*     ZLYZ210SOLについて、number range objectsを作成した後、下記の実行する必要です
**********************************************************************
          DATA lt_interval TYPE cl_numberrange_intervals=>nr_interval.
          APPEND VALUE #(
            nrrangenr  = '01'
            fromnumber = '00000001'
            tonumber   = '99999999'
            procind    = 'I'
          ) TO lt_interval.

          cl_numberrange_intervals=>create(
            EXPORTING
              object    = 'ZLYZ210SOL'
              subobject = ' '
              interval  = lt_interval
          ).
**********************************************************************
        ENDIF.
        "get numbers
        cl_numberrange_runtime=>number_get(
          EXPORTING
            nr_range_nr       = '01'
            object            = 'ZLYZ210SOL'   "Fallback: '/DMO/TRV_M'
            quantity          = 1
          IMPORTING
            number            = DATA(number_range_key)
            returncode        = DATA(number_range_return_code)
            returned_quantity = DATA(number_range_returned_quantity)
        ).
        out->write( number_range_key ).
        out->write( number_range_return_code ).
        out->write( number_range_returned_quantity ).

**********************************************************************
    ENDTRY.


  ENDMETHOD.
ENDCLASS.

