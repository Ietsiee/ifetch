PREFIX  ?= /usr
BINDIR  := $(PREFIX)/bin
CONFDIR := /etc/ifetch

.PHONY: all install uninstall

all: install

install:
	@echo "Installing ifetch..."

	@install -d $(BINDIR)
	@install -d $(CONFDIR)
	@install -d $(CONFDIR)/modules

	@install -m 755 ifetch-launcher.sh $(BINDIR)/ifetch
	@install -m 755 ifetch.sh $(CONFDIR)/ifetch.sh

	@install -m 755 modules/* $(CONFDIR)/modules/

	@install -m 644 ifetch.config $(CONFDIR)/ifetch.config
	@install -m 644 help.txt $(CONFDIR)/help.txt
	@install -m 644 logo.txt $(CONFDIR)/logo.txt

	@echo "ifetch installed successfully."

uninstall:
	@echo "Uninstalling ifetch..."

	@rm -f $(BINDIR)/ifetch
	@rm -rf $(CONFDIR)

	@echo "ifetch uninstalled."
