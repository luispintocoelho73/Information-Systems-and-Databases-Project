#!/usr/bin/python3

import psycopg2, cgi
import login

print('Content-type:text/html\n\n')
print('<html>')
print('<head>')
print('<title>Incidents</title>')
print('</head>')
print('<body>')

connection = None
try:
    # creating connection
    connection = psycopg2.connect(login.credentials)
    cursor = connection.cursor()
    
    print(f'<h2>Incident Table</h2>')

    # returns the column names
    sql =  f"""SELECT column_name 
           FROM information_schema.columns
           WHERE table_name = 'incident' AND table_schema = 'public';"""
    cursor.execute(sql)
    column_names = cursor.fetchall()

    # returns the table itself
    sql = f'SELECT * FROM incident;'
    cursor.execute(sql)
    result = cursor.fetchall()
    
    # table html
    print('<table border="0" cellspacing="5">')
    print('<tr>')
    column_names = [name for sublist in column_names for name in sublist] # 'flattening' the list
  
    for col in column_names:
        print(f'<td><b>{col.title()}</b></td>')
    for row in result:
        print('<tr>')
        for idx, value in enumerate(row):
            print(f'<td>{value}</td>')
            if column_names[idx] == 'id':
                element_id = value
            elif column_names[idx] == 'instant':
                instant = value
        
        print(f'<td><a href="edit_desc.cgi?id={element_id}&instant={instant}">Edit description</a></td>')
        print('</tr>')
    print('</table>')
    
    # insert new incident:
    print('<h3>Insert new incident:</h3>')
    print('<form action = "add_incident.cgi" method = "post">')
    for col in column_names:
        print(f'<b>{col.title()}:</b> <input type="text" name="{col}">')
        print('<br>')
    print('<input type = "submit" value = "Submit" />')
    
    # Closing connection
    cursor.close()
except Exception as e:
    # Print errors on the webpage if they occur
    print('<h1>An error occurred.</h1>')
    print(f'<p>{e}</p>')
finally:
    if connection is not None:
        connection.close()
