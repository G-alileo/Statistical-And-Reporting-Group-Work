# database_demo.py

import sqlite3
import pandas as pd

# 1. Connect to an in-memory SQLite database
# Note: To save to a real file, replace ':memory:' with 'my_database.sqlite'
conn = sqlite3.connect(':memory:')

# --- Create Dummy Data ---
physicians = pd.DataFrame({
    'physicianID': [1, 2, 3],
    'Name': ["Dr. Smith", "Dr. Jones", "Dr. Who"],
    'Department': ["Cardiology", "Neurology", "General"]
})

patients = pd.DataFrame({
    'patientID': [101, 102, 103, 104],
    'physicianID': [1, 2, 1, 99],
    'Name': ["Alice", "Bob", "Charlie", "David"],
    'Age': [45, 30, 50, 25]
})

# 2. Write dataframes to the database
physicians.to_sql('Physicians', conn, index=False)
patients.to_sql('Patients', conn, index=False)

# --- SQL Queries ---

print("--- Patients over 30 ---")
query1 = "SELECT * FROM Patients WHERE Age > 30"
print(pd.read_sql_query(query1, conn))

print("\n--- Average Age per Physician ---")
query2 = """SELECT physicianID, AVG(Age) as AvgAge 
            FROM Patients 
            GROUP BY physicianID"""
print(pd.read_sql_query(query2, conn))

print("\n--- Joined Data ---")
join_query = """SELECT Patients.Name, Physicians.Name AS Doctor, Physicians.Department
                FROM Patients
                INNER JOIN Physicians ON Patients.physicianID = Physicians.physicianID"""
print(pd.read_sql_query(join_query, conn))

# Close connection
conn.close()