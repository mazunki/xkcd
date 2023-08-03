PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin
APPSDIR ?= $(PREFIX)/share/applications
MANDIR ?= $(PREFIX)/share/man

default:
	@echo "Nothing to compile. Run make install instead."

install:
	install -Dm755 xkcd $(DESTDIR)$(BINDIR)/xkcd
	install -Dm644 xkcd.desktop $(DESTDIR)$(APPSDIR)/xkcd.desktop
	install -Dm644 xkcd.1 $(DESTDIR)$(MANDIR)/man1/xkcd.1

uninstall:
	rm -f $(DESTDIR)$(BINDIR)/xkcd
	rm -f $(DESTDIR)$(APPSDIR)/xkcd.desktop

.PHONY: install uninstall

