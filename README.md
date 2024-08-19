### Build and Run:
To build and run your services, navigate to your project directory in the terminal and run:
```bash
podman-compose up --build
```
This command will start both the logger application and MySQL database.

#### For windows users
If you're using windows system, you can turn on the podman desktop application. The above command would build 2 containers (one logger service and one database) and connect them automatically via a pod. Click the button to start pod. If it's running, it should look like the below screenshot. By entering the pod, you can see the log details to check if both the containers are running normally.   
![Podman Desktop](/images/pod.png)  
![Logs of pod](/images/pod_log.png)  

### Initialize the Database:
You’ll need to create the database schema after MySQL is running. You can do this by connecting to the MySQL container and running the SQL commands:  
(.yml file current setting: user_name: oliver, db_name: logdb; container_name depends on your folder name, should be <folder name>_db_1)

```bash
podman exec -it <container_name> mysql -u <user_name> -p <db_name>
```
Then, execute the following SQL commands to see the database and the table.
```sql
SHOW databases;

USE <db_name> -- logdb

SELECT * FROM log_data;
```  
Note that the DB config setting in `logger.py` should be obtained through os.environ.get() function when building the container, not the config.get() one. config.get() is used when you directly run `python logger.py.`  

### POST new data
Open the processor and the collector to post new data to this logger.

### Stopping and Removing Containers:
You can stop and remove the containers with:
```bash
podman-compose down
```

### Push image to Docker Hub
1. Login: `docker login`，接著輸入帳密
2. Tag local image: `podman tag <本地映像名稱> <遠端儲存庫名稱>/<映像名稱>:<標籤>`
   - <本地映像名稱>：您要推送的本地映像的名稱。
   - <遠端儲存庫名稱>：您的 Docker Hub 使用者名稱或您私有 Registry 的名稱。
   - <映像名稱>：您要給這個映像取的名稱。
   - <標籤>：用來區分不同版本的映像。
3. Push image: `podman push <遠端儲存庫名稱>/<映像名稱>:<標籤>`

### Pull image from Docker Hub
1. `podman pull docker.io/<用戶名稱>/<映像名稱>:<標籤>`
2. Use image to start the container: `podman run -it <映像名稱>:<標籤>`
   - -it: 以互動式模式運行容器，並分配一個偽終端。
