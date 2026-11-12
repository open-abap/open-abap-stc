INTERFACE if_stctm_bg_task PUBLIC.

  INTERFACES if_serializable_object.
  INTERFACES if_stctm_task.

  ALIASES c_bool FOR if_stctm_task~c_bool.
  ALIASES is_necessary FOR if_stctm_task~is_necessary.
  ALIASES pr_log FOR if_stctm_task~pr_log.
  ALIASES pt_predecessor FOR if_stctm_task~pt_predecessor.
  ALIASES pt_successor FOR if_stctm_task~pt_successor.
  ALIASES p_status FOR if_stctm_task~p_status.

  TYPES t_progress TYPE if_stctm_task=>t_progress.

  EVENTS update_progress
    EXPORTING
      VALUE(i_progress) TYPE t_progress.

  METHODS checkmode
    IMPORTING
      ir_tasklist        TYPE REF TO cl_stctm_tasklist
    RETURNING
      VALUE(r_checkmode) TYPE if_stctm_task=>t_bool.

  METHODS execute
    IMPORTING
      ir_tasklist TYPE REF TO cl_stctm_tasklist
      i_check     TYPE stc_checkrun OPTIONAL
      i_trace     TYPE stc_trace OPTIONAL
    EXCEPTIONS
      error_occured
      warning_occured.

  METHODS longrunner
    IMPORTING
      ir_tasklist         TYPE REF TO cl_stctm_tasklist
    RETURNING
      VALUE(r_longrunner) TYPE if_stctm_task=>t_bool.

  METHODS resumable
    IMPORTING
      ir_tasklist        TYPE REF TO cl_stctm_tasklist
    RETURNING
      VALUE(r_resumable) TYPE if_stctm_task=>t_bool.

ENDINTERFACE.
