import sqlite3
import pandas as pd 

# --- Database Setup (Connecting to the Database) ---
try:
    con = sqlite3.connect("baseball.db")
  
except sqlite3.Error as e:
    print(f"Error connecting to the database: {e}")
    con = None


# --- Helper Function for Query Execution ---
def db_get_query(conn, sql_statement, description):
    if conn:
        print(f"\n--- {description} ---")
        try:
            # pandas read_sql_query is similar to R's dbGetQuery, returning a DataFrame
            df = pd.read_sql_query(sql_statement, conn)
            print(df)
            return df
        except Exception as e:
            print(f"Query failed: {e}")
    return None


# --- Database Introspection ---
if con:
    print("\n--- Listing Tables and Fields are not directly converted here ---")
    # R's dbListTables(con) equivalent:
    # tables = pd.read_sql_query("SELECT name FROM sqlite_master WHERE type='table';", con)



# --- Query Examples ---

# Example 1: Selecting Columns and Filtering (WHERE)
df_filtered = db_get_query(con, 
  "SELECT PlayerID, yearID, AB, H FROM Batting WHERE AB > 100 AND H > 0;",
  "SELECT PlayerID, yearID, AB, H FROM Batting WHERE AB > 100 AND H > 0"
)


# Example 2: Aggregating and Calculating Columns
df_agg = db_get_query(con, 
  "SELECT MIN(AB), AVG(AB), MAX(AB) FROM Batting;",
  "Aggregated Stats: MIN/AVG/MAX(AB)"
)


# Example 3: Calculated Column (Batting Average)
df_avg = db_get_query(con,
  "SELECT PlayerID, yearID, H/CAST(AB AS REAL) AS BattingAvg FROM Batting ORDER BY BattingAvg DESC LIMIT 3;",
  "Calculated Column (BattingAvg) with ORDER BY and LIMIT"
)


# Example 4: Aggregating with GROUP BY and HAVING
df_total_salary = db_get_query(con,
  "SELECT playerID, SUM(Salary) AS totalSalary FROM Salaries GROUP BY playerID HAVING totalSalary > 30000000;",
  "Aggregating with GROUP BY and HAVING"
)


# Example 5: JOIN (Linking Master and Salaries tables)
# Using explicit ON clause instead of USING for broader SQL compatibility
df_join = db_get_query(con, 
  "SELECT nameLast, nameFirst, yearID, Salary FROM Master INNER JOIN Salaries ON Master.playerID = Salaries.playerID;",
  "INNER JOIN (Master and Salaries)"
)


# --- Cleanup ---
if con:
    con.close()