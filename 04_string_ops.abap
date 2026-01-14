REPORT z_04_string_ops.

*---------------------------------------------*
*  Program: Z_STRING_OPS
*  Purpose: Common string operations
*---------------------------------------------*

DATA: gv_text TYPE string VALUE 'abap mini projects',
      gv_upper TYPE string,
      gv_length TYPE i,
      gv_sub TYPE string.

START-OF-SELECTION.

  gv_upper = to_upper( gv_text ).
  gv_length = strlen( gv_text ).
  gv_sub = gv_text+0(4).

  WRITE: / 'Original:', gv_text,
         / 'Upper:', gv_upper,
         / 'Length:', gv_length,
         / 'Substring:', gv_sub.
