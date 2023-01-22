#!/usr/bin/python3

import psycopg2, cgi
import login

form = cgi.FieldStorage()
element = form.getvalue('element')

print('Content-type:text/html\n\n')
print('<html>')
print('<head>')
print(f'<title>Removing {element}...</title>')
print('</head>')
print('<body>')

connection = None
try:
    # Creating connection
    connection = psycopg2.connect(login.credentials)
    cursor = connection.cursor()
    
    key = form.getvalue('id')
    if key is None:
        key = (form.getvalue('gpslat'), form.getvalue('gpslong'))
    
    if element == 'substation':
        # we also need to remove every transformer associated with that substation since it doesn't exist anymore
        sql = 'DELETE FROM transformer WHERE gpslat = %s AND gpslong = %s'
        cursor.execute(sql, key)

        sql = 'DELETE FROM substation WHERE gpslat = %s AND gpslong = %s'
        cursor.execute(sql, key)
    else:
        sql = 'DELETE FROM transformer WHERE pbbid = %s OR sbbid = %s'
        cursor.execute(sql, (key, key))
        sql = 'DELETE FROM line WHERE pbbid = %s OR sbbid = %s'
        cursor.execute(sql, (key, key))
        sql = f'DELETE FROM {element} WHERE id = %s'
        cursor.execute(sql, (key,))
        sql = 'DELETE FROM analyses WHERE id = %s'
        cursor.execute(sql, (key,))
        sql = 'DELETE FROM incident WHERE id = %s'
        cursor.execute(sql, (key,))
        sql = 'DELETE FROM element WHERE id = %s'
        cursor.execute(sql, (key,))

    connection.commit()

    print(f"<p>Removing {element} successful.</p>")
    # Closing connection
    cursor.close()
except Exception as e:
    # Print errors on the webpage if they occur
    print('<h1>An error occurred.</h1>')
    print('<p>{}</p>'.format(e))
finally:
    if connection is not None:
        connection.close()
