#!/usr/bin/python3
import psycopg2
import cgi
import login

print('Content-type:text/html\n\n')
print('<html>')
print('<head>')
print('</head>')
print('<body>')
print('<title>Power Grid</title>')

print('<h3> Choose element table to display: </h3>')
print('<form action = "element_table.cgi" method = "post">')
print('<select name = "dropdown">')
print('<option value = "busbar" selected>Bus bars</option>')
print('<option value = "substation">Substations</option>')
print('<option value = "transformer">Transformers</option>')
print('</select>')
print('<input type = "submit" value = "Submit"/>')
print('</form>')

print('<br><a href="incidents.cgi">View incident table</a>')


connection = None
try:
    form = cgi.FieldStorage()
except Exception as e:
    # Print errors on the webpage if they occur
    print('<h1>An error occurred.</h1>')
    print('<p>{}</p>'.format(e))
finally:
    if connection is not None:
        connection.close()

print('</body>')
