#!/usr/bin/python3

import psycopg2, cgi
import login

form = cgi.FieldStorage()
element = form.getvalue('element')

print('Content-type:text/html\n\n')
print('<html>')
print('<head>')
print(f'<title>Adding new {element}</title>')
print('</head>')
print('<body>')

connection = None
try:
    # Creating connection
    connection = psycopg2.connect(login.credentials)
    cursor = connection.cursor()

    # returns the column names
    # again, because it would be more work to get the data from that file to this one.
    sql =  f"""SELECT column_name 
           FROM information_schema.columns
           WHERE table_name = '{element}' AND table_schema = 'public';"""
    cursor.execute(sql)
    column_names = cursor.fetchall()
    column_names = [item[0] for item in column_names] # because cursor returns a list of tuples. we just want the names.
    
    column_values = {}
    # associates each column to its value in the form
    # this could also be done with a list of tuples
  
    for column in column_names:
        column_values[column] = f"{form.getvalue(f'{column}')}"
   
    # query time
    # first we have to insert whatever element into the element table
    # this makes this a bit less extensible... but it's what the ICs say
    if element != 'substation':
        sql = 'INSERT INTO element VALUES(%s)'
        data = column_values['id']
        
        # no string formatting to avoid sql injection
        cursor.execute(sql, (data,))
        connection.commit()
   
    sql = f'INSERT INTO {element} VALUES(%s, ' + " %s," * (len(column_names)-2) + " %s);"
    data = tuple(column_values.values())

    cursor.execute(sql, data)

    # Commit the update (without this step the database will not change)
    connection.commit()

    # Closing connection
    cursor.close()
    
    print(f'Added {element} successfully.')
except Exception as e:
    # Print errors on the webpage if they occur
    print('<h1>An error occurred.</h1>')
    print('<p>{}</p>'.format(e))
finally:
    if connection is not None:
        connection.close()
