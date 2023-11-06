import pyodbc


class DBManager:
    def __init__(self, **kwargs):
        self.__server = ''
        self.__database = ''
        self.__username = ''
        self.__password = ''
        if kwargs:
            if 'server' in kwargs:
                self.__server = kwargs['server']
            if 'database' in kwargs:
                self.__database = kwargs['database']
            if 'username' in kwargs:
                self.__username = kwargs['username']
            if 'password' in kwargs:
                self.__password = kwargs['password']
        try:
            self.__connection = pyodbc.connect('DRIVER={ODBC Driver 18 for SQL Server};SERVER=' + self.__server +
                                               ';DATABASE=' + self.__database + ';ENCRYPT=Optional;UID=' +
                                               self.__username + ';PWD=' + self.__password)
        except Exception as e:
            print("Error connecting to SQL Server.\n", e)

    def insert(self, table: str, **kwargs):
        if kwargs and table:
            try:
                with self.__connection.cursor() as cursor:
                    scrip = "INSERT INTO " + table + "("
                    values = []
                    unknown_values = 'VALUES ('
                    amount = len(kwargs)
                    count = 0
                    for key, value in kwargs.items():
                        if count != amount-1:
                            scrip = scrip + str(key) + ', '
                            unknown_values = unknown_values + '?, '
                        else:
                            scrip = scrip + str(key) + ') '
                            unknown_values = unknown_values + '?);'
                        values.append(value)
                        count = count + 1
                    if values:
                        if len(values) < 2:
                            values = values[0]
                        else:
                            values = tuple(values)
                    scrip = scrip + unknown_values
                    cursor.execute(scrip, values)
                    self.__connection.commit()
            except Exception as e:
                print('DBM insert error:\n' + str(e))
        else:
            print('Insert error: No values or table received')
        return 0

    def update(self, table: str, id_item: int, **kwargs):
        if kwargs and table and id_item:
            try:
                with self.__connection.cursor() as cursor:
                    scrip = "UPDATE " + table + " SET "
                    values = []
                    amount = len(kwargs)
                    count = 0
                    for key, value in kwargs.items():
                        if count != amount-1:
                            scrip = scrip + str(key) + ' = ?, '
                        else:
                            scrip = scrip + str(key) + ' = ? WHERE id = ?;'
                        values.append(value)
                        count = count + 1
                    values.append(id_item)
                    if values:
                        if len(values) < 2:
                            values = values[0]
                        else:
                            values = tuple(values)
                    print(scrip, '\n', values)
                    cursor.execute(scrip, values)
                    self.__connection.commit()
            except Exception as e:
                print('DBM update error:\n' + str(e))
        else:
            print('Update error: No values or table received')
        return 0

    def delete(self, table: str, id_item: int):
        if table and id_item:
            try:
                with self.__connection.cursor() as cursor:
                    scrip = "DELETE FROM " + table + " WHERE id = ?"
                    cursor.execute(scrip, id_item)
                    self.__connection.commit()
            except Exception as e:
                print('DBM delete error:\n' + str(e))
        else:
            print('Delete error: No id or table received')
        return 0

    def select(self, table: str, id_item: int, fields: list):
        if table and fields and id_item:
            try:
                with self.__connection.cursor() as cursor:
                    scrip = "SELECT "
                    for index_field in range(len(fields)):
                        if index_field != len(fields)-1:
                            scrip = scrip + str(fields[index_field]) + ', '
                        else:
                            scrip = scrip + str(fields[index_field]) + ' FROM ' + str(table) + ' WHERE id = ?;'
                    cursor.execute(scrip, id_item)
                    employee = cursor.fetchone()
                    while employee:
                        print(employee)
                        employee = cursor.fetchone()
            except Exception as e:
                print('DBM select error:\n' + str(e))
        else:
            print('Select error: No id or table received')
        return 0

    def close(self):
        self.__connection.close()
        return 0
