#
#
#
TARGETDIR := $(realpath $(dir $(abspath $(MAKEFILE_LIST)))/..)
ERLEXEC = $(TARGETDIR)/bin/erl
REBAREXEC = $(TARGETDIR)/bin/rebar

TARGETS = autoconf automake libtool lksctp-tools otp rebar

PATH := $(TARGETDIR)/bin:$(PATH)

BUILDTARGETS = $(addsuffix .build,$(TARGETS))
CLEANTARGETS = $(addsuffix .clean,$(TARGETS))

#
# General
#

all: build

build: $(BUILDTARGETS)

clean: $(CLEANTARGETS)

#
# autoconf
#

autoconf.build: $(TARGETDIR)/bin/autoconf

$(TARGETDIR)/bin/autoconf: autoconf
	make -C $<
	make -C $< install

autoconf: autoconf/configure
	cd $@ && ./configure --prefix=$(TARGETDIR)

autoconf.clean:
	make -C $(@:.clean=) clean
	rm -f $(TARGETDIR)/bin/$(@:.clean=)
	rm -f $(TARGETDIR)/bin/autoheader
	rm -f $(TARGETDIR)/bin/autom4te
	rm -f $(TARGETDIR)/bin/autoreconf
	rm -f $(TARGETDIR)/bin/autoscan
	rm -f $(TARGETDIR)/bin/autoupdate
	rm -f $(TARGETDIR)/bin/ifnames
	rm -rf $(TARGETDIR)/share/autoconf
	rm -f $(TARGETDIR)/share/info/dir
	rm -f $(TARGETDIR)/share/info/autoconf.info
	rm -f $(TARGETDIR)/share/info/standards.info
	rm -f $(TARGETDIR)/share/man/man1/autoconf.1
	rm -f $(TARGETDIR)/share/man/man1/autoheader.1
	rm -f $(TARGETDIR)/share/man/man1/autom4te.1
	rm -f $(TARGETDIR)/share/man/man1/autoreconf.1
	rm -f $(TARGETDIR)/share/man/man1/autoscan.1
	rm -f $(TARGETDIR)/share/man/man1/autoupdate.1
	rm -f $(TARGETDIR)/share/man/man1/config.guess.1
	rm -f $(TARGETDIR)/share/man/man1/config.sub.1
	rm -f $(TARGETDIR)/share/man/man1/ifnames.1

#
# automake
#

automake.build: $(TARGETDIR)/bin/automake

$(TARGETDIR)/bin/automake: automake $(TARGETDIR)/bin/autoconf
	make -C $<
	make -C $< install

automake: automake/configure
	cd $@ && ./configure --prefix=$(TARGETDIR)

automake.clean:
	make -C $(@:.clean=) clean
	rm -f $(TARGETDIR)/bin/aclocal
	rm -f $(TARGETDIR)/bin/aclocal-1.14
	rm -f $(TARGETDIR)/bin/automake
	rm -f $(TARGETDIR)/bin/automake-1.14
	rm -rf $(TARGETDIR)/share/aclocal
	rm -rf $(TARGETDIR)/share/aclocal-1.14
	rm -rf $(TARGETDIR)/share/automake-1.14
	rm -rf $(TARGETDIR)/share/doc/automake
	rm -f $(TARGETDIR)/share/info/automake-history.info
	rm -f $(TARGETDIR)/share/info/automake.info
	rm -f $(TARGETDIR)/share/info/automake.info-1
	rm -f $(TARGETDIR)/share/info/automake.info-2
	rm -f $(TARGETDIR)/share/man/man1/aclocal.1
	rm -f $(TARGETDIR)/share/man/man1/aclocal-1.14.1
	rm -f $(TARGETDIR)/share/man/man1/automake.1
	rm -f $(TARGETDIR)/share/man/man1/automake-1.14.1

#
# libtool
#

libtool.build: $(TARGETDIR)/bin/libtool

$(TARGETDIR)/bin/libtool: libtool/Makefile $(TARGETDIR)/bin/automake
	make -C libtool
	make -C libtool install

libtool/Makefile: libtool/configure
	sudo yum install texinfo help2man
	cd libtool && ./configure --prefix=$(TARGETDIR)

libtool/configure:
	cd libtool && ./bootstrap

