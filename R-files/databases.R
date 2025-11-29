# Install packages if missing: install.packages(c("DBI", "RSQLite"))
library(DBI)
library(RSQLite)

# 1. Connect to an in-memory database
con <- dbConnect(RSQLite::SQLite(), ":memory:")

# 2. Write sample data to DB
data(mtcars)
dbWriteTable(con, "cars", mtcars)

# 3. Execute SQL Query
res <- dbGetQuery(con, "SELECT mpg, cyl, hp FROM cars WHERE mpg > 20")
print(head(res))

# 4. Disconnect
dbDisconnect(con)