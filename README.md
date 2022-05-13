### Prepare environment
All below commands need to be executed with root permissions!
1. Install docker engine on host
   ```sh
    sudo apt-get update

    sudo apt-get install \
      ca-certificates \
      curl \
      gnupg \
      lsb-release
   ```
2. Add Docker’s official GPG key
   ```sh
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
   ```
3. Add stable repository
   ```sh
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
      $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   ```
4. Install Docker engine
   ```sh
    sudo apt-get update

    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
   ```
5. Let Docker daemon start automatically
   ```sh
    systemctl enable docker
   ```
7. Download and install docker-compose
   ```sh
    curl -SL https://github.com/docker/compose/releases/download/v2.5.0/docker-compose-linux-x86_64 -o /usr/local/lib/docker/cli-plugins/cli-plugins/docker-compose
   
    chmod +x /usr/local/lib/docker/cli-plugins/cli-plugins/docker-compose
   ```
 
 
Sources: 
* https://docs.docker.com/engine/install/debian/
* https://docs.docker.com/compose/install/#install-the-binary-manually



### Get runtime package
All below commands need to be executed as runtime-user!
1. Create installation folder
   ```sh
    mkdir -p /opt/btc
   
    chown -R runime-user:runtime-user /opt/btc
   ```
2. Download file set
   ```sh
    git clone https://github.com/ole-btc/netzportal6.5 /opt/btc
   ```
3. Create volume folder
   ```sh
    /opt/btc/netzportal6.5/bin/create_folder.sh
   ```

to be replaced by script (in progress!)
4. Modify DB passwords for file (as long available)
  ```sh
    /opt/btc/netzportal6.5/docker-compose/.env
    /opt/btc/netzportal6.5/data/mysql_init/init_netzportal-d.sql
    /opt/btc/netzportal6.5/data/mysql_init/init_netzportal-q.sql
    /opt/btc/netzportal6.5/data/mysql_init/init_netzportal-p.sql
   ```

to be replaced by script (in progress!)
5. Run compose file to setup container and network
5.1 MySQL database
   ```sh
    docker-compose -f /opt/btc/netzportal6.5/docker-compose/np6.5-mysql.yml up -d
   ```
   Wait for some seconds. You can also check status of this container running
   ```sh
    docker ps
    docker logs -f btc-np-db
   ```
5.2 Netzportal DEV
   ```sh
    docker-compose -f /opt/btc/netzportal6.5/docker-compose/np6.5-portal-d.yml up -d
   ```
    Wait again for some seconds. You can also check status of this container running

   ```sh
    docker ps
    docker logs -f btc-np-d-portal
   ```
5.3 Netzportal QA
   ```sh
    docker-compose -f /opt/btc/netzportal6.5/docker-compose/np6.5-portal-q.yml up -d
   ```
   Wait another tim for some seconds. You can also check status of this container running
   ```sh
    docker ps
    docker logs -f btc-np-q-portal
   ```
5.4 Proxy
   ```sh
    docker-compose -f /opt/btc/netzportal6.5/docker-compose/np6.5-nginx.yml up -d
   ```
   Wait another tim for some seconds. You can also check status of this container running
   ```sh
    docker ps
    docker logs -f btc-np-proxy
   ```


## Before you start
Think about some requirements and solution related topics

DRAFT:
* Sizing (CPU,MEM,HDD)
* Staging (3 stages: DEV/QA/PRD vs 2 stages NON-PROD/PRD)
* Proxy for external access
* Certificate handling
* external DB/integrated DB (Docker) 
