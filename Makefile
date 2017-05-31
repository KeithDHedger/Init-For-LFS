

PREFIX=/usr
LIBEXECDIR=$(PREFIX)/libexec
SYSCONFDIR=/etc
SBINDIR=/sbin

all:

install:
	mkdir -vp $(DESTDIR)$(LIBEXECDIR)/InitForLFS $(DESTDIR)$(SBINDIR) $(DESTDIR)$(SYSCONFDIR)
	g++ -Wall poweroff.cpp -o $(DESTDIR)$(LIBEXECDIR)/InitForLFS/poweroff
	strip $(DESTDIR)$(LIBEXECDIR)/InitForLFS/poweroff
	cp runservices $(DESTDIR)$(LIBEXECDIR)/InitForLFS
	sed -i "s|@@SYSCONFDIR@@|$(SYSCONFDIR)|g" "$(DESTDIR)$(LIBEXECDIR)/InitForLFS/runservices"
	sed -i "s|@@LIBEXECDIR@@|$(LIBEXECDIR)|g" "$(DESTDIR)$(LIBEXECDIR)/InitForLFS/runservices"
	( cd $(DESTDIR)$(SBINDIR); ln -sfv $(LIBEXECDIR)/InitForLFS/runservices init )
	( cd $(DESTDIR)$(SBINDIR); ln -sfv $(LIBEXECDIR)/InitForLFS/runservices shutdown )
	( cd $(DESTDIR)$(SBINDIR); ln -sfv $(LIBEXECDIR)/InitForLFS/runservices reboot )
	( cd $(DESTDIR)$(SBINDIR); ln -sfv $(LIBEXECDIR)/InitForLFS/runservices servicermt )
	cp -r data/* $(DESTDIR)$(SYSCONFDIR)
