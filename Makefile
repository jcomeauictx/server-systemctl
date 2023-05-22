SHELL := /bin/bash

install: linger

linger:
	# enables $(USER)/.config/systemd/user/* to run at bootup
	# otherwise $(USER)'s scripts can only run on login
	[ "$(USER)" ]
	sudo loginctl enable-linger $(USER)
