#!/usr/bin/python3

import psycopg2, cgi
import login

form = cgi.FieldStorage()
#getvalue uses the names from the form in previous page
element = form.getvalue('dropdown')

print('Content-type:text/html\n\n')
print('<html>')
print('<head>')
print('<title>Showing table</title>')
print('</head>')
print('<body>')

connection = None
try:
    # creating connection
    connection = psycopg2.connect(login.credentials)
    cursor = connection.cursor()
    
    print(f'<h2>{element.title()} Table</h2>')

    # returns the column names
    sql =  f"""SELECT column_name 
           FROM information_schema.columns
           WHERE table_name = '{element}' AND table_schema = 'public';"""
    cursor.execute(sql)
    column_names = cursor.fetchall()

    # returns the table itself
    sql = f'SELECT * FROM {element};'
    cursor.execute(sql)
    result = cursor.fetchall()
    num = len(result)
    # table html
    print('<table border="0" cellspacing="5">')
    print('<tr>')
    column_names = [name for sublist in column_names for name in sublist] # 'flattening' the list
  
    for value in column_names:
        print(f'<td><b>{value}</b></td>')
    for row in result:
        print('<tr>')
        for idx, value in enumerate(row):
            print(f'<td>{value}</td>')
            if 'id' in column_names[idx]:
                el_id = value
            else:
                if column_names[idx] == 'gpslat':
                    lat = value
                elif column_names[idx] == 'gpslong':
                    longitude = value
        
        if 'id' in column_names:
            print(f'<td><a href="remove.cgi?element={element}&id={el_id}">Remove</a></td>')
        else:
            print(f'<td><a href="remove.cgi?element={element}&gpslat={lat}&gpslong={longitude}">Remove</a></td>')

        # substations can change supervisors
        if element == 'substation':
            print(f'<td><a href="supervisor.cgi?gpslat={lat}&gpslong={longitude}">Change supervisor</a></td>')
        print('</tr>')
    print('</table>')
    
    #print(f'<p><input type='hidden' name='element' value='{element}'/></p>')
    # insert new element:
    print(f'<h3>Insert new {element}:</h3>')
    print('<form action = "add_element.cgi" method = "post">')
    print(f'<p><input type="hidden" name="element" value="{element}"/></p>')
    for el in column_names:
        print(f'<b>{el}:</b> <input type="text" name="{el}">')
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
