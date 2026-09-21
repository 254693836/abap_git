CLASS zlyz_course_edit DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

    METHODS insertzlyz_course  .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zlyz_course_edit IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    out->write( 'Hello ABAP Cloud' ).
    DATA lt_data TYPE TABLE OF zlyz_course.

    lt_data = VALUE #(
      (
          id = '102'
          name = 'sam2'
          description = 'desxxx'
          xbbbe = '1'
          xbbba = '2'
          xbbko = '3'
      )
    ).

    INSERT zlyz_course
      FROM TABLE @lt_data.


   out->write( |登録件数: { sy-dbcnt }| ).

  ENDMETHOD.

  METHOD insertzlyz_course.

  ENDMETHOD.

ENDCLASS.
