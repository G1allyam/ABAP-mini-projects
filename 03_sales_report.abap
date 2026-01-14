REPORT z_sales_report.

*---------------------------------------------*
*  Program: Z_SALES_REPORT
*  Purpose: Simple sales report with totals
*---------------------------------------------*

TYPES: BEGIN OF ty_sale,
         customer TYPE string,
         product  TYPE string,
         amount   TYPE p DECIMALS 2,
       END OF ty_sale.

DATA: gt_sales TYPE STANDARD TABLE OF ty_sale,
      gs_sale  TYPE ty_sale.

DATA: gv_total TYPE p DECIMALS 2.

START-OF-SELECTION.

*---------------------------------------------*
* Fill sales data
*---------------------------------------------*
  gs_sale-customer = 'Gerhard Gruber'.
  gs_sale-product  = 'Laptop'.
  gs_sale-amount   = '1200.50'.
  APPEND gs_sale TO gt_sales.

  gs_sale-customer = 'Gerhard Gruber'.
  gs_sale-product  = 'Mouse'.
  gs_sale-amount   = '25.90'.
  APPEND gs_sale TO gt_sales.

  gs_sale-customer = 'Anna Müller'.
  gs_sale-product  = 'Monitor'.
  gs_sale-amount   = '310.00'.
  APPEND gs_sale TO gt_sales.

  gs_sale-customer = 'Anna Müller'.
  gs_sale-product  = 'Keyboard'.
  gs_sale-amount   = '89.99'.
  APPEND gs_sale TO gt_sales.

  gs_sale-customer = 'Martin Schmidt'.
  gs_sale-product  = 'Tablet'.
  gs_sale-amount   = '450.00'.
  APPEND gs_sale TO gt_sales.

*---------------------------------------------*
* Calculate total sum
*---------------------------------------------*
  LOOP AT gt_sales INTO gs_sale.
    gv_total = gv_total + gs_sale-amount.
  ENDLOOP.

*---------------------------------------------*
* Output report
*---------------------------------------------*
  WRITE: / 'Customer', 20 'Product', 40 'Amount'.
  WRITE: / '----------------------------------------------'.

  LOOP AT gt_sales INTO gs_sale.
    WRITE: / gs_sale-customer,
             20 gs_sale-product,
             40 gs_sale-amount.
  ENDLOOP.

  WRITE: / '----------------------------------------------'.
  WRITE: / 'TOTAL SALES: ', gv_total.
