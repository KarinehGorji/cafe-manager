# cafe-manager
cafe manager application

PLEASE READ THE FOLLOWING BEFOR RUNNING THE APPLICATION

-The cafe manager app is writen as a Maven project

-To use the application first the sql scripts should be generated in MySQL workbench
and there should be a manager user inserted to the users table so that a manager can
be logged in.
the scripts are present in sql scripts folder attached to the project

-Update lines 35 and 36 in WEB-INF/servlet.xml to match your sql server connection.

-To test your connection to the database you can add TestDbServlet.java in testJdbc package.
