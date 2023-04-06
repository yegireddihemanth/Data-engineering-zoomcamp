#!/bin/bash
 
sudo apt-get update  
sudo apt-get upgrade -y 
sudo apt install -y docker.io 
sudo apt install -y pyspark 
sudo apt install -y docker-compose
sudo chmod +x /usr/local/bin/docker-compose 
docker --version 
docker-compose --version 
cd /home/azureuser/
sudo mkdir airflow
cd airflow
sudo mkdir dags 
sudo mkdir logs 
sudo mkdir scripts 
sudo mkdir plugins
sudo mkdir source_data
sudo mkdir processed_files
cd /mnt/sharedstorage
sudo mv Dockerfile /home/azureuser/airflow
sudo mv docker-compose.yml /home/azureuser/airflow
sudo mv airflow.env /home/azureuser/airflow
sudo mv entrypoint.sh /home/azureuser/airflow/scripts
sudo mv upload_files_dag.py /home/azureuser/airflow/dags
sudo mv transform_data_dag.py /home/azureuser/airflow/dags
sudo mv Red.csv /home/azureuser/airflow/source_data
sudo mv Rose.csv /home/azureuser/airflow/source_data
sudo mv Sparkling.csv /home/azureuser/airflow/source_data
sudo mv White.csv /home/azureuser/airflow/source_data
cd /home/azureuser/airflow
sudo chmod u=rwx,g=rwx,o=rwx /home/azureuser/airflow/logs
sudo chmod u=rwx,g=rwx,o=rwx /home/azureuser/airflow/dags
sudo chmod u=rwx,g=rwx,o=rwx /home/azureuser/airflow/scripts
sudo chmod u=rwx,g=rwx,o=rwx /home/azureuser/airflow/plugins
sudo chmod u=rwx,g=rwx,o=rwx /home/azureuser/airflow/source_data
sudo chmod u=rwx,g=rwx,o=rwx /home/azureuser/airflow/processed_files

