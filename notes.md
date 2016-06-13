This is my idea for my sinatra assessment project.

Create an app that will allow a teacher to checkout books in thier classroom to students.

It will need 2 database tables, students and books

Students have many books
columns for name, datestamp for when they checked out the book

Books belong to a student
columns for title, author, genre, datestamp for when it was checked out?

Book: 
Index page: Shows a list of books in the classroom library
Show page: Gives all the details for a specific title, included whether a student has it currently checked out
New page:  Allows the teacher to add new titles
Delete:  Remove titles that have left the collection

Student:
Index page: Shows a list of current students
Show page:  Shows student name and which books then have checked out.  Includes the date they checked it out.
New page:  Add a new student here
Delete:  Remove students who have left the class