libtool.clean:
	make -C $(@:.clean=) clean
	rm -f $(TARGETDIR)/bin/libtool
	rm -f $(TARGETDIR)/bin/libtoolize
	rm -f $(TARGETDIR)/lib/libltdl.a
	rm -f $(TARGETDIR)/lib/libltdl.la
	rm -f $(TARGETDIR)/lib/libltdl.so
	rm -f $(TARGETDIR)/lib/libltdl.so.7
	rm -f $(TARGETDIR)/lib/libltdl.so.7.3.0
	rm -rf $(TARGETDIR)/include/libltdl/
	rm -f $(TARGETDIR)/include/ltdl.h
	rm -rf $(TARGETDIR)/share/libtool/
	rm -f $(TARGETDIR)/share/man/man1/libtool.1
	rm -f $(TARGETDIR)/share/man/man1/libtoolize.1
	rm -f $(TARGETDIR)/share/info/libtool.info
	rm -f $(TARGETDIR)/share/info/libtool.info-1
	rm -f $(TARGETDIR)/share/info/libtool.info-2

#
# lksctp-tools
#

lksctp-tools.build: $(TARGETDIR)/lib/libsctp.a

$(TARGETDIR)/lib/libsctp.a: lksctp-tools/Makefile $(TARGETDIR)/bin/libtool
	make -C lksctp-tools
	make -C lksctp-tools install

lksctp-tools/Makefile: lksctp-tools/configure
	cd lksctp-tools && ./configure --prefix=$(TARGETDIR)

lksctp-tools/configure:
	cd lksctp-tools && ./bootstrap

lksctp-tools.clean:
	rm -f $(TARGETDIR)/bin/checksctp
	rm -f $(TARGETDIR)/bin/sctp_darn
	rm -f $(TARGETDIR)/bin/sctp_status
	rm -f $(TARGETDIR)/bin/sctp_test
	rm -f $(TARGETDIR)/bin/withsctp
	rm -f $(TARGETDIR)/lib/libsctp.a
	rm -f $(TARGETDIR)/lib/libsctp.la
	rm -f $(TARGETDIR)/lib/libsctp.so
	rm -f $(TARGETDIR)/lib/libsctp.so.1
	rm -f $(TARGETDIR)/lib/libsctp.so.1.0.16
	rm -rf $(TARGETDIR)/lib/lksctp-tools/
	rm -f $(TARGETDIR)/include/netinet/sctp.h
	rm -rf $(TARGETDIR)/share/lksctp-tools/
	rm -f $(TARGETDIR)/man/man3/sctp_bindx.3
	rm -f $(TARGETDIR)/man/man3/sctp_connectx.3
	rm -f $(TARGETDIR)/man/man3/sctp_getladdrs.3
	rm -f $(TARGETDIR)/man/man3/sctp_getpaddrs.3
	rm -f $(TARGETDIR)/man/man3/sctp_opt_info.3
	rm -f $(TARGETDIR)/man/man3/sctp_peeloff.3
	rm -f $(TARGETDIR)/man/man3/sctp_recvmsg.3
	rm -f $(TARGETDIR)/man/man3/sctp_send.3
	rm -f $(TARGETDIR)/man/man3/sctp_sendmsg.3
	rm -f $(TARGETDIR)/man/man7/sctp.7

#
# otp
#

otp.build: $(ERLEXEC) lksctp-tools.build

$(ERLEXEC): otp
	make -C $<
	make -C $< install

otp: otp/configure
	cd otp && ./configure --prefix=$(TARGETDIR)

otp/configure:
	cd otp && ./otp_build autoconf

otp.clean:
	make -C $(@:.clean=) clean
	rm -f $(TARGETDIR)/bin/ct_run
	rm -f $(TARGETDIR)/bin/dialyzer
	rm -f $(TARGETDIR)/bin/epmd
	rm -f $(TARGETDIR)/bin/erl
	rm -f $(TARGETDIR)/bin/erlc
	rm -f $(TARGETDIR)/bin/escript
	rm -f $(TARGETDIR)/bin/run_erl
	rm -f $(TARGETDIR)/bin/to_erl
	rm -f $(TARGETDIR)/bin/typer
	rm -rf $(TARGETDIR)/lib/erlang

#
# rebar
#

rebar.build: $(REBAREXEC) otp.build

$(REBAREXEC): rebar
	make -C rebar
	cp rebar/rebar $(TARGETDIR)/bin

rebar.clean:
	make -C rebar clean
	rm -f $(REBAREXEC)

.PHONY: all build clean $(BUILDTARGETS) $(CLEANTARGETS)

