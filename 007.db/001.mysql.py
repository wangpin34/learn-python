import mysql.connector

conn = mysql.connector.connect(user='root', password='', database='remind', use_unicode=True)

cursor = conn.cursor()

cursor.execute('insert into user (id, name) values (%s, %s)', ['1', 'Michael'])


print 'rowcount:',cursor.rowcount


conn.commit()


cursor.close()