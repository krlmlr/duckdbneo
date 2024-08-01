test_that("duckdb version", {
  version <- .Call(duckdbneo:::duckdb_library_version)
  duckdb_conv <- gsub("^([0-9]+[.][0-9]+[.][0-9]+).*$", "\\1", packageVersion("duckdb"))
  expect_equal(version, paste0("v", duckdb_conv))
})
