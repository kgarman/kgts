
TARGETS = kws

BUILDTARGETS = $(addsuffix .build,$(TARGETS))
CLEANTARGETS = $(addsuffix .clean,$(TARGETS))

all: build

build: $(BUILDTARGETS)

%.build: %
	-make -C $(@:.build=) build

clean: $(CLEANTARGETS)

%.clean:
	-make -C $(@:.clean=) clean

.PHONY: all build clean

