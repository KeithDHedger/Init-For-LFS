

PREFIX=/usr
SYSCONFDIR=/etc
SBINDIR=/sbin
VERSION=0.0.3

all:
	cp runservices.main runservices
	sed -i "s|@@SYSCONFDIR@@|$(SYSCONFDIR)|g" "runservices"
	sed -i "s|@@SBINDIR@@|$(SBINDIR)|g" "runservices"
	sed -i "s|@@VERSION@@|$(VERSION)|g" "runservices"
	
install:
	mkdir -vp $(DESTDIR)$(SBINDIR) $(DESTDIR)$(SYSCONFDIR) $(DESTDIR)$(SYSCONFDIR)/StartupServices/runtime
	g++ -Wall poweroff.cpp -o $(DESTDIR)$(SBINDIR)/poweroff
	strip $(DESTDIR)$(SBINDIR)/poweroff
	cp runservices.main "$(DESTDIR)$(SBINDIR)/runservices"
	sed -i "s|@@SYSCONFDIR@@|$(SYSCONFDIR)|g" "$(DESTDIR)$(SBINDIR)/runservices"
	sed -i "s|@@SBINDIR@@|$(SBINDIR)|g" "$(DESTDIR)$(SBINDIR)/runservices"
	sed -i "s|@@VERSION@@|$(VERSION)|g" "$(DESTDIR)$(SBINDIR)/runservices"
	( cd $(DESTDIR)$(SBINDIR); ln -sfv runservices init )
	( cd $(DESTDIR)$(SBINDIR); ln -sfv runservices shutdown )
	( cd $(DESTDIR)$(SBINDIR); ln -sfv runservices reboot )
	( cd $(DESTDIR)$(SBINDIR); ln -sfv runservices servicermt )
	cp -r data/* $(DESTDIR)$(SYSCONFDIR)

