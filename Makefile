main:
	ansible-playbook site.yml --vault-password-file password.txt
	
.PHONY: main
