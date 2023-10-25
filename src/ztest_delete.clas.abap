
CLASS ztest_delete DEFINITION PUBLIC FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
    CONSTANTS:
      c_destination TYPE string VALUE 'Z_IFFCO_MDG_CREATE_CUSTOMER'.
ENDCLASS.


CLASS ztest_delete IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
        DATA(lo_destination) = cl_rfc_destination_provider=>create_by_cloud_destination( c_destination ).
data: ev_message type string.
data: BP_ID(10) type c,
      ls_sales type ztab_salesarea,
      iv_bpid type c,
      lt_sales type table of ztab_salesarea.
      CONCATENATE '00' iv_bpid into bp_id.
*
*      SELECT * FROM ztab_salesarea where  zmdg_bp_id = '50000148' into table @lt_sales.
*
*      LOOP at lt_sales into ls_sales.
*      clear bp_id.
*
*            CONCATENATE '00' ls_sales-zmdg_bp_id into bp_id.
*    try.
**      CALL FUNCTION 'Z_IFFCO_EXTEND_CREDIT'
**      DESTINATION c_destination
*       NEW zscm_credit_segment_rfc( lo_destination )->z_iffco_extend_credit(
*                  EXPORTING
*             iv_bp = conv #( bp_id )
*             iv_limit = conv #( ls_sales-zlimit )
*             iv_segment = conv #( ls_sales-zcredit_segment )
*             iv_validity = ls_sales-zvalidity_to
*           IMPORTING
*             ev_message = ev_message ).
**        ).
*
*
*
**      CATCH cx_root INTO DATA(lo_error).
*
*CATCH cx_root INTO DATA(lo_error).
*ENDTRY.
*ENDLOOP.

update ztab_customers
set zduedate = '20240101'
WHERE zcustomer_num = '565DC27E4B5C1EEE88C2AAEB4DC3D894'.
  ENDMETHOD.
ENDCLASS.
















