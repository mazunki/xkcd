PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin
APPSDIR ?= $(PREFIX)/share/applications
MANDIR ?= $(PREFIX)/share/man

oldversion = $(shell git describe --abbrev=0 --tags | tr -d 'v')
newversion = $(shell sed -n '/VERSION/s/VERSION="\(.*\)"/\1/p' xkcd)

default:
	@echo "Nothing to compile. Run make install instead."

install:
	install -Dm755 xkcd $(DESTDIR)$(BINDIR)/xkcd
	install -Dm644 xkcd.desktop $(DESTDIR)$(APPSDIR)/xkcd.desktop
	install -Dm644 xkcd.1 $(DESTDIR)$(MANDIR)/man1/xkcd.1

uninstall:
	rm -f $(DESTDIR)$(BINDIR)/xkcd
	rm -f $(DESTDIR)$(APPSDIR)/xkcd.desktop

release:
	git diff-files --quiet xkcd || { echo "Make sure to commit xkcd first."; exit 1; }
	@# note that || : is required because mv fails if src and dest are the same file
	mv dist/gentoo/xkcd-handler-$(oldversion).ebuild dist/gentoo/xkcd-handler-$(newversion).ebuild || :
	@# please add your dists here
	git reset
	git add dist/
	git commit -m 'version bump'
	git tag -d v$(oldversion)
	git tag v$(newversion)


.PHONY: install uninstall release

