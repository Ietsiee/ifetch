PREFIX ?= /usr

.PHONY: install uninstall

install:
	chmod +x ifetch-launcher.sh
	chmod +x ifetch.sh
	chmod +x modules/*

	mkdir -p $(PREFIX)/bin
	cp ifetch-launcher.sh $(PREFIX)/bin/ifetch

	mkdir -p /etc/ifetch
	cp ifetch.sh /etc/ifetch/ifetch.sh
	cp ifetch.config /etc/ifetch/ifetch.config
	cp help.txt /etc/ifetch/help.txt
	cp logo.txt /etc/ifetch/logo.txt
	
	cp -r modules /etc/ifetch/
	cp -r presets /etc/ifetch/

uninstall:
	rm -f $(PREFIX)/bin/ifetch
	rm -rf /etc/ifetch
