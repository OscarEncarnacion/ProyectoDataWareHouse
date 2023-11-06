if __name__ == '__main__':
    try:
        with connection.cursor() as cursor:
            # INSERT
            # scrip = "INSERT INTO Employees(Name, Location) VALUES (?, ?);"
            # cursor.execute(scrip, ('Rigoberto', 'Jalisco'))

            # SELECT
            cursor.execute("SELECT * FROM Employees")
            employees = cursor.fetchall()
            for employee in employees:
                print(employee)

            # SELECT thrifty
            print('\n')
            scrip = "SELECT * FROM Employees WHERE Name = ?;"
            cursor.execute(scrip, 'Nikita')
            employee = cursor.fetchone()
            while employee:
                print(employee)
                employee = cursor.fetchone()

            # SELECT like
            print('\n')
            scrip = "SELECT * FROM Employees WHERE Location like ?;"
            search = 'i'
            cursor.execute(scrip, '%' + search + '%')
            employees = cursor.fetchall()
            for employee in employees:
                print(employee)

            # UPDATE
            # scrip = "UPDATE Employees SET Location = ? WHERE id = ?;"
            # cursor.execute(scrip, ("Francia", 8))

            # DELETE
            scrip = "DELETE FROM Employees WHERE id = ?;"
            cursor.execute(scrip, 7)

        connection.commit()

    except Exception as e:
        print('Error executing transaction:\n' + str(e))
    finally:
        connection.close()