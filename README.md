# Demo of an Ansible Playbook to run a Zookeeper-Cluster on Exoscale

This is a test and not for production use because:
- ports 443 and 80 are open for egress traffic
- Zookeeper is not configured to be particularly secure
- OS not hardened
- instances are small with only 1.5GB of RAM

## Setup

1. install python3 (tested with 3.7.2)
1. install pip (tested with 18.1)
1. create ssh-key
1. cp cloudstack.ini.sample ~/.cloudstack.ini
1. edit cloudstack.ini according your exoscale-account
1. `make install`
1. `make run`
