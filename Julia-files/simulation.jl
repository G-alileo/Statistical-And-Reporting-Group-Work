# database_demo.jl

using SQLite
using DataFrames

# 1. Connect to an in-memory SQLite database
# Note: To save to a real file, use SQLite.DB("my_database.sqlite")
db = SQLite.DB() 

# Create Dummy Data 
physicians = DataFrame(
    physicianID = [1, 2, 3],
    Name = ["Dr. Smith", "Dr. Jones", "Dr. Who"],
    Department = ["Cardiology", "Neurology", "General"]
)

patients = DataFrame(
    patientID = [101, 102, 103, 104],
    physicianID = [1, 2, 1, 99],
    Name = ["Alice", "Bob", "Charlie", "David"],
    Age = [45, 30, 50, 25]
)

# 2. Write dataframes to the database
SQLite.load!(physicians, db, "Physicians")
SQLite.load!(patients, db, "Patients")

# SQL Queries 

println(" Patients over 30 ")
query1 = "SELECT * FROM Patients WHERE Age > 30"
println(DBInterface.execute(db, query1) |> DataFrame)

println("\n Average Age per Physician ")
query2 = """SELECT physicianID, AVG(Age) as AvgAge 
            FROM Patients 
            GROUP BY physicianID"""
println(DBInterface.execute(db, query2) |> DataFrame)

println("\n--- Joined Data ---")
join_query = """SELECT Patients.Name, Physicians.Name AS Doctor, Physicians.Department
                FROM Patients
                INNER JOIN Physicians ON Patients.physicianID = Physicians.physicianID"""
println(DBInterface.execute(db, join_query) |> DataFrame)