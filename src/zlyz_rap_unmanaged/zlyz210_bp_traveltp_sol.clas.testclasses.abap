CLASS ltc_travel_comparison DEFINITION FINAL
  FOR TESTING DURATION SHORT RISK LEVEL HARMLESS.
  PRIVATE SECTION.
    DATA input TYPE zlyz210_a_add_action001_sol.
    DATA database_travel TYPE zlyz210_r_traveltp_sol.
    METHODS setup.
    METHODS identical_values_match FOR TESTING.
    METHODS each_field_difference_fails FOR TESTING.
    METHODS identical_initial_values_match FOR TESTING.
ENDCLASS.

CLASS ltc_travel_comparison IMPLEMENTATION.
  METHOD setup.
    input = VALUE #(
      TravelID = '00000001'
      AgencyID = '000001'
      CustomerID = '000001'
      BeginDate = '20260924'
      EndDate = '20260930'
      BookingFee = '10.00'
      TotalPrice = '110.00'
      CurrencyCode = 'EUR'
      Description = 'Comparison fixture'
      OverallStatus = 'O'
      Attachment = '0102FF'
      MimeType = 'application/octet-stream'
      FileName = 'fixture.bin'
      CreatedBy = 'TEST_USER'
      CreatedAt = '20260924010000.0000001'
      LocalLastChangedBy = 'TEST_USER'
      LocalLastChangedAt = '20260924020000.0000001'
      LastChangedAt = '20260924020000.0000002' ).
    database_travel = CORRESPONDING #( input ).
  ENDMETHOD.

  METHOD identical_values_match.
    cl_abap_unit_assert=>assert_true(
      act = lcl_travel_comparison=>matches_database(
        is_input = input is_database = database_travel ) ).
  ENDMETHOD.

  METHOD each_field_difference_fails.
    "Every parameter must matter, including values cleared by the caller.
    DATA original_input TYPE zlyz210_a_add_action001_sol.
    original_input = input.
    DO.
      input = original_input.
      ASSIGN COMPONENT sy-index OF STRUCTURE input TO FIELD-SYMBOL(<field>).
      IF sy-subrc <> 0.
        EXIT.
      ENDIF.
      cl_abap_unit_assert=>assert_not_initial(
        act = <field> msg = |Fixture field { sy-index } must be non-initial| ).
      CLEAR <field>.
      cl_abap_unit_assert=>assert_false(
        act = lcl_travel_comparison=>matches_database(
          is_input = input is_database = database_travel )
        msg = |Difference in parameter field { sy-index } was ignored| ).
    ENDDO.
  ENDMETHOD.

  METHOD identical_initial_values_match.
    CLEAR: input-Description, input-Attachment, input-MimeType, input-FileName.
    database_travel = CORRESPONDING #( input ).
    cl_abap_unit_assert=>assert_true(
      act = lcl_travel_comparison=>matches_database(
        is_input = input is_database = database_travel ) ).
  ENDMETHOD.
ENDCLASS.
