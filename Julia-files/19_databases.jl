# Requires packages: import Pkg; Pkg.add(["SQLite", "DataFrames"])
using SQLite, DataFrames

# 1. Connect to in-memory database
db = SQLite.DB() 

# 2. Create table and insert data
SQLite.execute(db, "CREATE TABLE data_table (val INTEGER, cat TEXT)")
SQLite.execute(db, "INSERT INTO data_table VALUES (1, 'A')")
SQLite.execute(db, "INSERT INTO data_table VALUES (5, 'C')")

# 3. Execute SQL Query
res = DBInterface.execute(db, "SELECT * FROM data_table WHERE val > 2") |> DataFrame
println(res)