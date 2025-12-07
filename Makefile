STOW=stow
SCRIPTS=./scripts/

install:
	@chmod +x $(SCRIPTS)*
	@$(SCRIPTS)install-tpm.sh
	@echo "installign dotfiles"
	@$(STOW) --dotfiles --adopt .
