using SQLite
using DataFrames
using DBInterface

# --- Database Setup (Connecting to the Database) ---
try
    db = SQLite.DB("baseball.db")
   
catch e
    println("Error connecting to the database: $e")
    db = nothing
end


# --- Helper Function for Query Execution ---
function db_get_query(db_conn, sql_statement, description)
    if db_conn !== nothing
        println("\n--- $description ---")
        try
            # DBInterface.execute is the general way to execute SQL in Julia, 
            # and piping to DataFrame provides the result structure.
            results = DBInterface.execute(db_conn, sql_statement) |> DataFrame
            println(results)
            return results
        catch e
            println("Query failed: $e")
        end
    end
    return nothing
end


# --- Database Introspection ---
if db !== nothing
    println("\n--- Listing Tables and Fields are not directly converted here ---")
    # R's dbListTables(con) equivalent:
    # tables = DBInterface.execute(db, "SELECT name FROM sqlite_master WHERE type='table';") |> DataFrame
    # R's dbListFields(con, name) equivalent:
    # fields = DBInterface.execute(db, "PRAGMA table_info(Batting);") |> DataFrame
end


# --- Query Examples ---

# Example 1: Selecting Columns and Filtering (WHERE)
df_filtered = db_get_query(db, 
  "SELECT PlayerID, yearID, AB, H FROM Batting WHERE AB > 100 AND H > 0;",
  "SELECT PlayerID, yearID, AB, H FROM Batting WHERE AB > 100 AND H > 0"
)


# Example 2: Aggregating and Calculating Columns
df_agg = db_get_query(db, 
  "SELECT MIN(AB), AVG(AB), MAX(AB) FROM Batting;",
  "Aggregated Stats: MIN/AVG/MAX(AB)"
)


# Example 3: Calculated Column (Batting Average)
df_avg = db_get_query(db,
  "SELECT PlayerID, yearID, H/CAST(AB AS REAL) AS BattingAvg FROM Batting ORDER BY BattingAvg DESC LIMIT 3;",
  "Calculated Column (BattingAvg) with ORDER BY and LIMIT"
)


# Example 4: Aggregating with GROUP BY and HAVING
df_total_salary = db_get_query(db,
  "SELECT playerID, SUM(Salary) AS totalSalary FROM Salaries GROUP BY playerID HAVING totalSalary > 30000000;",
  "Aggregating with GROUP BY and HAVING"
)


# Example 5: JOIN (Linking Master and Salaries tables)
df_join = db_get_query(db, 
  # Using explicit ON clause instead of USING for broader SQL compatibility
  "SELECT nameLast, nameFirst, yearID, Salary FROM Master INNER JOIN Salaries ON Master.playerID = Salaries.playerID;",
  "INNER JOIN (Master and Salaries)"
)


# --- Cleanup ---
if db !== nothing
    DBInterface.close(db)
end