skip_on_cran()

if (rlang::is_installed(c("DBItest", "adbi", "arrow"))) {
  DBItest::test_all(c(
    # Also in adbcsqlite

    # int/int64: https://github.com/r-dbi/DBItest/issues/311
    # 1 value(s) outside integer range set to NA, nanoarrow_warning_lossy_conversion/simpleWarning/warning/condition
    "data_64_bit_numeric",
    # further 64-bit warnings already skipped below

    # array_stream->get_schema(): [1]
    "bind_multi_row_zero_length",
    "arrow_bind_multi_row_zero_length",
    "stream_bind_multi_row_zero_length",
    "arrow_stream_bind_multi_row_zero_length",

    # New in duckdbneo

    # Logical as integers and not logicals
    "data_logical",
    "append_roundtrip_logical",
    "arrow_append_table_arrow_roundtrip_logical",

    # Genunely wrong output
    "write_table_value_subset",
    "write_table_value_shuffle_subset",
    "arrow_fetch_arrow_chunk_multi_row_single_column",
    "arrow_fetch_arrow_chunk_multi_row_multi_column",

    # Output order
    "write_table_value_shuffle",

    # Fixable with using database file
    "create_table_visible_in_other_connection",

    # Error in `!nrow(res)`: invalid argument type
    "arrow_write_table_arrow_value_subset",
    "arrow_write_table_arrow_value_shuffle",
    "arrow_write_table_arrow_value_shuffle_subset",

    # dbDataType for blob objects unknown for type adbc_driver, adbc_xptr
    "data_type_driver",
    "data_type_connection",
    "append_roundtrip_blob",
    "arrow_append_table_arrow_roundtrip_blob",
    "bind_raw", # Wrong output, probably still related
    "bind_blob", # Wrong output, probably still related
    "arrow_bind_raw", # Wrong output, probably still related
    "arrow_bind_blob", # Wrong output, probably still related
    "stream_bind_blob", # Wrong output, probably still related
    "arrow_stream_bind_blob", # Wrong output, probably still related

    # Only lists of raw vectors are currently supported
    "append_roundtrip_raw",

    # nanoarrow_infer_vector_type_schema(): Expected child of map type to be non-nullable but was nullable
    "get_info_connection",

    # From duckdb:
    # NOT_IMPLEMENTED: Binding multiple rows at once is not supported yet
    "send_query_params",
    "get_query_params",
    "bind_multi_row",
    "arrow_bind_multi_row",
    "stream_bind_multi_row",
    "arrow_stream_bind_multi_row",
    "arrow_send_query_params",
    "arrow_get_query_arrow_params",

    # INTERNAL: Conversion Error: timestamp field value out of range
    "append_roundtrip_timestamp",
    "append_roundtrip_timestamp_extended",
    "bind_timestamp",
    "arrow_bind_timestamp",
    "stream_bind_timestamp",
    "stream_bind_timestamp_lt",
    "arrow_stream_bind_timestamp",
    "arrow_stream_bind_timestamp_lt",
    "arrow_append_table_arrow_roundtrip_timestamp",

    # ArrowBasicArrayStreamValidate(): Expected struct child 1 to have length >= 11 but found child with length 1
    "bind_timestamp_lt",
    "arrow_bind_timestamp_lt",

    # `dbAppendTable(con, table_name, unclass(test_in))` did not throw the expected error.
    "append_table_invalid_value",

    # duckdb
    if (!TEST_RE2) {
      c(
        "send_query_immediate",
        "clear_result_return_query_arrow",
        "cannot_clear_result_twice_query_arrow",
        "get_query_immediate",
        "send_statement_params",
        "execute_params",
        "read_table_missing",
        "read_table_row_names_false",
        "read_table_row_names_true_exists",
        "read_table_row_names_true_missing",
        "read_table_row_names_na_exists",
        "read_table_row_names_string_exists",
        "read_table_row_names_string_missing",
        "read_table_row_names_default",
        "read_table_check_names",
        "read_table_check_names_false",
        "read_table_closed_connection",
        "read_table_invalid_connection",
        "read_table_error",
        "read_table_name",
        "create_table_error",
        "create_table_temporary",
        "create_table_row_names_non_null",
        "append_table_missing",
        "append_table_error",
        "append_roundtrip_quotes",
        "append_roundtrip_time",
        "append_roundtrip_mixed",
        "write_table_return",
        "write_table_overwrite",
        "write_table_append_incompatible",
        "roundtrip_.*",
        "write_table_name",
        "write_table_value_df",
        "temporary_table",
        "roundtrip_keywords",
        "roundtrip_quotes",
        "roundtrip_quotes_table_names",
        "roundtrip_integer",
        "roundtrip_numeric",
        "roundtrip_logical",
        "roundtrip_null",
        "roundtrip_64_bit_numeric",
        "roundtrip_64_bit_roundtrip",
        "write_table_row_names_false",
        "write_table_row_names_true_exists",
        "write_table_row_names_na_exists",
        "write_table_row_names_string_exists",
        "write_table_row_names_default",
        "list_tables_temporary",
        "exists_table",
        "exists_table_temporary",
        "exists_table_error",
        "exists_table_name",
        "remove_table_return",
        "remove_table_missing",
        "remove_table_closed_connection",
        "remove_table_invalid_connection",
        "remove_table_error",
        "remove_table_temporary_arg",
        "remove_table_missing_succeed",
        "remove_table_temporary",
        "remove_table_name",
        "list_objects_temporary",
        "list_fields",
        "list_fields_temporary",
        "list_fields_wrong_table",
        "list_fields_quoted",
        "list_fields_row_names",
        "bind_return_value_statement",
        "bind_multi_row_unequal_length",
        "bind_multi_row_statement",
        "bind_repeated_statement",
        "bind_repeated_untouched_statement",
        "arrow_bind_multi_row_unequal_length",
        "stream_bind_return_value_statement",
        "stream_bind_multi_row_statement",
        "stream_bind_repeated_statement",
        "stream_bind_repeated_untouched_statement",
        "column_info",
        "column_info_row_names",
        "rows_affected_statement",
        "begin_write_commit",
        "begin_write_rollback",
        "begin_write_disconnect",
        "with_transaction_success",
        "with_transaction_failure",
        "with_transaction_break",
        "arrow_send_query_immediate",
        "arrow_get_query_arrow_immediate",
        "arrow_read_table_arrow",
        "arrow_read_table_arrow_missing",
        "arrow_read_table_arrow_empty",
        "arrow_read_table_arrow_closed_connection",
        "arrow_read_table_arrow_invalid_connection",
        "arrow_read_table_arrow_error",
        "arrow_read_table_arrow_name",
        "arrow_write_table_arrow_return",
        "arrow_write_table_arrow_error_overwrite",
        "arrow_write_table_arrow_append_incompatible",
        "arrow_write_table_arrow_error",
        "arrow_write_table_arrow_name",
        "arrow_write_table_arrow_value_df",
        "arrow_write_table_arrow_overwrite",
        "arrow_write_table_arrow_overwrite_missing",
        "arrow_write_table_arrow_append",
        "arrow_write_table_arrow_append_new",
        "arrow_write_table_arrow_temporary",
        "arrow_write_table_arrow_visible_in_other_connection",
        "arrow_write_table_arrow_roundtrip_quotes",
        "arrow_write_table_arrow_roundtrip_quotes_table_names",
        "arrow_write_table_arrow_roundtrip_integer",
        "arrow_write_table_arrow_roundtrip_numeric",
        "arrow_write_table_arrow_roundtrip_null",
        "arrow_write_table_arrow_roundtrip_64_bit_roundtrip",
        "arrow_write_table_arrow_roundtrip_character_empty",
        "arrow_write_table_arrow_roundtrip_character_empty_after",
        "arrow_write_table_arrow_roundtrip_date",
        "arrow_write_table_arrow_roundtrip_date_extended",
        "arrow_write_table_arrow_roundtrip_time",
        "arrow_write_table_arrow_roundtrip_mixed",
        "arrow_create_table_arrow_error",
        "arrow_create_table_arrow_temporary",
        "arrow_create_table_arrow_visible_in_other_connection",
        "arrow_append_table_arrow_return",
        "arrow_append_table_arrow_missing",
        "arrow_append_table_arrow_error",
        "arrow_append_table_arrow_roundtrip_quotes",
        "arrow_append_table_arrow_roundtrip_64_bit_roundtrip",
        "arrow_append_table_arrow_roundtrip_time",
        "arrow_append_table_arrow_roundtrip_mixed",
        "list_tables",
        "list_tables_quote",
        "list_fields_object",
        "list_objects",
        "list_objects_quote",
        "list_objects_features",
        "remove_table_list",
        "remove_table_other_con",
        "exists_table_list",
        # 1.8.1
        "write_table_name_quoted",
        "remove_table_name_quoted",
        "arrow_write_table_arrow_name_quoted",
        "arrow_write_table_arrow_roundtrip_keywords",
        "arrow_write_table_arrow_roundtrip_quotes_column_names",
        "arrow_write_table_arrow_roundtrip_logical",
        "arrow_write_table_arrow_roundtrip_character",
        "arrow_write_table_arrow_roundtrip_character_native",
        "arrow_write_table_arrow_roundtrip_factor",
        "arrow_write_table_arrow_roundtrip_blob",
        "arrow_write_table_arrow_roundtrip_timestamp",
        NULL
      )
    },
    "package_name", # wontfix
    "package_dependencies", # wontfix
    "reexport", # wontfix

    "constructor", # wontfix
    "send_query_only_one_result_set", # wontfix
    "send_statement_only_one_result_set", # wontfix
    "send_query_stale_warning", # wontfix
    "send_statement_stale_warning", # wontfix

    if (packageVersion("DBItest") < "1.7.0.9004") "roundtrip_timestamp", # broken test

    "data_64_bit_numeric_warning", # 64 bit, not now
    "data_64_bit_lossless",
    "roundtrip_64_bit_character",
    "connect_bigint_integer",
    "connect_bigint_character",
    "connect_bigint_integer64",
    "append_roundtrip_64_bit_numeric",
    "append_roundtrip_64_bit_character",
    "append_roundtrip_64_bit_roundtrip",
    #
    "column_info_consistent", # won't fix: https://github.com/r-dbi/DBItest/issues/181

    "read_table", # these are temporarily skipped because factors can be round tripped
    "read_table_empty",
    "read_table_row_names_na_missing",
    "write_table_error",
    "overwrite_table",
    "overwrite_table_missing",
    "append_table",
    "append_table_new",
    "table_visible_in_other_connection",
    "roundtrip_character",
    "roundtrip_factor",
    "write_table_row_names_true_missing",
    "write_table_row_names_string_missing",
    "write_table_row_names_na_missing",
    "append_roundtrip_factor",
    "bind_factor",
    "arrow_bind_factor",
    "arrow_send_query_stale_warning", # wontfix
    "arrow_send_query_only_one_result_set", # wontfix
    "arrow_write_table_arrow_roundtrip_timestamp_extended", # precision
    "arrow_append_table_arrow_roundtrip_timestamp_extended", # precision
    NULL
  ))
}
