#!/usr/bin/python3

import psycopg2, cgi
import login

form = cgi.FieldStorage()
new_name = form.getvalue('new_supervisor')
new_addr = form.getvalue('new_addr')
lat = form.getvalue('gpslat')
lng = form.getvalue('gpslong')

print('Content-type:text/html\n\n')
print('<html>')
print('<head>')
print('<title>update</title>')
print('</head>')
print('<body>')

connection = None
try:
    # Creating connection
    connection = psycopg2.connect(login.credentials)
    cursor = connection.cursor()
    
    sql = "UPDATE substation SET sname = %s, saddress = %s WHERE gpslat = %s AND gpslong = %s;"
    data = (new_name, new_addr, lat, lng)

    cursor.execute(sql, data)
    connection.commit()

    # Closing connection
    cursor.close()
    
    print(f'Changed supervisor to {new_name}  successfully.')
    print("<p><a href="https://web2.tecnico.ulisboa.pt/ist425293/powergrid.cgi">Click here to go back to the main page.</A>")
except Exception as e:
    # Print errors on the webpage if they occur
    print('<h1>An error occurred.</h1>')
    print('<p>{}</p>'.format(e))
finally:
    if connection is not None:
        connection.close()
