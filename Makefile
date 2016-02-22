SUBDIRS =
DESTDIR =
UBINDIR ?= /usr/bin
LIBDIR ?= /usr/lib
SBINDIR ?= /sbin
USBINDIR ?= /usr/sbin
BINDIR ?= /bin
LIBEXECDIR ?= /usr/libexec
SYSCONFDIR ?= /etc

all:
	for d in $(SUBDIRS); do $(MAKE) -C $$d; done

clean:
	for d in $(SUBDIRS); do $(MAKE) -C $$d clean; done

install:
	for d in $(SUBDIRS); do $(MAKE) -C $$d install; done

	install -d $(DESTDIR)/$(SBINDIR)
	install -d $(DESTDIR)/$(BINDIR)
	install -m 0755 *-functions.sh $(DESTDIR)/$(SBINDIR)/

	install -d $(DESTDIR)/$(USBINDIR)
	install -m 0755 builder $(DESTDIR)/$(USBINDIR)/

	install -d $(DESTDIR)/$(UBINDIR)
	install -m 0755 sabayon-buildpackages $(DESTDIR)/$(UBINDIR)/
	install -m 0755 sabayon-createrepo $(DESTDIR)/$(UBINDIR)/
	install -m 0755 sabayon-entropypreservedlibs $(DESTDIR)/$(UBINDIR)/
	install -m 0755 sabayon-brokenlibs $(DESTDIR)/$(UBINDIR)/
	install -m 0755 sabayon-bz2brokenlibs $(DESTDIR)/$(UBINDIR)/
