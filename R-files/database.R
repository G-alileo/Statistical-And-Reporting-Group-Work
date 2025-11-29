library(DBI)
library(RSQLite)

# --- Database Setup (Connecting to the Database) ---
drv <- dbDriver('SQLite')
con <- dbConnect(drv, dbname="baseball.db")                                       

# --- Database Introspection ---
cat("\n--- dbListTables ---\n")
dbListTables(con)         # Get tables in the database (returns vector)

cat("\n--- dbListFields(Batting) ---\n")

# --- Query Examples (dbGetQuery) ---

# Example 1: Selecting Columns and Filtering (WHERE)
cat("\n--- SELECT PlayerID, yearID, AB, H FROM Batting WHERE AB > 100 AND H > 0 ---\n")
df_filtered <- dbGetQuery(con, 
  "SELECT PlayerID, yearID, AB, H FROM Batting WHERE AB > 100 AND H > 0;"
)
print(df_filtered)

# Example 2: Aggregating and Calculating Columns
cat("\n--- Aggregated Stats: MIN/AVG/MAX(AB) ---\n")
df_agg <- dbGetQuery(con, 
  "SELECT MIN(AB), AVG(AB), MAX(AB) FROM Batting;"
)
print(df_agg)

# Example 3: Calculated Column (Batting Average)
cat("\n--- Calculated Column (BattingAvg) with ORDER BY and LIMIT ---\n")
df_avg <- dbGetQuery(con,
  "SELECT 
    PlayerID, 
    yearID, 
    H/CAST(AB AS REAL) AS BattingAvg 
  FROM Batting
  ORDER BY BattingAvg DESC 
  LIMIT 3;" 
)
print(df_avg)

# Example 4: Aggregating with GROUP BY and HAVING
cat("\n--- Aggregating with GROUP BY and HAVING ---\n")
df_total_salary <- dbGetQuery(con,
  "SELECT playerID, SUM(salary) AS totalSalary FROM Salaries GROUP BY playerID HAVING totalSalary > 30000000;"
)
print(df_total_salary)

# Example 5: JOIN (Linking Master and Salaries tables)
cat("\n--- INNER JOIN...USING (Master and Salaries) ---\n")
df_join <- dbGetQuery(con, paste(
  "SELECT nameLast,nameFirst,yearID,salary",
  "FROM Master INNER JOIN Salaries USING(playerID)"))

print(df_join)

# --- Cleanup ---
dbDisconnect(con)