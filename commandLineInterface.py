import psycopg2

# Connect to local PostgreSQL database
def connect():
    conn = psycopg2.connect(database = "postgres", 
                        user = "postgres", 
                        host= 'localhost',
                        password = "",
                        port = 5432)
    return conn

def insert():
    con = connect()
    cur = con.cursor()

    try:
        # Ask user for table, columns, and values
        table = input("Which table would you like to insert data: ")
        columns = input("Which columns would you like to insert into (comma-separated): ")
        values = input("What are your values (comma-separated): ")

        # Execute and commit SQL query
        cur.execute(f"INSERT INTO {table} ({columns}) VALUES ({values})")
        con.commit()
        print("Inserted Successfully!")

    except Exception as error:
        con.rollback()
        print("Error occurred while inserting data: ", error)

    finally:
        con.close()
        
def delete():
    con = connect()
    cur = con.cursor()

    try:
        # Ask user for table and conditions
        table = input("Which table would you like to delete data from: ")
        conditions = input("What are your conditions to delete data (ENTER if none): ")

        # Building SQL query
        query = f"DELETE FROM {table}"
        if conditions:
            query += f" WHERE {conditions}"

        # Execute and commit SQL query
        cur.execute(query)
        con.commit()
        print("Data deleted successfully!")

    except Exception as error:
        print("Error occurred while deleting data: ", error)

    finally:
        con.close()

def update():
    con = connect()
    cur = con.cursor()

    try:
        # Ask user for table, updates, and condtions
        table = input("Which table name would you like to update: ")
        updates = input("What are the columns and values you would like to update (in the form: column1=value1, column2=value2, ...): ")
        conditions = input("What are the conditions for your update (ENTER if none): ")

        # Building SQL query
        query = f"UPDATE {table} SET {updates}"
        if conditions:
            query += f" WHERE {conditions}"

        # Execute and commit the SQL query
        cur.execute(query)
        con.commit()
        print("Data updated successfully!")

    except Exception as error:
        print("Error occurred while updating data: ", error)

    finally:
        con.close()

def search():
    con = connect()
    cur = con.cursor()
    
    try:
        # Ask user for table, columns, and conditions 
        table = input("Which table would you like to view? ")
        columns = input("Which columns would you like to select from(comma-separated), or '*' for all: ")
        conditions = input("Enter the conditions (ENTER if none): ")

        # Building SQL query
        query = f"SELECT {columns} FROM {table}"
        if conditions:
            query += f" WHERE {conditions}"

        # Execute the SQL query
        cur.execute(query)
        for row in cur.fetchall():
            print(row)

    except Exception as error:
        print("Error occurred while searching data: ", error)
    
    finally:
        con.close()
        

def aggregate():
    con = connect()
    cur = con.cursor()

    try: 
        # Ask user for table and column and aggregation function
        table = input("Which table would you like to perform the aggregation: ")
        column = input("Which column would you like to perform aggregation on ('*' if none): ")
        function = input("Enter the aggregation function (SUM, AVG, COUNT, MIN, MAX): ")

        # Execute SQL query and showing result
        cur.execute(f"SELECT {function}({column}) FROM {table}")
        result = cur.fetchone()
        print(f"{function} of {column}: {result[0]}")

    except Exception as error:
        print("Error occurred while aggregating data: ", error)

    finally:
        con.close()

def sorting():
    con = connect()
    cur = con.cursor()

    try: 
        # Ask user for table, column, and sorting order
        table = input("What table would you like to sort: ")
        column = input("Which column would you like to sort by: ")
        order = input("What sorting order (ASC/DESC): ")

        # Execute the SQL query and show result
        cur.execute(f"SELECT * FROM {table} ORDER BY {column} {order}")
        for row in cur.fetchall():
            print(row)
            
    except Exception as error:
        print("Error occurred while sorting the data: ", error)
    
    finally:
        con.close()

def joins():
    con = connect()
    cur = con.cursor()

    try:
        # Ask users for 2 tables and join condition
        table1 = input("What is the first table name: ")
        table2 = input("What is the second table name: ")
        join_condition = input("What is your join condition: ")

        # Execute the SQL query and show results
        cur.execute(f"SELECT * FROM {table1} INNER JOIN {table2} ON {table1}.{join_condition}={table2}.{join_condition}")
        for row in cur.fetchall():
            print(row)
            
    except Exception as error:
        print("Error occurred while sorting the data: ", error)

    finally:
        con.close()

def grouping():
    con = connect()
    cur = con.cursor()

    try: 
        # Ask user for table , column, and aggregation function
        table = input("What is the table you would like to group: ")
        column1 = input("What column would you like to group by: ")
        column2 = input("Would you like a column to aggregate ('*' if not): ")
        function = input("What aggregation function do you need (SUM, AVG, COUNT, MIN, MAX): ")

        # Execute the SQL query and show results
        cur.execute(f"SELECT {column1}, {function}({column2}) FROM {table} GROUP BY {column1}")
        for row in cur.fetchall():
            print(row)
            
    except Exception as error:
        print("Error occurred while grouping the data: ", error)

    finally:
        con.close()

def subqueries():
    con = connect()
    cur = con.cursor()

    try:
        # Ask user for the possible tables and columns needed for the subquery
        table1 = input("What is the main table you would like to search in: ")
        column = input("What column would you like to search in: ")
        function = input("Would you like to check in or not in (IN/NOT IN): ")
        table2 = input("What is the sub table you would like to search in: ")

        # Execute the SQL query and show the results
        cur.execute(f"SELECT * FROM {table1} WHERE {column} {function} (SELECT {column} FROM {table2})")
        for row in cur.fetchall():
            print(row)

    except Exception as error:
        print("Error occurred while subquerying: ", error)

    finally:     
        con.close()

def transaction():
    con = connect()
    cur = con.cursor()

    try:
        print("1. BEGIN TRANSACTION")
        print("2. COMMIT")
        print("3. ROLLBACK")
        command = input("What command are you looking to perform? (1-3)")

        if command == "1":
            cur.execute("BEGIN TRANSACTION")
        elif command == "2":
            cur.execute("COMMIT")
        elif command == "3":
            cur.execute("ROLLBACK")
        else:
            print("Not correct input")

    except Exception as error:
         print("Error occurred while performing transaction: ", error)

    finally: 
        con.close()
        

def main():
    while True:
        print("Options:")
        print("1. Insert")
        print("2. Delete ")
        print("3. Update")
        print("4. Search")
        print("5. Aggregate Functions")
        print("6. Sorting")
        print("7. Joins")
        print("8. Grouping")
        print("9. Subqueries")
        print("10. Transactions")
        print("11. End")

        opt = input("Select an option (1-11): ")

        if opt == "1":
            insert()
        elif opt == "2":
            delete()
        elif opt == "3":
            update()
        elif opt == "4":
            search()
        elif opt == "5":
            aggregate()
        elif opt == "6":
            sorting()
        elif opt == "7":
            joins()
        elif opt == "8":
            grouping()
        elif opt == "9":
            subqueries()
        elif opt == "10":
            transaction()
        elif opt == "11":
            break
        else:
            print("Error: please insert correct number")

if __name__ == "__main__":
    main()
