SHELL := /usr/bin/env bash

.PHONY: help all build buildtiny test testtiny clean

help:
	@echo 'Usage: make (all|build|bulidtiny|test|testtiny|clean)'

all: build buildtiny

#------------------------------------------------------------------------------

# Use for-loop because 'go build ./...' does not produce error messages
# compatible with vim quickfix.
build:
	set -e; \
	for i in */Makefile; do \
		$(MAKE) -C $$(dirname $$i) $@; \
	done

# Use for-loop because 'go test ./...' does not produce error messages
# compatible with vim quickfix.
test:
	set -e; \
	for i in */Makefile; do \
		$(MAKE) -C $$(dirname $$i) $@; \
	done

#------------------------------------------------------------------------------

# Use for-loop because 'tinygo build ./...' does not produce error messages
# compatible with vim quickfix.
buildtiny:
	set -e; \
	for i in cmd/*/Makefile; do \
		$(MAKE) -C $$(dirname $$i) $@; \
	done

# Use for-loop because 'tinygo test ./...' does not produce error messages
# compatible with vim quickfix.
testtiny:
	set -e; \
	for i in */Makefile; do \
		$(MAKE) -C $$(dirname $$i) $@; \
	done

#------------------------------------------------------------------------------

clean:
	set -e; \
	for i in cmd/*/Makefile; do \
		$(MAKE) -C $$(dirname $$i) $@; \
	done
