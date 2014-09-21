TARGET_DIR := $(realpath $(dir $(abspath $(MAKEFILE_LIST)))/..)
ERLEXEC = $(TARGET_DIR)/bin/erl
REBAREXEC = $(TARGET_DIR)/bin/rebar

TARGETS = otp rebar

BUILDTARGETS = $(addsuffix .build,$(TARGETS))
CLEANTARGETS = $(addsuffix .clean,$(TARGETS))

#
# General
#

all: build

build: $(BUILDTARGETS)

clean: $(CLEANTARGETS)

#
# otp
#

otp.build: $(ERLEXEC)

$(ERLEXEC): otp
	cd $< && ./otp_build autoconf
	cd $< && ./configure --prefix=$(TARGET_DIR)
	make -C $<
	make -C $< install

otp.clean:
	make -C $(@:.clean=) clean
	rm -f $(TARGET_DIR)/bin/ct_run
	rm -f $(TARGET_DIR)/bin/dialyzer
	rm -f $(TARGET_DIR)/bin/epmd
	rm -f $(TARGET_DIR)/bin/erl
	rm -f $(TARGET_DIR)/bin/erlc
	rm -f $(TARGET_DIR)/bin/escript
	rm -f $(TARGET_DIR)/bin/run_erl
	rm -f $(TARGET_DIR)/bin/to_erl
	rm -f $(TARGET_DIR)/bin/typer
	rm -rf $(TARGET_DIR)/lib/erlang

#
# Rebar
#

rebar.build: $(REBAREXEC)

$(REBAREXEC): otp rebar
	make -C rebar
	cp rebar/rebar $(TARGET_DIR)/bin

rebar.clean:
	make -C rebar clean
	rm -f $(REBAREXEC)

.PHONY: all build clean

