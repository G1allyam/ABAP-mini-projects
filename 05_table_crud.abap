REPORT z_05_table_crud.

*---------------------------------------------*
*  Program: Z_TABLE_CRUD
*  Purpose: CRUD (Create, Read, Update, Delete) operations
*---------------------------------------------*

TYPES: BEGIN OF ty_product,
         id TYPE i,
         name TYPE string,
         stock TYPE i,
       END OF ty_product.

DATA: lt_products TYPE STANDARD TABLE OF ty_product,
      ls_product TYPE ty_product.

" CREATE
ls_product-id = 1.
ls_product-name = 'Keyboard'.
ls_product-stock = 10.
APPEND ls_product TO lt_products.

ls_product-id = 2.
ls_product-name = 'Monitor'.
ls_product-stock = 5.
APPEND ls_product TO lt_products.

" READ
WRITE: / 'Initial Product List:'.
LOOP AT lt_products INTO ls_product.
  WRITE: / ls_product-id, ls_product-name, ls_product-stock.
ENDLOOP.

" UPDATE
READ TABLE lt_products INTO ls_product WITH KEY id = 1.
IF sy-subrc = 0.
  ls_product-stock = 15.
  MODIFY lt_products FROM ls_product INDEX sy-tabix.
ENDIF.

" DELETE
DELETE lt_products WHERE id = 2.

WRITE: / ' ',
       / 'After Update and Delete:'.

LOOP AT lt_products INTO ls_product.
  WRITE: / ls_product-id, ls_product-name, ls_product-stock.
ENDLOOP.
