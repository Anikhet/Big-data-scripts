import psycopg2
connection = psycopg2.connect(database="imdb",user="postgres",password="password",host="localhost",port= '5432')
cursor = connection.cursor()
insert_query = "INSERT INTO reviews VALUES (15, 5.6, 1590) ,(15, 5.6, 1590), (3, 5.6, 1590);"

try:

    cursor.execute(insert_query)
    connection.commit()
    print("3 Record inserted successfully into ratings table")

except (Exception, psycopg2.DatabaseError) as error:
    connection.rollback()
    print("Error while inserting data into PostgreSQL table", error)

cursor = connection.cursor()
cursor.execute('SELECT * FROM reviews;')
result = cursor.fetchall()
print(result)