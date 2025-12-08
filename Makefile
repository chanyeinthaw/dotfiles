STOW=stow
SCRIPTS=./scripts/

encrypt:
	@chmod +x $(SCRIPTS)encrypt.sh
	@$(SCRIPTS)encrypt.sh

decrypt:
	@chmod +x $(SCRIPTS)decrypt.sh
	@$(SCRIPTS)decrypt.sh

update:
	@chmod +x $(SCRIPTS)update.sh
	@$(SCRIPTS)update.sh

install:
	@chmod +x $(SCRIPTS)*
	@$(SCRIPTS)decrypt.sh
	@$(SCRIPTS)install-tpm.sh

	@echo "installign dotfiles"
	@$(STOW) --dotfiles --adopt .
