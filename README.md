# Information-Systems-and-Databases-Project

Project for the Information Systems and Databases Course (https://fenix.tecnico.ulisboa.pt/disciplinas/SIBD77/2020-2021/1-semestre/pagina-inicial).

This project is divided in three parts.

The first part consisted in designing a concise and clean database model using the Entity-Association model graphic notation in order to answer the information requirements of an aplication described in the project_assigment_part_1.pdf file, contained in the project_assigment_part_1 folder. The Entity-Association model can be found in the delivery-01-38.pdf file.

In the second part, a given Entity-Association model was implemented by properly creating and populating a database. In order to test the database, a couple of queries were also designed according to the project_assigment_part_2.pdf file. This file also contains the referenced Entity-Association model. The database schema, populating script and designed queries can be found in the schema.sql, populate.sql and queries.sql files, respectively. The file output.txt contains the queries' output. Additional information about the implementation is also presented in file project-db-38.pdf.

Finally, in the third part, given a certain database schema, presented in the schemaPart3.sql file, a number of tasks had to be done, according to the project_assigment_part_3.pdf file:
	- First, a couple of integrity contraints had to be implemented using stored procedures and triggers. The code containing the implementation of the integrity contraints is presented in the RI.sql file.
	- Then, a view and a couple of more complex queries were created. This work is presented in the queries.sql file. The file populate.sql was created in order to populate the given database schema.
	- A web interface application using Python CGI scripts and HTML pages was also created, in order to allow users to insert, list, edit and remove particular fields in the database. The files used for this application are contained in the web folder. 
	- A couple of indexes were also created, in order to improve the querying times of two queries, presented in the project_assigment_part_3.pdf file. The indexes can be found in the report38.pdf project file file.
	- A star schema multidimensional model, presented in the star_schema.sql file, was also implemented and addded to the database. This star schema was loaded using the scripts implemented in the etl.sql file.
	- Finally, within the context of the created star schema, an OLAP query was developed, and is presented in the olap.sql file.
	
As stated before, a project report for this third part, containing additional information about the implementation can be found in the report38.pdf.

This project was done using the PostgreSQL querying language and Python.
