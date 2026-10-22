CLASS zcl_data_generator_7025 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES:
    if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_data_generator_7025 IMPLEMENTATION.


        METHOD if_oo_adt_classrun~main.

            " deleting existing data from tables
            DELETE FROM ZBOOKINGSUPP_M.
            DELETE FROM ZBOOKING_M7025.
            DELETE FROM ZTRAVEL_M7025.
            COMMIT WORK.

            " insert data in ztravel_m7025 table
            insert ZTRAVEL_M7025 FROM (
                   select *
                       from /DMO/TRAVEL_M
            ).

            " insert data in table
            Insert ZBOOKING_M7025 FROM (
                 select *
                 from   /DMO/Booking_M
        "         JOIN ZTRAVEL_M7025 as y
        "         ON   booking~travel_id = y~travel_id

            ).


            " insert data in table
            Insert ZBOOKINGSUPP_M FROM (
                 select *
                 from   /DMO/BookSuppl_M
        "         JOIN ZTRAVEL_M7025 as y
        "         ON   booking~travel_id = y~travel_id

            ).

        COMMIT WORK.

        ENDMETHOD.


ENDCLASS.
