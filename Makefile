SHELL := /bin/bash
SERVICES := *.service
CONFIGDIR := $(HOME)/.config/systemd/user
SERVER := dedicated
DRYRUN ?= --dry-run

all: linger install

linger:
	# enables $(USER)/.config/systemd/user/* to run at bootup
	# otherwise $(USER)'s scripts can only run on login
	[ "$(USER)" ]
	sudo loginctl enable-linger $(USER)

install: $(SERVICES)
	[ -d "$(CONFIGDIR)" ] || mkdir -p $(CONFIGDIR)
	cp $^ $(CONFIGDIR)/
	for service in $^; do systemctl --user enable $$service; done

remote_install:
	rsync -avcz $(DRYRUN) \
	 --exclude .git* \
	 --exclude LICENSE \
	 --exclude README.md \
	 --exclude Makefile \
	 . \
	 $(SERVER):$(CONFIGDIR)/

fetch_remote:
	rsync -avcz $(DRYRUN) \
	 --exclude default.target.wants \
	 $(SERVER):$(CONFIGDIR)/ \
	 .
