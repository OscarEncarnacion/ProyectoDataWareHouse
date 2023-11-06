from DB import DBManager

if __name__ == '__main__':
    try:
        dbm = DBManager(database='')
        dbm.insert(table='Employees', Location='Inglaterra', Name='Elizabeth')
        # dbm.update(table='Employees', id_item=20, DepartmentID=42)
        # dbm.delete(table='Employees', id_item=22)
        # dbm.select(table='Employees', id_item=9, fields=['id', 'Location'])

        dbm.close()
    except Exception as e:
        print('Main error:\n' + str(e))
    finally:
        print("Bye")
