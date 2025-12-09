STOW=stow
SCRIPTS=./setup/

install:
	@chmod +x $(SCRIPTS)*
	@$(SCRIPTS)install.sh
