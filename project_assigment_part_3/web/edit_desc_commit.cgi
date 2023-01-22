#!/usr/bin/python3

import psycopg2, cgi
import login

form = cgi.FieldStorage()
element_id = form.getvalue('id')
instant = form.getvalue('instant')
new_desc = form.getvalue('new_desc')

print('Content-type:text/html\n\n')
print('<html>')
print('<head>')
print('<title>Incident updated!</title>')
print('</head>')
print('<body>')

connection = None
try:
    # Creating connection
    connection = psycopg2.connect(login.credentials)
    cursor = connection.cursor()
    
    sql = "UPDATE incident SET description = %s WHERE instant = %s AND id = %s;"
    data = (new_desc, instant, element_id)

    cursor.execute(sql, data)
    connection.commit()

    # Closing connection
    cursor.close()
    
    print(f'Changed the description of the incident at {element_id} at {instant} to {new_desc} successfully.')
except Exception as e:
    # Print errors on the webpage if they occur
    print('<h1>An error occurred.</h1>')
    print('<p>{}</p>'.format(e))
finally:
    if connection is not None:
        connection.close()
