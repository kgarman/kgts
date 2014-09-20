
TARGETS = util libs apps

BUILDTARGETS = $(addsuffix .build,$(TARGETS))

all: build

build: $(BUILDTARGETS)

%.build: %
	make -C $(@:.build=) build

clean: apps.clean

%.clean:
	make -C $(@:.clean=) clean

.PHONY: all build clean

