REPORT z_hello_sap_world.

*---------------------------------------------*
*  Program: Z_HELLO_SAP_WORLD
*  Purpose: First demo ABAP report for GitHub
*---------------------------------------------*

DATA: gv_user TYPE sy-uname,
      gv_date TYPE sy-datum,
      gv_time TYPE sy-uzeit.

START-OF-SELECTION.

  gv_user = sy-uname.
  gv_date = sy-datum.
  gv_time = sy-uzeit.

  WRITE: / 'Hello SAP World!',
         / 'User: ', gv_user,
         / 'Date: ', gv_date,
         / 'Time: ', gv_time.