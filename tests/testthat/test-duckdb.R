test_that("duckdb version", {
  version <- .Call(duckdbneo:::duckdb_library_version)
  expect_equal(version, paste0("v", packageVersion("duckdb")))
})
