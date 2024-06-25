.onLoad <- function(lib, pkg) {
  # Side effect: store handle to duckdb library in static variable
  .Call(duckdb_load_library, system.file("libs", "duckdb.so", package = "duckdb"))
}
