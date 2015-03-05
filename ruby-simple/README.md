To run ansible on a host, 
1) make sure that host exists in the hosts file
2) in site.yml hosts: should be set to what ever group that host is part of.
3) also in site.yml, you can comment out roles that you don't want to run.
4) run: ansible-playbook -i ./hosts site.yml
