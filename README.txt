Prerequisites
Microsoft SQL Server:

Ensure that Microsoft SQL Server is installed on your system. You can download it from the official Microsoft website.
SQL Server Management Studio (SSMS):

Download and install SQL Server Management Studio (SSMS) from the official Microsoft website.
Setting Up the Database
Follow these steps to set up the elibraryDB database using the provided Script.sql file:

Open SQL Server Management Studio (SSMS):

Launch SSMS and connect to your SQL Server instance using your credentials.
Create a New Query:

Click on New Query in the toolbar to open a new query window.
Open and Execute the SQL Script:

Copy the entire contents of the Script.sql file provided.
Paste the copied script into the query window in SSMS.
Execute the Script:

Click on the Execute button or press F5 to run the script. This will create the elibraryDB database and set up the tables according to the script.
Verify the Setup:

After execution, you can verify the setup by refreshing the Databases node in the Object Explorer. You should see elibraryDB listed there.
Expand the Tables node under elibraryDB to confirm that the tables have been created.


Configuring the Connection Strings
After setting up the elibraryDB database, you need to configure your application to connect to this database. This is done by updating the Web.config file with the correct connection string for your SQL Server instance.

Steps to Update Web.config
Open Web.config:

Locate and open the Web.config file in your project directory. This file contains configuration settings for your application.
Locate Connection Strings Section:

Find the <connectionStrings> section within the Web.config file. It should look like this:

<configuration>
  <connectionStrings>
    <add name="con" connectionString="Data Source=YOUR-DESKTOP\SQLEXPRESS;Initial Catalog=elibraryDB;Integrated Security=true" />
    <add name="elibraryDBConnectionString" connectionString="Data Source=YOUR-DESKTOP\SQLEXPRESS;Initial Catalog=elibraryDB;Integrated Security=True"
      providerName="System.Data.SqlClient" />
  </connectionStrings>
</configuration>
Update the Data Source:

Replace YOUR-DESKTOP in both connection strings with the name of your SQL Server instance. This is typically the name of your machine or server where SQL Server is installed.

For example, if your machine name is MyMachine, update the connection strings to:

<configuration>
  <connectionStrings>
    <add name="con" connectionString="Data Source=MyMachine\SQLEXPRESS;Initial Catalog=elibraryDB;Integrated Security=true" />
    <add name="elibraryDBConnectionString" connectionString="Data Source=MyMachine\SQLEXPRESS;Initial Catalog=elibraryDB;Integrated Security=True"
      providerName="System.Data.SqlClient" />
  </connectionStrings>
</configuration>