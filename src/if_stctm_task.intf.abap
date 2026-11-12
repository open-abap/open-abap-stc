INTERFACE if_stctm_task PUBLIC.

  INTERFACES if_serializable_object.

  TYPES t_taskname TYPE stc_task_id.
  TYPES tt_taskname TYPE STANDARD TABLE OF t_taskname WITH DEFAULT KEY.
  TYPES t_tasktype TYPE stc_task_type.
  TYPES t_taskdescr TYPE stc_task_descr.
  TYPES t_bool TYPE abap_boolean.
  TYPES t_necessary TYPE c LENGTH 1.
  TYPES t_progress TYPE stc_task_progress.
  TYPES t_status TYPE stc_task_status.

  TYPES: BEGIN OF ts_task,
           taskname TYPE stc_task_id,
           tasktype TYPE stc_task_type,
         END OF ts_task.

  TYPES tt_task TYPE STANDARD TABLE OF ts_task WITH DEFAULT KEY.

  CONSTANTS: BEGIN OF c_bool,
               true  TYPE t_bool VALUE 'X',
               false TYPE t_bool VALUE ' ',
             END OF c_bool.

  CONSTANTS: BEGIN OF c_necessary,
               necessary TYPE t_necessary VALUE 'X',
             END OF c_necessary.

  DATA pr_log TYPE REF TO cl_stctm_log.
  DATA pt_predecessor TYPE tt_taskname.
  DATA pt_successor TYPE tt_taskname.
  DATA p_appl_comp TYPE ufps_posid.
  DATA p_check_progress TYPE t_progress.
  DATA p_check_status TYPE t_status.
  DATA p_component TYPE stc_component.
  DATA p_multiple_usage TYPE t_bool.
  DATA p_obsolete TYPE t_bool.
  DATA p_phase TYPE stc_phase.
  DATA p_progress TYPE t_progress.
  DATA p_status TYPE t_status.

  METHODS get_description
    RETURNING
      VALUE(rv_descr) TYPE stc_task_descr.

  METHODS get_docu_object
    EXPORTING
      ev_doku_id  TYPE doku_id
      ev_doku_obj TYPE doku_obj
      ev_var1     TYPE symsgv
      ev_var2     TYPE symsgv
      ev_var3     TYPE symsgv
      ev_var4     TYPE symsgv.

  METHODS is_necessary
    IMPORTING
      ir_tasklist        TYPE REF TO cl_stctm_tasklist
    RETURNING
      VALUE(r_necessary) TYPE t_necessary.

  METHODS show_message_details
    IMPORTING
      i_details TYPE string
    EXCEPTIONS
      error_occured.

ENDINTERFACE.
