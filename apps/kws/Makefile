
all: build

build: rel/kws

rel/kws: .
	rebar check-deps
	rebar get-deps
	rebar compile
	rebar generate

clean:
	rebar clean

.PHONY: all build clean

