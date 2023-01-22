#!/usr/bin/python3

import psycopg2, cgi
import login

form = cgi.FieldStorage()
element_id = form.getvalue('id')
instant = form.getvalue('instant')

print('Content-type:text/html\n\n')
print('<html>')
print('<head>')
print('<title>Edit description</title>')
print('</head>')
print('<body>')

try:
    print(f'<h3>Changing the description for the incident that happened at line element {element_id} at {instant}:</h3>')
    print('<form action = "edit_desc_commit.cgi" method = "post">')
    print('<b>New description: </b><input type="text" name="new_desc">')
    print('<br><input type = "submit" value = "Submit"/>')
    print(f'<p><input type="hidden" name="id" value="{element_id}"/></p>')
    print(f'<p><input type="hidden" name="instant" value="{instant}"/></p>')

except Exception as e:
    # Print errors on the webpage if they occur
    print('<h1>An error occurred.</h1>')
    print(f'<p>{e}</p>')
