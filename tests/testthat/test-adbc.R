test_that("ADBC connection works", {
  skip_if_not_installed("adbcdrivermanager")

  adbc_driver <- adbcdrivermanager::adbc_driver(.Call(duckdb_adbc))
  adbc_db <- adbcdrivermanager::adbc_database_init(adbc_driver)
  adbc_con <- adbcdrivermanager::adbc_connection_init(adbc_db)

  out <- as.data.frame(adbcdrivermanager::read_adbc(adbc_con, "SELECT 1 AS a"))
  expect_equal(out, data.frame(a = 1))

  adbcdrivermanager::adbc_connection_release(adbc_con)
  adbcdrivermanager::adbc_database_release(adbc_db)
})
