PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin
APPSDIR ?= $(PREFIX)/share/applications

default:
	@echo "Nothing to compile. Run make install instead."

install:
	install -Dm755 xkcd $(DESTDIR)$(BINDIR)/xkcd
	install -Dm644 xkcd.desktop $(DESTDIR)$(APPSDIR)/xkcd.desktop

uninstall:
	rm -f $(DESTDIR)$(BINDIR)/xkcd
	rm -f $(DESTDIR)$(APPSDIR)/xkcd.desktop

.PHONY: install uninstall

