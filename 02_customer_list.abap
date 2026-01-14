REPORT z_customer_list.

*---------------------------------------------*
*  Program: Z_CUSTOMER_LIST
*  Purpose: Demo customer list using internal table
*---------------------------------------------*

TYPES: BEGIN OF ty_customer,
         id     TYPE i,
         name   TYPE string,
         age    TYPE i,
         city   TYPE string,
       END OF ty_customer.

DATA: gt_customers TYPE STANDARD TABLE OF ty_customer,
      gs_customer  TYPE ty_customer.

START-OF-SELECTION.

* Add customers
  gs_customer-id = 1.
  gs_customer-name = 'Ivan Petrov'.
  gs_customer-age = 25.
  gs_customer-city = 'Vienna'.
  APPEND gs_customer TO gt_customers.

  gs_customer-id = 2.
  gs_customer-name = 'Anna Müller'.
  gs_customer-age = 32.
  gs_customer-city = 'Linz'.
  APPEND gs_customer TO gt_customers.

  gs_customer-id = 3.
  gs_customer-name = 'Sergey Ivanov'.
  gs_customer-age = 19.
  gs_customer-city = 'Salzburg'.
  APPEND gs_customer TO gt_customers.

  gs_customer-id = 4.
  gs_customer-name = 'Maria Schmidt'.
  gs_customer-age = 41.
  gs_customer-city = 'Graz'.
  APPEND gs_customer TO gt_customers.

* Sort by age
  SORT gt_customers BY age.

* Output only adults (age >= 21)
  WRITE: / 'ID', 10 'Name', 30 'Age', 40 'City'.
  WRITE: / '-------------------------------------------'.

  LOOP AT gt_customers INTO gs_customer.
    IF gs_customer-age >= 21.
      WRITE: / gs_customer-id,
               10 gs_customer-name,
               30 gs_customer-age,
               40 gs_customer-city.
    ENDIF.
  ENDLOOP.
