import sqlite3
import pandas as pd

# 1. Connect to in-memory database
con = sqlite3.connect(":memory:")

# 2. Write sample data using pandas
df = pd.DataFrame({'val': [1, 2, 3, 4, 5], 'cat': ['A', 'A', 'B', 'B', 'C']})
df.to_sql("data_table", con, index=False)

# 3. Execute SQL Query
cursor = con.cursor()
cursor.execute("SELECT * FROM data_table WHERE val > 2")
rows = cursor.fetchall()
print("Rows where val > 2:", rows)

# 4. Close connection
con.close()