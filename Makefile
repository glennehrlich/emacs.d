ifeq ($(EMACS), t)
	EMACS = emacs
endif

EMACS_BATCH = $(EMACS) -Q -batch -L ./src -l src/my-load-path.el

# custom.el not in here because the .el is always loaded, never the .elc
LISPFILES = $(wildcard src/*.el) init.el
ELCFILES  = $(LISPFILES:.el=.elc)

ELPA = emacs.d.elpa
ELPA_DIR = ~/.$(ELPA)
ELPA_BACKUP_DIR = $(ELPA_DIR).backup
ELPA_TAR = ~/$(ELPA).tar.gz
PERSISTENT_DIR = ~/.emacs.d.persistent
GIT_BUNDLE = ~/emacs.d.bundle

%.elc: %.el
	$(EMACS_BATCH) -f batch-byte-compile $<

all: $(ELCFILES)
	@echo "sleeping 5 seconds in order to touch all *.elc files"
	sleep 5
	find . -name "*.elc" | xargs touch
	rm -f init.elc~

clean:
	rm -f $(ELCFILES)

update_elpa:
	mkdir -p $(ELPA_BACKUP_DIR)
	mv $(ELPA_DIR) $(ELPA_BACKUP_DIR)/$(ELPA)_$(shell date "+%Y-%m-%d_%H%M%S")
	rm -rf ~/.emacs.d/eln-cache/*
	$(EMACS_BATCH) -f get-my-packages
	@echo "sleeping 5 seconds in order to touch all *.elc files"
	sleep 5
	find $(ELPA_DIR) -name "*.elc" | xargs touch
	rm -f init.elc~

create_elpa_tar:
	cd ~
	rm -rf $(ELPA_TAR)
	tar czvf $(ELPA_TAR) .$(ELPA)

extract_elpa_tar:
	cd ~
	rm -rf $(ELPA_DIR).old
	mv $(ELPA_DIR) $(ELPA_DIR).old
	tar xzvf $(ELPA_TAR)

# This should be done outside of emacs to work; see clean_persistent_dirs.
create_persistent_dirs:
	cd ~
	mkdir -p $(PERSISTENT_DIR)
	mkdir -p $(PERSISTENT_DIR)/auto-complete
	mkdir -p $(PERSISTENT_DIR)/auto-save-list
	mkdir -p $(PERSISTENT_DIR)/eshell
	mkdir -p $(PERSISTENT_DIR)/org
	mkdir -p $(PERSISTENT_DIR)/python-environments
	mkdir -p $(PERSISTENT_DIR)/recentf
	mkdir -p $(PERSISTENT_DIR)/smex
	mkdir -p $(PERSISTENT_DIR)/tramp
	mkdir -p $(PERSISTENT_DIR)/url
	@echo
	@echo "$(PERSISTENT_DIR) and sub-directories have been created."


# This has to be done outside of emacs to work, otherwise, when emacs
# quits, it will re-write all of the bad data.
clean_persistent_dirs:
	rm -f $(PERSISTENT_DIR)/*/*

git_setup_origin:
	rm -rf .git
	git init
	rm -f .bundle_history
	@echo "`TZ=MST date` from origin: `id -un`@`hostname`" >> .bundle_history
	git add --all .
	git commit -m "origin: initial commit."
	git bundle create $(GIT_BUNDLE) --all

# Do this in parent directory; technically it can't be run, but this
# the command that should be executed.
# git_setup_remote:
# 	git clone $(GIT_BUNDLE) ; \

git_pull_origin:
	git pull $(GIT_BUNDLE)

git_pull_remote:
	git pull origin

git_push_origin:
	@echo "`TZ=MST date` from origin: `id -un`@`hostname`" >> .bundle_history
	git add --all .
	git commit -m "origin: add and commit from git_push_origin."
	git bundle create $(GIT_BUNDLE) --all

git_push_remote:
	@echo "`TZ=MST date` from remote: `id -un`@`hostname`" >> .bundle_history
	git add --all .
	git commit -m "remote: add and commit from git_push_remote."
	git bundle create $(GIT_BUNDLE) --all
