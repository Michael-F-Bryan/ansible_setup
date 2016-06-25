main: 
	ansible-playbook site.yml --vault-password-file password.txt

common:
	ansible-playbook tasks/common.yml --vault-password-file password.txt
	
dns_server:
	ansible-playbook tasks/dns_server.yml 

gitlab:
	ansible-playbook tasks/gitlab.yml 

personal_use:
	ansible-playbook tasks/personal_use.yml 

webservers:
	ansible-playbook tasks/webservers.yml 
	
	.PHONY: main common personal_use webservers gitlab dns_server
