STOW=stow
SCRIPTS=./scripts/

install:
	@chmod +x $(SCRIPTS)*
	@$(SCRIPTS)install.sh
