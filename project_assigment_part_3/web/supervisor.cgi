#!/usr/bin/python3

import psycopg2, cgi
import login

form = cgi.FieldStorage()
lat = form.getvalue('gpslat')
lng = form.getvalue('gpslong')

print('Content-type:text/html\n\n')
print('<html>')
print('<head>')
print('<title>change supervisor</title>')
print('</head>')
print('<body>')

try:
    print(f'<h3>Changing the supervisor for the substation at ({lat}, {lng}) to:</h3>')
    print('<form action = "supervisor_commit.cgi" method = "post">')
    print('<b>Supervisor name: </b><input type="text" name="new_supervisor">')
    print('<br><b>Supervisor address: </b><input type="text" name="new_addr">')
    print('<br><input type = "submit" value = "Submit"/>')
    print(f'<p><input type="hidden" name="gpslat" value="{lat}"/></p>')
    print(f'<p><input type="hidden" name="gpslong" value="{lng}"/></p>')

except Exception as e:
    # Print errors on the webpage if they occur
    print('<h1>An error occurred.</h1>')
    print(f'<p>{e}</p>')
