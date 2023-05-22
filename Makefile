SHELL := /bin/bash
SERVICES := *.service
CONFIGDIR := $(HOME)/.config/systemd/user

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
