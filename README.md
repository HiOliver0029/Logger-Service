### Build and Run:
To build and run your services, navigate to your project directory in the terminal and run:
```bash
podman-compose up --build
```
This command will start both the logger application and MySQL database.

### Initialize the Database:
You’ll need to create the database schema after MySQL is running. You can do this by connecting to the MySQL container and running the SQL commands:
(yml file current setting: user_name: oliver, db_name: logdb)
```bash
podman exec -it <container_name> mysql -u <user_name> -p <db_name>
```
Then, execute the following SQL commands to see the database and the table.
```sql
SHOW databases;

USE <db_name> -- logdb

SELECT * FROM log_data;
```

### POST new data
Open the processor and the collector to post new data to this logger.

### Stopping and Removing Containers:
You can stop and remove the containers with:

```bash
docker-compose down
```