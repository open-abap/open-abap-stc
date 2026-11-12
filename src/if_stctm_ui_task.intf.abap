INTERFACE if_stctm_ui_task PUBLIC.

  INTERFACES if_serializable_object.
  INTERFACES if_stctm_task.

  TYPES BEGIN OF ts_ext_param.
  INCLUDE TYPE stctm_s_fieldprop.
  TYPES value TYPE string. " obsolete, do not use anymore
  TYPES END OF ts_ext_param.

  TYPES tt_ext_param TYPE STANDARD TABLE OF ts_ext_param WITH DEFAULT KEY.

  DATA p_variant_descr TYPE c LENGTH 256.

  METHODS execute
    IMPORTING
      ir_tasklist    TYPE REF TO cl_stctm_tasklist
      i_display_only TYPE if_stctm_task=>t_bool
    EXCEPTIONS
      aborted_by_user
      error_occured.

  METHODS external_parameters
    IMPORTING
      ir_tasklist     TYPE REF TO cl_stctm_tasklist
    RETURNING
      VALUE(rt_param) TYPE tt_ext_param.

  METHODS get_parameters
    IMPORTING
      ir_tasklist   TYPE REF TO cl_stctm_tasklist
    EXPORTING
      et_parameters TYPE stctm_t_parameter.

  METHODS maintained
    IMPORTING
      ir_tasklist         TYPE REF TO cl_stctm_tasklist
    RETURNING
      VALUE(r_maintained) TYPE if_stctm_task=>t_bool.

  METHODS needed
    IMPORTING
      ir_tasklist     TYPE REF TO cl_stctm_tasklist
    RETURNING
      VALUE(r_needed) TYPE if_stctm_task=>t_bool.

  METHODS set_parameters
    IMPORTING
      ir_tasklist   TYPE REF TO cl_stctm_tasklist
      it_parameters TYPE stctm_t_parameter
    EXCEPTIONS
      invalid.

ENDINTERFACE.
