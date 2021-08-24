# Elm-VM-Project1
Elm VM Project1

## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.
![image](https://user-images.githubusercontent.com/81688396/130365337-d12f55ac-7bf4-46ad-badc-531088bdb258.png)


These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the YML file may be used to install only certain pieces of it, such as Filebeat.

The playbook and yml files in the ANSIBLE folder 

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.
Load balancing ensures that the application will be highly available, in addition to restricting access to the network.

Load Balancer ensures that all of the incoming data to the web-servers are always availabile. This is the key aspect of cyber Security - which is confidentiality, integrity, and availability which forms the CIA triad.

The advantage of Jump box is that i adds an additional layer of security and controlling the access to the azure network. It also allows for easy administration and depolyment of containers over the other servers. Jump box can act as a Secure Admin Workstation (SAW).

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the logs and system traffic.

Filebeat watches for log directories or specific log files.
Metricbeat periodically collect metrics from the operating system and from services running on the server. Metricbeat takes the metrics and statistics that it collects and ships them to the output that you specify, such as Elasticsearch or Logstash.

The configuration details of each machine may be found below.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.4   | Linux (Ubuntu)   |
| Web1     | Server   | 10.0.0.5   | Linux (Ubuntu)   |
| Wwb2     | Server   | 10.0.0.6   | Linux (Ubuntu)   |  
| ELK      | Server   | 10.1.0.4   | Linux (Ubuntu)   |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box VM can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- Personal IP address

Machines within the network can only be accessed by jump box VM via SSH.
- The ELK-Server (ip address:10.1.0.4) is accessible by JumpBox VIA SSH port 22 and via web access from Personal IP Address via Personal IP ddress via port 5601.

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses       |
|----------|---------------------|----------------------------|
| Jump Box | No                  | Personal IP Address        |
| Elk VM   | Yes                 | Jump Box (10.0.0.4)        |
| Elk VM   | NO                  | Personal IP Address        |         
| Web-1    | Yes                 | Jump Box (10.0.0.4)        |
| Web-2    | Yes                 | Jump Box (10.0.0.4)        |
    
### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
Ansible is advantageous to configure more machines,by just running the ansible playbook, we can configure multiple machines instead of going to every machine and configuring individually.

--------------------------------------------------------------------------------------------------------------------------------------------
The playbook implements the following tasks:
1.  Install Docker.io
2.  Install Pip3 
3.  Install docker python module
4.  Download and Install a Docker elk container
5.  Increase Virtual memory
6.  Using sysctl module

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![Part 4 docker PS](https://user-images.githubusercontent.com/81688396/130627949-4deda706-c454-41ea-b1cc-4b09ee507ef5.PNG)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
-Web 1 server (10.0.0.5)
-Web 2 server (10.0.0.6)

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat is a lightweight shipper for forwarding and centralizing log data. Installed as an agent on your servers, Filebeat monitors the log files or locations that you specify, collects log events,   and forwards them either to Elasticsearch or Logstash for indexing.

-Metricbeat is a lightweight shipper that you can install on your servers to periodically collect metrics from the operating system and from services running on the server. Metricbeat takes the metrics and statistics that it collects and ships them to the output that you specify, such as Elasticsearch or Logstash.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Edit the filebeat-Config.yml and metricbeat.yml files, Please check these config files attached in the Ansible folder.
- Update the /etc/ansible/hosts file to include the ip address of the machines (10.0.0.5 and 10.0.0.6) under [webservers] and elk servers ip address (10.1.0.4) under [elk].
- Copy the filebeat-config.yml and metricbeat.yml file to /etc/ansible/files.
- Update the filebeat and metricbeat config files to include elk server Private IP address in the Elasticsearch and Kibana Sections of the configuration file.
- Run both these playbooks, and after navigating to elk server's public Ip address:5601 and checked it is accessible which meant the installation worked as expected.

Which file is the playbook? filebeat-playbook.yml and metricbeat-playbook.yml are the playbook files Where do you copy it? /etc/ansible
- _Which file do you update to make Ansible run the playbook on a specific machine? filebeat-config.yml How do I specify which machine to install the ELK server on versus which to install Filebeat on? /etc/ansible/hosts file to be installed ElkServers
- _Which URL do you navigate to in order to check that the ELK server is running?http://[your.ELK-VM.External.IP]:5601/app/kibana

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc.
ssh azureuser@10.0.04(jumpbox ip address)
sudo su
docker start angry_edison
docker attach angry_edison
nano hosts (#to upload the hosts to include webservers and elk server ip addresses)
nano filebeat-config.yml (#update this filebeat config file)
nano metricbeat.yml (#update this metricbeat config file)
sudo apt-get update
sudo apt install docker.io
sudo service docker start
sudo docker start elk
ansible-playbook filebeat-playbook.yml (to run the filebeat playbook)
ansible-playbook metricbeat-playbook.yml (to run the metricbeat playbook)
