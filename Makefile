

VERSION=0.0.5
PREFIX=/usr
SYSCONFDIR=/etc
SBINDIR=/sbin
BINDIR=$(PREFIX)/bin
LOCALFOLDER=`pwd`/localtest

all:
	cp runservices.main runservices
	sed -i "s|@@SYSCONFDIR@@|$(SYSCONFDIR)|g" "runservices"
	sed -i "s|@@SBINDIR@@|$(SBINDIR)|g" "runservices"
	sed -i "s|@@VERSION@@|$(VERSION)|g" "runservices"
	
install:
	mkdir -vp $(DESTDIR)$(SBINDIR) $(DESTDIR)$(BINDIR) $(DESTDIR)$(SYSCONFDIR) $(DESTDIR)$(SYSCONFDIR)/StartupServices/runtime $(DESTDIR)/lib/services
	mkdir -vp $(DESTDIR)$(PREFIX)/share/man/man8 $(DESTDIR)/lib
	g++ -Wall poweroff.cpp -o $(DESTDIR)$(SBINDIR)/poweroff
	strip $(DESTDIR)$(SBINDIR)/poweroff
	cp runservices.main "$(DESTDIR)$(SBINDIR)/runservices"
	sed -i "s|@@SYSCONFDIR@@|$(SYSCONFDIR)|g" "$(DESTDIR)$(SBINDIR)/runservices"
	sed -i "s|@@SBINDIR@@|$(SBINDIR)|g" "$(DESTDIR)$(SBINDIR)/runservices"
	sed -i "s|@@VERSION@@|$(VERSION)|g" "$(DESTDIR)$(SBINDIR)/runservices"
	( cd $(DESTDIR)$(SBINDIR); ln -sfv runservices init )
	( cd $(DESTDIR)$(SBINDIR); ln -sfv runservices shutdown )
	( cd $(DESTDIR)$(SBINDIR); ln -sfv runservices reboot )
	( cd $(DESTDIR)$(BINDIR); ln -sfv $(SBINDIR)/runservices servicermt )
	cp -r data/* $(DESTDIR)$(SYSCONFDIR)
	cp scripts/ifup scripts/ifdown $(DESTDIR)$(SBINDIR)
	cp scripts/ifup.8 $(DESTDIR)$(PREFIX)/share/man/man8
	cp -r scripts/sysconfig $(DESTDIR)$(SYSCONFDIR)
	cp -r scripts/services $(DESTDIR)/lib
	( cd $(DESTDIR)/lib; ln -sfv services lsb )

local:
	cp runservices.main $(LOCALFOLDER)/runservices
	sed -i "s|@@SYSCONFDIR@@|$(LOCALFOLDER)|g" $(LOCALFOLDER)/runservices
	sed -i "s|@@SBINDIR@@|$(LOCALFOLDER)|g" $(LOCALFOLDER)/runservices
	sed -i "s|@@VERSION@@|$(VERSION)|g" $(LOCALFOLDER)/runservices
	( cd $(LOCALFOLDER); ln -sfv runservices init )
	( cd $(LOCALFOLDER); ln -sfv runservices shutdown )
	( cd $(LOCALFOLDER); ln -sfv runservices reboot )
	( cd $(LOCALFOLDER); ln -sfv runservices servicermt )

